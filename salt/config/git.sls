git_push:
  git.config_set:
    - global : True
    - name : push.default
    - value : current
    - user : {{grains['user']}}

git_checkout_alias:
  git.config_set:
    - global : True
    - name : alias.co
    - value : checkout
    - user : {{grains['user']}}

git_stash_pop_alias:
  git.config_set:
    - global : True
    - name : alias.pop
    - value : stash pop
    - user : {{grains['user']}}

git_branch_alias:
  git.config_set:
    - global : True
    - name : alias.branch
    - value : branch -vvv
    - user : {{grains['user']}}

git_status_alias:
  git.config_set:
    - global : True
    - name : alias.st
    - value : status
    - user : {{grains['user']}}

git_upll_alias:
  git.config_set:
    - global : True
    - name : alias.upll
    - value : pull
    - user : {{grains['user']}}

git_autosetuprebase:
  git.config_set:
    - global : True
    - name : branch.autosetuprebase
    - value : never
    - user : {{grains['user']}}

git_editor:
  git.config_set:
    - global : True
    - name : core.editor
    - value : vim
    - user : {{grains['user']}}