brew_pkgs:
  - heroku
  - tmux
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

html_web_dirs:
  - one
  - two
  - four
  - five
  - ten
  - eleven

php_web_dirs:
  - three
  - six
  - seven
  - eight
  - nine

apache_localhost_sites:
  - [{{grains['homedir']}}/web/one, 80]
  - [{{grains['homedir']}}/web/two, 8885]
  - [{{grains['homedir']}}/web/three, 8886]
  - [{{grains['homedir']}}/web/eleven, 8890]

apache_nretnil_local_dir: {{grains['homedir']}}/web/four

h2o_sites:
  - {{grains['homedir']}}/web/five, 8888]
  - {{grains['homedir']}}/web/ten, 8889]

nginx_sites:
  - [{{grains['homedir']}}/web/six, 8881]
  - [{{grains['homedir']}}/web/seven, 8882]
  - [{{grains['homedir']}}/web/eight, 8883]
  - [{{grains['homedir']}}/web/nine, 8884]
