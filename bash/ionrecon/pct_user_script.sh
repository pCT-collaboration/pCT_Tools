#!/bin/bash
###################################################################################################
##################################### Define global variables #####################################
###################################################################################################
current_host=$(hostname)
current_user=$(id -un)
current_group=$(id -gn)
user_folder="/${current_user}"
path_dirs=$(echo "${PATH//:/$'\n'}")
login_dir=~
USERS=$( users )
declare -a PCT_USERS
###################################################################################################
########################## Set current data & code value/choice variables #########################
###################################################################################################
#-------------------------------------------------------------------------------------------------#
version_CUDA_Kodiak=80
version_CUDA_Tardis_Headnode=80
version_CUDA_Tardis=80
version_CUDA_workstation=80
rcode_cu_file="/src/pCT_Reconstruction_Data_Segments_Blake.cu"
rcode_compute="compute_35"
rcode_sm="sm_35"
rcode_object="pCT_Reconstruction.out"
rcode_flags="-O3"
#-------------------------------------------------------------------------------------------------#
dindir="/input_Sensitom_CDH6/"
doutdir="/output_Sensitom_CDH6/B_25600/"
#current_rcode="Baylor_rcode"    # Options: Baylor_rcode, pct-collab_rcode, Blake_rcode, old_rcode
#current_rcode=$Baylor_rcode    # Options: $Baylor_rcode, $pct_collab_rcode, $Blake_rcode, $old_rcode
current_rcode="pct_collab_rcode"    # Options: Baylor_rcode, pct-collab_rcode, Blake_rcode, old_rcode
current_rcode_git='direct'      # Options: user_git='user', direct_git='direct'
#current_rcode_git=$direct_git  # Options: user_git='user', direct_git='direct'
current_phantom="CTP404_Sensitom"
current_phantom_ID="LMUDECT"
current_phantom_name="LMU_DECT"
current_scan_type="Experimental"
current_run_date="16-04-26"
current_run_number="0067_Top_Cont"
current_preprocessed_date="16-06-09"
#current_run_number="0074_Bot_Sup_Cont"
#current_preprocessed_date="16-06-10/"
#current_run_number="0075_Bot_Inf_Cont"
#current_preprocessed_date="16-06-11/"
###################################################################################################
############################### Redefine common bash functions ####################################
###################################################################################################
alias mv="mv -v"
alias rm="rm -v"
alias echo="echo -e"
alias scp="scp -rCp -c blowfish"
alias cp="cp -apv"
###################################################################################################
############### Source pCT (1) constant variable and (2) function definition scripts ##############
###################################################################################################
#-------------------------------------------------------------------------------------------------#
#source /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/load_pct_constvars.sh
source /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/bashvars.sh
#source /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/load_pct_functions.sh
source /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/bash_tools.sh
source /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/pct_tools.sh
#source /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/awk_tools.awk
###################################################################################################
####################################### PBS Queue Info ############################################
###################################################################################################
allnodes=( $(getpbsnodearray) )      
tardisnodes=( $(pbstardisnodes) )      
availtardisnodes=( $(pbsavailtardisnodes) )      
tardis_node_query=()
avail_tardis_node_query=()
tardis_nodes=()
avail_tardis_nodes=()
tardis_node_states=()
avail_tardis_node_states=()
tardis_node_pcpus=()
avail_tardis_node_pcpus=()
#-------------------------------------------------------------------------------------------------#
get_current_node_alias
#-------------------------------------------------------------------------------------------------#
###################################################################################################
######### Console output written on login before subsequent cluster/node dependent output #########
###################################################################################################
#-------------------------------------------------------------------------------------------------#
print_section "Tardis node info" 1,33  5,40
#-------------------------------------------------------------------------------------------------#
print_tardis_node_info 0
print_tardis_node_info 1
print_tardis_node_info 2
print_tardis_node_info 3
print_tardis_node_info 4
print_tardis_node_info 5
print_tardis_node_info 6
###################################################################################################
########################### Establish ssh connection aliases (shortcuts) ##########################
###################################################################################################
#-------------------------------------------------------------------------------------------------#
print_section "ssh shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias gokodiak="ssh ${current_user}@kodiak.baylor.edu")
print_alias $(exe alias gowhartnell="ssh ${current_user}@whartnell")
print_alias $(exe alias gojpertwee="ssh ${current_user}@jpertwee")
print_alias $(exe alias gotbaker="ssh ${current_user}@tbaker")
print_alias $(exe alias goptroughton="ssh ${current_user}@ptroughton")
print_alias $(exe alias gopdavison="ssh ${current_user}@pdavison")
print_alias $(exe alias gonode6="ssh ${current_user}@ecsn006")
print_alias $(exe alias gonode7="ssh ${current_user}@ecsn007")
print_alias $(exe alias gows1="ssh schultzeb@tardis-student1.ecs.baylor.edu")
print_alias $(exe alias gows2="ssh schultzeb@tardis-student2.ecs.baylor.edu")
#current_node_alias=$(current_node_name )
###################################################################################################
########################### Define shortcut directory change commands #############################
###################################################################################################
#-------------------------------------------------------------------------------------------------#
print_section "Kodiak data directory change shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias goinc="cd ${incoming_path}")                                              #
print_alias $(exe alias gostage="cd ${staging_path}")                                             #
print_alias $(exe alias godata="cd ${pct_data_path}")                                             #
print_alias $(exe alias goraw="cd ${raw_data_path}")                                              #
print_alias $(exe alias gopre="cd ${pre_data_path}")                                              #
print_alias $(exe alias goproj="cd ${proj_data_path}")                                            #
print_alias $(exe alias goorg="cd ${org_data_path}")                                              #
print_alias $(exe alias gorecon="cd ${recon_data_path}")                                          #
#print_alias $(exe alias gonewrecon="cd ${current_rdata}")                                        #
print_alias $(exe alias godocs="cd ${pct_data_path}${pct_docs_folder}" )                          #
#-------------------------------------------------------------------------------------------------#
print_section "Kodiak code directory change shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias gocode="cd ${global_code_path}" )                                         #
print_alias $(exe alias gogitcode="cd ${global_git_code_path}" )                                  #
print_alias $(exe alias gopcode="cd ${global_pcode_path}" )                                       #
print_alias $(exe alias gorcode="cd ${global_rcode_path}" )                                       #
print_alias $(exe alias gokrcode="cd ${global_pct_collab_rcode_git_repo_path}" )                                       #
print_alias $(exe alias gogitrcode="cd ${global_Baylor_rcode_git_repo_path}" )                    #
print_alias $(exe alias gogitmyrrcode="cd ${global_Blake_rcode_git_repo_path}" )                  #
print_alias $(exe alias gogitorcode="cd ${global_old_rcode_git_repo_path}" )                      #
print_alias $(exe alias gogittools="cd ${global_pct_tools_git_repo_path}" )                       #
print_alias $(exe alias gotools="cd ${pct_functions_git_repo_path}")
#-------------------------------------------------------------------------------------------------#
print_section "Kodiak user data/code directory change shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias gomyinc="cd ${incoming_path}${user_folder}"  )                            #
print_alias $(exe alias gomystage="cd ${staging_path}${user_folder}" )                            #
print_alias $(exe alias gomydata="cd ${user_home}${pct_data_folder}"  )                           #
print_alias $(exe alias gomyorg="cd ${user_home}${pct_data_folder}${org_data_folder}" )           #
print_alias $(exe alias gomyrecon="cd ${user_home}${pct_data_folder}${recon_data_folder}")        #
print_alias $(exe alias gomycode="cd ${user_home}${pct_code_folder}"   )                          #
print_alias $(exe alias gomypcode="cd ${user_home}${pcode_subdir_path}${user_folder}")            #
print_alias $(exe alias gomyrcode="cd ${user_home}${rcode_subdir_path}${user_folder}" )           #
#-------------------------------------------------------------------------------------------------#
print_section "Tardis data/code directory change shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias golpct="cd ${tardis_pct_folder}" )                                        #
print_alias $(exe alias golcode="cd ${tardis_code_path}")                                         #
print_alias $(exe alias golgitcode="cd ${tardis_git_code_path}" )                                 #
print_alias $(exe alias golrcode="cd ${tardis_rcode_path}${user_folder}")                         #
print_alias $(exe alias golpcode="cd ${tardis_pcode_path}${user_folder}")                         #
print_alias $(exe alias golgitrcode="cd ${tardis_Baylor_rcode_git_repo_path}")                    #
print_alias $(exe alias golgitmyrrcode="cd ${tardis_Blake_rcode_git_repo_path}")                  #
print_alias $(exe alias golgitorcode="cd ${tardis_old_rcode_git_repo_path}")                      #
print_alias $(exe alias golgittools="cd ${tardis_pct_tools_git_repo_path}")                       #
print_alias $(exe alias goldata="cd ${tardis_data_path}")                                         #
print_alias $(exe alias golorg="cd ${tardis_org_data_path}")                                      #
print_alias $(exe alias golrecon="cd ${tardis_recon_data_path}")                                  #
print_alias $(exe alias golusers="cd ${tardis_user_data_path}")                                   #
print_alias $(exe alias goltempin="cd ${tardis_temp_input_data_path}")                            #
print_alias $(exe alias goltempout="cd ${tardis_temp_output_data_path}")                          #
#print_alias $(exe alias golnewrecon="cd ${current_lrdata}")                                      #
#-------------------------------------------------------------------------------------------------#
print_section "Currently used Kodiak/Tardis recon code directory change shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias gocgitcode="cd ${current_global_rcode_path}" )                            #
print_alias $(exe alias gocgitcode="cd ${current_global_git_rcode_path}" )                        #
print_alias $(exe alias gocucode="cd ${current_global_user_rcode_path}" )                         #
print_alias $(exe alias gocgcode="cd ${current_global_group_rcode_path}" )                        #
print_alias $(exe alias goclgitcode="cd ${current_tardis_rcode_path}" )                           #
print_alias $(exe alias goclgitcode="cd ${current_tardis_git_rcode_path}" )                       #
print_alias $(exe alias goclucode="cd ${current_tardis_user_rcode_path}" )                        #
print_alias $(exe alias goclgcode="cd ${current_tardis_group_rcode_path}" )                       #
#-------------------------------------------------------------------------------------------------#
print_section "Currently used Kodiak/Tardis recon IO data directory change shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias gocudata="cd ${user_current_data_path}" )                                 #
#########rgroup_current_data_path="${rgroup_recon_data_path}${recon_data_folder}"                 #
print_alias $(exe alias gocldata="cd ${tardis_current_data_path}" )                               #
print_alias $(exe alias gocurecon="cd ${user_current_recon_data_path}" )                          #
########rgroup_current_recon_data_path="${rgroup_recon_data_path}${recon_data_folder}"            #
print_alias $(exe alias goclurecon="cd ${tardis_current_recon_data_path}" )                       #
#-------------------------------------------------------------------------------------------------#
print_section "Kodiak group data/code directory change shortcut (alias) commands" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
print_alias $(exe alias gorgrp="cd ${pct_home}/${recon_group}")                                   #
print_alias $(exe alias goghome="cd ${pct_home}/${recon_group}")                                  #
print_alias $(exe alias gogdata="cd ${recon_group_home}${pct_data_folder}"  )                     #
print_alias $(exe alias gogorg="cd ${recon_group_home}${pct_data_folder}${org_data_folder}" )     #
print_alias $(exe alias gogrecon="cd ${recon_group_home}${pct_data_folder}${recon_data_folder}")  #
print_alias $(exe alias gogcode="cd ${recon_group_home}${pct_code_folder}"   )                    #
print_alias $(exe alias gogpcode="cd ${recon_group_home}${pcode_subdir_path}${user_folder}")      #
print_alias $(exe alias gogrcode="cd ${recon_group_home}${rcode_subdir_path}${user_folder}")      #
###################################################################################################
################## Set up Kodiak modules, environment variables, and user prompt ##################
###################################################################################################
#*************************************************************************************************#
#************************************ Kodiak login procedure *************************************#
#*************************************************************************************************#
if [ $current_host == "kodiak" -o $current_host == "n130"  -o $current_host == "login001" ]
then
    #---------------------------------------------------------------------------------------------#
    #------------------------------------- Load modules ------------------------------------------#
    #---------------------------------------------------------------------------------------------#
    print_section "Loading of program and compiler modules" 1,33 5,40
    print "Loading modules..." 0,32 6,49 on
    modules=("unload gcc" "load gcc/4.8.4" "load geant4/10.1.1" "load openmpi/1.8.1" "load root" )
    num_modules=$(expr ${#kodiak_modules[@]} - 1)
    for i in "${kodiak_modules[@]}"    
    do  
      print_module_load "$i"    
    done
    #---------------------------------------------------------------------------------------------#
    print "\nCurrently loaded modules:" 0,32 6,49 on
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
elif [ $current_host == "whartnell" -o $current_host == "ecsn001" ]
then
    tardis_login_tasks 0
#*************************************************************************************************#
#********************************** PTRoughton login procedure ***********************************#
#*************************************************************************************************#
elif [ $current_host == "ptroughton" -o $current_host == "ecsn002" ]
then
    tardis_login_tasks 1
#*************************************************************************************************#
#*********************************** JPertwee login procedure ************************************#
#*************************************************************************************************#
elif [ $current_host == "jpertwee" -o $current_host == "ecsn003" ]
then
    tardis_login_tasks 2
#*************************************************************************************************#
#************************************ TBaker login procedure *************************************#
#*************************************************************************************************#
elif [ $current_host == "tbaker" -o $current_host == "ecsn004" ]
then
    tardis_login_tasks 3
#*************************************************************************************************#
#*********************************** PDavison login procedure ************************************#
#*************************************************************************************************#
elif [ $current_host == "pdavison" -o $current_host == "ecsn005" ]
then
    tardis_login_tasks 4
#*************************************************************************************************#
#****************************** Workstation #1/#2 login procedure ********************************#
#*************************************************************************************************#
elif [ $current_host == "tardis-student1" -o $current_host == "tardis-student2" ]
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
    print_section "Loading of program and compiler modules" 1,33 5,40
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
print_section "Currently loaded program/compiler versions" 1,33 5,40
#-------------------------------------------------------------------------------------------------#
if [ $current_host == "tardis-student1" -o $current_host == "tardis-student2" ]
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
############################ Query/print host information and status ##############################
###################################################################################################
if [ $current_host == "whartnell" ]
then
    host_ID="ecsn001"
else
    aliases=$(hostname -a)
    host_ID=$current_host
    host_name=${aliases[$(echo ${#aliases[@]})-1]}
    if [[ -z $host_name ]]; then host_name=$(hostname -s); fi
fi
#-------------------------------------------------------------------------------------------------#
login_tasks
#-------------------------------------------------------------------------------------------------#
###################################################################################################
########################################### END OF FILE ###########################################
###################################################################################################
