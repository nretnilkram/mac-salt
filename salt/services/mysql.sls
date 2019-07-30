mysql:
  pkg.installed

mysql_remove_err_files:
  cmd.run:
    - name: rm -f /usr/local/var/mysql/*.err
    - onlyif: test -f /usr/local/var/mysql/*.err
    - require:
      - pkg: mysql
