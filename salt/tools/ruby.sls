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
    - name: {{ pillar.get("ruby_version") }}
    - default: True
    - user: {{grains['user']}}
    - require:
      - pkg: rbenv
      - pkg: ruby-build
      - pkg: libyaml
      - pkg: libffi
      - pkg: readline

{% for n in pillar.get("gems") %}

{{n}}_gem_install:
  gem.installed:
    - name: {{n}}
    - ruby: {{ pillar.get("ruby_version") }}

{% endfor %}