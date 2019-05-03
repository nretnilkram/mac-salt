install_node:
  pkg.installed:
    - name: node
    - user: {{grains['user']}}

{% for n in pillar.get("node_pkgs") %}
{{n}}:
  npm.installed:
    - user: {{grains['user']}}
    - require:
      - pkg: node
{% endfor %}

dot_sass-lint.yml:
  file.managed:
    - name: {{grains['homedir']}}/.sass-lint.yml
    - source: salt://files/home/dot_sass-lint.yml
    - user: {{grains['user']}}
    - group: staff
    - mode: 644

dot_jshintrc:
  file.managed:
    - name: {{grains['homedir']}}/.jshintrc
    - source: salt://files/home/dot_jshintrc
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
