dot_vim_autoload_dir:
  file.directory:
    - name: {{grains['homedir']}}/.vim/autoload
    - user: {{grains['user']}}
    - group: staff
    - mode: 755

install_vim_plug:
  git.latest:
    - name: https://github.com/junegunn/vim-plug.git
    - target: {{grains['homedir']}}/.vim/plug
    - user: {{grains['user']}}

vim_plug_symlink:
  file.symlink:
    - name: {{grains['homedir']}}/.vim/autoload/plug.vim
    - target: {{grains['homedir']}}/.vim/plug/plug.vim
    - user: {{grains['user']}}
    - onlyif:
      - test -d {{grains['homedir']}}/.vim/autoload

vim_install_plugins:
  file.managed:
    - name: {{grains['homedir']}}/.vim/plugins.vim
    - source: salt://files/home/dot_vim/plugins.vim
    - user: {{grains['user']}}
    - group: staff
    - mode: 755

vim_config:
  file.managed:
    - name: {{grains['homedir']}}/.vimrc
    - source: salt://files/home/dot_vimrc
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
