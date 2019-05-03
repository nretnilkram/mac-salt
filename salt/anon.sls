home_web_dir:
  file.directory:
    - name: {{grains['homedir']}}/web
    - user: {{grains['user']}}

{% for dir in pillar['html_web_dirs'] %}
home_web_{{dir}}_dir:
  file.directory:
    - name: {{grains['homedir']}}/web/{{dir}}
    - user: {{grains['user']}}

home_web_{{dir}}_index:
  file.managed:
    - name: {{grains['homedir']}}/web/{{dir}}/index.html
    - source: salt://files/home/web/index.html
    - user: {{grains['user']}}
    - mode: 666
    - template: jinja
    - require:
      - home_web_{{dir}}_dir
    - context:
      title: {{grains['homedir']}}/web/{{dir}}
{% endfor %}

{% for dir in pillar['php_web_dirs'] %}
home_web_{{dir}}_dir:
  file.directory:
    - name: {{grains['homedir']}}/web/{{dir}}
    - user: {{grains['user']}}

home_web_{{dir}}_index:
  file.managed:
    - name: {{grains['homedir']}}/web/{{dir}}/index.php
    - source: salt://files/home/web/index.php
    - user: {{grains['user']}}
    - mode: 666
    - template: jinja
    - require:
      - home_web_{{dir}}_dir
    - context:
      title: {{grains['homedir']}}/web/{{dir}}
{% endfor %}
