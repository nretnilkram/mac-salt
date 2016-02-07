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

dnsmasq_conf:
  file.managed:
    - name: /usr/local/etc/dnsmasq.conf
    - source: salt://files/usr/local/etc/dnsmasq.conf
    - user: root
    - group: admin
    - mode: 644
    - require:
      - pkg: dnsmasq

dev_dnsmasq_plist:
  file.copy:
    - name: /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
    - source: /usr/local/opt/dnsmasq/homebrew.mxcl.dnsmasq.plist
    - user: root
    - group: admin
    - mode: 644
    - force: true
    - require:
      - pkg: dnsmasq

hosts_dnsmasq:
  file.managed:
    - name: /etc/hosts.dnsmasq
    - source: salt://files/etc/hosts.dnsmasq
    - user: root
    - group: admin
    - mode: 644

dnsmasq_setup_service:
  cmd.run:
    - name: launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist; launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
    - require:
      - file: dnsmasq_conf
      - file: dev_dnsmasq_plist
