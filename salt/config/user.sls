home_dot_ssh_dir:
  file.directory:
    - name: {{grains['homedir']}}/.ssh
    - user: {{grains['user']}}
    - group: staff
    - mode: 700
    - unless: [[ $(stat -f "%Su %Sg %A" {{grains['homedir']}}/.ssh) == "{{grains['user']}} staff 700" ]]

dropbox_dir_permissions:
  file.directory:
    - name: {{grains['homedir']}}/Dropbox
    - user: {{grains['user']}}
    - group: staff
    - mode: 755
    - unless: [[ $(stat -f "%Su %Sg %A" {{grains['homedir']}}/Dropbox) == "{{grains['user']}} staff 755" ]]

create_mac_salt_dir:
  file.directory:
    - name: {{grains['homedir']}}/.mac_salt
    - user: {{grains['user']}}
    - group: staff
    - mode: 755
    - makedirs: True

create_mac_salt_common_dir:
  file.recurse:
    - name: {{grains['homedir']}}/.mac_salt/common
    - source: salt://files/home/dot_mac_salt/common
    - user: {{grains['user']}}
    - group: staff
    - file_mode: 755
    - makedirs: True

create_mac_salt_bash_dir:
  file.recurse:
    - name: {{grains['homedir']}}/.mac_salt/bash
    - source: salt://files/home/dot_mac_salt/bash
    - user: {{grains['user']}}
    - group: staff
    - file_mode: 755
    - makedirs: True

create_mac_salt_zsh_dir:
  file.recurse:
    - name: {{grains['homedir']}}/.mac_salt/zsh
    - source: salt://files/home/dot_mac_salt/zsh
    - user: {{grains['user']}}
    - group: staff
    - file_mode: 755
    - makedirs: True

bash_config:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt/bash_config
    - source: salt://files/home/dot_mac_salt/bash_config
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
    - template: jinja

zsh_config:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt/zsh_config
    - source: salt://files/home/dot_mac_salt/zsh_config
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
    - template: jinja
