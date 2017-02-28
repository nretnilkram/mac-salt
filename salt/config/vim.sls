vim_config:
  file.managed:
    - name: {{grains['homedir']}}/.vimrc
    - source: salt://files/home/.vimrc
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
