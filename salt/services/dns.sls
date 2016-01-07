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

dns_masq_conf:
  file.managed:
    - name: /etc/dnsmasq.conf
    - source: salt://files/etc/dnsmasq.conf
    - user: root
    - group: admin
    - mode: 644

dev_dnsmasq_plist:
  file.managed:
    - name: /Library/LaunchDaemons/dev.dnsmasq.plist
    - source: salt://files/Library/LaunchDaemons/dev.dnsmasq.plist
    - user: root
    - template: jinja
    - group: admin
    - mode: 644

dnsmasq_log_dir:
  file.directory:
    - name: /var/log/dnsmasq/
    - user: nobody
    - group: staff
    - mode: 755

hosts_dnsmasq:
  file.managed:
    - name: /etc/hosts.dnsmasq
    - source: salt://files/etc/hosts.dnsmasq
    - user: root
    - group: admin
    - mode: 644

dnsmasq_setup_service:
  cmd.run:
    - name: launchctl unload -w /Library/LaunchDaemons/dev.dnsmasq.plist; launchctl load -w /Library/LaunchDaemons/dev.dnsmasq.plist
    - require:
      - file: dns_masq_conf
      - file: dev_dnsmasq_plist
