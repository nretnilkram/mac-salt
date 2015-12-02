include:
  - os.osx

rbenv:
  pkg.installed

current-ruby:
  rbenv.installed:
    - name: ruby-2.1.2
    - default: True
    - user: {{grains['user']}}
    - require:
      - pkg: rbenv
