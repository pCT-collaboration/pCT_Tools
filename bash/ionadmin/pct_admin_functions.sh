#!/bin/bash

. /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/load_pct_functions.sh
#. /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/pct_user_script.sh

username=$(id -un)
admin_users=( "schultze" "sittonb" "karbasip" "schubertk" "cair" )
array_member_test $username "${admin_users[@]}"
if ! array_member_test $username "${admin_users[@]}" 
then 
    echo "ERROR: You must be an approved pCT administrator to access these tools"
    exit
fi

print_section "Loading bash functions useful to pCT administrators for user/code/data  management"  1,33 5,40
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
    set_rcode -a "$current_rcode_account" -r "$current_rcode_repo" -c "$current_rcode_branch" $current_set_rcode_git_flag
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
function mkpdir()
{
    local OPTIND
    mkdir_opts=''
    mkdir_opts_string=''
    chmod_opts=''
    chmod_opts_string=''
    verbose_string='true'
    parent_dirs='false'
    recurse_perms='false'
    dir_arg=$(expr $# - 1)
    perms_arg=$(expr $#)
    dir="${!dir_arg}"
    chmod_dir=${dir}                                   
    full_dir=$dir
    perms="${!perms_arg}"
    mkdir_statement="Creating directory /${dir}"
    chmod_statement="Changing permissions of /$dir "

    usage="Usage: mkpdir [OPTION(S)] DIRECTORY NNN
    Create DIRECTORY and set its permissions to permission code NNN

    where OPTION(S) are:
        -h  show this help text
        -p  make parent directories as needed (no error if existing)
        -r  change permissions of files and directories recursively
        -R  change permissions of files and directories recursively
        -s silence status/progress printing, i.e. turn off 'verbose' command options"
    
    for arg in "$@"; do
        shift
        case "$arg" in
            "--parents")    set -- "$@" "-p" ;;
            "--recursive")  set -- "$@" "-r" ;;
            "--silent")     set -- "$@" "-s" ;;
            "--help")       set -- "$@" "-h" ;;
            *)              set -- "$@" "$arg"
        esac
    done
    
    while getopts 'prRsh' opt; do
        case $opt in
            p) parent_dirs='true'; mkdir_opts="${mkdir_opts}p";;
            r) recurse_perms='true'; chmod_opts="${chmod_opts}"; chmod_dir=${dir%%/*};;
            R) recurse_perms='true'; chmod_opts="${chmod_opts}"; chmod_dir=${dir%%/*};;
            s) verbose_string='false';;
            h) echo "$usage";;
            *) error "Unexpected option ${flag}";;
        esac
    done
    if ( $parent_dirs ); then mkdir_statement="${mkdir_statement} and any missing parents"; fi
    if ( $recurse_perms ); then chmod_statement="Recursively changing permissions of /$dir and all files/directories within"; fi
    if ( $verbose_string ); then mkdir_opts="${mkdir_opts}v"; chmod_opts="${chmod_opts}v"; fi
    if [[ ${#mkdir_opts} -gt 0 ]]; then mkdir_opts_string="-${mkdir_opts}"; fi
    if [[ ${#chmod_opts} -gt 0 ]]; then chmod_opts_string="-${chmod_opts}"; fi
    
    if ( $verbose_string ); then echo "$mkdir_statement"; echo "$chmod_statement"; fi
    mkdir $mkdir_opts_string $dir
    
    if ( $recurse_perms )
    then 
        chmod_dir=""                                                # Reset chmod target directory to empty string
        folders=(${full_dir//// })
        for folder in ${folders[@]}
        do
            chmod_dir="${chmod_dir}${folder}/"                        # Append token to run # directory name
            echo "folder=${folder}"      # Notify user of current chmod action
            echo "chmod_dir=${chmod_dir}"      # Notify user of current chmod action
            chmod $chmod_opts_string $perms $chmod_dir              # Apply permissions to j-th folder along ${full_dir} path
        done
    else
        chmod $chmod_opts_string $perms $chmod_dir  
    fi
}
function ifs_split()
{
    local OPTIND
    OIFS=$IFS                       # Save default 'IFS' value before changing so it can restored 
    IFS=$1                         # Delimiter for splitting path into its directory names   
    set -- "$2"
    IFS=$OIFS                       # Restore 'IFS' to its default value
}
function init_tardis_node()
{
    # /local/pCT_code/                                      #tardis_code_path
    # /local/pCT_code/git/                                  #tardis_git_clones_dir
    # /local/pCT_code/git/BaylorICTHUS/                     #tardis_Baylor_dir
    # /local/pCT_code/git/BaylorICTHUS/pCT_Reconstruction   #tardis_Baylor_rcode_git_repo_path
    
    # /local/pCT_data/                                      #tardis_data_path
    # /local/pCT_data/user_data/                            #tardis_user_data_path
    # /local/pCT_data/reconstruction_data/                  #tardis_recon_data_path
    # /local/pCT_data/organized_data/                       #tardis_org_data_path
    
    mkpdir -p ${tardis_code_path} 755
    mkpdir -p ${tardis_git_clones_dir} 755
    mkpdir -p ${tardis_Baylor_dir} 755
    mkpdir -p ${tardis_Baylor_rcode_git_repo_path} 755
    
    mkpdir -p ${tardis_data_path} 755
    mkpdir -p ${tardis_user_data_path} 755
    mkpdir -p ${tardis_recon_data_path} 755
    mkpdir -p ${tardis_org_data_path} 755
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

