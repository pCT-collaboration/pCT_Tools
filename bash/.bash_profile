# .bash_profile
###################################################################################################
################## Kodiak/Tardis and Workstation bash profile for user schultze ###################
###################################################################################################
# User specific environment and startup programs use Ctrl-X for stop so that Ctrl-S could be used for forward history search
[ -t 0 ] && stty stop ^X
###################################################################################################
########################## Command redefinitions/settings and shortcuts ###########################
###################################################################################################
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"
export HISTFILESIZE=20000                 # extend .bash_history size
export HISTSIZE=10000                     # extend bash command list size
export HISTCONTROL=erasedups              # erase duplicates from bash command history
export HISTTIMEFORMAT='%F %T '            # display timestamp of commands in history
#export PROMPT_COMMAND='history -a'
#shopt -s histappend
###################################################################################################
########################## Command redefinitions/settings and shortcuts ###########################
###################################################################################################
# Combination command shortcuts
alias rld="echo -e \"Reload ~/.bash_profile ...\"; . ~/.bash_profile"
alias ls="ls --color -ah"
alias back="cd -"
###################################################################################################
######## Source the script that loads pct functions and performs host dependent login tasks #######
###################################################################################################
. /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash_scripts/pct_user_script.sh
