bash_aliases:
  file.managed:
    - name : {{grains['homedir']}}/.aliases
    - source: salt://files/home/.aliases
    - user : {{grains['user']}}
    - group: staff
    - mode : 644
    - template : jinja

bash_profile:
  file.managed:
    - name : {{grains['homedir']}}/.profile
    - source: salt://files/home/.profile
    - user : {{grains['user']}}
    - group: staff
    - mode : 644

bash_git_completion:
  file.managed:
    - name : {{grains['homedir']}}/.git-completion.bash
    - source: salt://files/home/.git-completion.bash
    - user : {{grains['user']}}
    - group: staff
    - mode : 644

bash_git_prompt:
  file.managed:
    - name : {{grains['homedir']}}/.git-prompt.sh
    - source: salt://files/home/.git-prompt.sh
    - user : {{grains['user']}}
    - group: staff
    - mode : 644