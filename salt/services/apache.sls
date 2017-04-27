httpd_conf:
  file.managed:
    - name: /etc/apache2/httpd.conf
    - source: salt://files/etc/apache2/httpd.conf
    - mode: 644

foo_bar_conf:
  file.managed:
    - name: /etc/apache2/other/foo.bar.com.conf
    - source: salt://files/etc/apache2/other/foo.bar.com.conf
    - mode: 644
    - template: jinja

localhost_conf:
  file.managed:
    - name: /etc/apache2/other/localhost.conf
    - source: salt://files/etc/apache2/other/localhost.conf
    - mode: 644
    - template: jinja

apache_start_service:
  cmd.run:
    - name: apachectl start
    - unless: ps aux | grep httpd | grep -v grep

apache_restart_service:
  cmd.wait:
    - name: apachectl restart
    - unless: ps aux | grep httpd | grep -v grep
    - watch:
      - file: httpd_conf
      - file: foo_bar_conf
      - file: localhost_conf
