{% raw %}# vim:ft=zsh ts=2 sw=2 sts=2
#
# agnoster's Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for ZSH
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts).
# Make sure you have a recent version: the code points that Powerline
# uses changed in 2012, and older versions will display incorrectly,
# in confusing ways.
#

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_PROMPT_BG='NONE'
CURRENT_RPROMPT_BG='NONE'

case ${SOLARIZED_THEME:-dark} in
    light) CURRENT_FG='white';;
    *)     CURRENT_FG='black';;
esac

# Special Powerline characters

() {
  local LC_ALL="" LC_CTYPE="en_US.UTF-8"
  # NOTE: This segment separator character is correct.  In 2012, Powerline changed
  # the code points they use for their special characters. This is the new code point.
  # If this is not working for you, you probably have an old version of the
  # Powerline-patched fonts installed. Download and install the new version.
  # Do not submit PRs to change this unless you have reviewed the Powerline code point
  # history and have new information.
  # This is defined using a Unicode escape sequence so it is unambiguously readable, regardless of
  # what font the user is viewing this source code in. Do not replace the
  # escape sequence with a single literal character.
  # Do not change this! Do not make it '\u2b80'; that is the old, wrong code point.
  PROMPT_SEGMENT_SEPARATOR=$'\ue0b0'
  RPROMPT_SEGMENT_SEPARATOR=$'\ue0b2'
}

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
function __prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_PROMPT_BG != 'NONE' && $1 != $CURRENT_PROMPT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_PROMPT_BG}%}$PROMPT_SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_PROMPT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

function __rprompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  [[ -n $2 ]] && sfg="%F{$1}" || fg="%f"
  echo -n " %{$sfg%}$RPROMPT_SEGMENT_SEPARATOR%{$fg%}%{$bg%} "
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
function __prompt_end() {
  if [[ -n $CURRENT_PROMPT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_PROMPT_BG}%}$PROMPT_SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_PROMPT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
function __prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    __prompt_segment black default "%(!.%{%F{yellow}%}.)%n@%m"
  fi
}

# Git: branch/detached head, dirty status
# this requires the oh-my-zsh.plugin git-prompt
function __prompt_git() {
  local PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    PL_BRANCH_CHAR=$'\ue0a0'         # 
  }

  __git_super_status() {
    precmd_update_git_vars
    if [ -n "$__CURRENT_GIT_STATUS" ]; then
      STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_BRANCH$GIT_BRANCH"
      if [ "$GIT_BEHIND" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BEHIND$GIT_BEHIND"
      fi
      if [ "$GIT_AHEAD" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD$GIT_AHEAD"
      fi
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"
      if [ "$GIT_STAGED" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED"
      fi
      if [ "$GIT_CONFLICTS" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS"
      fi
      if [ "$GIT_CHANGED" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED"
      fi
      if [ "$GIT_UNTRACKED" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
      fi
      if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
      fi
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
      echo "$STATUS"
    fi
  }

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    ZSH_THEME_GIT_PROMPT_PREFIX=""
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{]%G%}"
    ZSH_THEME_GIT_PROMPT_SEPARATOR=" %{[%G%}"
    ZSH_THEME_GIT_PROMPT_BRANCH=""
    ZSH_THEME_GIT_PROMPT_STAGED="%{●%G%}"
    ZSH_THEME_GIT_PROMPT_CONFLICTS="%{✖ %G%}"
    ZSH_THEME_GIT_PROMPT_CHANGED="%{✚ %G%}"
    ZSH_THEME_GIT_PROMPT_BEHIND=" %{↓%G%}"
    ZSH_THEME_GIT_PROMPT_AHEAD=" %{↑%G%}"
    ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{…%G%}"
    ZSH_THEME_GIT_PROMPT_CLEAN="%{✔%G%}"

    if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
      # Orange White
      __prompt_segment 172 white "${PL_BRANCH_CHAR} $(__git_super_status)"
    else
      __prompt_segment magenta white "${PL_BRANCH_CHAR} $(__git_super_status)"
    fi
  fi
}

# Dir: current working directory
function __prompt_dir() {
  __prompt_segment green black '%(4~|%-1~/…/%2~|%3~)'
}

# Virtualenv: current working virtualenv
function __prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    __prompt_segment blue black "(`basename $virtualenv_path`)"
  fi
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
function __prompt_status() {
  local -a symbols

  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"
  [[ $RETVAL -eq 0 ]] && symbols+="%{%F{green}%}✔"

  [[ -n "$symbols" ]] && __prompt_segment black default "$symbols"
}

#AWS Profile:
# - display current AWS_PROFILE name
# - displays yellow on red if profile name contains 'production' or
#   ends in '-prod'
# - displays black on green otherwise
function __prompt_aws() {
  [[ -z "$AWS_PROFILE" ]] && return
  case "$AWS_PROFILE" in
    *-prod|*production*) __prompt_segment red yellow  "AWS: $AWS_PROFILE" ;;
    *) __prompt_segment green black "AWS: $AWS_PROFILE" ;;
  esac
}

function __timestamp () {
  __rprompt_segment blue white "%D{%y/%m/%d %H:%M:%S}"
}

function __battery () {
  __rprompt_segment black green "$(battery_pct_prompt)"
}

function __status_code() {
  [[ $RETVAL -ne 0 ]] && __rprompt_segment red white "$(echo $RETVAL)"
}

# The next 6 items are for setting and displaying the execution time
TIMER_FORMAT='%d'

function __human_str_duration() {
  local hrs=$(printf '%.0f' $(($1 / 3600)))
  local mins=$(printf '%.0f' $((($1 - 3600 * hrs) / 60)))
  local secs=$(printf "%.${TIMER_PRECISION:-1}f" $(($1 - (3600 * hrs) - (60 * mins))))
  local duration_str=$(echo "${hrs}h${mins}m${secs}s")
  local format="${TIMER_FORMAT:-/%d}"
  echo "${duration_str//(0h|0m)/}"
}

function __timer_display_timer_precmd() {
  if [ -n "${__timer_cmd_start_time}" ]; then
    local cmd_end_time=$(__timer_current_time)
    local tdiff=$((cmd_end_time - __timer_cmd_start_time))
    unset __timer_cmd_start_time
    export HUMANTIME="$(__human_str_duration ${tdiff})"
  fi
}

function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    # export HUMANTIME="${timer_show}s"
    unset timer
  else
    export HUMANTIME="0s"
  fi
}

function __cmd_time() {
  __rprompt_segment yellow black "${HUMANTIME}"
}

## Main prompt
function __build_prompt() {
  RETVAL=$?
  __prompt_status
  __prompt_virtualenv
  __prompt_aws
  # __prompt_context
  __prompt_dir
  __prompt_git
  __prompt_end
}

function __build_rprompt() {
  RETVAL=$?
  __status_code
  __cmd_time
  __timestamp
  __battery
}

PROMPT='$(__build_prompt) '
RPROMPT='$(__build_rprompt) '
{% endraw %}
