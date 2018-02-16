php72:
  pkg.installed:
    - taps:
      - homebrew/php
    - options:
      - --with-fpm
      - --with-debug

php_plist:
  file.copy:
    - name: {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.php72.plist
    - source: /usr/local/opt/php72/homebrew.mxcl.php72.plist
    - user: {{grains['user']}}
    - require:
      - pkg: php72

php_setup_service:
  cmd.run:
    - name: launchctl load -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.php72.plist
    - runas: {{grains['user']}}
    - unless: launchctl list | grep homebrew.mxcl.php72
    - require:
      - file: php_plist
      - pkg: php72

php_restart_service:
  cmd.wait:
    - name: launchctl unload {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.php72.plist && launchctl load -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.php72.plist
    - runas: {{grains['user']}}
    - watch:
      - file: php_plist
      - pkg: php72
