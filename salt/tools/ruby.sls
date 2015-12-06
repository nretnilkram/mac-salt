libyaml:
  pkg.installed

libffi:
  pkg.installed

readline:
  pkg.installed

rbenv:
  pkg.installed

ruby-build:
  pkg.installed

current-ruby:
  rbenv.installed:
    - name: 2.2.3
    - default: True
    - user: {{grains['user']}}
    - require:
      - pkg: rbenv
      - pkg: ruby-build
      - pkg: libyaml
      - pkg: libffi
      - pkg: readline