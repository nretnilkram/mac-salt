apache_foo_bar_conf:
  file.managed:
    - name: /etc/apache2/other/foo.bar.com.conf
    - source: salt://files/etc/apache2/other/foo.bar.com.conf
    - mode: 644

apache_start_service:
  cmd.run:
    - name: apachectl start
    - unless: ps aux | grep httpd | grep -v grep