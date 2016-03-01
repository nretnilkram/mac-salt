include:
  - services.php

nginx:
  pkg.installed

nginx_plist:
  file.copy:
    - name: {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.nginx.plist
    - source: /usr/local/opt/nginx/homebrew.mxcl.nginx.plist
    - user: {{grains['user']}}
    - force: true
    - require:
      - pkg: nginx

nginx_conf:
  file.managed:
    - name: /usr/local/etc/nginx/nginx.conf
    - source: salt://files/usr/local/etc/nginx/nginx.conf 
    - user: root
    - group: admin
    - mode: 644

nginx_setup_service:
  cmd.run:
    - name: launchctl unload -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.nginx.plist; launchctl load -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.nginx.plist
    - user: {{grains['user']}}
    - require:
      - file: nginx_conf
      - file: nginx_plist