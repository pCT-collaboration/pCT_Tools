#!/bin/bash
###################################################################################################
########################## Define text printing formatting codes/setting ##########################
###################################################################################################
console_width=90
separator_char="-"
default_separator_char="-"
default_background_color="6,40"
default_text_color="0,37"
reset_color="\e[0;37;6;40m"
FMTRESET="\e[0m"
FMTDEFAULT="\e[0;37;6;40m"
OPEN_COLOR_ESCAPE_SEQ="\e["         
CLOSE_COLOR_ESCAPE_SEQ="\e[m"       
NoColor="\e[0m"
Black="\e[0;30m"
DarkGray="\e[1;30m"
Red="\e[0;31m"
LightRed="\e[1;31m"
Green="\e[0;32m"
LightGreen="\e[1;32m"
Brown="\e[1;33m"
Yellow="\e[0;33m"
Blue="\e[0;34m"
LightBlue="\e[1;34m"
Purple="\e[0;35m"
LightPurple="\e[1;35m"
Cyan="\e[0;36m"
LightCyan="\e[1;36m"
LightGray="\e[0;37m"
White="\e[1;37m"
GRAY_BACKGROUND="\e[5;40"
BLACK_BACKGROUND="\e[40"
LIGHT_RED_BACKGROUND="\e[5;41"
RED_BACKGROUND="\e[6;41"
LIGHT_GREEN_BACKGROUND="\e[5;42"    
GREEN_BACKGROUND="\e[6;42"      
BROWN_BACKGROUND="\e[5;43"          
YELLOW_BACKGROUND="\e[6;43"         
LIGHT_BLUE_BACKGROUND="\e[5;44" 
BLUE_BACKGROUND="\e[6;44"   
LIGHT_PURPLE_BACKGROUND="\e[5;45"           
PURPLE_BACKGROUND="\e[6;45"         
LIGHT_CYAN_BACKGROUND="\e[5;46"         
CYAN_BACKGROUND="\e[6;46"           
WHITE_BACKGROUND="\e[5;47"          
LIGHT_GRAY_BACKGROUND="\e[6;47"     
UNDERLINE_TEXT="\e[;4"          
DONT_UNDERLINE_TEXT=""                  
###################################################################################################
######################### Prompt Assignments: Unicode Symbol Definitions ##########################
###################################################################################################
cdate='\D{%T %Z (%a) %m-%d-%Y}'
git_query="${LightBlue}${git_branch}${git_dirty}"
#arrow_prompt=$(echo -e '\u2794\u279B\u279C\u279D\u279E\u27A4\u27A5')
ARROW_KEYCHARS="-> "
ARROWHEAD=$(echo -e '\u27A4') #\xe2\x9e\xa4
ARROWHEAD_EQUIL=$(echo -e '\u2B9E') # U+2B9E    ⮞   e2 ae 9e    BLACK RIGHTWARDS EQUILATERAL ARROWHEAD
ARROW_HOOKED=$(echo -e '\u21AA') ##↪    \xe2\x86\xaa    RIGHTWARDS ARROW WITH HOOK
ARROW_DASHED=$(echo -e '\u21E2') #⇢ \xe2\x87\xa2    RIGHTWARDS DASHED ARROW
ARROW_OPEN=$(echo -e '\u21FE') #⇾   \xe2\x87\xbe    RIGHTWARDS OPEN-HEADED ARROW
ARROW_HOLLOW=$(echo -e '\u27A9') # U+27A9   ➩   e2 9e a9    RIGHT-SHADED WHITE RIGHTWARDS ARROW
ARROW_BENT=$(echo -e '\u2BA1') #⮡   \xe2\xae\xa1    DOWNWARDS TRIANGLE-HEADED ARROW WITH LONG TIP RIGHTWARDS
ARROW_WIDE=$(echo -e '\u2794') ## U+2794    ➔   e2 9e 94    HEAVY WIDE-HEADED RIGHTWARDS ARROW
ARROW_WIDE_ROUNDED=$(echo -e '\u279C') # U+279C ➜   e2 9e 9c    HEAVY ROUND-TIPPED RIGHTWARDS ARROW
# echo -e $ARROWHEAD$ARROWHEAD_EQUIL$ARROW_HOOKED$ARROW_DASHED$ARROW_OPEN$ARROW_HOLLOW$ARROW_BENT$ARROW_WIDE$ARROW_WIDE_ROUNDED
###################################################################################################
################################ Setting current data/code paths ##################################
###################################################################################################
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
########### User names of collaborators, including internal Baylor student user names #############
###################################################################################################
master="master"
other_pct_users=("penfolds" "plautzt" "piersimonip" "bashkirovv" "dedesg" "zatserkl" "johnsonr" "karonisn" "dout" "rowlands")
all_pct_users=("schultze" "karbasip" "schulter" "penfolds" "plautzt" "piersimonip" "bashkirovv" "dedesg" "zatserkl" "johnsonr" "karonisn" "dout" "rowlands")
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
load_pct_functions_script="load_pct_functions.sh"
###################################################################################################
############### Define variables for git commands, accounts, repos, branches, etc. ################
###################################################################################################

git_clone_addr_base="git@github.com:"
git_clone_addr_suffix=".git"
#----------------- pCT-collaboration account -------------------#
pct_collab_git_account="pCT-collaboration"
pct_collab_rcode_git_repo="Kodiak-Reconstruction"
pct_tools_git_repo="pCT_Tools"
pcode_git_repo="Preprocessing"
old_rcode_git_repo="pct-recon-copy"
geant4_git_repo="Geant4"
#-------------------- BaylorICTHUS account ---------------------#
Baylor_git_account="BaylorICTHUS"
Baylor_rcode_git_repo="pCT_Reconstruction"
pct_configs_path=pct_configs/
pct_jobs_path=pct_jobs/
pct_configs_basename=pct_config
pct_jobs_basename=pct_job
cfggen_fname=pct_cfggen.sh
cfgdefs_fname=pct_cfgdef.sh
params_fname=pct_params.txt
testparams_fname=pct_testparams.txt
#------------------- BlakeSchultze account ------------------------#
Blake_git_account="BlakeSchultze"
Blake_rcode_git_repo="pCT_Reconstruction"
Blake_doc_git_repo="pCT_Documentation"
# filename/path to script loading pCT user functions/shortcuts
load_pct_functions_script="load_pct_functions.sh"
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
#-------- Kodiak user code/data paths ------------#
user_inc_data_path="${incoming_path}${user_folder}"                            #
user_stage_data_path="${staging_path}${user_folder}"                             #
user_data_path="${user_home}${pct_data_folder}"                             #
user_org_data_path="${user_home}${pct_data_folder}${org_data_folder}"            #
user_recon_data_path="${user_home}${pct_data_folder}${recon_data_folder}"        #
user_code_path="${user_home}${pct_code_folder}"                            #
user_pcode_path="${user_home}${pcode_subdir_path}${user_folder}"            #
user_rcode_path="${user_home}${rcode_subdir_path}${user_folder}"            #
#-------- Kodiak group code/data paths ------------#
recon_group_home="${pct_home}/${recon_group}"                                  #
rgroup_data_path="${recon_group_home}${pct_data_folder}"                       #
rgroup_org_data_path="${recon_group_home}${pct_data_folder}${org_data_folder}"     #
rgroup_recon_data_path="${recon_group_home}${pct_data_folder}${recon_data_folder}"  #
rgroup_code_path="${recon_group_home}${pct_code_folder}"                       #
rgroup_pcode_path="${recon_group_home}${pcode_subdir_path}${user_folder}"      #
rgroup_rcode_path="${recon_group_home}${rcode_subdir_path}${user_folder}"      #
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
#################################################################################################
############################ Setting Kodiak/Tardis/GitHub code paths ##############################
###################################################################################################
phantom_IDs=( "Emp" "Empty" "CalEmp" "Calib" "Rod""Water" "Sensitom" "LinePair" ""Dose16" ""CIRSPHP1" "LMUDECT" "CIRSEdge" "Birks" )
phantom_names=( "Empty" "Calibration" "Calibration" "Rod" "Water" "CTP404_Sensitom" "CTP528_Linepair" "CTP515_Low_Contrast" "CTP554_Dose" "HN715_PedHead_0" "HN715_PedHead_1" "LMU_DECT" "CIRS_Edge" "Birks")
###################################################################################################
############### pCT module loading and CUDA info for Kodiak/Tardis gcc/nvcc usage #################
###################################################################################################
#-------------------------------------------------------------------------------------------------#
#kodiak_modules=("purge" "unload gcc" "load gcc/4.8.4" "load geant4/10.1.1" "load openmpi/1.8.1" "load root" )
kodiak_modules=("load geant4/10.1.1" "load cuda80/blas/8.0.61" "load cuda80/fft/8.0.61" "load cuda80/nsight/8.0.61" "load cuda80/profiler/8.0.61" "load cuda80/toolkit/8.0.61" "load matlab/2017a")
#-------------------------------------------------------------------------------------------------#
tardis_modules_old=("purge" "load cmake/3.2" "load java/1.8.0" "load emacs/24.5" "load geant4/10.1.1" "load git/2.4.3" "load make/4.1" "load matlab/2015a" "load perl/5.20" "load python/3.4" "load root" "load ruby/2.2.2" "load blacs/openmpi/gcc/64/1.1patch03" "load blacs/openmpi/open64/64/1.1patch03" "load blas/gcc/64/3.5.0" "load blas/open64/64/3.5.0" "load fftw3/openmpi/gcc/64/3.3.4" "load fftw3/openmpi/open64/64/3.3.4" "load lapack/gcc/64/3.5.0" "load lapack/open64/64/3.5.0" "load mpich/ge/gcc/64/3.1.4" "load mpich/ge/open64/64/3.1.4" "load mpiexec/0.84_432" "load mvapich2/1.9-gcc-4.9.2" "load mvapich2/gcc/64/2.1" "load mvapich2/open64/64/2.1" "load openblas/dynamic/0.2.14" "load openmpi/gcc/64/1.8.5" "load openmpi/open64/64/1.8.5" "load scalapack/gcc/64/1.8.0" "load scalapack/open64/64/1.8.0")
#-------------------------------------------------------------------------------------------------#
tardis_modules_less_old=("purge" "load cmake/3.2" "load java/1.8.0" "load emacs/24.5" "load geant4/10.1.1" "load git/2.4.3" "load make/4.1" "load matlab/2015a" "load perl/5.20" "load python/3.4" "load root" "load ruby/2.2.2" "load blacs/openmpi/gcc/64/1.1patch03" "load blacs/openmpi/open64/64/1.1patch03" "load blas/gcc/64/3.6.0" "load blas/open64/64/3.6.0" "load fftw3/openmpi/gcc/64/3.3.4" "load fftw3/openmpi/open64/64/3.3.4" "load lapack/gcc/64/3.6.0" "load lapack/open64/64/3.6.0" "load mpich/ge/gcc/64/3.2" "load mpich/ge/open64/64/3.2" "load mpiexec/0.84_432" "load mvapich2/1.9-gcc-4.9.2" "load mvapich2/gcc/64/2.2b" "load mvapich2/open64/64/2.2b" "load openblas/dynamic/0.2.15" "load openmpi/gcc/64/1.10.1" "load openmpi/open64/64/1.10.1" "load scalapack/mvapich2/gcc/64/2.0.2" "load scalapack/openmpi/gcc/64/2.0.2")
#-------------------------------------------------------------------------------------------------#
tardis_modules=( "load geant4/10.1.1" "load matlab/2016a" "load python/2.7.10" "load blacs/openmpi/gcc/64/1.1patch03" "load blas/gcc/64/3.6.0" "load lapack/gcc/64/3.6.0" "load openmpi/gcc/64/1.10.1" "load openmpi/open64/64/1.10.1" "load scalapack/openmpi/gcc/64/2.0.2")
###################################################################################################
################################ Setting Kodiak/Tardis data paths #################################
###################################################################################################
user_current_data_path="${user_data_path}${current_phantom}${experimental_data_folder}${dindir}"
#########rgroup_current_data_path="${rgroup_recon_data_path}${recon_data_folder}"
tardis_current_data_path="${tardis_org_data_path}${dindir}"
user_current_recon_data_path="${user_recon_data_path}${doutdir}"
########rgroup_current_recon_data_path="${rgroup_recon_data_path}${recon_data_folder}"
tardis_current_recon_data_path="${tardis_recon_data_path}${doutdir}"
###################################################################################################
############################ Setting Kodiak/Tardis/GitHub code paths ##############################
###################################################################################################
#----------- Common code dir/subdir paths ---------------#
pct_code_path="${pct_folder}${pct_code_folder}"
pcode_subdir_path=${pct_code_folder}${pcode_folder}
rcode_subdir_path=${pct_code_folder}${rcode_folder}
git_code_subdir_path=${pct_code_folder}${git_code_folder}
Baylor_rcode_git_repo_subdir_path="${Baylor_git_account}/${Baylor_rcode_git_repo}"
pct_collab_rcode_git_repo_subdir_path="${pct_collab_git_account}/${pct_collab_rcode_git_repo}"
Blake_rcode_git_repo_subdir_path="${Blake_git_account}/${Blake_rcode_git_repo}"
old_rcode_git_repo_subdir_path="${pct_collab_git_account}/${old_rcode_git_repo}"
pct_tools_git_repo_subdir_path="${pct_collab_git_account}/${pct_tools_git_repo}"
#--------------- Kodiak code paths -------------------#
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
global_pct_collab_rcode_git_repo_path="${global_git_code_path}/${pct_collab_rcode_git_repo_subdir_path}"
global_Blake_rcode_git_repo_path="${global_git_code_path}/${Blake_rcode_git_repo_subdir_path}"
#--------------- Tardis code paths -------------------#
tardis_code_path="${tardis_pct_folder}${pct_code_folder}"
tardis_pcode_path=${tardis_pct_folder}${pcode_subdir_path}
tardis_rcode_path=${tardis_pct_folder}${rcode_subdir_path}
tardis_git_clones_dir=${tardis_code_path}${git_code_folder}
tardis_git_code_path=${tardis_git_clones_dir}
tardis_pct_collab_dir=${tardis_git_clones_dir}/${pct_collab_git_account}
tardis_Baylor_dir=${tardis_git_clones_dir}/${Baylor_git_account}
tardis_Blake_dir=${tardis_git_clones_dir}/${Blake_git_account}
tardis_pct_tools_git_repo_path="${tardis_git_code_path}/${pct_tools_git_repo_subdir_path}"
tardis_old_rcode_git_repo_path="${tardis_git_code_path}/${old_rcode_git_repo_subdir_path}"
tardis_Baylor_rcode_git_repo_path="${tardis_git_code_path}/${Baylor_rcode_git_repo_subdir_path}"
tardis_pct_collab_rcode_git_repo_path="${tardis_git_code_path}/${pct_collab_rcode_git_repo_subdir_path}"
tardis_Blake_rcode_git_repo_path="${tardis_git_code_path}/${Blake_rcode_git_repo_subdir_path}"
#--------------- git repo cloning addresses -------------------#
# git clone arguments for primary git repositories
pct_tools_git_clone_addr="${git_clone_addr_base}${pct_tools_git_repo_subdir_path}${git_clone_addr_suffix}"
old_rcode_git_clone_addr="${git_clone_addr_base}${old_rcode_git_repo_subdir_path}${git_clone_addr_suffix}"
Baylor_rcode_git_clone_addr="${git_clone_addr_base}/${Baylor_rcode_git_repo_subdir_path}${git_clone_addr_suffix}"
pct_collab_rcode_git_clone_addr="${git_clone_addr_base}/${pct_collab_rcode_git_repo_subdir_path}${git_clone_addr_suffix}"
Blake_rcode_git_clone_addr="${git_clone_addr_base}/${Blake_rcode_git_repo_subdir_path}${git_clone_addr_suffix}"
#--------------- git repo cloning addresses -------------------#
# filename/path to script loading pCT user functions/shortcuts
pct_functions_git_repo_path="${global_git_code_path}/${pct_tools_git_repo_subdir_path}/bash"
pct_functions_script_path="${global_git_code_path}/${pct_tools_git_repo_subdir_path}/bash/${load_pct_functions_script}"
###################################################################################################
############################# Code/data info storage array definitions ############################
###################################################################################################
#--------------- pCT data storage directory hierarchy arrays -------------------#
pct_data_subdirs=( $org_data_folder $raw_data_folder $pre_data_folder $proj_data_folder $recon_data_folder )
pct_code_subdirs=( $git_code_folder $rcode_folder $pcode_folder )
phantom_subdirs=( $experimental_data_folder $simulated_data_folder $ref_images_folder )
run_number_subdirs=( $raw_data_link_folder $proj_data_link_folder )
ion_subdirs=( $incoming_folder $staging_folder $pct_code_folder $pct_data_folder )
#--------------- git account names/repos arrays -------------------#
git_accounts=( $pct_collab_git_account $Baylor_git_account $Blake_git_account )
pct_collab_repos=( $pct_collab_rcode_git_repo $pct_tools_git_repo $pcode_git_repo $old_rcode_git_repo $geant4_git_repo )
Baylor_repos=( $Baylor_rcode_git_repo )
Blake_repos=( $Blake_rcode_git_repo $Blake_doc_git_repo )
#--------------- data path arrays -------------------#
pct_data_paths=( $org_data_path $raw_data_path $pre_data_path $proj_data_path $recon_data_path )
pct_code_paths=( $global_git_code_path $global_pcode_path $global_rcode_path )
ion_paths=( $incoming_path $staging_path $pct_code_path $pct_data_path )
tardis_user_paths=( $tardis_rcode_path $tardis_pcode_path $tardis_user_data_path $tardis_temp_input_data_path $tardis_temp_output_data_path )
###################################################################################################
################################ Setting current data/code paths ##################################
###################################################################################################
#--------------- Repo selection/interaction: nicknames and selection controls -------------------#
user_git='user'
direct_git='direct'
direct_git_flag='-g'
Baylor_rcode="Baylor_rcode"
pct_collab_rcode="pct_collab_rcode"
Blake_rcode="Blake_rcode"
old_rcode="old_rcode"
#--------------- Set current reconstruction source git account/repo/branch   -------------------#
if [[ "$current_rcode" == "$Baylor_rcode" ]] # BaylorICTHUS/pCT_Reconstruction
then
    current_rcode_account="${Baylor_git_account}"
    current_rcode_repo="${Baylor_rcode_git_repo}"
    current_rcode_branch="single_GPU"
elif [[ "$current_rcode" == "$pct_collab_rcode" ]] # pCT-collaboration/Kodiak-Reconstruction
then
    current_rcode_account="${pct_collab_git_account}"
    current_rcode_repo="${pct_collab_rcode_git_repo}"
    current_rcode_branch="master"
elif [[ "$current_rcode" == "$Blake_rcode" ]] # BlakeSchultze/pCT_Reconstruction
then
    current_rcode_account="${Blake_git_account}"
    current_rcode_repo="${Blake_rcode_git_repo}"
    current_rcode_branch="development"
elif [[ "$current_rcode" == "$old_rcode" ]] # pCT-collaboration/pct_recon_copy
then
    current_rcode_account="${pct_collab_git_account}"
    current_rcode_repo="${old_rcode_git_repo}"
    current_rcode_branch="master"
else
    current_rcode_account="${Baylor_git_account}"
    current_rcode_repo="${Baylor_rcode_git_repo}"
    current_rcode_branch="single_GPU"
fi
#--------------- Set git repo used to shared clone or personal user clone -------------------#
if [[ $current_rcode_git == $direct_git ]]
then
    current_set_rcode_git_flag=$direct_git_flag
else
    current_set_rcode_git_flag=''
fi
#--------------- Set current Kodiak reconstruction code source paths -------------------#
# /ion/pCT_code/[Reconstruction/<user:group>/]git/<git account>/<git repo>/
current_global_rcode_path="${global_git_code_path}/${current_rcode_account}/${current_rcode_repo}"
current_global_git_rcode_path=${current_global_rcode_path}
current_global_user_rcode_path="${global_rcode_path}/${username}${git_code_folder}/${current_rcode_account}/${current_rcode_repo}"
current_global_group_rcode_path="${global_rcode_path}/${recon_group}${git_code_folder}/${current_rcode_account}/${current_rcode_repo}"
#--------------- Set current Tardis reconstruction code source paths -------------------#
# /local/pCT_code/[Reconstruction/<user:group>/]git/<git account>/<git repo>/
current_tardis_rcode_path="${tardis_git_code_path}/${current_rcode_account}/${current_rcode_repo}"
current_tardis_git_rcode_path=${current_tardis_rcode_path}
current_tardis_user_rcode_path="${tardis_rcode_path}/${username}${git_code_folder}/${current_rcode_account}/${current_rcode_repo}"
current_tardis_group_rcode_path="${tardis_rcode_path}/${recon_group}${git_code_folder}/${current_rcode_account}/${current_rcode_repo}"
#--------------- Set current Kodiak/Tardis preprocessing code source paths -------------------#
current_pcode_account="${pct_collab_git_account}"
current_pcode_repo="${pcode_git_repo}"