{% if grains['mac_salt_file_exists'] %}
remove_mac_salt_file:
  file.absent:
    - name: {{grains['homedir']}}/.mac_salt
    - 
{% endif %}

create_mac_salt_dir:
  file.directory:
    - name: {{grains['homedir']}}/.mac_salt
    - user: {{grains['user']}}
    - group: staff
    - mode: 755
    - makedirs: True

/usr/local:
  file.directory:
    - user : {{grains['user']}}
    - group: admin
    - mode: 755
    - makedirs: False

bash_aliases:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt/aliases
    - source: salt://files/home/.mac_salt/aliases
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
    - template: jinja

bash_profile:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt/profile
    - source: salt://files/home/.mac_salt/profile
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
    - source: salt://files/home/.mac_salt/git-completion.bash
    - user: {{grains['user']}}
    - group: staff
    - mode: 644

bash_git_prompt:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt/git-prompt.sh
    - source: salt://files/home/.mac_salt/git-prompt.sh
    - user: {{grains['user']}}
    - group: staff
    - mode: 644

bash_functions:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt/functions
    - source: salt://files/home/.mac_salt/functions
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
    - template: jinja

bash_config:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt/bash_config
    - source: salt://files/home/.mac_salt/bash_config
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
    - template: jinja

tmux_config:
  file.managed:
    - name: {{grains['homedir']}}/.tmux.conf
    - source: salt://files/home/.tmux.conf
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
