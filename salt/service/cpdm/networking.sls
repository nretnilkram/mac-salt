
include:
  - os.osx

dev_pf_rules:
  file.managed:
    - name: /etc/pf.anchors/dev
    - user: root
    - group: admin
    - mode: 755
    - source: salt://files/etc/pf.anchors/dev

networking_setup_script:
  file.managed:
    - name: /usr/local/bin/dev_network_setup.sh
    - user: root
    - group: admin
    - mode: 755
    - source: salt://files/usr/local/bin/dev_network_setup.sh
    - require:
      - file: dev_pf_rules

dev_networking_plist:
  file.managed:
    - name: /Library/LaunchDaemons/dev.networking.plist
    - user: root
    - group: admin
    - mode: 755
    - source: salt://files/Library/LaunchDaemons/dev.networking.plist
    - require:
      - file: networking_setup_script


networking_setup_service:
  cmd.run:
    - name:  launchctl unload -w /Library/LaunchDaemons/dev.networking.plist;  launchctl load -w /Library/LaunchDaemons/dev.networking.plist
    - require:
      - file: dev_networking_plist
