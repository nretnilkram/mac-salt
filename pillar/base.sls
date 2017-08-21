brew_pkgs:
  - corkscrew
  - git
  - htop-osx
  - wget
  - bash-completion
  - heroku
  - tmux
  - rmtrash
  - nodenv
  - node-build
  - tidy-html5

dns_masq_domains:
  - dev
  - dev.com
  - h2o.dev.com
  - nginx.dev.com
  - nretnil.local

oracle_dns_masq_domains:
  - cpdm.oraclecorp.com
  - test-cpdm.oraclecorp.com

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

node_pkgs:
  - npm-check-updates
  - npm-check
  - coffee-script
  - grunt-cli
  - jshint
  - webpack
  - sass-lint

ruby_version: 2.2.3
vagrant_version: 1.9.7

apache_localhost_dir: {{grains['homedir']}}/Dropbox/Website
apache_nretnil_local_dir: {{grains['homedir']}}/Dropbox/var-www-html

h2o_localhost_8080_dir: {{grains['homedir']}}/Dropbox/Website/dev/bootstrap4-start

nginx_sites:
  - [{{grains['homedir']}}/Dropbox/Website/dev/avatar, 8081]
  - [{{grains['homedir']}}/dev_mlintern/lintern-us, 8082]
  - [{{grains['homedir']}}/dev_mlintern/nretnil-com, 8083]
