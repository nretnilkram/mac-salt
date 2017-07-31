tidy_config:
  file.managed:
    - name: {{grains['homedir']}}/.tidy.conf
    - source: salt://files/home/dot_tidy.conf
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
