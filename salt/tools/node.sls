node:
  pkg.installed

{% for n in pillar.get("node_pkgs") %}

{{n}}:
  npm.installed: 
    - user: {{grains['user']}}

{% endfor %}