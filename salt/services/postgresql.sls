postgresql:
  pkg.installed

postgresql_plist:
  file.copy:
    - name: {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
    - source: /usr/local/opt/postgresql/homebrew.mxcl.postgresql.plist
    - user: {{grains['user']}}
    - require:
      - pkg: postgresql

postgresql_setup_service:
  cmd.run:
    - name: launchctl load -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
    - runas: {{grains['user']}}
    - unless: launchctl list | grep homebrew.mxcl.postgresql
    - require:
      - pkg: postgresql
      - file: postgresql_plist
