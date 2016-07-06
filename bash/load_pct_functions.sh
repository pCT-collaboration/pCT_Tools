#!/bin/bash
###################################################################################################
########### User names of collaborators, including internal Baylor student user names #############
###################################################################################################
master="master"
current_user=$(id -un)
user_folder="/${current_user}"
recon_group="ionrecon"
other_pct_users=("penfolds" "plautzt" "piersimonip" "bashkirovv" "dedesg" "zatserkl" "johnsonr" "karonisn" "dout")
declare -a PCT_USERS
###################################################################################################
#################### Folder name variables for Kodiak/Tardis nodes code/data ######################
###################################################################################################
user_home=~
pct_folder="/ion"
tardis_pct_folder="/local"
home_folder="/home"
incoming_folder="/incoming"
staging_folder="/staging"
pct_code_folder="/pCT_code"
pct_data_folder="/pCT_data"
raw_data_folder="/raw_data"
pre_data_folder="/preprocessed_data"
proj_data_folder="/projection_data"
org_data_folder="/organized_data"
recon_data_folder="/reconstruction_data"
unorg_data_folder="/unorganized_data"
temp_input_data_folder="/temp_input_data"
temp_output_data_folder="/temp_output_data"
tardis_user_data_folder="/user_data"
ref_images_folder="/Reference_Images"
experimental_data_folder="/Experimental"
simulated_data_folder="/Simulated"
GEANT4_run_data_prefix="G_"
TOPAS_run_data_prefix="T_"
raw_data_link_folder="/Input"
proj_data_link_folder="/Output"
git_code_folder="/git"
rcode_folder="/Reconstruction"
pcode_folder="/Preprocessing"
pct_docs_folder="/pCT_Documentation"
###################################################################################################
############### Define variables for git commands, accounts, repos, branches, etc. ################
###################################################################################################
git_clone_addr_base="git@github.com:"
git_clone_addr_suffix=".git"
# pCT-collaboration account
pct_collab_git_account="pCT-collaboration"
pct_tools_git_repo="pCT_Tools"
pcode_git_repo="Preprocessing"
old_rcode_git_repo="pct-recon-copy"
geant4_git_repo="Geant4"
# BaylorICTHUS account
Baylor_git_account="BaylorICTHUS"
Baylor_rcode_git_repo="pCT_Reconstruction"
# BlakeSchultze account
Blake_git_account="BlakeSchultze"
Blake_rcode_git_repo="pCT_Reconstruction"
Blake_doc_git_repo="pCT_Documentation"
###################################################################################################
############################ Setting Kodiak/Tardis/GitHub data paths ##############################
###################################################################################################
pct_home="${pct_folder}${home_folder}"
tardis_home="${tardis_pct_folder}${home_folder}"
workstation_pct="${home_folder}/share"
recon_group_home="${pct_home}/${recon_group}"
#-------- Kodiak code/data paths ------------#
incoming_path="${pct_folder}${incoming_folder}"
staging_path="${pct_folder}${staging_folder}"
pct_data_path="${pct_folder}${pct_data_folder}"
raw_data_path="${pct_data_path}${raw_data_folder}"
pre_data_path="${pct_data_path}${pre_data_folder}"
proj_data_path="${pct_data_path}${proj_data_folder}"
org_data_path="${pct_data_path}${org_data_folder}"
recon_data_path="${pct_data_path}${recon_data_folder}"
#-------- Tardis code/data paths ------------#
tardis_data_path=${tardis_pct_folder}${pct_data_folder}
tardis_raw_data_path="${tardis_data_path}${raw_data_folder}"
tardis_pre_data_path="${tardis_data_path}${pre_data_folder}"
tardis_proj_data_path="${tardis_data_path}${proj_data_folder}"
tardis_recon_data_path="${tardis_data_path}${recon_data_folder}"
tardis_org_data_path="${tardis_data_path}${org_data_folder}"
tardis_unorg_data_path="${tardis_data_path}${unorg_data_folder}"
tardis_user_data_path="${tardis_data_path}${tardis_user_data_folder}"
tardis_temp_input_data_path="${tardis_data_path}${temp_input_data_folder}"
tardis_temp_output_data_path="${tardis_recon_data_path}${temp_output_data_folder}"
###################################################################################################
############################ Setting Kodiak/Tardis/GitHub code paths ##############################
###################################################################################################
pct_tools_git_repo_subdir_path="${pct_collab_git_account}/${pct_tools_git_repo}"
old_rcode_git_repo_subdir_path="${pct_collab_git_account}/${old_rcode_git_repo}"
Baylor_rcode_git_repo_subdir_path="${Baylor_git_account}/${Baylor_rcode_git_repo}"
Blake_rcode_git_repo_subdir_path="${Blake_git_account}/${Blake_rcode_git_repo}"
pcode_subdir_path=${pct_code_folder}${pcode_folder}
rcode_subdir_path=${pct_code_folder}${rcode_folder}
git_code_subdir_path=${pct_code_folder}${git_code_folder}

pct_code_path="${pct_folder}${pct_code_folder}"
global_code_path="${pct_folder}${pct_code_folder}"
global_pcode_path=${pct_folder}${pcode_subdir_path}
global_rcode_path=${pct_folder}${rcode_subdir_path}
global_git_code_path=${pct_folder}${git_code_subdir_path}
global_git_clones_dir=${global_code_path}${git_code_folder}
global_pct_collab_dir=${global_git_clones_dir}/${pct_collab_git_account}
global_Baylor_dir=${global_git_clones_dir}/${Baylor_git_account}
global_Blake_dir=${global_git_clones_dir}/${Blake_git_account}
global_pct_tools_git_repo_path="${global_git_code_path}/${pct_tools_git_repo_subdir_path}"
global_old_rcode_git_repo_path="${global_git_code_path}/${old_rcode_git_repo_subdir_path}"
global_Baylor_rcode_git_repo_path="${global_git_code_path}/${Baylor_rcode_git_repo_subdir_path}"
global_Blake_rcode_git_repo_path="${global_git_code_path}/${Blake_rcode_git_repo_subdir_path}"

tardis_code_path="${tardis_pct_folder}${pct_code_folder}"
tardis_pcode_path=${tardis_pct_folder}${pcode_subdir_path}
tardis_rcode_path=${tardis_pct_folder}${rcode_subdir_path}
tardis_git_code_path=${tardis_git_clones_dir}
tardis_git_clones_dir=${tardis_code_path}${git_code_folder}
tardis_pct_collab_dir=${tardis_git_clones_dir}/${pct_collab_git_account}
tardis_Baylor_dir=${tardis_git_clones_dir}/${Baylor_git_account}
tardis_Blake_dir=${tardis_git_clones_dir}/${Blake_git_account}
tardis_pct_tools_git_repo_path="${tardis_git_code_path}/${pct_tools_git_repo_subdir_path}"
tardis_old_rcode_git_repo_path="${tardis_git_code_path}/${old_rcode_git_repo_subdir_path}"
tardis_Baylor_rcode_git_repo_path="${tardis_git_code_path}/${Baylor_rcode_git_repo_subdir_path}"
tardis_Blake_rcode_git_repo_path="${tardis_git_code_path}/${Blake_rcode_git_repo_subdir_path}"

# git clone arguments for primary git repositories
pct_tools_git_clone_addr="${git_clone_addr_base}${pct_tools_git_repo_subdir_path}${git_clone_addr_suffix}"
old_rcode_git_clone_addr="${git_clone_addr_base}${old_rcode_git_repo_subdir_path}${git_clone_addr_suffix}"
Baylor_rcode_git_clone_addr="${git_clone_addr_base}/${Baylor_rcode_git_repo_subdir_path}${git_clone_addr_suffix}"
Blake_rcode_git_clone_addr="${git_clone_addr_base}/${Blake_rcode_git_repo_subdir_path}${git_clone_addr_suffix}"

# filename/path to script loading pCT user functions/shortcuts
load_pct_functions_script="load_pct_functions.sh"
pct_functions_git_repo_path="${global_git_code_path}/${pct_tools_git_repo_subdir_path}/bash_scripts"
pct_functions_script_path="${global_git_code_path}/${pct_tools_git_repo_subdir_path}/bash_scripts/${load_pct_functions_script}"

pct_data_subdirs=( $org_data_folder $raw_data_folder $pre_data_folder $proj_data_folder $recon_data_folder )
pct_code_subdirs=( $git_code_folder $rcode_folder $pcode_folder )
phantom_IDs=( "Emp" "Empty"
    "CalEmp" ]]; then object_name="Calibration"
    "Calib" ]]; then object_name="Calibration"
    "Rod" ]]; then object_name="Rod"
"Water" ]]; then object_name="Water"   
"Sensitom" ]]; then object_name="CTP404_Sensitom"
"LinePair" ]]; then object_name="CTP528_Linepair"
"LowCon" ]]; then object_name="CTP515_Low_Contrast"
"Dose16" ]]; then object_name="CTP554_Dose"
"CIRSPHP0" ]]; then object_name="HN715_PedHead_0"
"CIRSPHP1" ]]; then object_name="HN715_PedHead_1"
"LMUDECT" ]]; then object_name="LMU_DECT"
"CIRSEdge" ]]; then object_name="CIRS_Edge"
"Birks" ]]; then object_name="Birks"
phantom_subdirs=( $experimental_data_folder $simulated_data_folder $ref_images_folder )
run_number_subdirs=( $raw_data_link_folder $proj_data_link_folder )
ion_subdirs=( $incoming_folder $staging_folder $pct_code_folder $pct_data_folder )

git_accounts=( $pct_collab_git_account $Baylor_git_account $Blake_git_account )
pct_collab_repos=( $pct_tools_git_repo $pcode_git_repo $old_rcode_git_repo $geant4_git_repo )
Baylor_repos=( $Baylor_rcode_git_repo )
Blake_repos=( $Blake_rcode_git_repo $Blake_doc_git_repo )

pct_data_paths=( $org_data_path $raw_data_path $pre_data_path $proj_data_path $recon_data_path )
pct_code_paths=( $global_git_code_path $global_pcode_path $global_rcode_path )
ion_paths=( $incoming_path $staging_path $pct_code_path $pct_data_path )
tardis_user_paths=( $tardis_rcode_path $tardis_pcode_path $tardis_user_data_path $tardis_temp_input_data_path $tardis_temp_output_data_path )
###################################################################################################
################################ Setting current data/code paths ##################################
###################################################################################################
direct_git='direct'
user_git='user'
direct_git_flag='-g'
current_rcode_account="${Blake_git_account}"
current_rcode_repo="${Blake_rcode_git_repo}"
current_rcode_branch="development"
current_rcode_git=$direct_git
if [[ $current_rcode_git == 'direct' ]]
then
    current_set_rcode_git_flag=$direct_git_flag
else
    current_set_rcode_git_flag=''
fi
   
current_global_git_rcode_path="${global_git_code_path}/${current_rcode_account}/${current_rcode_repo}"
current_global_user_rcode_path="${global_rcode_path}/${username}${git_code_folder}/${current_rcode_account}/${current_rcode_repo}"
current_global_group_rcode_path="${global_rcode_path}/${recon_group}${git_code_folder}/${current_rcode_account}/${current_rcode_repo}"
current_tardis_git_rcode_path="${tardis_git_code_path}/${current_rcode_account}/${current_rcode_repo}"
current_tardis_user_rcode_path="${tardis_rcode_path}/${username}${git_code_folder}/${current_rcode_account}/${current_rcode_repo}"
current_tardis_group_rcode_path="${tardis_rcode_path}/${recon_group}${git_code_folder}/${current_rcode_account}/${current_rcode_repo}"
current_global_rcode_path=${current_global_git_rcode_path}
current_tardis_rcode_path=${current_tardis_git_rcode_path}

current_pcode_account="${pct_collab_git_account}"
current_pcode_repo="${pcode_git_repo}"

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
################### Tardis head/compute node IDs, nicknames, and IP addresses #####################
###################################################################################################
# Node ID numbers
kodiak=130
whartnell=1
ptroughton=2
jpertwee=3
tbaker=4
pdavison=5
# Tardis node IDs
tardis_head_node_ID="ecsn001"
tardis_compute_node1_ID="ecsn002"
tardis_compute_node2_ID="ecsn003"
tardis_compute_node3_ID="ecsn004"
tardis_compute_node4_ID="ecsn005"
# Tardis node aliases
tardis_head_node_alias="whartnell"
tardis_compute_node1_alias="ptroughton"
tardis_compute_node2_alias="jpertwee"
tardis_compute_node3_alias="tbaker"
tardis_compute_node4_alias="pdavison"
# Tardis node IPs
tardis_IP_base="192.168.225."
tardis_head_node_IP="${tardis_IP_base}${whartnell}"
tardis_compute_node1_IP="${tardis_IP_base}${ptroughton}"
tardis_compute_node2_IP="${tardis_IP_base}${jpertwee}"
tardis_compute_node3_IP="${tardis_IP_base}${tbaker}"
tardis_compute_node4_IP="${tardis_IP_base}${pdavison}"
###################################################################################################
############### pCT module loading and CUDA info for Kodiak/Tardis gcc/nvcc usage #################
###################################################################################################
kodiak_modules=("purge" "unload gcc" "load gcc/4.8.4" "load geant4/10.1.1" "load openmpi/1.8.1" "load root" )
tardis_modules_old=("purge" "load cmake/3.2" "load java/1.8.0" "load emacs/24.5" "load geant4/10.1.1" "load git/2.4.3" "load make/4.1" "load matlab/2015a" "load perl/5.20" "load python/3.4" "load root" "load ruby/2.2.2" "load blacs/openmpi/gcc/64/1.1patch03" "load blacs/openmpi/open64/64/1.1patch03" "load blas/gcc/64/3.5.0" "load blas/open64/64/3.5.0" "load fftw3/openmpi/gcc/64/3.3.4" "load fftw3/openmpi/open64/64/3.3.4" "load lapack/gcc/64/3.5.0" "load lapack/open64/64/3.5.0" "load mpich/ge/gcc/64/3.1.4" "load mpich/ge/open64/64/3.1.4" "load mpiexec/0.84_432" "load mvapich2/1.9-gcc-4.9.2" "load mvapich2/gcc/64/2.1" "load mvapich2/open64/64/2.1" "load openblas/dynamic/0.2.14" "load openmpi/gcc/64/1.8.5" "load openmpi/open64/64/1.8.5" "load scalapack/gcc/64/1.8.0" "load scalapack/open64/64/1.8.0")
tardis_modules=("purge" "load cmake/3.2" "load java/1.8.0" "load emacs/24.5" "load geant4/10.1.1" "load git/2.4.3" "load make/4.1" "load matlab/2015a" "load perl/5.20" "load python/3.4" "load root" "load ruby/2.2.2" "load blacs/openmpi/gcc/64/1.1patch03" "load blacs/openmpi/open64/64/1.1patch03" "load blas/gcc/64/3.6.0" "load blas/open64/64/3.6.0" "load fftw3/openmpi/gcc/64/3.3.4" "load fftw3/openmpi/open64/64/3.3.4" "load lapack/gcc/64/3.6.0" "load lapack/open64/64/3.6.0" "load mpich/ge/gcc/64/3.2" "load mpich/ge/open64/64/3.2" "load mpiexec/0.84_432" "load mvapich2/1.9-gcc-4.9.2" "load mvapich2/gcc/64/2.2b" "load mvapich2/open64/64/2.2b" "load openblas/dynamic/0.2.15" "load openmpi/gcc/64/1.10.1" "load openmpi/open64/64/1.10.1" "load scalapack/mvapich2/gcc/64/2.0.2" "load scalapack/openmpi/gcc/64/2.0.2")
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
######################## Define variables for console output formatting ###########################
###################################################################################################
console_width=90
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
DEFAULT_IFS=' '
###################################################################################################
###################################################################################################
###################################### Function definitions #######################################
###################################################################################################
###################################################################################################
#-------------------------------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------#
#------------------------------ General helper/utility functions ---------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------#
function exe() { echo -e " $@" ; "$@" ; }
function now() { date +"%T %Z (%a) %m-%d-%Y"; }
function current_date() { date +"%y-%m-%d"; }
function dec2int() { echo "scale=0; $@/1" | bc ; }
function charrep() { printf '%*s' "$2" | tr ' ' "$1" ; }
function is_integer()
{
    re='^[0-9]+$'
    if [[ $1 =~ $re ]]; then return 0
    else return 1; fi
}
function char_occur_count() { number_of_occurrences=$(grep -o "$2" <<< "$1" | wc -l); REPLY=$number_of_occurrences; }
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
function qsort() 
{
   local pivot i smaller=() larger=()
   qsort_ret=()
   (($#==0)) && return 0
   pivot=$1
   shift
   for i; do
      if [[ $i < $pivot ]]; then
         smaller+=( "$i" )
      else
         larger+=( "$i" )
      fi
   done
   qsort "${smaller[@]}"
   smaller=( "${qsort_ret[@]}" )
   qsort "${larger[@]}"
   larger=( "${qsort_ret[@]}" )
   qsort_ret=( "${smaller[@]}" "$pivot" "${larger[@]}" )
}
function path_2_parent()
{
    path=$1
    echo "${path:0:1}"
    if [[ "${path:0:1}" == "/" ]]; then path="${path:1}"; fi
    parent=${path%%/*}
    #echo $parent
    REPLY=$parent
}
function path_2_folder()
{
    path=$1
    #echo "${path:0:1}"
    folder=${path##*/}
    #echo $folder
    REPLY=$folder
}
function strip_path_folder()
{
    path=$1
    folder=${path##*/}
    #echo $folder
    stripped_path=${path%%/$folder}
    #echo $stripped_path
    REPLY=$stripped_path
}
function string_2_array() 
{ 
    string=$1
    declare -a string_array
    IFS=$'\n'
    set -- $string
    j=2   
    i=0 
    while [ -n "${!j}" ]; do                        
        string_array[i]="${!j}"
        let i++
        j=$(($j+1)) 
    done
    qsort "${string_array[@]}"
    REPLY="${qsort_ret[@]}"
}
function array_member_test () 
{
    #case "${myarray[@]}" in  *"two"*) echo "found" ;; esac
    local e
    for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
    return 1
}
function lsdirs() 
{ 
    dirs=$(find -maxdepth 1 -type d -printf "%f\n")
    string_2_array $dirs    
    dirs_array=( ${qsort_ret[@]} )
    REPLY="${dirs_array[@]}"
    IFS=$DEFAULT_IFS   
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
function dir_sizes() { du -sh *; }
function subdir_sizes()
{ 
    local OPTIND
    max_depth='1'
    path="$PWD"
    while getopts 'h:p:d:' opt; do
        case $opt in        
            h) echo "${usage}"; return;;
            p) path=${OPTARG};;
            d) max_depth=${OPTARG};;
            *) error "Unexpected option ${flag}";;
        esac
    done     
    du --max-depth $max_depth -h ${path}/* 
}
#-------------------------------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
#------------------------------------------ Console Printing/Formatting Functions ----------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
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
function print_key_value()
{
    local OPTIND
    while getopts 'c:C:k:v:' opt; do
        case $opt in
            c) key_color_coding=${OPTARG};;
            C) value_color_coding=${OPTARG};;
            k) key=${OPTARG};;
            v) value=${OPTARG};;
            *) error "Unexpected option ${flag}";;
        esac
    done
    color_text " $value" $value_color_coding; value_string=$REPLY
    print "$key:$value_string" $key_color_coding
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
function print_program_version()
{
    echo -e "${Green}$1 version:${LightCyan}"
    echo -e "$( $2 )${NoColor} $3"
}
#-------------------------------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
#---------------------------------------------- Data naming/organization -------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
function parse_pct_path()
{
    local OPTIND
    parent_path="$PWD"
    verbose_flag='false'
    while getopts 'hvp:' opt; do
        case $opt in
            h) echo "${usage}"; return;;
            v) verbose_string='true';;
            p) parent_path=${OPTARG};; 
            *) error "Unexpected option ${flag}";;
        esac
    done
    L=${#parent_path}
    last_char=`expr $L - 1`    
    if [[ "${parent_path:$last_char}" == "/" ]]; then parent_path="${parent_path:0:$last_char}"; fi
    if [[ "${parent_path:0:1}" == "/" ]]; then parent_path="${parent_path:1}"; fi   
    char_occur_count $parent_path "/"
    num_folders=$REPLY
    if [[ $num_folders == '6' ]]
    then
        path_2_folder $parent_path
        recon_date=$REPLY
        strip_path_folder $parent_path
        parent_path=$REPLY    
    fi
    path_2_folder $parent_path
    preprocess_date=$REPLY
    #echo $preprocess_date
    
    strip_path_folder $parent_path
    parent_path=$REPLY  
    path_2_folder $parent_path  
    output_folder=$REPLY
    #echo $output_folder
    
    strip_path_folder $parent_path
    parent_path=$REPLY  
    path_2_folder $parent_path  
    run_number=$REPLY
    #echo $run_number
    
    strip_path_folder $parent_path
    parent_path=$REPLY  
    path_2_folder $parent_path  
    run_date=$REPLY
    #echo $run_date
    
    strip_path_folder $parent_path
    parent_path=$REPLY  
    path_2_folder $parent_path  
    scan_type_folder=$REPLY
    #echo $scan_type_folder
    
    strip_path_folder $parent_path
    #parent_path=$REPLY  
    #path_2_folder $parent_path  
    object=$REPLY
    echo $REPLY
    #unset PCT_FIELDS
    if [[ $num_folders == '6' ]]
    then    
        PCT_FIELDS=( $object $scan_type_folder $run_date $run_number $output_folder $preprocess_date $recon_date)
    else
        PCT_FIELDS=( $object $scan_type_folder $run_date $run_number $output_folder $preprocess_date)
    fi
    REPLY=$PCT_FIELDS
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
function parse_readme()
{
    usage="$(echo "${FUNCNAME}") [-h] [-p <README path>] [-f <README filename>] -- parse the 'readme' text file included with preprocessed data specifying the filename(s) of the input raw data used as input from which the phantom name, run #/tag(s), and projection angle can be extracted.  

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
    parent_dir="${org_data_path}"
    preprocessed_date=$(current_date)
    recon_date=$(current_date)
    data_direction="${raw_data_link_folder:1}"
    while getopts 'ho:r:n:d:D:KCEGTIO' opt; do
        case $opt in        
            h) echo "${usage}"; return;;
            o) object=${OPTARG};;
            r) run_date=${OPTARG};;
            n) run_number=${OPTARG};;
            d) preprocessed_date=${OPTARG};;
            D) recon_date=${OPTARG};;
            K) parent_dir="${org_data_path}";;
            C) parent_dir="${tardis_org_data_path}";;
            E) scan_type_folder="${experimental_data_folder}";;
            G) run_date_folder_prefix="${GEANT4_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;
            T) run_date_folder_prefix="${TOPAS_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;         
            I) data_direction="${raw_data_link_folder}";;
            O) data_direction="${proj_data_link_folder}";;
            *) error "Unexpected option ${flag}";;
        esac
    done    
    run_date_folder="${run_date_folder_prefix}${run_date}"                                          # Extract run date from last directory in the path
    #input_path="${parent_dir}/${object}/${scan_type_folder}/${run_date_folder}/${run_date_folder}${run_number}${proj_data_link_folder}/${preprocessed_date}"
    #output_path="${parent_dir}/${object}/${scan_type_folder}/${run_date_folder}/${run_date_folder}${run_number}${proj_data_link_folder}/${preprocessed_date}/${recon_date}"
    input_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${proj_data_link_folder}/${preprocessed_date}"
    output_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${proj_data_link_folder}/${preprocessed_date}/${recon_date}"
    echo "${input_path}"
    echo "${output_path}"
    if [[ $data_direction == "${raw_data_link_folder:1}" ]]; then REPLY="${input_path}"
    elif [[ $data_direction == "${proj_data_link_folder:1}" ]]; then REPLY="${output_path}"; fi
    #/ion/pCT_data/organized_data/<phantom>/<scan type>/<run date>/<run #>/Output/<preprocessed data>     
}
function construct_preprocessing_path()
{
    local OPTIND
    username="$(id -un)"
    data_direction="${proj_data_link_folder}"
    scan_type_folder="${experimental_data_folder}"
    run_date_folder_prefix=""
    parent_dir="${org_data_path}"
    preprocessed_date=$(current_date)
    recon_date=$(current_date)
    data_direction="proj_data_link_folder"
    verbose_flag='false'
    usage="$(echo "${FUNCNAME}") [-h] [-EGT] [-IO] [-o <object name>] [-r <run date>][-n <run # + tag(s)>] [-d <preprocessed data>] -- construct input or output data path for appropriately organized preprocessed data
    
    where:
        -h  show this help text
        -v  verbose: console output on (DEFAULT: 'off')
        -o  object name (REQUIRED)
        -r  run date (REQUIRED)
        -n  run # + tag(s) (REQUIRED)
        -d  preprocessed_date (DEFAULT: ${preprocessed_date} (today))
        -E  Experimental data flag (DEFAULT)
        -G  GEANT4 data flag 
        -T  TOPAS data flag 
        -I  input data flag
        -O  output data flag (DEFAULT)"
    while getopts 'hvo:r:n:d:EGTIO' opt; do
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
            I) data_direction="${raw_data_link_folder}";;
            O) data_direction="${proj_data_link_folder}";;
            *) error "Unexpected option ${flag}";;
        esac
    done    
    run_date_folder="${run_date_folder_prefix}${run_date}"                                          
    input_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${raw_data_link_folder}"
    output_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${proj_data_link_folder}/${preprocessed_date}"
    if [[ $data_direction == "${raw_data_link_folder:1}" ]]; then path="${input_path}"
    elif [[ $data_direction == "${proj_data_link_folder:1}" ]]; then path="${output_path}"; fi
    if [[ $verbose_flag == 'true' ]]; then echo "${path}"; fi
    REPLY="${path}"
}
function construct_recon_path()
{
    local OPTIND
    username="$(id -un)" 
    data_direction="${projection_link_folder}"
    scan_type_folder="${experimental_data_folder}"
    run_date_folder_prefix=""
    parent_dir="${org_data_path}"
    preprocessed_date=$(current_date)
    recon_date=$(current_date)
    data_direction="${proj_data_link_folder}"
    verbose_flag='false'
    usage="$(echo "${FUNCNAME}") [-h] [-EGT] [-IO] [-o <object name>] [-r <run date>][-n <run # + tag(s)>] [-d <preprocessed data>] [-D <reconstruction date>] -- construct input or output data path for appropriately organized reconstruction data

    where:
        -h  show this help text
        -v  verbose: console output on (DEFAULT: 'off')
        -o  object name (REQUIRED)
        -r  run date (REQUIRED)
        -n  run # + tag(s) (REQUIRED)
        -d  preprocessed_date (DEFAULT: ${preprocessed_date} (today))
        -D  reconstruction date, if applicable (DEFAULT: ${recon_date} (today))
        -E  Experimental data flag (DEFAULT)
        -G  GEANT4 data flag 
        -T  TOPAS data flag 
        -I  input data flag
        -O  output data flag (DEFAULT)"
    while getopts 'hvo:r:n:d:D:EGTIO' opt; do
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
            I) data_direction="${raw_data_link_folder}";;
            O) data_direction="${proj_data_link_folder}";;
            *) error "Unexpected option ${flag}";;
        esac
    done    
    run_date_folder="${run_date_folder_prefix}${run_date}"          # Extract run date from last directory in the path
    input_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${proj_data_link_folder}/${preprocessed_date}"
    output_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${proj_data_link_folder}/${preprocessed_date}/${recon_date}"
    #echo "${input_path}"
    #echo "${output_path}"
    if [[ $data_direction == "${raw_data_link_folder:1}" ]]; then path="${input_path}"
    elif [[ $data_direction == "${proj_data_link_folder:1}" ]]; then path="${output_path}"; fi
    if [[ $verbose_flag == 'true' ]]; then echo "${path}"; fi
    REPLY="${path}"
    #REPLY="${IO_path}"
}
function construct_pct_path()
{
    local OPTIND
    username="$(id -un)" 
    data_direction="${projection_link_folder}"
    scan_type_folder="${experimental_data_folder}"
    run_date_folder_prefix=""
    parent_dir="${org_data_path}"
    preprocessed_date=$(current_date)
    recon_date=$(current_date)
    data_direction="${proj_data_link_folder}"
    preprocessing_flag='true'
    verbose_flag='false'
    usage="${echo $FUNCNAME} [-h] [-EGT] [-IO] [-o <object name>] [-r <run date>][-n <run # + tag(s)>] [-d <preprocessed data>] [-D <reconstruction date>] -- construct input or output data path for appropriately organized reconstruction data

    where:
        -h  show this help text
        -P  preprocessing path request flag (DEFAULT)
        -R  reconstruction path request flag (DEFAULT: preprocessing )
        -o  object name (REQUIRED)
        -r  run date (REQUIRED)
        -n  run # + tag(s) (REQUIRED)
        -d  preprocessed_date (DEFAULT: ${preprocessed_date} (today))
        -D  reconstruction date, if applicable (DEFAULT: ${recon_date} (today))
        -E  Experimental data flag (DEFAULT)
        -G  GEANT4 data flag 
        -T  TOPAS data flag 
        -I  input data flag
        -O  output data flag (DEFAULT)"
    while getopts 'hvPRo:r:n:d:D:EGTIO' opt; do
        case $opt in        
            h) echo "${usage}"; return;;
            v) verbose_flag='true';;
            P) preprocessing_flag='true';;
            R) preprocessing_flag='false';;
            o) object=${OPTARG};;
            r) run_date=${OPTARG};;
            n) run_number=${OPTARG};;
            d) preprocessed_date=${OPTARG};;
            D) recon_date=${OPTARG};;
            E) scan_type_folder="${experimental_data_folder}";;
            G) run_date_folder_prefix="${GEANT4_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;
            T) run_date_folder_prefix="${TOPAS_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;         
            I) data_direction="${raw_data_link_folder}";;
            O) data_direction="${proj_data_link_folder}";;
            *) error "Unexpected option ${flag}";;
        esac
    done    
    run_date_folder="${run_date_folder_prefix}${run_date}"          # Extract run date from last directory in the path
    if [[ $preprocessing_flag == 'true' ]]
    then
        input_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${raw_data_link_folder}"
        output_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${proj_data_link_folder}/${preprocessed_date}"    
    else
        input_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${proj_data_link_folder}/${preprocessed_date}"
        output_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${proj_data_link_folder}/${preprocessed_date}/${recon_date}"      
    fi
    #echo "${input_path}"
    #echo "${output_path}"
    if [[ $data_direction == "${raw_data_link_folder}" ]]; then REPLY="${input_path}"
    elif [[ $data_direction == "${proj_data_link_folder}" ]]; then REPLY="${output_path}"; fi
    #echo "${IO_path}"
    REPLY="${IO_path}"         
}
function organize_data()
{
    local OPTIND
    username="$(id -un)" 
    current_pwd=$PWD
    data_path=$PWD
    destination=$current_pwd
    data_direction="${projection_link_folder}"
    scan_type_folder="${experimental_data_folder}"
    run_date_folder_prefix=""
    parent_dir="${org_data_path}"
    preprocessed_date=$(current_date)
    recon_date=$(current_date)
    data_direction="${proj_data_link_folder}"
    verbose_flag='false'
    copy_flag='true'
    usage="$(echo "${FUNCNAME}") [-h] [-EGT] [-IO] [-o <object name>] [-r <run date>][-n <run # + tag(s)>] [-d <preprocessed data>] [-D <reconstruction date>] -- construct input or output data path for appropriately organized reconstruction data
    
    where:
        -h  show this help text
        -v  verbose: console output on (DEFAULT: 'off')
        -P  preprocessing data flag (DEFAULT)
        -R  reconstruction data flag (DEFAULT: preprocessing)
        -M  move data (DEFAULT: copy)
        -C  move data (DEFAULT: copy)
        -p  path to data (DEFAULT: current working directory)
        -t  write output hierarchy to (DEFAULT: current working directory)
        -o  object name (REQUIRED)
        -r  run date (REQUIRED)
        -n  run # + tag(s) (REQUIRED)
        -d  preprocessed_date (DEFAULT: ${preprocessed_date} (today))
        -D  reconstruction date, if applicable (DEFAULT: ${recon_date} (today))
        -E  Experimental data flag (DEFAULT)
        -G  GEANT4 data flag 
        -T  TOPAS data flag 
        -I  input data flag
        -O  output data flag (DEFAULT)"
    while getopts 'hvMCPRp:t:o:r:n:d:D:EGTIO' opt; do
        case $opt in               
            h) echo "${usage}"; return;;
            v) verbose_flag='true';;
            P) preprocessing_flag='true';;
            R) preprocessing_flag='false';;
            M) copy_flag='false';;
            C) copy_flag='true';;
            p) data_path=${OPTARG};;
            t) destination=${OPTARG};;
            o) object=${OPTARG};;
            r) run_date=${OPTARG};;
            n) run_number=${OPTARG};;
            d) preprocessed_date=${OPTARG};;
            D) recon_date=${OPTARG};;
            E) scan_type_folder="${experimental_data_folder}";;
            G) run_date_folder_prefix="${GEANT4_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;
            T) run_date_folder_prefix="${TOPAS_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;         
            I) data_direction="${raw_data_link_folder}";;
            O) data_direction="${proj_data_link_folder}";;
            *) error "Unexpected option ${flag}";;
        esac
    done    
    run_date_folder="${run_date_folder_prefix}${run_date}"          # Extract run date from last directory in the path
    if [[ $preprocessing_flag == 'true' ]]
    then
        input_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${raw_data_link_folder}"
        output_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${proj_data_link_folder}/${preprocessed_date}"    
    else
        input_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${proj_data_link_folder}/${preprocessed_date}"
        output_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${proj_data_link_folder}/${preprocessed_date}/${recon_date}"      
    fi
    #echo "${input_path}"
    #echo "${output_path}"
    if [[ $data_direction == "${raw_data_link_folder}" ]]; then hierarchy_path="${input_path}"
    elif [[ $data_direction == "${proj_data_link_folder}" ]]; then hierarchy_path="${output_path}"; fi
    dest_path="$destination/${hierarchy_path}"
    echo "${dest_path}"
    mkdir -p $dest_path
    if [[ $copy_flag == 'true' ]]; then find ${data_path}/* -maxdepth 1 -type f -exec cp -vt $dest_path {} + # cp ${data_path}/* $dest_path  
    else mv ${data_path}/* $dest_path; fi
    REPLY="$destination${dest_path}"            
}
function set_current_rdata()
{
    construct_recon_path -o $current_phantom_name -r $current_run_date -n $current_run_number -d $current_preprocessed_date 
    current_rdata=${org_data_path}/${input_path}
    current_lrdata=${tardis_org_data_path}/${input_path}
    echo $current_rdata
    echo $current_lrdata
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
                link_path="${pCT_path}organized_data/${object_name}/Experimental/${run_date}/${run_num}${raw_data_link_folder}/"
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
                link_path="${pCT_path}organized_data/${object_name}/${scan_type}/${run_date}/${run_num}${raw_data_link_folder}/${preprocessed_date}/"
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
function stage_preprocessed_data()
{
    local OPTIND
    preprocessed_path=$PWD
    preprocessed_date=$(current_date)
    filename="readme.txt"
    verbose_flag='false'
    YYMMDD_flag='true'
    flag_string=''
    verbose_string=''
    YYMMDD_string=''
    username=$(id -un)
    usage="$(echo "${FUNCNAME}") [-h][-v][-O][-p <README/data path>] [-f <README filename>] -- parse the 'readme' text file included with preprocessed data specifying the filename(s) of the input raw data used as input from which the phantom name, run #/tag(s), and projection angle can be parsed.  

        where:
            -h  show this help text
            -v  verbose flag: terminal output 'on' (DEFAULT: $verbose_flag)
            -d  date of preprocessing (DEFAULT: $preprocessed_date (today))
            -p  path to data and readme text file (DEFAULT: $preprocessed_path)
            -f  filename of readme text file (DEFAULT: $filename)
            -O  specifies old date format MMDDYYYY is used (DEFAULT: 'YY-MM-DD')"
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
function scppct()
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
    data_path=$PWD  
    tardis_path="${tardis_pct_folder}${PWD##${pct_folder}}"
    username=$(id -un)
    while getopts 'n:A' opt; do
        case $opt in        
            h) echo "${usage}"; return;;
            n) node=${OPTARG};;
            d) preprocessed_date=${OPTARG};;
            p) preprocessed_path=${OPTARG};;
            f) filename=${OPTARG};;
            O) YYMMDD_string='O'; flag_string="-${verbose_string}${YYMMDD_string}";;
            *) error "Unexpected option ${flag}";;
        esac
    done  
    mkdir -p "${tardis_path}"
        
}
#-------------------------------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
#------------------------------------------ Code transferring/compilation/execution --------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
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
function scp_recon()
{   
    echo -e ${REPLY}
    scp ${user_home}${rcode_subdir_path}${user_folder}/src ${1}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    scp ${user_home}${rcode_subdir_path}${user_folder}/include ${1}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    print_newline
}
function txrecon2all()
{
    print_section_header "Transferring reconstruction code to all Tardis compute nodes" 1,33  5,40
    print "\nCurrent user: " 0,32;  print "${current_user}" 0,35
    print "\nTransferring to: " 0,32;  print "${tardis_compute_node1_alias}" 0,35
    set_color ${default_text_color} ${default_background_color} 
    echo -e ${REPLY}
    scp ${user_home}${rcode_subdir_path}${user_folder}/src ${current_user}@${tardis_compute_node1_alias}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    scp ${user_home}${rcode_subdir_path}${user_folder}/include ${current_user}@${tardis_compute_node1_alias}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    print "\nTransferring to: " 0,32;  print "${tardis_compute_node2_alias}" 0,35
    set_color ${default_text_color} ${default_background_color}
    echo -e $REPLY
    scp ${user_home}${rcode_subdir_path}${user_folder}/src ${current_user}@${tardis_compute_node2_alias}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    scp ${user_home}${rcode_subdir_path}${user_folder}/include ${current_user}@${tardis_compute_node2_alias}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    print "\nTransferring to: " 0,32;  print "${tardis_compute_node3_alias}" 0,35
    set_color ${default_text_color} ${default_background_color}
    echo -e $REPLY
    scp ${user_home}${rcode_subdir_path}${user_folder}/src ${current_user}@${tardis_compute_node3_alias}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    scp ${user_home}${rcode_subdir_path}${user_folder}/include ${current_user}@${tardis_compute_node3_alias}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    print "\nTransferring to: " 0,32;  print "${tardis_compute_node4_alias}" 0,35
   set_color ${default_text_color} ${default_background_color}
    echo -e $REPLY
    scp ${user_home}${rcode_subdir_path}${user_folder}/src ${current_user}@${tardis_compute_node4_alias}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    scp ${user_home}${rcode_subdir_path}${user_folder}/include ${current_user}@${tardis_compute_node4_alias}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
}
function txrecon()
{   # Process the execution parameters/arguments
    local OPTIND
    node_num_flag='true'
    account=${Baylor_git_account}
    group=${recon_group}
    repo=${Baylor_rcode_git_repo}
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
    
    /ion${home_folder}/ionrecon/pCT_code/Reconstruction/schultze/BaylorICTHUS/pCT_Reconstruction
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
function nvccgen()
{
    usage="$(echo "${FUNCNAME}") [-h] [$1] [$2] -- compile pCT_Reconstruction code with argument #1/#2 used to set architecture/code 

    where:
        -h  show this help text
        $1  architecture (DEFAULT: arch=compute_35)
        $2  code (DEFAULT: code=sm_35)"
    while getopts 'h' opt; do
        case $opt in
            h) echo "${usage}"; return;;
            *) error "Unexpected option ${flag}";;
        esac
    done
    
    #nvcc11="nvcc -std=c++11 -gencode arch=compute_35,code=sm_35 -O3"
    #-std=c++11 -gencode arch=$rcode_compute,code=$rcode_sm
    print_newline
    target_source_code="${tardis_pct_folder}${rcode_subdir_path}${user_folder}${rcode_cu_file}"
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
    usage="$(echo "${FUNCNAME}") [-h] [$1] [$2] -- compile and run pCT_Reconstruction code with argument #1/#2 used to set architecture/code 

    where:
        -h  show this help text
        $1  architecture (DEFAULT: arch=compute_35)
        $2  code (DEFAULT: code=sm_35)"
     while getopts 'h' opt; do
        case $opt in
            h) echo "${usage}"; return;;
            *) error "Unexpected option ${flag}";;
        esac
    done
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
#-------------------------------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
#------------------------------------------------------- Git  ------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
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
function construct_git_clone_addr()
{
    local OPTIND
    account=${pct_collab_git_account}
    repo=${old_rcode_git_repo}
    usage="$(echo "${FUNCNAME}") [-h] [-a <git account>] [-r <git repository>] -- construct GitHub address used to clone the account/repository

    where:
        -h  show this help text
        -a  git account (DEFAULT: ${account})
        -r  git repository (DEFAULT: ${repo})"
    while getopts 'a:r:' opt; do
        case $opt in
            h) echo "${usage}"; return;;
            a) account=${OPTARG};;
            r) repo=${OPTARG};;           
            *) error "Unexpected option ${flag}";;
        esac
    done
    git_clone_addr="${git_clone_addr_base}/${account}/${repo}${git_clone_addr_suffix}"
    REPLY=$git_clone_addr
}
function add_rcode_repo()
{
    local OPTIND
    username="$(id -un)"
    account=${pct_collab_git_account}
    repo=${old_rcode_git_repo}
    usage="$(echo "${FUNCNAME}") [-h] [-u <username>] [-a <git account>] [-r <git repository>] -- add directory and clone GitHub repository code to Tardis node

    where:
        -h  show this help text
        -u  username (DEFAULT: ${username})
        -a  git account (DEFAULT: ${account})
        -r  git repository (DEFAULT: ${repo})"
    while getopts 'hu:a:r:' opt; do
        case $opt in
            h) echo "${usage}"; return;;
            u) username=${OPTARG};;
            a) account=${OPTARG};;
            r) repo=${OPTARG};;           
            *) error "Unexpected option ${flag}";;
        esac
    done
    adding_rcode_path="${tardis_rcode_path}/${username}${git_code_folder}/${account}/"
    construct_git_clone_addr -a $account -r $repo 
    git_clone_addr=$REPLY
    echo $adding_rcode_path
    echo $git_clone_addr
    #mkdir -p ${adding_rcode_path}
    #cd ${adding_rcode_path}   
    #git clone ${git_clone_addr}   
}
function create_recon_user()
{
    usage="$(echo "${FUNCNAME}") [-h] [-u <username>] -- add directory for pCT code to local SSD drive and default GitHub repository

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
function set_rcode()
{
    local OPTIND
    username="$(id -un)"
    account=${pct_collab_git_account}
    repo=${old_rcode_git_repo}
    git_direct='false' 
    branch='master'
    usage="$(echo "${FUNCNAME}") [-h][-G][-g] [-a <git account>] [-r <git repository>] [-b <git branch>] [-u <username>] -- set the git account/repository and branch (optional) to use for the reconstruction code, either the global clone or a clone to the user's code directory

        where:
            -h  show this help text
            -a  git account (DEFAULT: ${account})
            -r  git repository (DEFAULT: ${repo})   
            -b  git branch (DEFAULT: $branch)
            -u  username, if applicable (DEFAULT: $username)
            -G  reconstruction group username flag (DEFAULT: ${username})
            -g  global git code repositories flag (DEFAULT: user git code directories)"
    while getopts 'hu:a:r:b:Gg' opt; do
        case $opt in
            h) echo "${usage}"; return;;
            u) username=${OPTARG};;
            a) account=${OPTARG};;
            r) repo=${OPTARG};;           
            b) branch=${OPTARG};;           
            G) username=${recon_group};;  
            g) git_direct='true';;               
            *) error "Unexpected option ${flag}";;
        esac
    done
    if [[ $git_direct == 'true' ]]
    then
        setting_tardis_rcode_path="${tardis_git_code_path}/${account}/${repo}"
        setting_global_rcode_path="${global_git_code_path}/${account}/${repo}"
    else
        setting_tardis_rcode_path="${tardis_rcode_path}/${username}${git_code_folder}/${account}/${repo}"
        setting_global_rcode_path="${global_rcode_path}/${username}${git_code_folder}/${account}/${repo}"   
    fi
    if [ $HOSTNAME == "kodiak" -o $HOSTNAME == "n130" ]
    then
        cd ${setting_global_rcode_path}
    else
        cd ${setting_tardis_rcode_path}
    fi
    if [[ $branch != 'master' ]]
    then
        git checkout $branch
    fi  
    current_rcode_account="${account}"
    current_rcode_repo="${repo}"
    current_rcode_branch="${branch}"
    if [[ $git_direct == 'true' ]]
    then
        current_rcode_git=$direct_git
        current_set_rcode_git_flag=$direct_git_flag
    else
        current_rcode_git=$user_git
        current_set_rcode_git_flag=''
    fi  
}    
#-------------------------------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
#---------------------------------------------- pCT user/data management  ------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------------------#
function pctusers()
{
    users=$(find /ion/home -maxdepth 1 -type d -printf "%f\n")
    declare -a pct_users
    declare -a sorting_pct_users
    IFS=$'\n'
    set -- $users
    j=2   
    i=0 
    while [ -n "${!j}" ]; do                        
        pct_users[i]="${!j}"
        let i++
        j=$(($j+1)) 
    done
    sorting_pct_users=( ${pct_users[@]} ${other_pct_users[@]} )
    qsort "${sorting_pct_users[@]}"
    PCT_USERS="${qsort_ret[@]}"
    IFS=$DEFAULT_IFS
    #declare -p PCT_USERS
}
function print_users()
{
    print "pCT Users:" 0,32 6,40 underline 
    for i in ${PCT_USERS[@]}
    do
        print $i 0,35 6,40
    done   
}
function login_tasks()
{
    print_info "Login Home" "${login_dir}"
    pctusers
    print_info "Current git Access" "${current_rcode_git}"
    print_info "Current git Account" "${current_rcode_account}"
    print_info "Current git Repository" "${current_rcode_repo}"
    print_info "Current git Branch" "${current_rcode_branch}"
    set_rcode -a "$current_rcode_account" -r "$current_rcode_repo" -b "$current_rcode_branch" $current_set_rcode_git_flag
    color_text "[$(now)]" 0,33 5,49; now_string=$REPLY
    color_text "$PWD" 0,35 5,49; pwd_string=$REPLY
    color_text "${git_branch}${git_dirty}" 0,34 5,49; git_string=$REPLY
    color_text "[${current_user}.${HOSTNAME}/$current_node_alias]" 0,36 5,49; current_user_string=$REPLY
    print "$now_string $pwd_string $git_string" 0,35 6,49
    print "$current_user_string" 0,36 5,49
    print_result "$(ls -a)"
}
function create_user_dirs()
{
    local OPTIND
    path="$PWD"
    permissions='777'
    while getopts 'p:P:' opt; do
        case $opt in
            p) path=${OPTARG};; 
            P) permissions=${OPTARG};;
            *) error "Unexpected option ${flag}";;
        esac
    done
    for i in ${PCT_USERS[@]}
     do
        mkdir -p "${path}/$i"
        chmod $permissions "$i"
     done 
}
function create_tardis_user_dirs()
{
    local OPTIND
    parent_path="$PWD"
    permissions='755'
    verbose_string='false'
    while getopts 'p:P:v' opt; do
        case $opt in
            p) parent_path=${OPTARG};; 
            P) permissions=${OPTARG};;
            v) verbose_string='true';;
            *) error "Unexpected option ${flag}";;
        esac
    done
    for i in ${PCT_USERS[@]}
    do
        if [[ $verbose_string == 'true' ]]; then echo "${parent_path}/$i"; fi
        mkdir -p "${parent_path}/$i"
        chmod $permissions "${parent_path}/$i"
    done 
}
function apply_permission_blocks()
{
    # # restricted permission folders
    # /local/pCT_code/*                                       #$tardis_code_path          
    # /local/pCT_data/*                                       #$tardis_data_path  
    # /local/pCT_data/reconstruction_data/*                   #$tardis_recon_data_path  
    # /local/pCT_data/organized_data/*                        #$tardis_org_data_path  
    blocked_dirs=( $tardis_code_path $tardis_data_path $tardis_recon_data_path $tardis_user_data_path )
    permanent_dir_permissions='755'
    expanding_dir_permissions='775'
    chmod $permanent_dir_permissions $tardis_code_path
    chmod $permanent_dir_permissions $tardis_code_path/*
    chmod $permanent_dir_permissions $tardis_git_code_path/*
    chmod $permanent_dir_permissions $tardis_rcode_path/*
    chmod $permanent_dir_permissions $tardis_pcode_path/*
    
    chmod $permanent_dir_permissions $tardis_data_path
    chmod $permanent_dir_permissions $tardis_data_path/*
    #chmod $permanent_dir_permissions $tardis_recon_data_path 
    chmod $expanding_dir_permissions $tardis_recon_data_path/* 
    #chmod $permanent_dir_permissions $tardis_org_data_path 
    chmod $expanding_dir_permissions $tardis_org_data_path/* 
    chmod $permanent_dir_permissions $tardis_user_data_path/*
    chmod $permanent_dir_permissions $tardis_temp_input_data_path/*
    chmod $permanent_dir_permissions $tardis_temp_output_data_path/*
}
function create_all_tardis_user_dirs()
{
     # #user directories
    # /local/pCT_code/Reconstruction/*                        #tardis_rcode_path
    # /local/pCT_code/Preprocessing/*                         #tardis_pcode_path
    # /local/pCT_data/user_data/*                             #tardis_user_data_path
    # /local/pCT_data/temp_input_data/*                       #tardis_temp_input_data_path
    # /local/pCT_data/reconstruction_data/temp_output_data/*  #tardis_temp_output_data_path
    #tardis_user_dirs=( $tardis_rcode_path $tardis_pcode_path $tardis_user_data_path $tardis_temp_input_data_path $tardis_temp_output_data_path )
    create_tardis_user_dirs -p ${tardis_rcode_path} -P 755
    create_tardis_user_dirs -p ${tardis_pcode_path} -P 755
    create_tardis_user_dirs -p ${tardis_user_data_path} -P 755
    create_tardis_user_dirs -p ${tardis_temp_input_data_path} -P 755
    create_tardis_user_dirs -p ${tardis_temp_output_data_path} -P 755
}
function tardis_default_cloning()
{
    mkdir -p ${tardis_git_clones_dir}
    mkdir -p ${tardis_pct_collab_dir}
    mkdir -p ${tardis_Baylor_dir}
    mkdir -p ${tardis_Blake_dir}
    
    cd ${tardis_pct_collab_dir}
    git clone ${old_rcode_git_clone_addr}
    git clone ${pct_tools_git_clone_addr}
    cd ${tardis_Baylor_dir}
    git clone ${Baylor_rcode_git_clone_addr}
    cd ${tardis_Blake_dir}
    git clone ${Blake_rcode_git_clone_addr}
}
#####################################################################################################################################
#####################################################################################################################################
############################################################ DEVELOPMENT ############################################################
#####################################################################################################################################
#####################################################################################################################################
function add_tardis_data()
{
    local OPTIND
    username=$(id -un)
    unorganized_flag='false'
    verbose_string='false'
    node_number='3'
    organize_first_flag='false'
    username="$(id -un)" 
    current_pwd=$PWD
    data_path=$PWD
    destination=$current_pwd
    data_direction="${projection_link_folder}"
    scan_type_folder="${experimental_data_folder}"
    run_date_folder_prefix=""
    parent_dir="${org_data_path}"
    preprocessed_date=$(current_date)
    recon_date=$(current_date)
    data_direction="${proj_data_link_folder}"
    verbose_flag='false'
    copy_flag='true'
    usage="$(echo "${FUNCNAME}") [-h] [-EGT] [-IO] [-o <object name>] [-r <run date>][-n <run # + tag(s)>] [-d <preprocessed data>] [-D <reconstruction date>] -- construct input or output data path for appropriately organized reconstruction data
    
    where:
        -h  show this help text
        -v  verbose: console output on (DEFAULT: 'off')
        -P  preprocessing data flag (DEFAULT)
        -R  reconstruction data flag (DEFAULT: preprocessing)
        -M  move data (DEFAULT: copy)
        -C  move data (DEFAULT: copy)
        -p  path to data (DEFAULT: current working directory)
        -t  destination path for pre-organized data on Kodiak or unorganized data on Tardis  (DEFAULT: current working directory)
        -F  organize data before transfer (DEFAULT: false)
        -o  object name (REQUIRED)
        -r  run date (REQUIRED)
        -n  run # + tag(s) (REQUIRED)
        -d  preprocessed_date (DEFAULT: ${preprocessed_date} (today))
        -D  reconstruction date, if applicable (DEFAULT: ${recon_date} (today))
        -E  Experimental data flag (DEFAULT)
        -G  GEANT4 data flag 
        -T  TOPAS data flag 
        -I  input data flag
        -O  output data flag (DEFAULT)
        -U  unorganized data flag (DEFAULT: organized)
        -H  organized data heirarchy flag (DEFAULT)
        -N  destination Tardis node number (3-5) (DEFAULT: '3')"
    while getopts 'hvPRMCFUHp:t:o:r:n:d:D:N:EGTIO' opt; do
        case $opt in               
            h) echo "${usage}"; return;;
            v) verbose_flag='true';;
            U) unorganized_flag='true';;
            H) unorganized_flag='false';;            
            P) preprocessing_flag='true';;
            R) preprocessing_flag='false';;
            M) copy_flag='false';;
            C) copy_flag='true';;
            F) organize_first_flag='true';;
            p) data_path=${OPTARG};;
            t) destination=${OPTARG};;
            o) object=${OPTARG};;
            r) run_date=${OPTARG};;
            n) run_number=${OPTARG};;
            d) preprocessed_date=${OPTARG};;
            D) recon_date=${OPTARG};;
            E) scan_type_folder="${experimental_data_folder}";;
            G) run_date_folder_prefix="${GEANT4_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;
            T) run_date_folder_prefix="${TOPAS_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;         
            I) data_direction="${raw_data_link_folder}";;
            O) data_direction="${proj_data_link_folder}";;
            N) node_number=${OPTARG};;
            *) error "Unexpected option ${flag}";;
        esac
    done    
    node_address="ecsn00${node_number}"
    user_unorganized_path="${tardis_user_data_path}/${username}"    
    if [[ $unorganized_flag == 'true' ]]
    then
        if [[ $organize_first_flag == 'true' ]]
        then
            print "Unorganized data being organized first and then copied to Tardis" 0,32 6,40
            run_date_folder="${run_date_folder_prefix}${run_date}"          # Extract run date from last directory in the path
            if [[ $preprocessing_flag == 'true' ]]
            then
                input_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${raw_data_link_folder}"
                output_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${proj_data_link_folder}/${preprocessed_date}"    
            else
                input_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${proj_data_link_folder}/${preprocessed_date}"
                output_path="${object}${scan_type_folder}/${run_date_folder}/${run_number}${proj_data_link_folder}/${preprocessed_date}/${recon_date}"      
            fi
            #echo "${input_path}"
            #echo "${output_path}"
            if [[ $data_direction == "${raw_data_link_folder}" ]]; then hierarchy_path="${input_path}"
            elif [[ $data_direction == "${proj_data_link_folder}" ]]; then hierarchy_path="${output_path}"; fi
            dest_path="${destination}/${hierarchy_path}"
            node_path="${tardis_org_data_path}/${hierarchy_path}"    
            color_text " ${dest_path}"     0,33 6,40; dest_path_string=$REPLY
            color_text " ${node_path}"     0,33 6,40; node_path_string=$REPLY
            print "Organized path on Kodiak:$dest_path_string" 0,32 6,40 underline
            print "Destination path on Tardis:$node_path_string" 0,32 6,40 underline   
            #echo "${dest_path}"
            mkdir -p $dest_path
            if [[ $copy_flag == 'true' ]]; then find ${data_path}/* -maxdepth 1 -type f -exec cp -vt $dest_path {} + #
            else mv ${data_path}/* $dest_path; fi 
            ssh $node_address "mkdir -p $node_path"
            scp -rCp -c blowfish $dest_path/* "$node_address:$node_path"
            #REPLY="${destination}${dest_path}"            
        else
            print "Unorganized data being copied to /local/pCT_data/user_data/<username> on Tardis" 0,32 6,40
            dest_path="${data_path}"
            node_path="${user_unorganized_path}/${destination}"    
            color_text " ${dest_path}"     0,33 6,40; dest_path_string=$REPLY
            color_text " ${node_path}"     0,33 6,40; node_path_string=$REPLY
            print "Organized path on Kodiak:$dest_path_string" 0,32 6,40 underline
            print "Destination path on Tardis:$node_path_string" 0,32 6,40 underline   
            ssh $node_address "mkdir -p $node_path"
            scp -rCp -c blowfish $dest_path/* "$node_address:$node_path"
            #REPLY="${destination}${dest_path}"    
        fi
    else
        print "Organized data being copied directly to Tardis" 0,32 6,40
        dest_path="${data_path}"
        node_path="${tardis_user_data_path}/${hierarchy_path}"    
        color_text " ${dest_path}"     0,33 6,40; dest_path_string=$REPLY
        color_text " ${node_path}"     0,33 6,40; node_path_string=$REPLY
        print "Organized path on Kodiak:$dest_path_string" 0,32 6,40 underline
        print "Destination path on Tardis:$node_path_string" 0,32 6,40 underline   
        ssh $node_address "mkdir -p $node_path"
        scp -rCp -c blowfish $dest_path/* "$node_address:$node_path"
        #REPLY="$destination${dest_path}" 
    fi  
}