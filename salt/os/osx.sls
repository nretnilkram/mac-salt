{% for n in pillar.get("brew_pkgs") %}

{{n}}_brew_install:
  pkg.installed:
    - name: {{n}}

{% endfor %}