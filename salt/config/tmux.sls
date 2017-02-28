tmux_config:
  file.managed:
    - name: {{grains['homedir']}}/.tmux.conf
    - source: salt://files/home/.tmux.conf
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
