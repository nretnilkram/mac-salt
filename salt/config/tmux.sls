tmux_config:
  file.managed:
    - name: {{grains['homedir']}}/.tmux.conf
    - source: salt://files/home/dot_tmux.conf
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
