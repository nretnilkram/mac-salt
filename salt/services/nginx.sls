include:
  - services.php

nginx:
  pkg.installed

nginx_conf:
  file.managed:
    - name: /usr/local/etc/nginx/nginx.conf
    {% if pillar.get("oracle") %}
    - source: salt://files/oracle/usr/local/etc/nginx/nginx.conf
    {% else %}
    - source: salt://files/usr/local/etc/nginx/nginx.conf
    {% endif %}
    - user: root
    - group: admin
    - mode: 644
    - template: jinja
    - require:
      - pkg: nginx

{% if pillar.get("oracle") %}
nginx_tmp_dir:
  file.directory:
    - name: /usr/local/cache/nginx/tmp
    - makedirs: True
    - mode: 755
{% endif %}
