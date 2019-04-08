mongodb:
  pkg.installed

mongodb_plist:
  file.copy:
    - name: {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
    - source: /usr/local/opt/mongodb/homebrew.mxcl.mongodb.plist
    - user: {{grains['user']}}
    - require:
      - pkg: mongodb

mongodb_setup_service:
  cmd.run:
    - name: launchctl load -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
    - runas: {{grains['user']}}
    - unless: launchctl list | grep homebrew.mxcl.mongodb
    - require:
      - pkg: mongodb
      - file: mongodb_plist

mongodb_restart_service:
  cmd.wait:
    - name: launchctl unload {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.mongodb.plist && launchctl load -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
    - runas: {{grains['user']}}
    - watch:
      - file: mongodb_plist
      - pkg: mongodb
    - require:
      - pkg: mongodb
