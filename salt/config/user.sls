/usr/local:
  file.directory:
    - user : {{grains['user']}}
    - group: admin
    - mode: 755
    - makedirs: False

bash_aliases:
  file.managed:
    - name: {{grains['homedir']}}/.aliases
    - source: salt://files/home/.aliases
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
    - template: jinja

bash_profile:
  file.managed:
    - name: {{grains['homedir']}}/.profile
    - source: salt://files/home/.profile
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
    - name: {{grains['homedir']}}/.git-completion.bash
    - source: salt://files/home/.git-completion.bash
    - user: {{grains['user']}}
    - group: staff
    - mode: 644

bash_git_prompt:
  file.managed:
    - name: {{grains['homedir']}}/.git-prompt.sh
    - source: salt://files/home/.git-prompt.sh
    - user: {{grains['user']}}
    - group: staff
    - mode: 644

bash_functions:
  file.managed:
    - name: {{grains['homedir']}}/.functions
    - source: salt://files/home/.functions
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
    - template: jinja

bash_mac_salt:
  file.managed:
    - name: {{grains['homedir']}}/.mac_salt
    - source: salt://files/home/.mac_salt
    - user: {{grains['user']}}
    - group: staff
    - mode: 644
    - template: jinja