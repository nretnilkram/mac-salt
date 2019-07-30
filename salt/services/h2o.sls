h2o:
  pkg.installed

h2o_conf:
  file.managed:
    - name: /usr/local/etc/h2o/h2o.conf
    - source: salt://files/usr/local/etc/h2o/h2o.conf
    - user: root
    - group: admin
    - mode: 644
    - template: jinja
    - require:
      - pkg: h2o
