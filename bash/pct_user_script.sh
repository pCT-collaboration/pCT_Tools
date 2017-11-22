#!/bin/bash
###################################################################################################
############################### Redefine common bash functions ####################################
###################################################################################################
alias mv="mv -v"
alias rm="rm -v"
alias echo="echo -e"
alias scp="scp -rCp -c blowfish"
alias cp="cp -apv"
###################################################################################################
################################# Define new bash functions #######################################
###################################################################################################
alias cpdir="cp -apRv"
alias deldir="rm -rf"
alias contents="tree -dluDC"
alias lst="ls -alt --color"
alias host=$(hostname)
###################################################################################################
################################### Console output definitions ####################################
###################################################################################################
#cd /ion/pCT_code/pCT-collaboration/pCT_Tools/bash_scripts
#./load_pct_functions.sh
. /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash_scripts/load_pct_functions.sh
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
echo -e "${LightRed}-> ${Brown}[1] ${Green}${tardis_head_node_ID} - ${LightBlue}${tardis_head_node_alias}  - ${LightPurple}${tardis_head_node_IP}"
echo -e "${LightRed}-> ${Brown}[2] ${Green}${tardis_compute_node1_ID} - ${LightBlue}${tardis_compute_node1_alias}  - ${LightPurple}${tardis_compute_node1_IP}"
echo -e "${LightRed}-> ${Brown}[3] ${Green}${tardis_compute_node2_ID} - ${LightBlue}${tardis_compute_node2_alias}  - ${LightPurple}${tardis_compute_node2_IP}"
echo -e "${LightRed}-> ${Brown}[4] ${Green}${tardis_compute_node3_ID} - ${LightBlue}${tardis_compute_node3_alias}  - ${LightPurple}${tardis_compute_node3_IP}"
echo -e "${LightRed}-> ${Brown}[5] ${Green}${tardis_compute_node4_ID} - ${LightBlue}${tardis_compute_node4_alias}  - ${LightPurple}${tardis_compute_node4_IP}"
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
###################################################################################################
########################### Define shortcut directory change commands #############################
###################################################################################################
#-------------------------------------------------------------------------------------------------#
print_section_header "Kodiak data directory change shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias goinc="cd ${incoming_path}")                               #
print_alias $(exe alias gostage="cd ${staging_path}")                              #
print_alias $(exe alias godata="cd ${pct_data_path}")                                          #
print_alias $(exe alias goraw="cd ${raw_data_path}")                         #
print_alias $(exe alias gopre="cd ${pre_data_path}")                         #
print_alias $(exe alias goproj="cd ${proj_data_path}")                       #
print_alias $(exe alias goorg="cd ${org_data_path}")                         #
print_alias $(exe alias gorecon="cd ${recon_data_path}")                     #
#print_alias $(exe alias gonewrecon="cd ${current_rdata}")                                         #
print_alias $(exe alias godocs="cd ${pct_data_path}${pct_docs_folder}" )                      #
#-------------------------------------------------------------------------------------------------#
print_section_header "Kodiak code directory change shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias gocode="cd ${global_code_path}" )                             #
print_alias $(exe alias gogitcode="cd ${global_git_code_path}" )                             #
print_alias $(exe alias gopcode="cd ${global_pcode_path}" )                                      #
print_alias $(exe alias gorcode="cd ${global_rcode_path}" )                                       #
print_alias $(exe alias gotools="cd ${pct_functions_git_repo_path}")
#-------------------------------------------------------------------------------------------------#
print_section_header "Kodiak user data/code directory change shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias gomyinc="cd ${incoming_path}${user_folder}"  )             #
print_alias $(exe alias gomystage="cd ${staging_path}${user_folder}" )             #
print_alias $(exe alias gomydata="cd ${user_home}${pct_data_folder}"  )                           #
print_alias $(exe alias gomyorg="cd ${user_home}${pct_data_folder}${org_data_folder}" )           #
print_alias $(exe alias gomyrecon="cd ${user_home}${pct_data_folder}${recon_data_folder}")        #
print_alias $(exe alias gomycode="cd ${user_home}${pct_code_folder}"   )                          #
print_alias $(exe alias gomypcode="cd ${user_home}${pcode_subdir_path}${user_folder}")                   #
print_alias $(exe alias gomyrcode="cd ${user_home}${rcode_subdir_path}${user_folder}" )                  #
#-------------------------------------------------------------------------------------------------#
print_section_header "Tardis data/code directory change shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias golpct="cd ${tardis_pct_folder}" )                                               #
print_alias $(exe alias golcode="cd ${tardis_code_path}")                             #
print_alias $(exe alias golgitcode="cd ${tardis_git_code_path}" )                             #
print_alias $(exe alias golrcode="cd ${tardis_rcode_path}${user_folder}")                   #
print_alias $(exe alias golpcode="cd ${tardis_pcode_path}${user_folder}")                   #
print_alias $(exe alias goldata="cd ${tardis_data_path}")                                         #
print_alias $(exe alias golorg="cd ${tardis_org_data_path}")                        #
print_alias $(exe alias golrecon="cd ${tardis_recon_data_path}")                    #
print_alias $(exe alias golusers="cd ${tardis_user_data_path}")                    #
print_alias $(exe alias goltempin="cd ${tardis_temp_input_data_path}")                    #
print_alias $(exe alias goltempout="cd ${tardis_temp_output_data_path}")                    #


#print_alias $(exe alias golnewrecon="cd ${current_lrdata}")                                         #
#-------------------------------------------------------------------------------------------------#
print_section_header "Kodiak recon group directory change shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
#print_alias $(exe alias gorgrpgit="cd ${pct_home}/${recon_group}/")                                        #
#-------------------------------------------------------------------------------------------------#
print_section_header "Kodiak group data/code directory change shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias gorgrp="cd ${pct_home}/${recon_group}")        #
print_alias $(exe alias goghome="cd ${pct_home}/${recon_group}")        #
print_alias $(exe alias gogdata="cd ${recon_group_home}${pct_data_folder}"  )                           #
print_alias $(exe alias gogorg="cd ${recon_group_home}${pct_data_folder}${org_data_folder}" )           #
print_alias $(exe alias gogrecon="cd ${recon_group_home}${pct_data_folder}${recon_data_folder}")        #
print_alias $(exe alias gogcode="cd ${recon_group_home}${pct_code_folder}"   )                          #
print_alias $(exe alias gogpcode="cd ${recon_group_home}${pcode_subdir_path}${user_folder}")                   #
print_alias $(exe alias gogrcode="cd ${recon_group_home}${rcode_subdir_path}${user_folder}")                  #

#alias goBlake=


###################################################################################################
################## Set up Kodiak modules, environment variables, and user prompt ##################
###################################################################################################
#*************************************************************************************************#
#************************************ Kodiak login procedure *************************************#
#*************************************************************************************************#
if [ $HOSTNAME == "kodiak" -o $HOSTNAME == "n130"  -o $HOSTNAME == "login001" ]
then
    #---------------------------------------------------------------------------------------------#
    #------------------------------------- Load modules ------------------------------------------#
    #---------------------------------------------------------------------------------------------#
    print_section_header "Loading of program and compiler modules" 1,33 5,40
    print "Loading modules..." 0,32 6,40 on
    modules=("unload gcc" "load gcc/4.8.4" "load geant4/10.1.1" "load openmpi/1.8.1" "load root" )
    num_modules=$(expr ${#kodiak_modules[@]} - 1)
    for i in "${kodiak_modules[@]}"    
    do  
      print_module_load "$i"    
    done
    #---------------------------------------------------------------------------------------------#
    print "\nCurrently loaded modules:" 0,32
    print_module_load "-l list"
    #---------------------------------------------------------------------------------------------#
    login_dir="${current_global_rcode_path}"
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
    #for i in `seq 0 $num_modules`; do print_module_load "${tardis_modules[$i]}" ; done
    for i in "${tardis_modules[@]}"    
    do  
      print_module_load "$i"    
    done
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
    #for i in `seq 0 $num_modules`; do print_module_load "${tardis_modules[$i]}" ; done
    for i in "${tardis_modules[@]}"    
    do  
      print_module_load "$i"    
    done
    load_CUDA_modules
    #---------------------------------------------------------------------------------------------#
    print "\nCurrently loaded modules:" 0,32
    print_module_load "-l list"
    #---------------------------------------------------------------------------------------------#
    login_dir="${current_tardis_rcode_path}"
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
    #for i in `seq 0 $num_modules`; do print_module_load "${tardis_modules[$i]}" ; done
    for i in "${tardis_modules[@]}"    
    do  
      print_module_load "$i"    
    done
    load_CUDA_modules
    #---------------------------------------------------------------------------------------------#
    print "\nCurrently loaded modules:" 0,32
    print_module_load "-l list"
    #---------------------------------------------------------------------------------------------#
    login_dir="${current_tardis_rcode_path}"
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
    #for i in `seq 0 $num_modules`; do print_module_load "${tardis_modules[$i]}" ; done
    for i in "${tardis_modules[@]}"    
    do  
      print_module_load "$i"    
    done
    load_CUDA_modules
    #---------------------------------------------------------------------------------------------#
    print "\nCurrently loaded modules:" 0,32
    print_module_load "-l list"
    #---------------------------------------------------------------------------------------------#
    login_dir="${current_tardis_rcode_path}"
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
    #for i in `seq 0 $num_modules`; do print_module_load "${tardis_modules[$i]}" ; done
    for i in "${tardis_modules[@]}"    
    do  
      print_module_load "$i"    
    done
    load_CUDA_modules
    #---------------------------------------------------------------------------------------------#
    print "\nCurrently loaded modules:" 0,32
    print_module_load "-l list"
    #---------------------------------------------------------------------------------------------#
    current_global_rcode_path=${current_global_git_rcode_path}
    login_dir="${current_tardis_rcode_path}"
    #---------------------------------------------------------------------------------------------#
#*************************************************************************************************#
#****************************** Workstation #1/#2 login procedure ********************************#
#*************************************************************************************************#
elif [ $HOSTNAME == "tardis-student1" -o $HOSTNAME == "tardis-student2" ]
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
#cd "${login_dir}"
print_section_header "User Information" 1,33 5,40
print_info "Username" "$(id -un) ${LightBlue}($(id -u))"
print_info "User Group(s)" "$(id -Gn) ${LightBlue}($(id -G))"
print_info "Current Group" "$(id -gn) ${LightBlue}($(id -g))"
print_info "User Home" "${user_home}"
print_info "User Data Home" "${user_home}${pct_data_folder}"
print_info "User Code Home" "${user_home}${pct_code_folder}"
#top
###################################################################################################
########################################### END OF FILE ###########################################
###################################################################################################
login_tasks