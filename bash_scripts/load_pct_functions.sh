#!/bin/bash
console_width=90
dark="0;"
light="1;"
red="31m"
green="32m"
brown="33m"
blue="34m"
purple="35m"
cyan="36m"
NoColor="\033[0m"
Black="\033[0;30m"
DarkGray="\033[1;30m"

Red="\033[0;31m"
LightRed="\033[1;31m"
Green="\033[0;32m"
LightGreen="\033[1;32m"
Brown="\033[1;33m"
Yellow="\033[0;33m"
Blue="\033[0;34m"
LightBlue="\033[1;34m"
Purple="\033[0;35m"
LightPurple="\033[1;35m"
Cyan="\033[0;36m"
LightCyan="\033[1;36m"
LightGray="\033[0;37m"
White="\033[1;37m"
separator_char="-"
default_background_color="6,40"
default_text_color="0,37"
reset_color="\033[0;37;6;40m"
###################################################################################################
########### User names of collaborators, including internal Baylor student user names #############
###################################################################################################
master="master"
blake="schultze"
blake_baylor="schultzeb"
paniz="karbasip"
ritchie="cair"
andriy="zatserkl"
pier="piersimonip"
tia="plautzt"
val="giamcomettiv"
vlad="bashkirovv"
current_user=$(id -un)
user_folder="/${current_user}"
recon_group="ionrecon"
###################################################################################################
######################## Paths/directories common to Kodiak/Tardis nodes ##########################
###################################################################################################
user_home=~
global_pct="/ion"
global_pct_homes="${global_pct}/home"
tardis_pct="/local"
workstation_pct="/home/share"
pct_code_folder="/pCT_code"
pct_data_folder="/pCT_data"
pct_docs_folder="/pCT_Documentation"
raw_data_folder="/raw_data"
pre_data_folder="/preprocessed_data"
proj_data_folder="/projection_data"
org_data_folder="/organized_data"
recon_data_folder="/reconstruction_data"
baylor_recon_repo="/pCT_Reconstruction"
rcode_folder="/Reconstruction"
pcode_folder="/Preprocessing"
incoming_folder="/incoming"
staging_folder="/staging"
experimental_data_folder="/Experimental"
simulated_data_folder="/Simulated"
GEANT4_run_data_prefix="G_"
TOPAS_run_data_prefix="T_"
raw_data_folder="Input"
projection_data_folder="Output"
   
pct_data_parent_path="${global_pct}${pct_data_folder}"
raw_data_parent_path="${pct_data_parent_path}${raw_data_folder}"
pre_data_parent_path="${pct_data_parent_path}${pre_data_folder}"
proj_data_parent_path="${pct_data_parent_path}${proj_data_folder}"
org_data_parent_path="${pct_data_parent_path}${org_data_folder}"
incoming_parent_path="${global_pct}${incoming_folder}"
staging_parent_path="${global_pct}${staging_folder}"
# git commands, folder name, and account names
git_code_folder="/git"
git_clone_addr_base="git@github.com:"
git_clone_addr_suffix=".git"
pct_collab_git_account="pCT-collaboration"
Baylor_git_account="BaylorICTHUS"
Blake_git_account="BlakeSchultze"
# git repository names
pct_tools_git_repo="pCT_Tools"
rcode_git_repo="pCT_Reconstruction"
old_rcode_git_repo="pct-recon-copy"
# paths to git repositories on Kodiak
pct_tools_git_repo_path="${global_pct}${pct_code_folder}${git_code_folder}/${pct_collab_git_account}/${pct_tools_git_repo}"
old_rcode_git_repo_path="${global_pct}${pct_code_folder}/${pct_collab_git_account}/${old_rcode_git_repo}"
Baylor_rcode_git_repo_path="${global_pct}${pct_code_folder}/${Baylor_git_account}/${rcode_git_repo}"
Blake_rcode_git_repo_path="${global_pct}${pct_code_folder}/${Blake_git_account}/${rcode_git_repo}"
# git clone arguments for primary git repositories
old_rcode_git_clone_addr="${git_clone_addr_base}${pct_collab_git_account}/${old_rcode_git_repo}${git_clone_addr_suffix}"
Baylor_rcode_git_clone_addr="${git_clone_addr_base}${Baylor_git_account}/${rcode_git_repo}${git_clone_addr_suffix}"
Blake_rcode_git_clone_addr="${git_clone_addr_base}${Blake_git_account}/${rcode_git_repo}${git_clone_addr_suffix}"
# filename/path to script loading pCT user functions/shortcuts
load_pct_functions_script="load_pct_functions.sh"
pct_functions_git_repo_path="${global_pct}${pct_code_folder}${git_code_folder}/${pct_collab_git_account}/${pct_tools_git_repo}/bash_scripts"
pct_functions_script_path="${global_pct}${pct_code_folder}${git_code_folder}/${pct_collab_git_account}/${pct_tools_git_repo}/bash_scripts/${load_pct_functions_script}"

current_rcode="/"
current_rdata="/ion/home/recon/pCT_data/reconstruction_data/CTP404_Sensitom/Simulated/G_15-05-24/0001/Output/15-05-24"
current_lrdata="/local/pCT_data/reconstruction_data/CTP404_Sensitom/Simulated/G_15-05-24/0001/Output/15-05-24"
#-------------------------------------------------------------------------------------------------#
#-std=c++11 -gencode arch=$rcode_compute,code=$rcode_sm
masterpcode=${pct_code_folder}${pcode_folder}/${master}
masterrcode=${pct_code_folder}${rcode_folder}/${master}
pcode_path=${pct_code_folder}${pcode_folder}
rcode_path=${pct_code_folder}${rcode_folder}
global_pcode_path=${global_pct}${pcode_path}
global_rcode_path=${global_pct}${rcode_path}
tardis_rcode_path=${tardis_pct}${rcode_path}
global_data_path=${global_pct}${pct_data_folder}
tardis_data_path=${tardis_pct}${pct_data_folder}

pct_data_parent="${global_data_path}${org_data_folder}"
tardis_data_parent="${tardis_data_path}${org_data_folder}"
###################################################################################################
################### Tardis head/compute node IDs, nicknames, and IP addresses #####################
###################################################################################################
# IDs
tardis_head_node_ID="ecsn001"
tardis_compute_node1_ID="ecsn002"
tardis_compute_node2_ID="ecsn003"
tardis_compute_node3_ID="ecsn004"
tardis_compute_node4_ID="ecsn005"
# aliases
tardis_head_node_alias="whartnell"
tardis_compute_node1_alias="ptroughton"
tardis_compute_node2_alias="jpertwee"
tardis_compute_node3_alias="tbaker"
tardis_compute_node4_alias="pdavison"
# Node ID numbers
kodiak=130
whartnell=1
ptroughton=2
jpertwee=3
tbaker=4
pdavison=5
# IPs
tardis_IP_base="192.168.225."
tardis_head_node_IP="${tardis_IP_base}${whartnell}"
tardis_compute_node1_IP="${tardis_IP_base}${ptroughton}"
tardis_compute_node2_IP="${tardis_IP_base}${jpertwee}"
tardis_compute_node3_IP="${tardis_IP_base}${tbaker}"
tardis_compute_node4_IP="${tardis_IP_base}${pdavison}"
###################################################################################################
########## Node specific CUDA SDK selection used in loading approprate gcc/nvcc modules ###########
###################################################################################################
version_CUDA_Kodiak="none"
version_CUDA_Tardis_Headnode=55
version_CUDA_Tardis=70
version_CUDA_workstation=70
rcode_cu_file="/src/pCT_Reconstruction_Data_Segments_Blake.cu"
rcode_compute="compute_35"
rcode_sm="sm_35"
rcode_object="recon.out"
rcode_flags="-O3"
alias nvcc11="nvcc -std=c++11 -gencode arch=${rcode_compute},code=${rcode_sm} ${rcode_flags}"
###################################################################################################
###################################### Function definitions #######################################
###################################################################################################
kodiak_modules=("purge" "unload gcc" "load gcc/4.8.4" "load geant4/10.1.1" "load openmpi/1.8.1" "load root" )
tardis_modules_old=("purge" "load cmake/3.2" "load java/1.8.0" "load emacs/24.5" "load geant4/10.1.1" "load git/2.4.3" "load make/4.1" "load matlab/2015a" "load perl/5.20" "load python/3.4" "load root" "load ruby/2.2.2" "load blacs/openmpi/gcc/64/1.1patch03" "load blacs/openmpi/open64/64/1.1patch03" "load blas/gcc/64/3.5.0" "load blas/open64/64/3.5.0" "load fftw3/openmpi/gcc/64/3.3.4" "load fftw3/openmpi/open64/64/3.3.4" "load lapack/gcc/64/3.5.0" "load lapack/open64/64/3.5.0" "load mpich/ge/gcc/64/3.1.4" "load mpich/ge/open64/64/3.1.4" "load mpiexec/0.84_432" "load mvapich2/1.9-gcc-4.9.2" "load mvapich2/gcc/64/2.1" "load mvapich2/open64/64/2.1" "load openblas/dynamic/0.2.14" "load openmpi/gcc/64/1.8.5" "load openmpi/open64/64/1.8.5" "load scalapack/gcc/64/1.8.0" "load scalapack/open64/64/1.8.0")
tardis_modules=("purge" "load cmake/3.2" "load java/1.8.0" "load emacs/24.5" "load geant4/10.1.1" "load git/2.4.3" "load make/4.1" "load matlab/2015a" "load perl/5.20" "load python/3.4" "load root" "load ruby/2.2.2" "load blacs/openmpi/gcc/64/1.1patch03" "load blacs/openmpi/open64/64/1.1patch03" "load blas/gcc/64/3.6.0" "load blas/open64/64/3.6.0" "load fftw3/openmpi/gcc/64/3.3.4" "load fftw3/openmpi/open64/64/3.3.4" "load lapack/gcc/64/3.6.0" "load lapack/open64/64/3.6.0" "load mpich/ge/gcc/64/3.2" "load mpich/ge/open64/64/3.2" "load mpiexec/0.84_432" "load mvapich2/1.9-gcc-4.9.2" "load mvapich2/gcc/64/2.2b" "load mvapich2/open64/64/2.2b" "load openblas/dynamic/0.2.15" "load openmpi/gcc/64/1.10.1" "load openmpi/open64/64/1.10.1" "load scalapack/mvapich2/gcc/64/2.0.2" "load scalapack/openmpi/gcc/64/2.0.2")
#    modules=("purge" "load cmake/3.2" "load java/1.8.0" "load emacs/24.5" "load geant4/10.1.1" "load git/2.4.3" "load make/4.1" "load matlab/2015a" "load perl/5.20" "load python/3.4" "load root" "load ruby/2.2.2" "load blacs/openmpi/gcc/64/1.1patch03" "load blacs/openmpi/open64/64/1.1patch03" "load blas/gcc/64/3.5.0" "load blas/open64/64/3.5.0" "load fftw3/openmpi/gcc/64/3.3.4" "load fftw3/openmpi/open64/64/3.3.4" "load lapack/gcc/64/3.5.0" "load lapack/open64/64/3.5.0" "load openblas/dynamic/0.2.14" "load openmpi/gcc/64/1.8.5" "load openmpi/open64/64/1.8.5" "load scalapack/gcc/64/1.8.0" "load scalapack/open64/64/1.8.0")
#    "load mvapich2/1.9"
#    "load mvapich2/1.9-centos"
#    "load mvapich2/1.9-gcc-4.7.2"
#    "load mvapich2/1.9-gcc-4.9.2"
#    "load mvapich2/1.9-intel"
#    "load mvapich2/1.9-intel-noaffinity"
#    "load mvapich2/2.0"
#    "load mvapich2/gcc/64/2.1"
#    "load mvapich2/open64/64/2.1"

###################################################################################################
############################### Establish ssh connection shortcuts ################################
###################################################################################################
# ssh aliases
alias gokodiak="ssh ${current_user}@kodiak.baylor.edu"
alias gowhartnell="ssh ${current_user}@whartnell"
alias gojpertwee="ssh ${current_user}@jpertwee"
alias gotbaker="ssh ${current_user}@tbaker"
alias goptroughton="ssh ${current_user}@ptroughton"
alias gopdavison="ssh ${current_user}@pdavison"
alias gows1="ssh schultzeb@tardis-student1.ecs.baylor.edu"
alias gows2="ssh schultzeb@tardis-student2.ecs.baylor.edu"
###################################################################################################
########################### Define shortcut directory change commands #############################
###################################################################################################
alias gocode="cd ${global_pct}${pct_code_folder}"                              #
alias gopcode="cd ${global_pcode_path}"                                       #
alias gorcode="cd ${global_rcode_path}"                                        #
alias gomasterpcode="cd ${global_pct}${masterpcode}"                           #
alias gomasterrcode="cd ${global_pct}${masterrcode}"                          #
alias gogitpcode="cd ${global_pcode_path}${user_folder}"                       #
alias gogitrcode="cd ${global_rcode_path}${user_folder}${baylor_recon_repo}"   #
alias godata="cd ${global_data_path}"                                          #
alias goraw="cd ${global_data_path}${raw_data_folder}"                         #
alias gopre="cd ${global_data_path}${pre_data_folder}"                         #
alias goproj="cd ${global_data_path}${proj_data_folder}"                       #
alias gorecon="cd ${global_data_path}${recon_data_folder}"                     #
alias goorg="cd ${global_data_path}${org_data_folder}"                         #
alias godocs="cd ${global_data_path}${pct_docs_folder}"                       #
alias goinc="cd ${global_pct}${incoming_folder}"                               #
alias gostage="cd ${global_pct}${staging_folder}"                              #
alias gomyinc="cd ${global_pct}${incoming_folder}${user_folder}"               #
alias gomystage="cd ${global_pct}${staging_folder}${user_folder}"              #
alias gonewrecon="cd ${current_rdata}"                                         #

alias golpct="cd ${tardis_pct}"                                                #
alias golcode="cd ${tardis_pct}${pct_code_folder}"                             #
alias golrcode="cd ${tardis_pct}${rcode_path}${user_folder}"                   #
alias goldata="cd ${tardis_data_path}"                                         #
alias golorg="cd ${tardis_data_path}${org_data_folder}"                        #
alias golrecon="cd ${tardis_data_path}${recon_data_folder}"                    #
alias golnewrecon="cd ${current_lrdata}"                                         #

alias gomycode="cd ${user_home}${pct_code_folder}"                             #
alias gomypcode="cd ${user_home}${pcode_path}${user_folder}"                   #
alias gomyrcode="cd ${user_home}${rcode_path}${user_folder}"                   #
alias gomydata="cd ${user_home}${pct_data_folder}"                             #
alias gomyorg="cd ${user_home}${pct_data_folder}${org_data_folder}"            #
alias gomyrecon="cd ${user_home}${pct_data_folder}${recon_data_folder}"        #

alias gogrp="cd ${recon_group}"                                        #
alias gotools="cd ${pct_functions_git_repo_path}"

###################################################################################################
###################################### Function definitions #######################################
###################################################################################################
function exe() { echo -e " $@" ; "$@" ; }
#function now() { date +"%T %Z %a %m-%d-%Y"; }
function current_date() { date +"%y-%m-%d"; }
function dec2int() { echo "scale=0; $@/1" | bc ; }
function charrep() { printf '%*s' "$2" | tr ' ' "$1" ; }
function is_integer()
{
    re='^[0-9]+$'
    if [[ $1 =~ $re ]]; then return 0
    else return 1; fi
}
function current_node_name()
{
    node_ID=$HOSTNAME
    if [ $node_ID == "n130" ]; then node_alias="Kodiak"
    elif [ $node_ID == "ecsn001" -o $node_ID == "whartnell" ]; then node_alias="WHartnell"
    elif [ $node_ID == "ecsn002" ]; then node_alias="PTroughton"
    elif [ $node_ID == "ecsn003" ]; then node_alias="JPertwee"
    elif [ $node_ID == "ecsn004" ]; then node_alias="TBaker"
    elif [ $node_ID == "ecsn005" ]; then node_alias="PDavison"
    elif [ $node_ID == "tardis-student1" ]; then node_alias="Workstation #1"
    elif [ $node_ID == "tardis-student2" ]; then node_alias="Workstation #2"
    fi
    echo -e $node_alias
}
function node_info()
{
    local OPTIND
    node_name_flag='false'
    node_alias_flag='false'
    node_IP_flag='false'
    optstring='ain'
    while getopts $optstring opt; do
        case $opt in
            a) node_alias_flag='true';;
            i) node_IP_flag='true';;
            n) node_name_flag='true';;
            *) error "Unexpected option ${flag}";;
        esac
    done   
    # Set prefix of the variables corresponding to the specified node #: 0(head), 1-4 (compute nodes)
    node_num="${!#}"
    is_integer ${node_num} 
    if [ $? -eq 1 ]; then print "ERROR: Invalid node alias provided" 0,31 5,33; return 1; fi
    if test ${node_num} -eq 0; then target_base="tardis_head_node_"
    elif test ${node_num} -eq 1; then target_base="tardis_compute_node1_"
    elif test ${node_num} -eq 2; then target_base="tardis_compute_node2_"
    elif test ${node_num} -eq 3; then target_base="tardis_compute_node3_"
    elif test ${node_num} -eq 4; then target_base="tardis_compute_node4_"
    else
         print "ERROR: Invalid node ID # provided" 0,31 5,33       
         return 1
    fi   
    # Append suffix to variable name prefix corresponding to the node identifier desired: node's name, alias, or IP
    target_identifier="${target_base}ID"
    if ( "$node_IP_flag" ); then target_identifier="${target_base}IP"; fi
    if ( "$node_alias_flag" ); then target_identifier="${target_base}alias"; fi
    if ( "$node_name_flag" ); then target_identifier="${target_base}ID"; fi
    REPLY=${!target_identifier} 
}
function set_color()
{
    if [ -z "$1" ]; then
        text_color_shade_code="0";
        text_color_color_code="32";
    else
        text_color_code_length=${#1};
        text_color_shade_code=${1:0:1};
        text_color_color_code=${1:2};
    fi;
    if [ -z "$2" ]; then
        background_shade_code="6";
        background_color_code="40";
    else
        background_color_code_length=${#2};
        background_color_shade_code=${2:0:1};
        background_color_color_code=${2:2};
    fi;
    if [ -z "$3" ]; then
        underline_code="";
    else
       underline_code="\033[4m";
    fi;
    #echo -e "\033[${text_color_shade_code};${text_color_color_code};${background_color_shade_code};${background_color_color_code}m${underline_code}"
    REPLY="\033[${text_color_shade_code};${text_color_color_code};${background_color_shade_code};${background_color_color_code}m${underline_code}"
}
function color_text()
{
  if [ -z "$2" ]; then
      set_color ${default_text_color} ${default_background_color}
  else
      if [ -z "$3" ]; then
          set_color $2 ${default_background_color}
      else
          set_color $2 $3
      fi
  fi
  if [ -z "$4" ]; then
        underline_code="";
    else
       underline_code="\033[4m";
    fi;
  color_cmd=${REPLY}
  REPLY="${color_cmd}${underline_code}${1}\e[m"
  #echo -e $REPLY
}
function print()
{
  if [ -z "$2" ]; then
      set_color ${default_text_color} ${default_background_color}
  else
      if [ -z "$3" ]; then
          set_color $2 ${default_background_color}
      else
          set_color $2 $3
      fi
  fi
  if [ -z "$4" ]; then
        underline_code="";
    else
       underline_code="\033[4m";
    fi;
  echo -e "${REPLY}${underline_code}${1}\e[m"
}
function print_alias()
{
    equal_pos=$(expr index "$2" = )
    var_length=$(expr $equal_pos - 1)
    cmd="${1}"
    var=${2:0:$var_length}
    val=${2:${equal_pos}}
    alias_val="${var}=${val} $3"
    echo -e "${LightRed}-> ${Brown}alias ${Green}${var}=${LightPurple}${val} $3${NoColor}"
    alias "${alias_val}"
}
function print_info() { echo -e "${Green}$1: ${LightCyan}$2 " ; }
function print_label() { echo -e "${Green}$@: ${LightCyan}" ; }
function print_module_load()
{
    words=( $1 )
    module_command=${words[0]}
    module_name=${words[1]}
    echo -e "${LightRed}-> ${Brown}module ${LightBlue}$module_command ${LightPurple}$module_name${LightCyan}"
    module $1 $2
}
function print_newline() { echo -e ""; }
function print_result() { echo -e "${LightCyan}$@ ${NoColor}" ; }
function print_section_header()
{
    heading_length=${#1}
    num_dashes=$(expr $console_width - $heading_length - 2)
    num_front=$(expr $num_dashes / 2)
    num_back=$(expr $num_dashes - $num_front)
    front_string=$(charrep $separator_char $num_front)
    back_string=$(charrep $separator_char $num_back)
    separator_string=$(charrep "-" $console_width)
    if [ -z "$2" ]; then
       print "${separator_string}" ${default_text_color} ${default_background_color}
       print "${front_string} $1 ${back_string}" ${default_text_color} ${default_background_color}
       print "${separator_string}" ${default_text_color} ${default_background_color}   
    else
        if [ -z "$3" ]; then
            print "${separator_string}" ${2} ${default_background_color}
            print "${front_string} $1 ${back_string}" ${2} ${default_background_color}
            print "${separator_string}" ${2} ${default_background_color}   
        else
            print "${separator_string}" ${2} ${3}
            print "${front_string} $1 ${back_string}" ${2} ${3}
            print "${separator_string}" ${2} ${3}   
        fi
    fi
    print_newline
}
function print_section_title()
{
    heading_length=${#1}
    num_dashes=$(expr $console_width - $heading_length - 2)
    num_front=$(expr $num_dashes / 2)
    num_back=$(expr $num_dashes - $num_front)
    front_string=$(charrep $separator_char $num_front)
    back_string=$(charrep $separator_char $num_back)
    separator_string=$(charrep "-" $console_width)
    if [ -z "$2" ]                           # If no 2nd parameter present
    then
        heading_separator="$Brown$separator_string"
        echo -e $heading_separator
        echo -e "$Brown$front_string $1 $back_string"
        echo -e $heading_separator
    else
        heading_separator="$2$separator_string"
        echo -e $heading_separator
        echo -e "${2}$front_string $1 $back_string"
        echo -e $heading_separator
  fi
}
function print_program_version()
{
    echo -e "${Green}$1 version:${LightCyan}"
    echo -e "$( $2 )${NoColor} $3"
}
function link_raw_data()
{
    ######################################################################################################################################
    ############################### Determine the run date for the data in the current raw data directory ################################
    ######################################################################################################################################
    local OPTIND
    execution_path=$PWD
    error_flag="false"                                                          # Initialize error_flag indicating unknown Phantom ID 
    data_path=$PWD  
    angle_interval=4                                                            # Query path to current raw data directory
    while getopts 'p:i:' opt; do
        case $opt in
            p) data_path=${OPTARG};;
            i) printf -v angle_interval "%d" ${OPTARG};;
            *) error "Unexpected option ${flag}";;
        esac
    done
    ######################################################################################################################################
    ########################## Determine path to pCT data directory (parent directory of raw_data directory) #############################
    ######################################################################################################################################
    run_date="${data_path##*/}"                                                 # Extract run date from last directory in the path
    data_directory="raw_data"                                                   # Name of directory where all raw data is stored
    pCT_path=${data_path%%${data_directory}*}                                   # Extract pCT data path from raw data path
    echo  "Execution path:$execution_path"
    echo  "pCT data parent directory:$pCT_path"
    echo  "Raw data path:$data_directory"
    echo  "Run Date:$run_date"
    echo  "Angle interval:$angle_interval" 
    cd "${data_path}"
    ######################################################################################################################################
    ############################# Find and create/organize links to raw data files for each angle in [0,360) #############################
    ######################################################################################################################################
    for (( angle=0; angle<360; angle+=$angle_interval )); do                      # For each angle in [0,360) in steps of "angle_interval"
        ##################################################################################################################################
        ######################### Parse file names to determine object name and run # for the current angle xxx ##########################
        ##################################################################################################################################
        printf -v angle_str "%03d" $angle                                       # Convert each angle into string of the form "xxx"
        for file in *_$angle_str.*; do                                          # For each file found for the current angle xxx
            IFS='_'                                                             # Delimiter for splitting path into its directory names
            set -- $file                                                        # Split file names into '_' separated tokens $1, $2, ...
            if [[ "$file" != "*_${angle_str}.*" ]]; then                            # Make sure there are 2+ tokens so "$2" is valid token
                ##########################################################################################################################
                ################### Combine tokens until reaching xxx.extension to allow run #s like "Run_100_sup_..." ###################
                ##########################################################################################################################
                extension=${file##*${angle_str}}                                # Extract file extension from file name
                file_ending="${angle_str}${extension}"                          # Set string used to stop parsing file names
                objectID="${1}"                                                 # Set object name as 1st token
                run_num="${2}"                                                  # Initialize run_num to 1st token after 1st '_'
                j=3                                                             # Set integer # for next token # to access
                var="$j"                                                        # Convert integer j into string to access tokens by #
                while [[ ${!var} != $file_ending ]]; do                         # Parse while next token is not xxx.extension
                    run_num="${run_num}_${!var}"                                # Append token to run # directory name
                    j=$(($j+1))                                                 # Advance token #
                    var="$j"                                                    # Token # integer -> string so !var accesses next token
                done
                ##########################################################################################################################
                ################ Use objectID to lookup the appropriate object folder name corresponding to this phantom #################
                ##########################################################################################################################
                if [[ $objectID == "Emp" ]]; then object_name="Empty"
                elif [[ $objectID == "CalEmp" ]]; then object_name="Calibration"
                elif [[ $objectID == "Calib" ]]; then object_name="Calibration"
                elif [[ $objectID == "Rod" ]]; then object_name="Rod"
                elif [[ $objectID == "Water" ]]; then object_name="Water"   
                elif [[ $objectID == "Sensitom" ]]; then object_name="CTP404_Sensitom"
                elif [[ $objectID == "LinePair" ]]; then object_name="CTP528_Linepair"
                elif [[ $objectID == "LowCon" ]]; then object_name="CTP515_Low_Contrast"
                elif [[ $objectID == "Dose16" ]]; then object_name="CTP554_Dose"
                elif [[ $objectID == "CIRSPHP0" ]]; then object_name="HN715_PedHead_0"
                elif [[ $objectID == "CIRSPHP1" ]]; then object_name="HN715_PedHead_1"
                elif [[ $objectID == "LMUDECT" ]]; then object_name="LMU_DECT"
                elif [[ $objectID == "CIRSEdge" ]]; then object_name="CIRS_Edge"
                elif [[ $objectID == "Birks" ]]; then object_name="Birks"
                else error_flag="true"
                fi
                ##########################################################################################################################
                ############################# Construct path/file names for the raw data and the links to it #############################
                ##########################################################################################################################
                data_file="${objectID}_${run_num}_${file_ending}"
                link_path="${pCT_path}organized_data/${object_name}/Experimental/${run_date}/${run_num}/Input/"
                link_file="raw_${angle_str}.bin"
                ##########################################################################################################################
                ################### Print scan properties/characteristics and directory/file names of data and links## ###################
                ##########################################################################################################################
                echo "/---------------------------------------------------------------------------------------------------------------------/"
                echo "Raw data filename = $file"
                echo "Object ID = ${objectID}"
                echo "Object Name = ${object_name}"
                echo "Run # = ${run_num}"
                echo -e "Link destination = ${link_path}${link_file}"
                ##########################################################################################################################
                ################## Create appropriate directories/subdirectories and create/organize the raw data links ##################
                ##########################################################################################################################
                mkdir -p "${link_path}"                                            # Create directories/subdirectories for links
                ln -sv "${data_path}/${data_file}" "${link_path}${link_file}"   # Create the soft links to the raw data
            fi
            if [[ $error_flag == "true" ]]
            then
                echo "ERROR: Unknown Phantom ID '$objectID' encountered"
                error_flag=false;
                break
            fi
        done
    done
}
function link_projection_data()
{
    ######################################################################################################################################
    ########################### Determine the run date for the data in the current projection data directory #############################
    ######################################################################################################################################
    local OPTIND
    execution_path=$PWD
    error_flag="false"                                                          # Initialize error_flag indicating unknown Phantom ID 
    data_path=$PWD  
    angle_interval=4  
    scan_type='Experimental'                                                          # Query path to current raw data directory
    while getopts 'p:i:t:' opt; do
        case $opt in
            p) data_path=${OPTARG};;
            i) printf -v angle_interval "%d" ${OPTARG};;
            t) scan_type=${OPTARG};;
            *) error "Unexpected option ${flag}";;
        esac
    done

    run_date="${data_path##*/}"                                                 # Extract run date from last directory in the path
    #scan_type_path="${data_path%/$run_date}"                                    # Remove run date from path so scan type folder is on end
    #scan_type="${scan_type_path##*/}"                                           # Identify scan type from last folder on scan_type_path
    data_directory="preprocessed_data"                                            # Name of directory where all projection data is stored
    output_folder="projection_data"                                            # Name of directory where all projection data is stored
    pCT_path=${data_path%%${data_directory}*}                                   # Extract pCT data path from projection data path
    echo  "Execution path:$execution_path"
    echo  "pCT data parent directory:$pCT_path"                                 # Print path to pCT data directory to terminal window
    echo  "Raw data path:$data_directory"
    echo  "Scan Type: ${scan_type}"                                             # Print scan type: Experimental or Simulated
    echo  "Run Date:$run_date"
    echo  "Angle interval:$angle_interval" 
    cd "${data_path}"
    ######################################################################################################################################
    ######################### Find and create/organize links to projection data files for each angle in [0,360) ##########################
    ######################################################################################################################################
    for ((angle=0; angle<360; angle+=$angle_interval)); do                      # For each angle in [0,360) in steps of "angle_interval"
        ##################################################################################################################################
        ########################## Parse file names to determine object ID and run # for the current angle xxx ###########################
        ##################################################################################################################################
        printf -v angle_str "%03d" $angle                                       # Convert each angle into string of the form "xxx"
        for file in *_$angle_str.*; do                                          # For each file found for the current angle xxx
            IFS='_'                                                             # Delimiter for splitting path into its directory names
            set -- $file                                                        # Split file names into '_' separated tokens $1, $2, ...
            if [[ $file != "*_${angle_str}.*" ]]; then                          # Make sure there are 2+ tokens so "$2" is valid token
                ##########################################################################################################################
                ################### Combine tokens until reaching xxx.extension to allow run #s like "Run_100_sup_..." ###################
                ##########################################################################################################################
                extension=${file##*${angle_str}}                                # Extract file extension from file name
                file_ending="${angle_str}${extension}"                          # Set string used to stop parsing file names
                objectID="${1}"                                                 # Set object ID as 1st token
                run_num="${2}"                                                  # Initialize run_num to 1st token after 1st '_'
                j=3                                                             # Set integer # for next token # to access
                var="$j"                                                        # Convert integer j into string to access tokens by #
                while [ ${!var} != "$file_ending" ]; do                         # Parse while next token is not xxx.extension
                    run_num="${run_num}_${!var}"                                # Append token to run # directory name
                    j=$(($j+1))                                                 # Advance token #
                    var="$j"                                                    # Token # integer -> string so !var accesses next token
                done
                data_file="${objectID}_${run_num}_${file_ending}"
                echo "$data_file"
                if [[ $angle == 0 ]]; then preprocessed_date=$(date +"%y-%m-%d" -r "${data_file}"); echo hello; fi                                                # Extract run date from last directory in the path            
                ##########################################################################################################################
                ################ Use objectID to lookup the appropriate object folder name corresponding to this phantom #################
                ##########################################################################################################################
                if [[ $objectID == "Emp" ]]; then object_name="Empty"
                elif [[ $objectID == "CalEmp" ]]; then object_name="Calibration"
                elif [[ $objectID == "Calib" ]]; then object_name="Calibration"
                elif [[ $objectID == "Rod" ]]; then object_name="Rod"
                elif [[ $objectID == "Water" ]]; then object_name="Water"   
                elif [[ $objectID == "Sensitom" ]]; then object_name="CTP404_Sensitom"
                elif [[ $objectID == "LinePair" ]]; then object_name="CTP528_Linepair"
                elif [[ $objectID == "LowCon" ]]; then object_name="CTP515_Low_Contrast"
                elif [[ $objectID == "Dose16" ]]; then object_name="CTP554_Dose"
                elif [[ $objectID == "CIRSPHP0" ]]; then object_name="HN715_PedHead_0"
                elif [[ $objectID == "CIRSPHP1" ]]; then object_name="HN715_PedHead_1"
                elif [[ $objectID == "LMUDECT" ]]; then object_name="LMU_DECT"
                elif [[ $objectID == "CIRSEdge" ]]; then object_name="CIRS_Edge"
                elif [[ $objectID == "Birks" ]]; then object_name="Birks"
                else error_flag="true"
                fi
                ##########################################################################################################################
                ######################### Construct path/file names for the projection data and the links to it ##########################
                ##########################################################################################################################
                data_file="${objectID}_${run_num}_${file_ending}"
                link_path="${pCT_path}organized_data/${object_name}/${scan_type}/${run_date}/${run_num}/Output/${preprocessed_date}/"
                link_file="projection_${angle_str}.bin"
                ##########################################################################################################################
                ################### Print scan properties/characteristics and directory/file names of data and links## ###################
                ##########################################################################################################################
                echo "/------------------------------------------------------------------------------/"
                echo "Projection data filename = $file"
                echo "Preprocessed date = ${preprocessed_date}"
                echo "Object Name = ${object_name}"
                echo "Run # = ${run_num}"
                echo -e "Link destination = ${link_path}${link_file}"
                ##########################################################################################################################
                ############## Create appropriate directories/subdirectories and create/organize the projection data links ###############
                ##########################################################################################################################
                mkdir -p "${link_path}"                                         # Create directories/subdirectories for links
                ln -s "${data_path}/${data_file}" "${link_path}${link_file}"    # Create the soft links to the projection data
            fi
            if [[ $error_flag == "true" ]]
            then
                echo "ERROR: Unknown Phantom ID '$objectID' encountered"
                error_flag=false;
                break
            fi
        done
    done
}
function scp_recon()
{   
    echo -e ${REPLY}
    scp ${user_home}${rcode_path}${user_folder}/src ${1}:${tardis_pct}${rcode_path}${user_folder}
    scp ${user_home}${rcode_path}${user_folder}/include ${1}:${tardis_pct}${rcode_path}${user_folder}
    print_newline
}
function txrecon2all()
{
    print_section_header "Transferring reconstruction code to all Tardis compute nodes" 1,33  5,40
    print "\nCurrent user: " 0,32;  print "${current_user}" 0,35
    print "\nTransferring to: " 0,32;  print "${tardis_compute_node1_alias}" 0,35
    set_color ${default_text_color} ${default_background_color} 
    echo -e ${REPLY}
    scp ${user_home}${rcode_path}${user_folder}/src ${current_user}@${tardis_compute_node1_alias}:${tardis_pct}${rcode_path}${user_folder}
    scp ${user_home}${rcode_path}${user_folder}/include ${current_user}@${tardis_compute_node1_alias}:${tardis_pct}${rcode_path}${user_folder}
    print "\nTransferring to: " 0,32;  print "${tardis_compute_node2_alias}" 0,35
    set_color ${default_text_color} ${default_background_color}
    echo -e $REPLY
    scp ${user_home}${rcode_path}${user_folder}/src ${current_user}@${tardis_compute_node2_alias}:${tardis_pct}${rcode_path}${user_folder}
    scp ${user_home}${rcode_path}${user_folder}/include ${current_user}@${tardis_compute_node2_alias}:${tardis_pct}${rcode_path}${user_folder}
    print "\nTransferring to: " 0,32;  print "${tardis_compute_node3_alias}" 0,35
    set_color ${default_text_color} ${default_background_color}
    echo -e $REPLY
    scp ${user_home}${rcode_path}${user_folder}/src ${current_user}@${tardis_compute_node3_alias}:${tardis_pct}${rcode_path}${user_folder}
    scp ${user_home}${rcode_path}${user_folder}/include ${current_user}@${tardis_compute_node3_alias}:${tardis_pct}${rcode_path}${user_folder}
    print "\nTransferring to: " 0,32;  print "${tardis_compute_node4_alias}" 0,35
   set_color ${default_text_color} ${default_background_color}
    echo -e $REPLY
    scp ${user_home}${rcode_path}${user_folder}/src ${current_user}@${tardis_compute_node4_alias}:${tardis_pct}${rcode_path}${user_folder}
    scp ${user_home}${rcode_path}${user_folder}/include ${current_user}@${tardis_compute_node4_alias}:${tardis_pct}${rcode_path}${user_folder}
}
function lsm()
{
    local OPTIND
    match_string='*'
    depth='1'
    filename_string=''
    filename='lsm_results.txt'
    verbose_string=''
    mtime='' 
    mtime_string=''
    file_type='d'
    period_identifier="days"
    age=''
    while getopts 'vm:d:f:o:t:sIMCAR' opt; do
        case $opt in
            v) verbose_string='-printf %f\n';;
            m) match_string=${OPTARG};;
            d) depth=${OPTARG};;
            f) filename=${OPTARG};;
            o) mtime=${OPTARG};;
            t) file_type=${OPTARG};;
            I) filename='ROI_analysis_folders.txt';;
            M) filename='multiplot_folders.txt';;
            C) filename='compared_folders.txt';;
            A) filename='averaging_folders.txt';;
            R) filename='reconstruction_folders.txt';;
            s) filename_string="$(echo -e "-fprintf ${filename} ")%f\n";;
            *) error "Unexpected option ${flag}";;
        esac
    done
    modified_qualifier=${mtime:0:1}   
    if [[ $modified_qualifier == "-" ]]; then age_identifier="less than"; age=${mtime:1}
    elif [[ $modified_qualifier == "+" ]]; then age_identifier="greater than"; age=${mtime:1}
    else age_identifier="exactly"; age=${mtime:0}; fi
    if [[ ${age} == 1 ]]; then period_identifier="day"; fi
    color_text " $match_string" 0,33 6,40; matching=$REPLY
    color_text " $depth"        0,33 6,40; maxdepth=$REPLY
    color_text " $filename"     0,33 6,40; filenaming=$REPLY
    color_text " ${age_identifier} ${age} ${period_identifier} ago"     0,33 6,40; ordering=$REPLY
    print "Searching for names matching:$matching" 0,32 6,40 underline
    print "Maximum search depth:$maxdepth"         0,32 6,40 underline
    if [[ -n $mtime ]]; then print "Only those created/modified:${ordering}" 0,32 6,40 underline; mtime_string="$(echo -e "-mtime $mtime")"; fi
    if [[ -n $filename_string ]]; then print "Saving results to:$filenaming" 0,32 6,40 underline; filename_string="$(echo -e "-fprintf ${filename} ")%f\n"; fi
    num_results=$(find -maxdepth $depth -type $file_type -name "${match_string}" ${mtime_string} ${verbose_string} ${filename_string} | wc -l)
    search_results=$(find -maxdepth $depth -type $file_type -name "${match_string}" ${mtime_string} ${verbose_string} ${filename_string})
    color_text " $num_results"     0,33 6,40; num_matching=$REPLY
    color_text "${search_results}" 0,35 6,40; results=$REPLY
    print "Search matches returned:$num_matching" 0,32 6,40 underline
    print "Search results:\n$results" 0,32 6,40 underline
    print_newline
}
function add_rcode_repo()
{
    local OPTIND
    username="$(id -un)"
    account=${pct_collab_git_account}
    repo=${old_rcode_git_repo}
    while getopts 'u:a:r:' opt; do
        case $opt in
            u) username=${OPTARG};;
            a) account=${OPTARG};;
            r) repo=${OPTARG};;           
            *) error "Unexpected option ${flag}";;
        esac
    done
    rcode_path="${tardis_rcode_path}/${username}${git_code_folder}/${account}/"
    mkdir -p ${rcode_path}
    cd ${rcode_path}
    
    Baylor_rcode_git_clone_addr="${git_clone_addr_base}${account}/${repo}${git_clone_addr_suffix}"
    git clone ${Baylor_rcode_git_clone_addr}   
}
function create_recon_user()
{
    usage="$(basename "$0") [-h] [-u <username>] -- add directory for pCT code to local SSD drive and default GitHub repository

    where:
        -h  show this help text
        -u  username (if different from login)"
    local OPTIND
    username="$(id -un)"
    while getopts 'u:h' opt; do
        case $opt in
            h) echo "${usage}"; exit;;
            u) username=${OPTARG};;
            *) error "Unexpected option ${flag}";;
        esac
    done    
    old_rcode_path="${tardis_rcode_path}/${username}${git_code_folder}/${pct_collab_git_account}/"
    mkdir -p ${old_rcode_path}
    cd ${old_rcode_path}
    git clone ${old_rcode_git_clone_addr}   
    cd "$old_rcode_git_repo"
    git checkout Baylor
}
function nvccgen()
{
    #nvcc11="nvcc -std=c++11 -gencode arch=compute_35,code=sm_35 -O3"
    print_newline
    color_prefix="\033[0;34;5;47m"
    color_postfix="\033[3;40;5;1;34m"
    target_source_code="${tardis_pct}${rcode_path}${user_folder}${rcode_cu_file}"
    if [ -z "$1" ] # If no 2nd parameter present
    then
        print_section_header "Using compute/sm 35 (default)" 0,34 5,47
        nvcc_cmd="nvcc -std=c++11 -gencode arch=$rcode_compute,code=$rcode_sm ${rcode_flags} ${target_source_code} -o ${rcode_object}"
        print "${nvcc_cmd}" 1,33 5,40
        set_color 0,31 5,40; echo -e $REPLY
        echo -e "$(${nvcc_cmd})"
    else
        if [ -z "$2" ]
        then
            print_section_header "Using compute/sm ${1} (default)" 0,34 5,47
            nvcc_cmd="nvcc -std=c++11 -gencode arch=compute_$1,code=sm_$1 ${rcode_flags} ${target_source_code} -o ${rcode_object}"
            print "${nvcc_cmd}" 1,33 5,40
            set_color 0,31 5,40; echo -e $REPLY
            echo -e "$(${nvcc_cmd})"      
        else
            if [ $1 -gt $2 ]
            then
                heading_separator="\033[${Red}$separator_string\033[0m"
                echo -e $heading_separator
                echo -e "${Red}ERROR:${LightRed} Incompatible code generation requested\n"
                echo -e "${LightRed}\tThe selected target SM architecture (sm_$2) only supports code generation from compute_$2 or an older instruction set"
                echo -e $heading_separator
            else
                print_section_header "Using compute_${1}/sm_${2}" 0,34 5,47

                nvcc_cmd="nvcc -std=c++11 -gencode arch=compute_$1,code=sm_$2 ${rcode_flags} ${target_source_code} -o ${rcode_object}"
                print "${nvcc_cmd}" 1,33 5,40
                set_color 0,31 5,40; echo -e $REPLY
                echo -e "$(${nvcc_cmd})"      
            fi
        fi
    fi
}
function runrecon()
{
      if [ -z "$1" ]
      then
         nvccgen
         ./recon.out
         else
         if [ -z "$2" ]
         then
             nvccgen $1 $1
             ./recon.out
         else
             if [ $1 -gt $2 ]
             then
                 echo -e "${Red}  ERROR:${LightRed} Incompatible code generation requested\n"
                 echo -e "${LightRed}\tTarget SM architecture (sm_$2) only supports code generation from compute_$2 or an older instruction set"
             else
                 nvccgen $1 $2
                 ./recon.out
             fi
         fi
     fi
}
function txrecon()
{   # Process the execution parameters/arguments
    local OPTIND
    git_code_folder="/git"
    pct_collab_git_account="pCT-collaboration"
    Baylor_git_account="BaylorICTHUS"
    my_git_account="BlakeSchultze"

    rcode_git_repo="pCT_Reconstruction"
    old_rcode_git_repo="pct-recon-copy"

    git_clone_addr_base="git@github.com:"
    git_clone_addr_suffix=".git"
    node_num_flag='true'
    pct_code_folder="/pCT_code"
    spct_data_folder="/pCT_data"
    baylor_recon_repo="/pCT_Reconstruction"
    rcode_folder="/Reconstruction"

    rcode_subdirectory="${pct_code_folder}${rcode_folder}"
    #pct_rcode_path="${global_pct_home}${}${}"

    account=${Baylor_git_account}
    group=${recon_group}
    repo=${rcode_git_repo}
    username="$(id -un)"
    while getopts 'fg:a:r:u:n:H' opt; do
        case $opt in
             f) node_num_flag='false';;
             g) group=${OPTARG};;
             a) account=${OPTARG};;  
             r) repo=${OPTARG};;  
             u) username=${OPTARG};;  
             n) node=${OPTARG};;  
             H) source="";;           
            *) error "Unexpected option ${flag}";;
        esac
    done   
    /ion/pCT_code/Reconstruction/schultze/BaylorICTHUS/pCT_Reconstruction
    
    /ion/home/ionrecon/pCT_code/Reconstruction/schultze/BaylorICTHUS/pCT_Reconstruction
    /local/pCT_code/Reconstruction/schultze/BaylorICTHUS/pCT_Reconstruction
    # Set node # to last execution argument, convert this to  name and verify a valid node # was provided
    if ( "$node_num_flag" ); then node_num=${!#}; fi
    node_info -n $node_num;
    if [ $? -eq 1 ]; then return; fi
    node_name=$REPLY 
    node_info -a $node_num; node_alias=$REPLY
    node_info -i $node_num; node_IP=$REPLY 
    
    # Print destination node and initiate reconstruction code transfer
    color_text "${node_name}/${node_alias} (${node_IP})" 0,33 6,40 
    target_node_statement=" ${REPLY}"
    color_text "\nTransferring reconstruction code to:" 0,32 5,40 4
    echo -e ${REPLY}${target_node_statement}
    set_color 0,35 5,40 
    scp_recon ${node_IP}  
}
function load_CUDA_modules()
{
    print "\nLoading modules required by selected version of CUDA..." 0,32
    #---------------------------------------------------------------------------------------------#
    if [ $HOSTNAME == "whartnell" ]
    then
        load_CUDA=$version_CUDA_Tardis_Headnode
    #---------------------------------------------------------------------------------------------#
    elif [ $HOSTNAME == "ecsn002" -o $HOSTNAME == "ecsn003" -o $HOSTNAME == "ecsn004" -o $HOSTNAME == "ecsn005" ]
    then
        load_CUDA=$version_CUDA_Tardis
    #---------------------------------------------------------------------------------------------#
    elif [ $HOSTNAME == "tardis-student1" -o $HOSTNAME == "tardis-student2" ]
    then
        load_CUDA=$version_CUDA_Workstation
    else
        load_CUDA="none"
    fi
    #---------------------------------------------------------------------------------------------#
    if [ ${load_CUDA} == 55 ]
    then
        print_module_load "unload gcc"
        print_module_load "load cuda55"
          print_module_load "load cuda55/blas/5.5.22"
          print_module_load "load cuda55/fft/5.5.22"
          print_module_load "load cuda55/toolkit/5.5.22"
    #---------------------------------------------------------------------------------------------#
    elif [ ${load_CUDA} == 65 ]
    then
        print_module_load "unload gcc"
        print_module_load "load gcc/4.8.4"
        print_module_load "load cuda65/blas/6.5.14"
        print_module_load "load cuda65/fft/6.5.14"
        print_module_load "load cuda65/gdk/340.29"
          print_module_load "load cuda65/nsight/6.5.14"
          print_module_load "load cuda65/profiler/6.5.14"
        print_module_load "load cuda65/toolkit/6.5.14"
    #---------------------------------------------------------------------------------------------#
    elif [ ${load_CUDA} == 70 ]
    then
        print_module_load "unload gcc"
        print_module_load "load gcc/4.9.2"
        print_module_load "load cuda70"
          print_module_load "load cuda70/blas/7.0.28"
          print_module_load "load cuda70/fft/7.0.28"
          print_module_load "load cuda70/gdk/346.46"
          print_module_load "load cuda70/nsight/7.0.28"
        print_module_load "load cuda70/profiler/7.0.28"
          print_module_load "load cuda70/toolkit/7.0.28"
    fi
}
function find_git_branch()
{
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="($branch)"
  else
    git_branch=""
  fi
}

function find_git_dirty()
{
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    git_dirty='* '
  else
    git_dirty=''
  fi
}
function can_user_write_to_file()
{
    if [[ $# -lt 2 || ! -r $2 ]]
    then
        echo 0
        return
    fi
    local user_id=$(id -u $1 2>/dev/null)
    local file_owner_id=$(stat -c "%u" $2)
    if [[ ${user_id} == ${file_owner_id} ]]
    then
        echo 1
        return
    fi
    local file_access=$(stat -c "%a" $2)
    local file_group_access=${file_access:1:1}
    local file_group_name=$(stat -c "%G" $2)
    local user_group_list=$(groups $1 2>/dev/null)
    if [[ ${file_group_access} -ge 6 ]]
    then
        for el in ${user_group_list-nop}
        do
            if [[ "${el}" == ${file_group_name} ]]
            then
                echo 1
                return
            fi
        done
    fi
    echo 0
}
function construct_pct_path()
{
   usage="construct_pct_path [-h] [-u <username>] -- add directory for pCT code to local SSD drive and default GitHub repository

    where:
        -h  show this help text
        -u  desired username (if different from login)"
    local OPTIND
    username="$(id -un)"   
    data_direction="${projection_link_folder}"
    scan_type_folder="${experimental_data_folder}"
    run_date_folder_prefix=""
    #pct_dir="${NAS_pct_dir}"
    parent_dir="${pct_data_parent}"
    preprocessed_date=$(current_date)
    recon_date=$(current_date)
    data_direction="Output"
    while getopts 'ho:r:n:d:D:KCEGTIO' opt; do
        case $opt in        
            h) echo "${usage}"; return;;
            o) object=${OPTARG};;
            r) run_date=${OPTARG};;
            n) run_number=${OPTARG};;
            d) preprocessed_date=${OPTARG};;
            D) recon_date=${OPTARG};;
            K) parent_dir="${pct_data_parent}";;
            C) parent_dir="${tardis_data_parent}";;
            E) scan_type_folder="${experimental_data_folder}";;
            G) run_date_folder_prefix="${GEANT4_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;
            T) run_date_folder_prefix="${TOPAS_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;         
            I) data_direction="Input";;
            O) data_direction="Output";;
            *) error "Unexpected option ${flag}";;
        esac
    done    
    run_date_folder="${run_date_folder_prefix}${run_date}"                                          # Extract run date from last directory in the path
    #input_path="${parent_dir}/${object}/${scan_type_folder}/${run_date_folder}/${run_date_folder}${run_number}/${projection_data_folder}/${preprocessed_date}"
    #output_path="${parent_dir}/${object}/${scan_type_folder}/${run_date_folder}/${run_date_folder}${run_number}/${projection_data_folder}/${preprocessed_date}/${recon_date}"
    input_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}/${projection_data_folder}/${preprocessed_date}"
    output_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}/${projection_data_folder}/${preprocessed_date}/${recon_date}"
    echo "${input_path}"
    echo "${output_path}"
    if [[ $data_direction == "Input" ]]; then REPLY="${input_path}"
    elif [[ $data_direction == "Output" ]]; then REPLY="${output_path}"; fi
    #/ion/pCT_data/organized_data/<phantom>/<scan type>/<run date>/<run #>/Output/<preprocessed data>     
}
function construct_recon_path()
{
   usage="construct_pct_path [-h] [-u <username>] -- add directory for pCT code to local SSD drive and default GitHub repository

    where:
        -h  show this help text
        -u  desired username (if different from login)"
    local OPTIND
    username="$(id -un)"
    
    data_direction="${projection_link_folder}"
    scan_type_folder="${experimental_data_folder}"
    run_date_folder_prefix=""
    #pct_dir="${NAS_pct_dir}"
    parent_dir="${pct_data_parent}"
    preprocessed_date=$(current_date)
    recon_date=$(current_date)
    data_direction="Output"
    while getopts 'ho:r:n:d:D:KCEGTIO' opt; do
        case $opt in        
            h) echo "${usage}"; return;;
            o) object=${OPTARG};;
            r) run_date=${OPTARG};;
            n) run_number=${OPTARG};;
            d) preprocessed_date=${OPTARG};;
            D) recon_date=${OPTARG};;
            E) scan_type_folder="${experimental_data_folder}";;
            G) run_date_folder_prefix="${GEANT4_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;
            T) run_date_folder_prefix="${TOPAS_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;         
            I) data_direction="${raw_data_folder}";;
            O) data_direction="${projection_data_folder}";;
            *) error "Unexpected option ${flag}";;
        esac
    done    
    run_date_folder="${run_date_folder_prefix}${run_date}"                                          # Extract run date from last directory in the path
    input_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}/${projection_data_folder}/${preprocessed_date}"
    output_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}/${projection_data_folder}/${preprocessed_date}/${recon_date}"
    if [[ $data_direction == "${raw_data_folder}" ]]; then path="${input_path}"
    elif [[ $data_direction == "${projection_data_folder}" ]]; then path="${output_path}"; fi
    echo "${path}"
    REPLY="${path}"
}
function construct_preprocessing_path()
{
   usage="construct_pct_path [-h] [-u <username>] -- add directory for pCT code to local SSD drive and default GitHub repository

    where:
        -h  show this help text
        -u  desired username (if different from login)"
    local OPTIND
    username="$(id -un)"  #pre_data_folder
    data_direction="${projection_data_folder}"
    scan_type_folder="${experimental_data_folder}"
    run_date_folder_prefix=""
    parent_dir="${pct_data_parent}"
    preprocessed_date=$(current_date)
    recon_date=$(current_date)
    data_direction="Output"
    verbose_flag='false'
    while getopts 'hvo:r:n:d:KCEGTIO' opt; do
        case $opt in        
            h) echo "${usage}"; return;;
            v) verbose_flag='true';;
            o) object=${OPTARG};;
            r) run_date=${OPTARG};;
            n) run_number=${OPTARG};;
            d) preprocessed_date=${OPTARG};;
            E) scan_type_folder="${experimental_data_folder}";;
            G) run_date_folder_prefix="${GEANT4_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;
            T) run_date_folder_prefix="${TOPAS_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;         
            I) data_direction="${raw_data_folder}";;
            O) data_direction="${projection_data_folder}";;
            *) error "Unexpected option ${flag}";;
        esac
    done    
    run_date_folder="${run_date_folder_prefix}${run_date}"                                          
    input_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}/${raw_data_folder}"
    output_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}/${projection_data_folder}/${preprocessed_date}"
    if [[ $data_direction == "${raw_data_folder}" ]]; then path="${input_path}"
    elif [[ $data_direction == "${projection_data_folder}" ]]; then path="${output_path}"; fi
    if [[ $verbose_flag == 'true' ]]; then echo "${path}"; fi
    REPLY="${path}"
}
function parse_pct_config()
{
    file="pct_config.txt"
    object=$(grep -Po "(?<=^object ).*" $file)
    run_date=$(grep -Po "(?<=^run_date ).*" $file)
    run_number=$(grep -Po "(?<=^run_number ).*" $file)
    echo "${object}"
    echo "${run_date}"
    echo "${run_number}"
}
function read_file()
{
    usage="read_file [-h] [-u <username>] -- add directory for pCT code to local SSD drive and default GitHub repository

    where:
        -h  show this help text
        -u  desired username (if different from login)"
    local OPTIND
  path=$PWD
  filename="readme.txt"
while getopts 'p:f:' opt; do
        case $opt in        
            h) echo "${usage}"; return;;
            p) path=${OPTARG};;
            f) filename=${OPTARG};;          
            *) error "Unexpected option ${flag}";;
        esac
    done 
    data=$(<readme.txt)
    IFS=$'\n'
    set -- $data  
    last_line="$2"
    IFS=' '
    set -- $last_line 
    object="$1"
    echo $input_data
    IFS=$'\n'
}
function object_id_2_name()
{
    objectID=$1
    if [[ $objectID == "Emp" ]]; then object_name="Empty"
    elif [[ $objectID == "CalEmp" ]]; then object_name="Calibration"
    elif [[ $objectID == "Calib" ]]; then object_name="Calibration"
    elif [[ $objectID == "Rod" ]]; then object_name="Rod"
    elif [[ $objectID == "Water" ]]; then object_name="Water"   
    elif [[ $objectID == "Sensitom" ]]; then object_name="CTP404_Sensitom"
    elif [[ $objectID == "LinePair" ]]; then object_name="CTP528_Linepair"
    elif [[ $objectID == "LowCon" ]]; then object_name="CTP515_Low_Contrast"
    elif [[ $objectID == "Dose16" ]]; then object_name="CTP554_Dose"
    elif [[ $objectID == "CIRSPHP0" ]]; then object_name="HN715_PedHead_0"
    elif [[ $objectID == "CIRSPHP1" ]]; then object_name="HN715_PedHead_1"
    elif [[ $objectID == "LMUDECT" ]]; then object_name="LMU_DECT"
    elif [[ $objectID == "CIRSEdge" ]]; then object_name="CIRS_Edge"
    elif [[ $objectID == "Birks" ]]; then object_name="Birks"
    else error_flag="true"
    fi
    if [[ $error_flag == "true" ]]
    then
        echo "ERROR: Unknown Phantom ID '$objectID' encountered"
        error_flag=false;
        break
    fi
}
function parse_pct_filename()
{
    IFS='_'                         
    extensionless=${1%.*}         
    L=${#extensionless}
    start_angle_index=`expr $L - 3`
    angle=${extensionless:start_angle_index}
    run_info=${extensionless%_*}                                
    objectID="${run_info%%_*}"                            
    run_num_tag="${run_info##${objectID}_}" 
    IFS=$'\n'                         # Delimiter for splitting path into its directory names    
}
function parse_readme()
{
    usage="parse_readme [-h] [-p <README path>] [-f <README filename>] -- parse the 'readme' text file included with preprocessed data specifying the filename(s) of the input raw data used as input from which the phantom name, run #/tag(s), and projection angle can be extracted.  

    where:
        -h  show this help text
        -v  verbose terminal output (default: off)
        -O  specifies old date format MMDDYYYY is used (default: YY-MM-DD)
        -p  path to data and readme text file (default: current working directory)
        -f  filename of readme text file (default: readme.txt)
        -d  date of preprocessing (default: parsed from data path '.../Output/<preprocessed date>')"
    local OPTIND
    preprocessed_path=$PWD
    filename="readme.txt"
    verbose_flag='false'
    YYMMDD_flag='true'
    while getopts 'hvOp:f:d:' opt; do
        case $opt in        
            h) echo "${usage}"; return;;
            v) verbose_flag='true';;
            O) YYMMDD_flag='false';;
            p) preprocessed_path=${OPTARG};;
            f) filename=${OPTARG};;
            d) preprocessed_date=${OPTARG};;
            *) error "Unexpected option ${flag}";;
        esac
    done   
    readme_path="${preprocessed_path}/${filename}"
    preprocessed_date="${preprocessed_path##*/}"
    if [[ $YYMMDD_flag == 'false' ]]
    then 
        month="${preprocessed_date:0:2}"
        day="${preprocessed_date:2:2}"
        year="${preprocessed_date:4:4}"
        preprocessed_date="${year:2:2}-${month}-${day}"
    fi    
    data=$(<"${readme_path}")
    IFS=$'\n'
    set -- $data  
    last_line="$2"
    IFS=' '
    set -- $last_line 
    input_data="$1"
    scan_date=$(date --date="$(printf "%s %s %s" $4 $5 $6)" +"%y-%m-%d")
    parse_pct_filename "$input_data"
    object_id_2_name "$objectID"
    if [[ $verbose_flag == 'true' ]]
    then
        construct_preprocessing_path -vE -r "${scan_date}" -d "${preprocessed_date}"  -o "${object_name}" -n "${run_num_tag}"    
        color_text " $path"     0,33 6,40; cpath=$REPLY
        color_text "${scan_date}" 0,35 6,40; cscan_date=$REPLY
        color_text "${input_data}" 0,35 6,40; cinput_data=$REPLY
        color_text "${objectID}" 0,35 6,40; cobjectID=$REPLY
        color_text "${object_name}" 0,35 6,40; cobject_name=$REPLY
        color_text "${run_num_tag}" 0,35 6,40; crun_num_tag=$REPLY
        color_text "${angle}" 0,35 6,40; cangle=$REPLY
        color_text "${input_path}" 0,35 6,40; cinput_path=$REPLY
        
        print "\npreprocessed data path = ${cpath}" 0,32 6,40 
        print "scan date = $cscan_date" 0,32 6,40 
        print "raw data filename = $cinput_data" 0,32 6,40 
        print "object ID = ${cobjectID}" 0,32 6,40 
        print "object name = $cobject_name" 0,32 6,40 
        print "run # + subcategory tag(s) = ${crun_num_tag}" 0,32 6,40  
        print "projection angle = ${cangle}" 0,32 6,40    
        print "source data = $cinput_path" 0,32 6,40    
    else
        construct_preprocessing_path -E -r "${scan_date}" -d "${preprocessed_date}" -o "${object_name}" -n "${run_num_tag}"
    fi  
    color_text "${output_path}" 0,35 6,40; coutput_path=$REPLY        
    print "\npreprocessed data destination:\n${coutput_path}" 0,32 6,40 
    destination_path="${preprocessed_path}/${output_path}"
}
function stage_preprocessed_data()
{
    usage="stage_preprocessed_data [-h][-v][-O][-p <README/data path>] [-f <README filename>] -- parse the 'readme' text file included with preprocessed data specifying the filename(s) of the input raw data used as input from which the phantom name, run #/tag(s), and projection angle can be parsed.  

        where:
            -h  show this help text
            -v  verbose terminal output (default: off)
            -O  specifies old date format MMDDYYYY is used (default: YY-MM-DD)
            -d  date of preprocessing (default: parsed from data path '.../Output/<preprocessed date>')
            -p  path to data and readme text file (default: current working directory)
            -f  filename of readme text file (default: readme.txt)"
    local OPTIND
    preprocessed_path=$PWD
    filename="readme.txt"
    verbose_flag='false'
    YYMMDD_flag='true'
    flag_string=''
    verbose_string=''
    YYMMDD_string=''
    username=$(id -un)
    while getopts 'hvOp:f:' opt; do
        case $opt in        
            h) echo "${usage}"; return;;
            v) verbose_string='v'; flag_string="-${verbose_string}${YYMMDD_string}";;
            d) preprocessed_date=${OPTARG};;
            p) preprocessed_path=${OPTARG};;
            f) filename=${OPTARG};;
            O) YYMMDD_string='O'; flag_string="-${verbose_string}${YYMMDD_string}";;
            *) error "Unexpected option ${flag}";;
        esac
    done   
    parse_readme -p "${preprocessed_path}" -f "${filename}" "${flag_string}"
    staging_destination="${staging_parent_path}/${username}/${output_path}"
    color_text "${staging_destination}" 0,35 6,40; cstaging_destination=$REPLY        
    print "\nStaging directory destination:\n${cstaging_destination}" 0,32 6,40 
    mkdir -p "${staging_destination}"
    cp -vr ${preprocessed_path}/* ${staging_destination}
}  
function subcategory_tagging()
{
    tag=$(tolowercase $1)
    if [[ $tag == "0b" ]]; then tag_out="0b"
    elif [[ $tag == "1b" ]]; then tag_out="1b"
    elif [[ $tag == "2b" ]]; then tag_out="2b"
    elif [[ $tag == "3b" ]]; then tag_out="3b"
    elif [[ $tag == "4b" ]]; then tag_out="4b"   
    elif [[ $tag == "nst4b" ]]; then tag_out="nst4b"
    elif [[ $tag == "cen" ]]; then tag_out="Cen"
    elif [[ $tag == "per" ]]; then tag_out="Per"
    elif [[ $tag == "sup" ]]; then tag_out="Sup"
    elif [[ $tag == "inf" ]]; then tag_out="Inf"
    elif [[ $tag == "top" ]]; then tag_out="Top"
    elif [[ $tag == "bot" ]]; then tag_out="Bot"
    elif [[ $tag == "cont" ]]; then tag_out="Cont"
    else error_flag="true"
    fi
    if [[ $error_flag == "true" ]]
    then
        echo "ERROR: Unknown subcategory tag '$tag' encountered"
        error_flag=false;
        return
    else
        echo $tag_out
    fi
}
function tolowercase()
{
    #lower=$(echo "$1" | tr '[:upper:]' '[:lower:]')
    echo "$1" | awk '{print tolower($0)}'
}
function touppercase()
{
    #lower=$(echo "$1" | tr '[:lower:]' '[:upper:]')
    echo "$1" | awk '{print toupper($0)}'
}
current_node_alias=$(current_node_name)
