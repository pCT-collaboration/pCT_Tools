#!/bin/bash
###################################################################################################
########### User names of collaborators, including internal Baylor student user names #############
###################################################################################################
echo -e "hello script world, my name is $(basename --  $0)"
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
#source "$DIR/../includes/setup.sh"
#"\[$(tput bold)$(tput setb 4)$(tput setaf 7)\]\u@\h:\w $ \[$(tput sgr0)\]"
# tput setab [1-7] – Set a background color using ANSI escape
# tput setb [1-7] – Set a background color
# tput setaf [1-7] – Set a foreground color using ANSI escape
# tput setf [1-7] – Set a foreground color
# tput Text Mode Capabilities:

# tput bold – Set bold mode
# tput dim – turn on half-bright mode
# tput smul – begin underline mode
# tput rmul – exit underline mode
# tput rev – Turn on reverse mode
# tput smso – Enter standout mode (bold on rxvt)
# tput rmso – Exit standout mode
# tput sgr0 – Turn off all attributes
# this prompt will show the hostname in green if the last command returned 0,
# otherwise it will be red.
#PS1="\[\`if [[ \$? = "0" ]]; then echo '\e[32m\h\e[0m'; else echo '\e[31m\h\e[0m' ; fi\`:\w\n\$ 
echo $DIR
function testfunc() 
{ 
    echo -e "hello script function world, my name is $(basename --  $0)"
}
testfunc