mysql:
  pkg.installed

mysql_plist:
  file.copy:
    - name: /Library/LaunchDaemons/homebrew.mxcl.mysql.plist
    - source: /usr/local/opt/mysql/homebrew.mxcl.mysql.plist
    - user: root
    - group: admin
    - mode: 644
    - force: true
    - require: 
      - pkg: mysql

mysql_setup_service:
  cmd.run:
    - name: launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.mysql.plist; launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.mysql.plist
    - user: root
    - group: wheel
    - require:
      - file: mysql_plist