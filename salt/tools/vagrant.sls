vagrant_download:
  cmd.run:
    - name: curl -L -o /tmp/vagrant_{{ pillar.get("vagrant_version") }}.dmg https://releases.hashicorp.com/vagrant/{{ pillar.get("vagrant_version") }}/vagrant_{{ pillar.get("vagrant_version") }}.dmg
    - creates: /tmp/vagrant_{{ pillar.get("vagrant_version") }}.dmg
    - unless:  /usr/local/bin/vagrant -v | grep '{{ pillar.get("vagrant_version") }}'

mount_vagrant_volume:
  cmd.run:
    - name: open -W /tmp/vagrant_{{ pillar.get("vagrant_version") }}.dmg
    - unless: /usr/local/bin/vagrant -v | grep '{{ pillar.get("vagrant_version") }}'
    - creates: /Volumes/Vagrant/Vagrant.pkg
    - require:
      - cmd: vagrant_download

vagrant_install:
  cmd.run:
    - name: installer -verbose -pkg /Volumes/Vagrant/Vagrant.pkg -target /
    - unless: /usr/local/bin/vagrant -v | grep '{{ pillar.get("vagrant_version") }}'
    - require:
      - cmd: mount_vagrant_volume