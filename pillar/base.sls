oracle: false

brew_pkgs:
  - corkscrew
  - git
  - htop
  - wget
  - bash-completion
  - heroku
  - tmux
  - rmtrash
  - nodenv
  - node-build
  - tidy-html5
  - composer
  - telnet

dns_masq_domains:
  - dev
  - dev.com
  - h2o.dev.com
  - nginx.dev.com
  - nretnil.local

ruby_pkgs:
  - libyaml
  - libffi
  - readline
  - openssl
  - rbenv
  - ruby-build
  - rbenv-default-gems

gems:
  - bundler
  - rubocop
  - scss_lint

node_pkgs:
  - npm-check-updates
  - npm-check
  - coffee-script
  - grunt-cli
  - jshint
  - webpack

ruby_version: 2.5.1

apache_localhost_sites:
  - [{{grains['homedir']}}/Dropbox/Website, 80]
  - [{{grains['homedir']}}/dev_mlintern/marklintern-com, 8885]
  - [{{grains['homedir']}}/dev_mlintern/Twig-Website, 8886]
  - [{{grains['homedir']}}/dev_mlintern/album, 8890]

# 8887
apache_nretnil_local_dir: {{grains['homedir']}}/Dropbox/var-www-html

h2o_sites:
  - [{{grains['homedir']}}/Dropbox/Website/dev/bootstrap4-start, 8888]
  - [{{grains['homedir']}}/Dropbox/Website/dev/foundation-start, 8889]

nginx_sites:
  - [{{grains['homedir']}}/Dropbox/Website/dev/avatar, 8881]
  - [{{grains['homedir']}}/dev_mlintern/lintern-us, 8882]
  - [{{grains['homedir']}}/dev_mlintern/nretnil-com, 8883]
  - [{{grains['homedir']}}/dev_mlintern/sandybox, 8884]
