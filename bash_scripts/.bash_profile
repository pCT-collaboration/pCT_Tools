# .bash_profile
#newgrp ionrecon
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
alias lst="ls -alt --color"
alias ls="ls --color -ah"
alias cp="cp -apv"
alias cpdir="cp -apRv"
alias rm="rm -v"
alias mv="mv -v"
alias deldir="rm -rf"
alias rld="echo -e \"Reload ~/.bash_profile ...\"; . ~/.bash_profile"
alias scp="scp -rCp -c blowfish"
alias back="cd -"
alias contents="tree -dluDC"
alias host=$(hostname)
###################################################################################################
################################### Console output definitions ####################################
###################################################################################################
#cd /ion/pCT_code/pCT-collaboration/pCT_Tools/bash_scripts
#./load_pct_functions.sh
. /ion/pCT_code/pCT-collaboration/pCT_Tools/bash_scripts/load_pct_functions.sh
###################################################################################################
######### Console output written on login before subsequent cluster/node dependent output #########
###################################################################################################
#CLUSTER NODE SYSTEMS
#   [1] ecsn001 - whartnell  - 192.168.225.1
#   [2] ecsn002 - ptroughton - 192.168.225.2
#   [3] ecsn003 - jpertwee   - 192.168.225.3
#   [4] ecsn004 - tbaker     - 192.168.225.4 ${Brown}
#   [5] ecsn005 - pdavison   - 192.168.225.5
print_section_header "CLUSTER NODE SYSTEMS" 1,33  5,40
print_result "${LightRed}-> ${Brown}[1] ${Green}${tardis_head_node_ID} - ${LightBlue}${tardis_head_node_alias}  - ${LightPurple}${tardis_head_node_IP}"
print_result "${LightRed}-> ${Brown}[2] ${Green}${tardis_compute_node1_ID} - ${LightBlue}${tardis_compute_node1_alias}  - ${LightPurple}${tardis_compute_node1_IP}"
print_result "${LightRed}-> ${Brown}[3] ${Green}${tardis_compute_node2_ID} - ${LightBlue}${tardis_compute_node2_alias}  - ${LightPurple}${tardis_compute_node2_IP}"
print_result "${LightRed}-> ${Brown}[4] ${Green}${tardis_compute_node3_ID} - ${LightBlue}${tardis_compute_node3_alias}  - ${LightPurple}${tardis_compute_node3_IP}"
print_result "${LightRed}-> ${Brown}[5] ${Green}${tardis_compute_node4_ID} - ${LightBlue}${tardis_compute_node4_alias}  - ${LightPurple}${tardis_compute_node4_IP}"
###################################################################################################
############################### Establish ssh connection shortcuts ################################
###################################################################################################
# ssh aliases
#-------------------------------------------------------------------------------------------------#
print_section_header "ssh shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias gokodiak="ssh ${current_user}@kodiak.baylor.edu")
print_alias $(exe alias gowhartnell="ssh ${current_user}@whartnell")
print_alias $(exe alias gojpertwee="ssh ${current_user}@jpertwee")
print_alias $(exe alias gotbaker="ssh ${current_user}@tbaker")
print_alias $(exe alias goptroughton="ssh ${current_user}@ptroughton")
print_alias $(exe alias gopdavison="ssh ${current_user}@pdavison")
print_alias $(exe alias gows1="ssh schultzeb@tardis-student1.ecs.baylor.edu")
print_alias $(exe alias gows2="ssh schultzeb@tardis-student2.ecs.baylor.edu")
current_node_alias=$(current_node_name )
###################################################################################################
########################### Define shortcut directory change commands #############################
###################################################################################################
#-------------------------------------------------------------------------------------------------#
print_section_header "directory change shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias gocode="cd ${global_pct}${pct_code_folder}")                              #
print_alias $(exe alias gopcode="cd ${global_pcode_path}")                                        #
print_alias $(exe alias gorcode="cd ${global_rcode_path}")                                        #
print_alias $(exe alias gomasterpcode="cd ${global_pct}${masterpcode}")                           #
print_alias $(exe alias gomasterrcode="cd ${global_pct}${masterrcode}")                           #
print_alias $(exe alias gogitpcode="cd ${global_pcode_path}${user_folder}")                       #
print_alias $(exe alias gogitrcode="cd ${global_rcode_path}${user_folder}${baylor_recon_repo}")   #
print_alias $(exe alias godata="cd ${global_data_path}")                                          #
print_alias $(exe alias goraw="cd ${global_data_path}${raw_data_folder}")                         #
print_alias $(exe alias gopre="cd ${global_data_path}${pre_data_folder}")                         #
print_alias $(exe alias goproj="cd ${global_data_path}${proj_data_folder}")                       #
print_alias $(exe alias gorecon="cd ${global_data_path}${recon_data_folder}")                     #
print_alias $(exe alias goorg="cd ${global_data_path}${org_data_folder}")                         #
print_alias $(exe alias godocs="cd ${global_data_path}${pct_docs_folder}")                        #
print_alias $(exe alias goinc="cd ${global_pct}${incoming_folder}")                               #
print_alias $(exe alias gostage="cd ${global_pct}${staging_folder}")                              #
print_alias $(exe alias gomyinc="cd ${global_pct}${incoming_folder}${user_folder}")               #
print_alias $(exe alias gomystage="cd ${global_pct}${staging_folder}${user_folder}")              #
print_alias $(exe alias gonewrecon="cd ${current_rdata}")                                         #

print_alias $(exe alias golpct="cd ${tardis_pct}")                                                #
print_alias $(exe alias golcode="cd ${tardis_pct}${pct_code_folder}")                             #
print_alias $(exe alias golrcode="cd ${tardis_pct}${rcode_path}${user_folder}")                   #
print_alias $(exe alias goldata="cd ${tardis_data_path}")                                         #
print_alias $(exe alias golorg="cd ${tardis_data_path}${org_data_folder}")                        #
print_alias $(exe alias golrecon="cd ${tardis_data_path}${recon_data_folder}")                    #
print_alias $(exe alias golnewrecon="cd ${current_lrdata}")                                         #

print_alias $(exe alias gomycode="cd ${user_home}${pct_code_folder}")                             #
print_alias $(exe alias gomypcode="cd ${user_home}${pcode_path}${user_folder}")                   #
print_alias $(exe alias gomyrcode="cd ${user_home}${rcode_path}${user_folder}")                   #
print_alias $(exe alias gomydata="cd ${user_home}${pct_data_folder}")                             #
print_alias $(exe alias gomyorg="cd ${user_home}${pct_data_folder}${org_data_folder}")            #
print_alias $(exe alias gomyrecon="cd ${user_home}${pct_data_folder}${recon_data_folder}")        #

print_alias $(exe alias gogrp="cd ${recon_group}")                                         #

###################################################################################################
################## Set up Kodiak modules, environment variables, and user prompt ##################
###################################################################################################
#*************************************************************************************************#
#************************************ Kodiak login procedure *************************************#
#*************************************************************************************************#
if [ $HOSTNAME == "kodiak" -o $HOSTNAME == "n130" ]
then
    #---------------------------------------------------------------------------------------------#
    #------------------------------------- Load modules ------------------------------------------#
    #---------------------------------------------------------------------------------------------#
    print_section_header "Loading of program and compiler modules" 1,33 5,40
    print "Loading modules..." 0,32 6,40 on

    modules=("unload gcc" "load gcc/4.8.4" "load geant4/10.1.1" "load openmpi/1.8.1" "load root" )
    num_modules=$(expr ${#kodiak_modules[@]} - 1)
    for i in `seq 0 $num_modules`; do print_module_load "${kodiak_modules[$i]}" ; done
    #---------------------------------------------------------------------------------------------#
    print "\nCurrently loaded modules:" 0,32
    print_module_load "-l list"
    #---------------------------------------------------------------------------------------------#
    login_dir=${user_home}${rcode_path}${user_folder}
    #---------------------------------------------------------------------------------------------#
###################################################################################################
############### Set up Tardis node modules, environment variables, and user prompt ################
###################################################################################################
#*************************************************************************************************#
#********************************** WHartnell login procedure ************************************#
#*************************************************************************************************#
elif [ $HOSTNAME == "whartnell" -o $HOSTNAME == "ecsn001" ]
then
    #---------------------------------------------------------------------------------------------#
    #------------------------------------- Load modules ------------------------------------------#
    #---------------------------------------------------------------------------------------------#
    print_section_header "Loading of program and compiler modules" 1,33 5,40
    print "Loading modules..." 0,32
    num_modules=$(expr ${#tardis_modules[@]} - 1)
    for i in `seq 0 $num_modules`; do print_module_load "${tardis_modules[$i]}" ; done
    load_CUDA_modules
    #---------------------------------------------------------------------------------------------#
    print "\nCurrently loaded modules:" 0,32
    print_module_load "-l list"
    #---------------------------------------------------------------------------------------------#
    login_dir=${user_home}
    #---------------------------------------------------------------------------------------------#
#*************************************************************************************************#
#********************************** PTRoughton login procedure ***********************************#
#*************************************************************************************************#
elif [ $HOSTNAME == "ptroughton" -o $HOSTNAME == "ecsn002" ]
then
#---------------------------------------------------------------------------------------------#
    #------------------------------------- Load modules ------------------------------------------#
    #---------------------------------------------------------------------------------------------#
    print_section_header "Loading of program and compiler modules" 1,33 5,40
    print "Loading modules..." 0,32
    num_modules=$(expr ${#tardis_modules[@]} - 1)
    for i in `seq 0 $num_modules`; do print_module_load "${tardis_modules[$i]}" ; done
    load_CUDA_modules
    #---------------------------------------------------------------------------------------------#
    print "\nCurrently loaded modules:" 0,32
    print_module_load "-l list"
    #---------------------------------------------------------------------------------------------#
    login_dir="${tardis_pct}${pct_code_folder}${rcode_folder}${user_folder}"
    #---------------------------------------------------------------------------------------------#
#*************************************************************************************************#
#*********************************** JPertwee login procedure ************************************#
#*************************************************************************************************#
elif [ $HOSTNAME == "jpertwee" -o $HOSTNAME == "ecsn003" ]
then
    #---------------------------------------------------------------------------------------------#
    #------------------------------------- Load modules ------------------------------------------#
    #---------------------------------------------------------------------------------------------#
    print_section_header "Loading of program and compiler modules" 1,33 5,40
    print "Loading modules..." 0,32
    num_modules=$(expr ${#tardis_modules[@]} - 1)
    for i in `seq 0 $num_modules`; do print_module_load "${tardis_modules[$i]}" ; done
    load_CUDA_modules
    #---------------------------------------------------------------------------------------------#
    print "\nCurrently loaded modules:" 0,32
    print_module_load "-l list"
    #---------------------------------------------------------------------------------------------#
    login_dir="${tardis_pct}${pct_code_folder}${rcode_folder}${user_folder}"
    #---------------------------------------------------------------------------------------------#
#*************************************************************************************************#
#************************************ TBaker login procedure *************************************#
#*************************************************************************************************#
elif [ $HOSTNAME == "tbaker" -o $HOSTNAME == "ecsn004" ]
then
    #---------------------------------------------------------------------------------------------#
    #------------------------------------- Load modules ------------------------------------------#
    #---------------------------------------------------------------------------------------------#
    print_section_header "Loading of program and compiler modules" 1,33 5,40
    print "Loading modules..." 0,32
    num_modules=$(expr ${#tardis_modules[@]} - 1)
    for i in `seq 0 $num_modules`; do print_module_load "${tardis_modules[$i]}" ; done
    load_CUDA_modules
    #---------------------------------------------------------------------------------------------#
    print "\nCurrently loaded modules:" 0,32
    print_module_load "-l list"
    #---------------------------------------------------------------------------------------------#
    login_dir="${tardis_pct}${pct_code_folder}${rcode_folder}${user_folder}"
    #---------------------------------------------------------------------------------------------#
#*************************************************************************************************#
#*********************************** PDavison login procedure ************************************#
#*************************************************************************************************#
elif [ $HOSTNAME == "pdavison" -o $HOSTNAME == "ecsn005" ]
then
    #---------------------------------------------------------------------------------------------#
    #------------------------------------- Load modules ------------------------------------------#
    #---------------------------------------------------------------------------------------------#
    print_section_header "Loading of program and compiler modules" 1,33 5,40
    print "Loading modules..." 0,32
    num_modules=$(expr ${#tardis_modules[@]} - 1)
    for i in `seq 0 $num_modules`; do print_module_load "${tardis_modules[$i]}" ; done
    load_CUDA_modules
    #---------------------------------------------------------------------------------------------#
    print "\nCurrently loaded modules:" 0,32
    print_module_load "-l list"
    #---------------------------------------------------------------------------------------------#
    login_dir="${tardis_pct}${pct_code_folder}${rcode_folder}${user_folder}"
    #---------------------------------------------------------------------------------------------#
#*************************************************************************************************#
#****************************** Workstation #1/#2 login procedure ********************************#
#*************************************************************************************************#
elif [ $host == "tardis-student1" -o $host == "tardis-student2" ]
then
    #---------------------------------------------------------------------------------------------#
    #------------------------------ Set environment variables ------------------------------------#
    #---------------------------------------------------------------------------------------------#
    CUDA_PATH=/usr/local/cuda-6.5
    export PATH=${CUDA_PATH}/bin:$PATH:$HOME/bin
    export LD_LIBRARY_PATH=${CUDA_PATH}/lib64:${LD_LIBRARY_PATH}
    #---------------------------------------------------------------------------------------------#
    #------------------------------------- Load modules ------------------------------------------#
    #---------------------------------------------------------------------------------------------#
    print_section_header "Loading of program and compiler modules" 1,33 5,40
    print "Loading modules..." 0,32
    print_module_load "load make/make-4.1"
    #---------------------------------------------------------------------------------------------#
    login_dir=${workstation_pct}
    #---------------------------------------------------------------------------------------------#
fi
###################################################################################################
############################ Query/print host information and status ##############################
###################################################################################################
#-------------------------------------------------------------------------------------------------#
print_section_header "Currently loaded program/compiler versions" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
if [ $HOSTNAME == "tardis-student1" -o $HOSTNAME == "tardis-student2" ]
then
     print_program_version "Java" "java -version"
     print_program_version "Make" "make --version" "\n"
     print_program_version "git" "git --version" "\n"
     #print_program_version "Matlab"; print_result "$(matlab -n)"
     #print_program_version "GEANT4"; print_result "$(geant4 --version)"
     print_program_version "gcc" "gcc -dumpversion" "\n"
     print_program_version "CUDA" "nvcc --version" "\n"
else

     print_program_version "Java" "java -version"
     print_program_version "Make" "make --version" "\n"
     print_program_version "git" "git --version" "\n"
     print_program_version "Emacs" "emacs --version" "\n"
     print_program_version "Perl" "perl --version"
     print_program_version "Python" "python --version"
     print_program_version "Ruby"  "ruby --version" "\n"
     #print_program_version "Matlab" "matlab -n"
     #print_program_version "GEANT4" "geant4 --version"
     print_program_version "gcc" "gcc -dumpversion" "\n"
     print_program_version "CUDA" "nvcc --version" "\n"
fi
print_program_version "bash" "echo -e $BASH_VERSION"
###################################################################################################
################################### Specify user prompt format ####################################
###################################################################################################
PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"
if [[ ${EUID} == 0 ]] ; then
    export PS1=$'\[\[\033[0;33m\][\D{%T %Z (%a) %m-%d-%Y}] \[\033[35m\]$PWD\n\[\033[36m\][\u.\h/${current_node_alias}]\[\033[0m\] \\[\033[32m\\]\xe2\x9e\xa4\\[\033[37m\\] '
else
    export PS1=$'\[\[\033[0;33m\][\D{%T %Z (%a) %m-%d-%Y}] \[\033[35m\]$PWD \[\033[0;34m\]${git_branch}${git_dirty}\n\[\033[36m\][\u.\h/${current_node_alias}]\[\033[0m\] \\[\033[32m\\]\xe2\x9e\xa4\\[\033[37m\\] '
fi
export PS2="-> "
###################################################################################################
############################ Query/print host information and status ##############################
###################################################################################################
if [ $HOSTNAME == "whartnell" ]
then
    host_ID="ecsn001"
else
    aliases=$(hostname -a)
    host_ID=$HOSTNAME
    host_name=${aliases[$(echo ${#aliases[@]})-1]}
fi
print_section_header "Host Information" 1,33 5,40
print_info "Hostname" "${host_ID} ${LightBlue}(${host_name})"
print_info "Host IP" "$(hostname -i) ${LightBlue}($(hostname -I))"
print_info "Host Users/Activity" "\n$(w)\n"
#print_info "Host computational load" "\n$(top)\n"
###################################################################################################
####################### Query/print operating system information/properties #######################
###################################################################################################
print_info "OS" "$(uname -o) ${LightBlue}($(uname -m))"
print_info "$(uname -s) Kernel Version" "$(uname -v)"
print_info "$(uname -s) Kernel Release" "$(uname -r)"
###################################################################################################
######################### Query/print user/group information and status ###########################
###################################################################################################
cd "${login_dir}"
print_section_header "User Information" 1,33 5,40
print_info "Username" "$(id -un) ${LightBlue}($(id -u))"
print_info "User Group(s)" "$(id -Gn) ${LightBlue}($(id -G))"
print_info "Current Group" "$(id -gn) ${LightBlue}($(id -g))"
print_info "User Home" "${user_home}"
print_info "User Data Home" "${user_home}${pct_data_folder}"
print_info "User Code Home" "${user_home}${pct_code_folder}"
print_info "Login Home" "${login_dir}"
print_result "$(ls -a)"
#top
###################################################################################################
########################################### END OF FILE ###########################################
###################################################################################################

