include:
  - config.user

install_git:
  pkg.installed:
    - name: git

git_push:
  git.config_set:
    - global: True
    - name: push.default
    - value: current
    - user: {{grains['user']}}

git_push_followTags:
  git.config_set:
    - global: True
    - name: push.followTags
    - value: true
    - user: {{grains['user']}}

git_remote_prune:
  git.config_set:
    - global: true
    - name: remote.origin.prune
    - value: true
    - user: {{grains['user']}}

git_checkout_alias:
  git.config_set:
    - global: True
    - name: alias.co
    - value: checkout
    - user: {{grains['user']}}

git_amend_alias:
  git.config_set:
    - global: True
    - name: alias.amend
    - value: "!git add -A && git commit --amend --no-edit"
    - user: {{grains['user']}}

git_pop_alias:
  git.config_set:
    - global: True
    - name: alias.pop
    - value: stash pop
    - user: {{grains['user']}}

git_diffws_alias:
  git.config_set:
    - global: True
    - name: alias.diffws
    - value: diff --ws-error-highlight=all
    - user: {{grains['user']}}

git_diffc_alias:
  git.config_set:
    - global: True
    - name: alias.diffc
    - value: diff --staged
    - user: {{grains['user']}}

git_branchv_alias:
  git.config_set:
    - global: True
    - name: alias.branchv
    - value: branch -vv
    - user: {{grains['user']}}

git_status_alias:
  git.config_set:
    - global: True
    - name: alias.st
    - value: status
    - user: {{grains['user']}}

git_upll_alias:
  git.config_set:
    - global: True
    - name: alias.upll
    - value: pull
    - user: {{grains['user']}}

git_sup_alias:
  git.config_set:
    - global: True
    - name: alias.sup
    - value: "!git branch --set-upstream-to=origin/`git symbolic-ref --short HEAD`"
    - user: {{grains['user']}}

git_autosetuprebase:
  git.config_set:
    - global: True
    - name: branch.autosetuprebase
    - value: never
    - user: {{grains['user']}}

git_editor:
  git.config_set:
    - global: True
    - name: core.editor
    - value: vim
    - user: {{grains['user']}}

git_branch-name_alias:
  git.config_set:
    - global: True
    - name: alias.branch-name
    - value: "!git rev-parse --abbrev-ref HEAD"
    - user: {{grains['user']}}

git_publish_alias:
  git.config_set:
    - global: True
    - name: alias.publish
    - value: "!git push -u origin $(git branch-name)"
    - user: {{grains['user']}}

git_unpublish_alias:
  git.config_set:
    - global: True
    - name: alias.unpublish
    - value: "!git push origin :$(git branch-name)"
    - user: {{grains['user']}}

git_unstage_alias:
  git.config_set:
    - global: True
    - name: alias.unstage
    - value: reset HEAD
    - user: {{grains['user']}}

git_sha_alias:
  git.config_set:
    - global: True
    - name: alias.sha
    - value: "!git rev-parse HEAD"
    - user: {{grains['user']}}
