# .bash_profile
###################################################################################################
##################### Kodiak/Tardis and Workstation bash profile for pCT users ####################
###################################################################################################
# User specific environment and startup programs use Ctrl-X for stop so that Ctrl-S could be used for forward history search
[ -t 0 ] && stty stop ^X
###################################################################################################
######################## Define basic/standard session/terminal properties ########################
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
alias ls="ls -AhL --color --file-type --author --group-directories-first " #
alias back="cd -"
alias cd..="cd .."
alias fhere="find . -name "
alias df="df -Tha --total"
alias free="free -mt"
alias ps="ps auxf"
alias wget="wget -c"
alias histg="history | grep"
alias top="htop"
#alias du="ncdu"
#alias df="pydf"
alias myip="curl http://ipecho.net/plain; echo"
###################################################################################################
######## Source the script that loads pct functions and performs host dependent login tasks #######
###################################################################################################
#-------------------------------------------------------------------------------------------------#
. /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/pct_user_script.sh
#-------------------------------------------------------------------------------------------------#
###################################################################################################
################################### Specify user prompt format ####################################
###################################################################################################
prompt_date=$BrackdLongDate
prompt_login_info=$userAtHostAlias
prompt_separator=$ARROWHEAD
PS2_prompt="\[$ARROW_HOOKED\]"
PS3_prompt="\[$ARROW_DASHED\]"
PS4_prompt="\[$ARROW_WIDE\]"
PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"
#-------------------------------------------------------------------------------------------------#
if [[ ${EUID} == 0 ]] ; then
    prompt_git_info="${git_EUID0}"
else
    prompt_git_info="${git_query}"
fi
#-------------------------------------------------------------------------------------------------#
profile 3
#-------------------------------------------------------------------------------------------------#
PSi_fmtstr PS2 "\[$ARROW_HOOKED\]"
PSi_fmtstr PS3 "\[$ARROW_DASHED\]"
PSi_fmtstr PS4 "\[$ARROW_WIDE\]"
#-------------------------------------------------------------------------------------------------#
cd "${login_dir}"
#-------------------------------------------------------------------------------------------------#
