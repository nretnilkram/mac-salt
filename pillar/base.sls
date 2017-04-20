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

dns_masq_domains:
  - dev
  - dev.com
  - h2o.dev.com
  - nginx.dev.com
  - foo.bar.com

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
  - coffee-script
  - grunt-cli
  - jshint
  - webpack
  - sass-lint

ruby_version: 2.2.3
vagrant_version: 1.9.2

apache_localhost_dir: {{grains['homedir']}}/Dropbox/Website
apache_foo_bar_com_dir: {{grains['homedir']}}/Dropbox/var-www-html

h2o_localhost_8080_dir: {{grains['homedir']}}/Dropbox/Website/dev/bootstrap4-start

nginx_localhost_8081_dir: {{grains['homedir']}}/Dropbox/Website/dev/avatar
nginx_localhost_8082_dir: {{grains['homedir']}}/dev_mlintern/lintern-us
