vagrant_download:
  cmd.run:
    - name : curl -L -o /tmp/vagrant.dmg https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2.dmg
    - creates : /tmp/vagrant.dmg
    - unless :  stat /usr/bin/vagrant

mount_vagrant_volume:
  cmd.run:
    - name : open  -W /tmp/vagrant.dmg
    - unless : stat /usr/bin/vagrant
    - creates : /Volumes/Vagrant/Vagrant.pkg
    - require:
      - cmd: vagrant_download

vagrant_install:
  cmd.run:
    - name: installer -verbose -pkg /Volumes/Vagrant/Vagrant.pkg -target /
    - unless : stat /usr/bin/vagrant
    - require:
      - cmd: mount_vagrant_volume