oracle: true

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
  - php72

dns_masq_domains:
  - dev
  - dev.com
  - h2o.dev.com
  - nginx.dev.com
  - nretnil.local

eloqua_dns_masq_domains:
  - elqdev19.com
  - appcloudqa.eloqua.com
  - dev.eloquacorp.com
  - dev.eloqua.com
  - dev19p01.eloquaeditors.com
  - elqdev08.com
  - dev08p01.eloquapreview.com
  - dev08p01.eloquaeditors.com
  - devsecure.eloquacorp.com
  - devlogin.eloquacorp.com
  - eloquatesting.com

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
vagrant_version: 2.0.2

apache_localhost_sites:
  - [{{grains['homedir']}}/Dropbox/Website, 8888]
  - [{{grains['homedir']}}/dev_mlintern/marklintern-com, 8085]
  - [{{grains['homedir']}}/dev_mlintern/Twig Website, 8086]

apache_nretnil_local_dir: {{grains['homedir']}}/Dropbox/var-www-html

h2o_localhost_8080_dir: {{grains['homedir']}}/Dropbox/Website/dev/bootstrap4-start

nginx_sites:
  - [{{grains['homedir']}}/Dropbox/Website/dev/avatar, 8081]
  - [{{grains['homedir']}}/dev_mlintern/lintern-us, 8082]
  - [{{grains['homedir']}}/dev_mlintern/nretnil-com, 8083]
  - [{{grains['homedir']}}/dev_mlintern/sandybox, 8084]
