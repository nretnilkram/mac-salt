mysql:
  pkg.installed

mysql_plist:
  file.copy:
    - name: {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    - source: /usr/local/opt/mysql/homebrew.mxcl.mysql.plist
    - user: {{grains['user']}}
    - force: true
    - require:
      - pkg: mysql

remove_old_mysql_plist:
  file.absent:
    - name: /Library/LaunchDaemons/homebrew.mxcl.mysql.plist

mysql_remove_err_files:
  cmd.run:
    - name: rm -f /usr/local/var/mysql/*.err

mysql_setup_service:
  cmd.run:
    - name: launchctl unload -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.mysql.plist; launchctl load -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    - user: {{grains['user']}}
    - require:
      - file: mysql_plist