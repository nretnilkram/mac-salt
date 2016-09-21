php56:
  pkg.installed:
    - taps: 
      - homebrew/php
    - options: 
      - --with-fpm
      - --with-debug

php_plist:
  file.copy:
    - name: {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.php56.plist
    - source: /usr/local/opt/php56/homebrew.mxcl.php56.plist
    - user: {{grains['user']}}
    - require:
      - pkg: php56

php_setup_service:
  cmd.run:
    - name: launchctl load -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.php56.plist
    - runas: {{grains['user']}}
    - unless: launchctl list | grep homebrew.mxcl.php56
    - require:
      - file: php_plist
      - pkg: php56

php_restart_service:
  cmd.wait:
    - name: launchctl unload {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.php56.plist && launchctl load -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.php56.plist
    - runas: {{grains['user']}}
    - watch:
      - file: php_plist
      - pkg: php56