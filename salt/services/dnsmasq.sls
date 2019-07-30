dnsmasq:
  pkg.installed

resolver_dir:
  file.directory:
    - name: /etc/resolver
    - user: root
    - group: admin
    - mode: 644
    - require:
      - pkg: dnsmasq

{% for n in pillar.get("dns_masq_domains") %}
{{n}}_resolver_conf:
  file.managed:
    - name: /etc/resolver/{{n}}
    - source: salt://files/etc/resolver/resolver.template
    - require:
      - file: resolver_dir
{% endfor %}

{% if pillar.get("oracle") %}
{% for n in pillar.get("eloqua_dnsmasq_domains") %}
{{n}}_resolver_conf:
  file.managed:
    - name: /etc/resolver/{{n}}
    - source: salt://files/etc/resolver/resolver.template
    - require:
      - file: resolver_dir
{% endfor %}

{% for n in pillar.get("oracle_dnsmasq_domains") %}
{{n}}_resolver_conf:
  file.managed:
    - name: /etc/resolver/{{n}}
    - source: salt://files/etc/resolver/resolver.template
    - require:
      - file: resolver_dir
{% endfor %}
{% endif %}

dnsmasq_conf:
  file.managed:
    - name: /usr/local/etc/dnsmasq.conf
    {% if pillar.get("oracle") %}
    - source: salt://files/oracle/usr/local/etc/dnsmasq.conf
    {% else %}
    - source: salt://files/usr/local/etc/dnsmasq.conf
    {% endif %}
    - user: root
    - group: admin
    - mode: 644
    - require:
      - pkg: dnsmasq

hosts_dnsmasq:
  file.managed:
    - name: /etc/hosts.dnsmasq
    - source: salt://files/etc/hosts.dnsmasq
    - user: root
    - group: admin
    - mode: 644
