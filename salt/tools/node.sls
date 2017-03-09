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
