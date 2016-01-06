{% for n in pillar.get("ruby_pkgs") %}

{{n}}_brew_install:
  pkg.installed:
    - name: {{n}}

{% endfor %}

default-gems:
  file.managed:
    - name : {{grains['homedir']}}/.rbenv/default-gems
    - source: salt://files/home/rbenv/default-gems
    - user : {{grains['user']}}
    - group: staff
    - mode : 644
    - require:
      - pkg: rbenv
      - pkg: rbenv-default-gems

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
