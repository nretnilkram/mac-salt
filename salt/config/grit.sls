include:
  - config.git

install_grit_repo:
  git.latest:
    - name: https://github.com/nretnilkram/mac-salt.git
    - target: {{grains['homedir']}}/.grit
    - user: {{grains['user']}}
    - require:
      - pkg: git

bash_grit_symlink:
  file.symlink:
    - name: /usr/local/bin/grit
    - target: {{grains['homedir']}}/.grit/grit.rb
    - onlyif:
      - test -d {{grains['homedir']}}/.grit
