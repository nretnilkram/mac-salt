include:
  - services.php

nginx:
  pkg.installed

nginx_plist:
  file.copy:
    - name: /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
    - source: /usr/local/opt/nginx/homebrew.mxcl.nginx.plist
    - require:
      - pkg: nginx

nginx_conf:
  file.managed:
    - name: /usr/local/etc/nginx/nginx.conf
    {% if pillar.get("oracle") %}
    - source: salt://files/usr/local/etc/nginx/oracle-nginx.conf
    {% else %}
    - source: salt://files/usr/local/etc/nginx/nginx.conf
    {% endif %}
    - user: root
    - group: admin
    - mode: 644
    - template: jinja
    - require:
      - pkg: nginx

{% if pillar.get("oracle") %}
nginx_tmp_dir:
  file.directory:
    - name: /usr/local/cache/nginx/tmp
    - user: {{grains['user']}}
    - makedirs: True
    - group: staff
    - mode: 755
{% endif %}

nginx_setup_service:
  cmd.run:
    - name: launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
    - unless: launchctl list | grep homebrew.mxcl.nginx
    - require:
      - file: nginx_conf
      - file: nginx_plist
      - pkg: nginx

nginx_restart_service:
  cmd.wait:
    - name: launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist && launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
    - watch:
      - file: nginx_conf
      - file: nginx_plist
      - pkg: nginx
