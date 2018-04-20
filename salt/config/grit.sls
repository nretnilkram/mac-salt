home_dot_grit_dir:
  file.directory:
    - name: {{grains['homedir']}}/.grit
    - user: {{grains['user']}}
    - group: staff
    - mode: 755

bash_grit_file:
  file.managed:
    - name: {{grains['homedir']}}/.grit/grit.rb
    - source: salt://files/home/dot_grit/grit.rb
    - user: {{grains['user']}}
    - group: staff
    - mode: 755
    - require:
      - file: home_dot_grit_dir

bash_grit_symlink:
  file.symlink:
    - name: /usr/local/bin/grit
    - target: {{grains['homedir']}}/.grit/grit.rb
    - require:
      - file: bash_grit_file
