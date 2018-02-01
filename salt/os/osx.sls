LaunchAgents_dir:
  file.directory:
    - name: {{grains['homedir']}}/Library/LaunchAgents
    - user: {{grains['user']}}

{% for n in pillar.get("brew_pkgs") %}

{{n}}_brew_install:
  pkg.installed:
    - name: {{n}}
    - user: {{grains['user']}}
    - require:
      - LaunchAgents_dir

{% endfor %}
