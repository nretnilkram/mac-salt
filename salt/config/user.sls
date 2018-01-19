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

bash_aliases:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt/aliases
    - source: salt://files/home/dot_mac_salt/aliases
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
    - template: jinja

bash_profile:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt/profile
    - source: salt://files/home/dot_mac_salt/profile
    - user: {{grains['user']}}
    - group: staff
    - mode: 644

bash_bash_sessions_disable:
  file.managed:
    - name: {{grains['homedir']}}/.bash_sessions_disable
    - source: salt://files/home/.bash_sessions_disable
    - user: {{grains['user']}}
    - group: staff
    - mode: 644

bash_git_completion:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt/git-completion.bash
    - source: salt://files/home/dot_mac_salt/git-completion.bash
    - user: {{grains['user']}}
    - group: staff
    - mode: 644

bash_functions:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt/functions
    - source: salt://files/home/dot_mac_salt/functions
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
    - template: jinja

bash_history:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt/history
    - source: salt://files/home/dot_mac_salt/history
    - user: {{grains['user']}}
    - group: staff
    - mode: 644

bash_cpdm:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt/cpdm
    - source: salt://files/home/dot_mac_salt/cpdm
    - user: {{grains['user']}}
    - group: staff
    - mode: 644

bash_config:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt/bash_config
    - source: salt://files/home/dot_mac_salt/bash_config
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
    - template: jinja
