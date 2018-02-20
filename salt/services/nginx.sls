include:
  - services.php

nginx:
  pkg.installed

nginx_plist:
  file.copy:
    - name: {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.nginx.plist
    - source: /usr/local/opt/nginx/homebrew.mxcl.nginx.plist
    - user: {{grains['user']}}
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

nginx_setup_service:
  cmd.run:
    - name: launchctl load -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.nginx.plist
    - runas: {{grains['user']}}
    - unless: launchctl list | grep homebrew.mxcl.nginx
    - require:
      - file: nginx_conf
      - file: nginx_plist
      - pkg: nginx

nginx_restart_service:
  cmd.wait:
    - name: launchctl unload {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.nginx.plist && launchctl load -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.nginx.plist
    - runas: {{grains['user']}}
    - watch:
      - file: nginx_conf
      - file: nginx_plist
      - pkg: nginx
