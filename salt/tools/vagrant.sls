vagrant_download:
  cmd.run:
    - name: curl -L -o /tmp/vagrant_{{ pillar.get("vagrant_version") }}.dmg https://releases.hashicorp.com/vagrant/{{ pillar.get("vagrant_version") }}/vagrant_{{ pillar.get("vagrant_version") }}_x86_64.dmg
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

unmount_vagrant_volume:
  cmd.run:
    - name: diskutil unmount /Volumes/Vagrant/
    - onlyif: ls /Volumes/Vagrant/
    - require:
      - cmd: mount_vagrant_volume
      - cmd: vagrant_install

delete_vagrant_file:
  cmd.run:
    - name: rm /tmp/vagrant_{{ pillar.get("vagrant_version") }}.dmg
    - onlyif: stat /tmp/vagrant_{{ pillar.get("vagrant_version") }}.dmg
    - require:
      - cmd: unmount_vagrant_volume
