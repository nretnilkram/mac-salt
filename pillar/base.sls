brew_pkgs:
  - corkscrew
  - htop
  - wget
  - bash-completion
  - rmtrash
  - pv

# base_ps1: '\n${Red}\$(exit_status)${Green}--------------------[\${TIMER_SHOW}s]------------------ \n${White}| \d \t \n| ${Red}\u${White}@${Cyan}\h ${Purple}\w ${White} \n| ${Yellow}\$(__git_ps1 "[%s]") ${White}=> ${NC}'
base_ps1: '\n${Red}\$(exit_status)${Green}--------------------[\${HUMAN_TIME}]------------------ \n${White}| \d \t ${Red}\u${White}@${Cyan}\h ${White}\n| ${Purple}\w ${Yellow}\$(__git_ps1 "[%s]") ${White}\n| => ${NC}'
base_ps2: '| => ${NC}'

no_color_base_ps1: '\n${NC}\$(exit_status)--------------------[\${HUMAN_TIME}]------------------ \n| \d \t \u@\h \n| \w \$(__git_ps1 "[%s]") \n| => '

simple_ps1: '${Red}\u${White}@${Cyan}\h ${Purple}\w ${Yellow}\$(__git_ps1 "[%s]") ${White}=> ${NC}'

no_color_simple_ps1: '\u@\h \w \$(__git_ps1 "[%s]") => '
