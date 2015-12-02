{% for n in pillar.get("brew_pkgs") %}

{{n}}:
  pkg.installed

{% endfor %}