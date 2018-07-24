#!/bin/bash
###################################################################################################
###################################################################################################
###################################### Function definitions #######################################
###################################################################################################
###################################################################################################
#-------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------#
#------------------------------ General helper/utility functions ---------------------------------#
#-------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------#
alias host=$(hostname)
alias echon='echo -n "${1}"'
alias scriptname='basename -- $0'
alias lsmod="ls -AhLlt --color --file-type --author --group-directories-first"
alias lsctime="ls -AhLlc --color --file-type --author --group-directories-first"
alias lsaccess="ls -AhLlc --color --file-type --author --group-directories-first"
alias lstype="ls -AhLlX --color --file-type --author --group-directories-first"
alias lst="ls -AhLlX --color --file-type --author --group-directories-first"
alias lssep="ls -AhLl1 --color --file-type --author --group-directories-first"
alias contents="tree -dluDC"
alias cpdir="cp -apRv"
#alias cpo="cp -vnpr /src/* /dest $1 $2"
alias cpo="cp -vr --preserve=all $1 $2"
alias cpn="cp -vrn --preserve=all $1 $2"
alias cpnew="cp -v --preserve=all -n $1 $2"
alias rsynco="rsync -aEHzvhI --progress $1 $2"
alias rsyncn="rsync -aEHzvh --progress --size-only $1 $2"
#alias rsynco="rsync -aEHzvhI --progress --compress $1 $2"
#alias rsyncn="rsync -aEHzvhI --progress --compress --size-only $1 $2"
alias rmf='rm -rf $1'
#alias deldir="rm -rf"
alias deldir='rmdir -v --ignore-fail-on-non-empty $1'
alias qstatu='qstat -t -u $username'
alias qdelu='qselect -u $username | xargs qdel'
#-------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------#
alias nvcc11="nvcc -std=c++11 -gencode arch=${rcode_compute},code=${rcode_sm} ${rcode_flags}"
#alias evaltabs='$(echo "$1" | expand)'
alias tabsconv='eval echo \"\${$1}\" | expand'
alias owner='stat -c '%U''
alias group='stat -c '%G''
alias ownergroup='stat -c '%U':'%G' '
alias userfns='compgen -A function | grep "^[a-z]\+" | grep -vE "^dequote|^quote|^in_array"'
alias fns='compgen -A function'
alias usernicks='compgen -a'
alias uservars='compgen -v'
alias usernames='compgen -u'
alias defof='declare -f'
alias findfn='compgen -A function | grep'
alias findal='compgen -a | grep'
alias finddefof='declare -f|grep'
alias getpbsnodelist='pbsnodes -a | grep -v = | sed '/^\s*$/d'| sort -d'
#for fn in $(compgen -A function |grep tx | tr '\n' ' ');do echo "it=$fn"; done
#for fn in $(declare -F |grep tx | sed -r 's/^declare -f//'| tr '\n' ' ');do declare -f "$fn"; done
#compgen -u
# declare -F|grep tx
# which rm
# whereis rm
# builtin
# alias [-p]
 # : [arguments]
# typeset -F
# type function_name
# compgen -a -A function
# set | grep " ()"
# command ls
#*************************************************************************************************#
#*************************************************************************************************#
#****************************** General helper/utility functions *********************************#
#*************************************************************************************************#
#*************************************************************************************************#
#-------------------------------------------------------------------------------------------------#
#-------------------- General bash terminal operations: assignment/execution ---------------------#
#-------------------------------------------------------------------------------------------------#
function now() { date +"%T %Z (%a) %m-%d-%Y"; }
function current_date() { date +"%y-%m-%d"; }
function returnval() { eval "$@" && { echo "${TRUE_VAL}"; } || { echo "${FALSE_VAL}"; }; }
#function returnval() { $1 && { echo "${TRUE_VAL}"; } || { echo "${FALSE_VAL}"; }; }
#function returnval() { $1; echo $?; }
function refvar_assign() { if [[ -n $1 ]]; then eval $1=\"\${$2}\"; fi; }
#-------------------------------------------------------------------------------------------------#
function optcount()
{ 
    local OPTIND
    for arg in "$@"; do
        shift
        case "$arg" in
            "--reset")      set -- "$@" "-r" ;;
            *)              set -- "$@" "$arg"
        esac
    done
    while getopts 'r' opt; do
        case $opt in
            r) OPTCOUNT=0; shift;;
            *) error "Unexpected option ${flag}";;
        esac
    done
    export OPTCOUNT=$(($OPTCOUNT + $1))
}
#-------------------------------------------------------------------------------------------------#
#----------------------------- bash numeric operations/manipulations -----------------------------#
#-------------------------------------------------------------------------------------------------#
function dec2int() { echo "scale=0; $@/1" | bc ; }
#-------------------------------------------------------------------------------------------------#
function is_integer()
{
    re='^[0-9]+$'
    if [[ $1 =~ $re ]]; then return 0
    else return 1; fi
}
#-------------------------------------------------------------------------------------------------#
#------------------------------ bash string operations/manipulations -----------------------------#
#-------------------------------------------------------------------------------------------------#
function evaltabs() { eval echo \"\${$1}\" | expand; }
function charrep() { printf '%*s' "$2" | tr ' ' "$1" ; }
function char_matches() { num_occurrences=$(grep -o "$2" <<< "$1" | wc -l); REPLY=$num_occurrences; }
function cutif_prefix() { echo $1 | eval sed -r 's/^"$2"\(.*\)/\\1/'; }  
function cutif_suffix() { echo $1 | eval sed -r 's/\(.*\)"$2"$/\\1/'; }
#-------------------------------------------------------------------------------------------------#
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
#----------------------------------------------------------------------------------------------------#
#----------------------------------- File/Directory Path Manipulation -----------------------------------#
#--------------------------------------------------------------------------------------------------------#
function mcd () { mkdir -p $1; cd $1; }
function dir_sizes() { du -sh *; }
#--------------------------------------------------------------------------------------------------------#
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
function numbered_dirs_orig()
{
    local OPTIND
    local echo_on=$FALSE
    local newending=''
    for arg in "$@"; do
        shift
        case "$arg" in
            --print*=*)                       set -- "$@" "-p ${arg#*=}";;
            --renum*=*|--change*=*|--chg*=*)  set -- "$@" "-r ${arg#*=}";;
            --rem*=*|--del*=*)                set -- "$@" "-d ${arg#*=}";;
            *)                                set -- "$@" "$arg";;
        esac
    done
    while getopts 'p:d:r:' opt; do
        case $opt in
            d) oldending="_${OPTARG}"; newending='';;
            r) oldending="_${OPTARG//:*/}"; newending="_${OPTARG#*:}";;
            p) oldending="_${OPTARG}"; newending="_${OPTARG}"; echo_on=$TRUE;;
            *) error "Unexpected option ${flag}";;
        esac
    done
    shift $(( OPTIND - 1 ))
    local num_chars=${#oldending}
    local check_index=$((num_chars + 1))
    for dir in $(dirsarr -p); do 
        local numbered_dir=$(returnval is_integer "${dir:(-${check_index}):1}")
        if [[ "${dir:(-${num_chars})}" == "${oldending}" && $numbered_dir == $TRUE_VAL ]]; then
            #echo ${str#*:}
            #echo ${str//:*/ }
            #echo "${dir: :(-2)}${newending}" 
            if [[ "$newending" == "$oldending" ]]; then echoif $echo_on "${dir}"
            else
                #local newname="${dir//${oldending}/}${newending}"
                local newname="${dir: :(-${num_chars})}${newending}"
                rename_statement $echo_on 'Directory' "${dir}" "${newname}"
                #mv "${dir}" "${dir: :(-2)}${newending}" 
            fi
        fi
    done
}
function numbered_dirs()
{
    local OPTIND
    local newending=''
    local newindex=''
    local action=''
    local renamed_dirs=0
    local echo_on=$FALSE
    for arg in "$@"; do
        shift
        case "$arg" in
            --print*)                          set -- "$@" "-p";;
            --renum*=*|--change*=*|--chg*=*)   set -- "$@" "-r ${arg#*=}";;
            --rem*|--del*)                     set -- "$@" "-d";;
            *)                                 set -- "$@" "$arg";;
        esac
    done
    while getopts 'pdr:' opt; do
        case $opt in
            d) action='delete';   newending='';;
            r) action='renumber'; newending="_${OPTARG}";;
            p) echo_on=$TRUE;;
            *) error "Unexpected option ${flag}";;
        esac
    done
    shift $(( OPTIND - 1 ))
    local oldending=$(cutif_suffix "_${1}" '_' ) #oldending="_${1}"; oldending="${oldending%_}"
    local num_chars=${#oldending}
    if [[ -z "${action}" ]]; then newending=$oldending; fi
    for dir in $(dirsarr -p); do 
        end=${dir##*_}
        last_index=$((${#dir} - ${#end} - 2))
        #last_index=$((${#dir} - $(echo $end | tr -d '\n' | wc -m) - 2))
        local numbered_dir=$(returnval is_integer "${dir:$last_index:1}")
        if [[ ( "${dir:(-${num_chars})}" == "${oldending}" && $numbered_dir == $TRUE_VAL )|| ( $num_chars == 0&& $numbered_dir == $FALSE_VAL ) ]]; then
            if [[ "$newending" == "$oldending" ]]; then echoif $echo_on "${dir}"
            else
                local newname="${dir: :(-${num_chars})}${newending%_}"
                rename_statement $echo_on 'Directory' "${dir}" "${newname}"
                mv "${dir}" "${newname}" 
                renamed_dirs=$((renamed_dirs + 1))
            fi
        fi
    done
    echoif $echo_on "Renamed ${renamed_dirs} Directories"
}
function rename_statement() { echoif $1 "Renaming $2...\n${FROM_LEADER}${3}\n${TO_LEADER}${4}"; }
function getdirsarr() { printf '%s\n' $(command ls); }
function refarr_assign() { if [[ -n $1 ]]; then eval $1=\(\"\${$2\[\@\]}\"\); fi; }
function dirsarr()
{
    local OPTIND
    local echo_on=$FALSE
    while getopts 'p' opt; do
        case $opt in
            p) echo_on=$TRUE;;
            *) error "Unexpected option ${flag}";;
        esac
    done
    shift $(( OPTIND - 1 ))
    arr=($(getdirsarr))
    target_arr=${1:-REPLY}
    refarr_assign $target_arr arr
    echoif $echo_on "${arr[*]}"
}
function echoif()
{
    local bool_val=$(setbool $1)
    if [[ $bool_val == $TRUE_VAL ]]; then echo "${2}"; fi
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
# function dcount_alternatives() 
# { 
     # count=0
    # for dir in *; do
     # test -d "$dir" || continue
    # test . = "$dir" && continue
    # test .. = "$dir" && continue
    # ((count++))
   # done
   # echo $count
    # echo *.* | wc -w
    # find . -type d ! -name . -printf . -prune | wc -c
    # find . -mindepth 1 -maxdepth 1 -type d -printf . | wc -c
    # tree -i -a -L 1 --noreport -P "/*" | wc -l (lists .)
    # find . -type d ! -name . -printf . -prune | wc -c
    # ls -l | grep "^d" | wc -l (lists . & ..)
    # ls -l . | grep -c ^d (lists . & ..)
# }
function dcount() 
{ 
    target=.
    maxdepth=1
    optstring='p:m:'
    while getopts $optstring opt; do
        case $opt in
            p) target=${OPTARG};;
            m) maxdepth=${OPTARG};;
            #n) node_name_flag='true';;
            *) error "Unexpected option ${flag}";;
        esac
    done   
    find ${target} -maxdepth ${maxdepth} -type d -print| wc -l
}
function fcount() 
{ 
    target="."
    maxdepth=1
    optstring='p:m:'
    while getopts $optstring opt; do
        case $opt in
            p) target=${OPTARG};;
            m) maxdepth=${OPTARG};;
            #n) node_name_flag='true';;
            *) error "Unexpected option ${flag}";;
        esac
    done   
    find ${target} -maxdepth ${maxdepth} -type f -print| wc -l
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
function cp2k() 
{ 
    target="."
    overwrite_flag='false'
    source="$1"
    destination="$2"
    optstring='p:o'
    while getopts $optstring opt; do
        case $opt in
            p) target=${OPTARG}
                echo "OPTARG=${OPTARG}: $1, $2, $3";
                shift 2;
                echo "after: $1, $2, $3";source="${1}";destination="${2}";
                break;;
            o) overwrite_flag='true';
                echo "${overwrite_flag}: $1, $2, $3";
                shift;
                echo "after: $1, $2, $3";source="$1"; destination="$2";
                break;;
            # p) target=${OPTARG};shift 2;source="$1"; destination="$2";break;;
            ##m) maxdepth=${OPTARG};shift;;
            #o) overwrite_flag='true'; shift;source="$1"; destination="$2";break;;
            *) error "Unexpected option ${flag}";break;;
        esac
    done   
    #source="$1"
    #destination="$2"
    echo "$1 => $source"
    echo "$2 -> $destination"
    #if [ $? -eq 1 ]; then print "ERROR: Invalid node alias provided" 0,31 5,33; return 1; fi
    if ( "$overwrite_flag" )
    then 
        #rsync -aEHzvhI --progress --compress $source $destination
        #rsync -aEHzvhI --progress --compress B_25600_L_0.000100_TV_0_A_0.950000_L0_0_Nk_6 #/ion/home/schultze/pCT_data/reconstruction_data/output_Sensitom_CDH6/B_25600
        echo "Overwrite"
        #echo "$source"
        #echo "$destination"
    else
        #rsync -aEHzvh --progress --size-only $source $destination    
        #rsync -aEHzvh --progress --size-only B_25600_L_0.000100_TV_0_A_0.950000_L0_0_Nk_6 #/ion/home/schultze/pCT_data/reconstruction_data/output_Sensitom_CDH6/B_25600
        #rsync -aEHzvh --progress --size-only /ion/incoming/karbasip/input_Sensitom_CDH6/* .
        #rsync -aEHzvh --progress --size-only * ${user_current_recon_data_path}
        #rsync -aEHzvh --progress --size-only B_25600_L_0.000100_TV_1* ${user_current_recon_data_path}
        echo "Size Only"
        #echo "$source"
        #echo "$destination" 
    fi
    #rsync -aEHzvhI --progress $source $destination
    #rsync -aEHzvh --progress --size-only $source $destination    
    #-a = archive mode; equals -rlptgoD (no -H,-A,-X)
    #-l = copy symlinks as symlinks
    #-t = preserve times, 
    #-p = preserve permissions, 
    #-E = preserve executability, 
    #-H = preserve hard links
    #-g = preserve group
    #-o = preserve owner
    #-D = same as --devices --specials
    #--devices = preserve device files (super-user only)
    #--copy-devices = copy device contents as regular file
    #--specials = preserve special files
    #-z, --compress = compress file data during the transfer, 
    #-h, --human-readable = output numbers in a human-readable format
    # --ignore-times = update files even if size/mod time match
    # --ignore-existing
    #-I, --ignore-times          don't skip files that match in size and mod-time
    #--size-only = skip files that match in size, 
    # --progress = show progress during transfer
    #(-arpEHzvht) - (-rlptgoD) = -aEHzvh
    #rsync -arpEHvht --progress --compress --size-only B_25600_L_0.000100_TV_0_A_0.950000_L0_0_Nk_6 /ion/home/schultze/pCT_data/reconstruction_data/output_Sensitom_CDH6/B_25600
    #rsync -r --ignore-existing --include=*/ --include=*.js --exclude=* source/ destination
    #rsync -aEHzvh --progress --size-only B_25600_L_0.000100_TV_0_A_0.950000_L0_0_Nk_6 /ion/home/schultze/pCT_data/reconstruction_data/output_Sensitom_CDH6/B_25600
    #cp -vnpr /src/* /dest
    #-a, --archive                same as -dR --preserve=all
    # -d                           same as --no-dereference --preserve=links
    # -H                            follow command-line symbolic links in SOURCE
    # -L, --dereference            always follow symbolic links in SOURCE
    # -n, --no-clobber             do not overwrite an existing file (overrides a previous -i option)
    # -P, --no-dereference         never follow symbolic links in SOURCE
    # -p                           same as --preserve=mode,ownership,timestamps
    # --preserve[=ATTR_LIST]    preserve attributes (default:mode,ownership,timestamps), others: context, links, xattr, all
    # -c                           deprecated, same as --preserve=context
    # -R, -r, --recursive          copy directories recursively
    # -u, --update                 copy only when SOURCE file is newer than the destination file or when the destination file is missing
    # -v, --verbose                explain what is being done
    #
    #
    #
    #
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
function extract() {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}
#----------------------------------------------------------------------------------------------------#
#------------------------------ Console Printing/Formatting Functions -------------------------------#
#----------------------------------------------------------------------------------------------------#
function exe() { echo -e " $@" ; "$@" ; }
function newline() { printf "\n"; }
function getcols() { export columns=$(tput cols);}
function setfmt() { textfmt "" $1; echo -e $REPLY; }
function fmtprint() { textfmt "$1" $2; echo -e "$REPLY"; }
function print_newline() { echo -e ""; }
function print_info() { echo -e "${GREEN}$1: ${LIGHTCYAN}$2 " ; }
function print_label() { echo -e "${GREEN}$@: ${LIGHTCYAN}" ; }
function print_result() { echo -e "${LIGHTCYAN}$@ ${NOCOLOR}" ; }
#----------------------------------------------------------------------------------------------------#
function color_LUT()
{
    color_ID=$1
    case $color_ID in        
        k) export colorref='DARKGRAY';;
        K) export colorref='BLACK';;
        r) export colorref='LIGHTRED';;
        R) export colorref='RED';;
        g) export colorref='LIGHTGREEN';;
        G) export colorref='GREEN';;
        y) export colorref='BROWN';;
        Y) export colorref='YELLOW';;
        b) export colorref='LIGHTBLUE';;
        B) export colorref='BLUE';;
        p) export colorref='LIGHTPURPLE';;
        P) export colorref='PURPLE';;
        c) export colorref='LIGHTCYAN';;
        C) export colorref='CYAN';;
        w) export colorref='LIGHTGRAY';;
        W) export colorref='WHITE';;
        z) export colorref='NOCOLOR';;
        Z) export colorref='NOCOLOR';;
        *) error "Unexpected color ID ${flag}";;
    esac
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
       underline_code="${ESCAPE_SEQUENCE}${UNDERLINE_TEXT}m";
    fi;
    #echo -e "${ESCAPE_SEQUENCE}${text_color_shade_code};${text_color_color_code};${background_color_shade_code};${background_color_color_code}m${underline_code}"
    REPLY="${ESCAPE_SEQUENCE}${text_color_shade_code};${text_color_color_code};${background_color_shade_code};${background_color_color_code}m${underline_code}"
}
function color_text()
{
  if [ -z "$2" ]; then
      set_color ${DEFAULT_TEXT_COLOR} ${DEFAULT_BACKGROUND_COLOR}
  else
      if [ -z "$3" ]; then
          set_color $2 ${DEFAULT_BACKGROUND_COLOR}
      else
          set_color $2 $3
      fi
  fi
  if [ -z "$4" ]; then
        underline_code="";
    else
       underline_code="${ESCAPE_SEQUENCE}${UNDERLINE_TEXT}m";
    fi;
  color_cmd=${REPLY}
  REPLY="${color_cmd}${underline_code}${1}${CLOSE_COLOR_ESCAPE_SEQ}"
  #echo -e $REPLY
}
function textfmt()
{
    background_code="${ESCAPE_SEQUENCE}6;40m"
    text_code="${ESCAPE_SEQUENCE}0;37m"
    format_code=''
    fmt_suffix=${CLOSE_COLOR_ESCAPE_SEQ}
    while getopts 'o' opt; do
        case $opt in        
            o) fmt_suffix=''; shift;;
            *) error "Unexpected option ${flag}";;
        esac
    done     
    textraw=$1
    color_code_arg=$2
    color_code_items=(${color_code_arg//,/ })                   # make array from simple string
    for (( j=0; j<${#color_code_items[@]}; j+=2 ))
    do  
        if [ ${color_code_items[@]:$j:1} == 0 -o ${color_code_items[@]:$j:1} == 1 ]
        then 
            export text_code="${ESCAPE_SEQUENCE}${color_code_items[$j]};${color_code_items[$(($j+1))]}m"
        elif [ ${color_code_items[@]:$j:1} == 5 -o ${color_code_items[@]:$j:1} == 6 ]
        then 
            export background_code="${ESCAPE_SEQUENCE}${color_code_items[$j]};${color_code_items[$(($j+1))]}m"
        else 
            if [[ -n "${color_code_items[$j]}" ]]; then export format_code="${ESCAPE_SEQUENCE}${color_code_items[$j]}m"; fi;            
            #echo ${format_code}
            j=$(($j-1)) 
        fi
    done
    textfmt_var=${3:-REPLY}
    outstr="${text_code}${background_code}${format_code}${textraw}${fmt_suffix}"
    refvar_assign $textfmt_var outstr
}
function coltext()
{
    local OPTIND
    text=""
    coltext_var=REPLY
    start_col=0
    shift_1st=0
    shift_all=0
    indent=0
    color='1,32,5,40'
    pad_color='0,37,6,49'
    for arg in "$@"; do
        shift
        case "$arg" in
            "--text")                           set -- "$@" "-t" ;;
            "--color")                          set -- "$@" "-C" ;;
            "--pad-color")                      set -- "$@" "-P" ;;
            "--indent")                         set -- "$@" "-i" ;;
            #--skip=*) skip_lines="${arg#*=}";;
            "--shift-all|shiftdist")            set -- "$@" "-S" ;;
            "--shift-1st|shift-top")            set -- "$@" "-s" ;;
            "--column|start-col")               set -- "$@" "-c" ;;
            "--set-variable|variable-out")      set -- "$@" "-v" ;;
            "--help")                           set -- "$@" "-h" ;;
            *)                                  set -- "$@" "$arg"
        esac
    done
    while getopts 't:v:c:s:S:i:C:P:' opt; do
        case $opt in
            t) text="${OPTARG}";;
            v) coltext_var=${OPTARG};;
            c) start_col=${OPTARG};;
            s) shift_1st=${OPTARG};;
            S) shift_all=${OPTARG};;
            i) indent=${OPTARG};;
            #i=*) indent=${OPTARG};;
            C) color=${OPTARG};;
            P) pad_color=${OPTARG};;
            *) error "Unexpected option ${flag}";;
        esac
    done
    if [[ -z $text ]]; then echo "ERROR: Mandatory '-t text' argument missing"; exit 1; fi;
    mincol=$(( $start_col > $shift_1st ? $start_col : $shift_1st ))
    toprow_padding=$(charrep ' ' $(($indent + $shift_all)) )
    par_padding=$(charrep ' ' $(($mincol + $shift_all)) )
    #charlimit=$(($CONSOLE_WIDTH - $shift_all - ${#keyval_sep} - $indent))
    charlimit=$(($CONSOLE_WIDTH - $shift_1st - $shift_all- $indent ))
    textfmt "${toprow_padding}" ${pad_color} toprow_padding_str   
    textfmt "${par_padding}" ${pad_color} par_padding_str  
    padstr="${toprow_padding_str}"
    line=''
    parag=""
    parag_words=${text//" "/ }
    for word in ${text//' '/ }; do
         if [[ $(( ${#line} + ${#word} )) -lt ${charlimit} ]]; then
            line="${line}${word}${SPACE_CHAR}"
        else
            #line_text=$(echo "${line}" | tr -d '[:space:]')
            #line_text=$(echo "${line_text}")
            #line_out=$(echo "{line_text}")
            #textfmt "${line_out}" ${color} line_str  
            #line_fin="${line/$line_text/$line_str}"
            #echo "${line_fin}$"
            #echo "${line/$line_text/$line_str}"
            #echo $color,$pad_color:"${line_str}"
            textfmt "${line}" ${color} line_str  
            parag="${parag}${padstr}${line_str}\n"
            padstr="${par_padding_str}"
            line="${word}"
            charlimit=$(($CONSOLE_WIDTH - $shift_1st - $shift_all ))
        fi
    done
    textfmt "${line}" ${color} line_str  
    parag="${parag}${padstr}${line_str}"
    refvar_assign $coltext_var parag
}
function print()
{
    if [ -z "$2" ]; then
        set_color ${DEFAULT_TEXT_COLOR} ${DEFAULT_BACKGROUND_COLOR}
    else
        if [ -z "$3" ]; then
            set_color $2 ${DEFAULT_BACKGROUND_COLOR}
        else
            set_color $2 $3
        fi
    fi
    if [ -z "$4" ]; then
        underline_code="";
    else
        underline_code="${ESCAPE_SEQUENCE}${UNDERLINE_TEXT}m";
    fi
    echo -e "${REPLY}${underline_code}${1}${CLOSE_COLOR_ESCAPE_SEQ}"
}
function printc()
{
    local OPTIND
    local background_code=$DEFAULT_BACKGROUND_COLOR
    local text_code=$DEFAULT_TEXT_COLOR
    local format_code=$DEFAULT_FORMAT   
    local full_code=$DEFAULT_ESCAPE_CODE   
    local build_code=$TRUE
    local skip_lines='none'
    for arg in "$@"; do
        shift
        case "$arg" in
            --back*=*|--bg*=*)              set -- "$@" "-b ${arg#*=}";;
            --text*=*|--str*=*)             set -- "$@" "-t ${arg#*=}";;
            --format*=*|--fmt*=*)           set -- "$@" "-f ${arg#*=}";;
            --code*=*|--col*=*|--full*=*)   set -- "$@" "-c ${arg#*=}";;
            --skip*=*|--cr*=*)              set -- "$@" "-s ${arg#*=}";; 
            *)                              set -- "$@" "$arg";;
        esac
    done
    while getopts 'b:t:f:c:s:' opt; do
        case $opt in
            b) background_code=${OPTARG// /};;
            t) text_code=${OPTARG// /};;
            f) format_code=${OPTARG// /};;
            c) full_code=${OPTARG// /}; build_code=$FALSE;;
            s) skip_lines=${OPTARG// /};;
            *) error "Unexpected option ${flag}";;
        esac
    done
    shift $(( OPTIND - 1 ))
    local print_statement="$1"
    if [[ "${build_code}" == $TRUE ]]; then 
        full_code="${text_code};${background_code};${format_code}"
    fi
    full_code="${ESCAPE_SEQUENCE}${full_code//,/;}m"
    if [ ${skip_lines} == 'before' -o ${skip_lines} == 'both' ]; then print_newline; fi
    printf "${full_code}${print_statement}${CLOSE_COLOR_ESCAPE_SEQ}"
    if [ ${skip_lines} == 'after' -o ${skip_lines} == 'both' ]; then print_newline; fi
}
function print_key_value()
{
    local OPTIND
    colstart=0
    keyval_sep_fmt='c'
    skip_lines='none'   
    for arg in "$@"; do        
        shift
        case "$arg" in
            --skip=*) skip_lines="${arg#*=}";;
            *)              set -- "$@" "$arg"
        esac
    done
    while getopts 'c:C:k:K:v:a:A:' opt; do
        case $opt in
            c) key_color_coding=${OPTARG};;
            C) value_color_coding=${OPTARG};;
            k) key=${OPTARG};;
            K) key=${OPTARG}; keyval_sep_fmt='C';colstart=$((${#key}+2));;
            v) value=${OPTARG};;
            a) colstart=${OPTARG}; keyval_sep_fmt='c';;
            A) colstart=${OPTARG}; keyval_sep_fmt='C';;
            *) error "Unexpected option ${flag}";;
        esac
    done
    if [ ${skip_lines} == 'before' -o ${skip_lines} == 'both' ]; then
        printf "\n"
    fi
    num_spaces=$(( $colstart > ${#key} + 2 ? $colstart - ${#key} - 2 : 1 ))
    keyval_sep=$(charrep " " $num_spaces)   
    if [[ $keyval_sep_fmt == 'c' ]]
    then #${CLOSE_COLOR_ESCAPE_SEQ}
        textfmt "${value}" ${value_color_coding}
        textfmt "${key}:${CLOSE_COLOR_ESCAPE_SEQ}${keyval_sep}${REPLY}" ${key_color_coding}
        #textfmt "${keyval_sep}" ${key_color_coding}
    elif [[ $keyval_sep_fmt == 'C' ]]
    then
        textfmt "${keyval_sep}${value}" ${value_color_coding}
        textfmt "${key}:${CLOSE_COLOR_ESCAPE_SEQ}${REPLY}" ${key_color_coding}
    else
        textfmt "${value}" ${value_color_coding}
        textfmt "${key}:${keyval_sep}${REPLY}" ${key_color_coding}
    fi
    printf "${REPLY}"
    if [ ${skip_lines} == 'after' -o ${skip_lines} == 'both' ]; then
        printf "\n"
    fi
}
function print_list()
{
    local OPTIND
    colstart=0
    keyval_sep_fmt='c'
    shift_dist=0;
    keyval_sep=' - '
    indent=0
    newlines='none'
    endline='\n'
    while getopts 'c:C:k:K:v:a:A:s:i:n:e' opt; do
        case $opt in
            c) key_color_coding=${OPTARG};;
            C) value_color_coding=${OPTARG};;
            k) key=${OPTARG};;
            K) key=${OPTARG};; # keyval_sep_fmt='C';colstart=$((${#key}+2));;
            v) value=${OPTARG};;
            a) colstart=${OPTARG}; keyval_sep_fmt='c';;
            A) colstart=${OPTARG}; keyval_sep_fmt='C';;
            s) shift_dist=${OPTARG};;
            i) indent=${OPTARG};;
            n) newlines=${OPTARG};;
            e) endline='';;
            *) error "Unexpected option ${flag}";;
        esac
    done
    keystr=$(evaltabs 'key')
    valstr=$(evaltabs 'value')
    keylen=${#keystr}
    paddist=$(( $keylen + ${#keyval_sep}))
    #echo $value,$keylen,$paddist,$keyval_sep,"${valstr}", "o${padding}o"
    coltext -t "${valstr}" -v valcol -s $paddist -S $shift_dist -i $indent -C ${value_color_coding} -P $key_color_coding
    if [[ $keyval_sep_fmt == 'c' ]]; then textfmt "${keystr}${keyval_sep}${valcol}" ${key_color_coding}
    elif [[ $keyval_sep_fmt == 'C' ]]; then textfmt "${keystr}${keyval_sep}${valcol}" ${key_color_coding}
    else textfmt "${keystr}${keyval_sep}${valcol}" ${key_color_coding}; fi
    if [ ${newlines} == 'before' -o ${newlines} == 'both' ]; then print_newline; fi
    printf "${REPLY}${endline}"
    if [ ${newlines} == 'after' -o ${newlines} == 'both' ]; then print_newline; fi
}
function print_alias()
{
    equal_pos=$(expr index "$2" = )
    var_length=$(expr $equal_pos - 1)
    cmd="${1}"
    var=${2:0:$var_length}
    val=${2:${equal_pos}}
    alias_val="${var}=${val} $3"
    echo -e "${LIGHTRED}-> ${BROWN}alias ${GREEN}${var}=${LIGHTPURPLE}${val} $3${NOCOLOR}"
    alias "${alias_val}"
}
function print_module_load()
{
    words=( $1 )
    module_command=${words[0]}
    module_name=${words[1]}
    echo "${FMTLIST}module ${LIGHTBLUE}$module_command ${LIGHTPURPLE}$module_name${LIGHTCYAN}"
    module $1 $2
}
function print_section()
{
    heading_length=${#1}
    num_dashes=$(expr $CONSOLE_WIDTH - $heading_length - 2)
    num_front=$(expr $num_dashes / 2)
    num_back=$(expr $num_dashes - $num_front)
    if [ -z "$4" ]
    then 
        SEPARATOR_CHAR="${DEFAULT_SEPARATOR_CHAR}"
    else
        SEPARATOR_CHAR="$4"
    fi
    front_string=$(charrep "${SEPARATOR_CHAR}" $num_front)
    back_string=$(charrep "${SEPARATOR_CHAR}" $num_back)
    separator_string=$(charrep "${SEPARATOR_CHAR}" $CONSOLE_WIDTH)
    if [ -z "$2" ]; then
       print "${separator_string}" ${DEFAULT_TEXT_COLOR} ${DEFAULT_BACKGROUND_COLOR}
       print "${front_string} $1 ${back_string}" ${DEFAULT_TEXT_COLOR} ${DEFAULT_BACKGROUND_COLOR}
       print "${separator_string}" ${DEFAULT_TEXT_COLOR} ${DEFAULT_BACKGROUND_COLOR}   
    else
        if [ -z "$3" ]; then
            print "${separator_string}" ${2} ${DEFAULT_BACKGROUND_COLOR}
            print "${front_string} $1 ${back_string}" ${2} ${DEFAULT_BACKGROUND_COLOR}
            print "${separator_string}" ${2} ${DEFAULT_BACKGROUND_COLOR}   
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
    echo -e "${GREEN}$1 version:${LIGHTCYAN}";
    echo -e "$( $2 )${NOCOLOR} $3"
}
#---------------------------------------------------------------------------------------------------#
#-------------------- bash logic and Boolean equivalent assignments/operations ---------------------#
#---------------------------------------------------------------------------------------------------#
function success() { [ $? -gt 0 ] && echo $FALSE_VAL || echo $TRUE_VAL;}
function failure() { [ $? -eq 0 ] && echo $FALSE_VAL || echo $TRUE_VAL;}
function bool_2_name() { tobool ${1} && { echo "${TRUE}"; } || { echo "${FALSE}"; } }
function bool_2_val() { tobool ${1} && { echo "${TRUE_VAL}"; } || { echo "${FALSE_VAL}"; } }
function bool_2_string() { tobool ${1} && { echo "${TRUE_STRING}"; } || { echo "${FALSE_STRING}"; } }
function setbool() { returnval "bool $1 && test -n $1"; }
function ismember() { for elem in "${@:2}"; do if [[ "$1" == $elem ]]; then return 0; fi; done; return 1 ; }
#---------------------------------------------------------------------------------------------------#
function bool_by_type()
{ 
    local OPTIND
    local bool_var=''
    local bool_type=$NUMERIC_TYPE
    local echo_on=$FALSE
    for arg in "$@"; do
        shift
        case "$arg" in
            --numeric)                        set -- "$@" "-n";;
            --bool)                           set -- "$@" "-b";;
            --string|--text)                  set -- "$@" "-s";;
            --print)                          set -- "$@" "-p";;
            --variable*=*|--set-variable=*)   set -- "$@" "-v ${arg#*=}";;
            --help)                           set -- "$@" "-h";;
            *)                                set -- "$@" "$arg"
        esac
    done
    while getopts 'nbspv:h' opt; do
        case $opt in
            n) bool_type=$NUMERIC_TYPE;;
            b) bool_type=$BOOL_TYPE;;
            s) bool_type=$STRING_TYPE;;
            p) echo_on=$TRUE;;
            v) bool_var=${OPTARG};;
            h) usage >&2;;
            *) error "Unexpected option ${flag}";;
        esac
    done
    shift $(( OPTIND - 1 ))
    local bool_val=$(setbool $1)
    local bool_type=${2:-$bool_type}
    if [[ -n $3 ]]; then bool_var=$3; else bool_var=${bool_var:-_bool_by_type}; fi
    if [[ $bool_type == $BOOL_TYPE ]]; then 
        bool_val=$(bool_2_name $bool_val)
    elif [[ $bool_type == $STRING_TYPE ]]; then 
        bool_val=$(bool_2_string $bool_val)
    fi
    refvar_assign $bool_var bool_val
    if [[ $echo_on == $TRUE ]]; then echo $bool_val; fi
}
function bool()
{
    test "${1}" == "${TRUE}" -o "${1}" == "${TRUE_STRING}"  -o "${1}" == "${TRUE_VAL}"  && return 0 
    test "${1}" == "${ON}" -o "${1}" == "${ON_STRING}"  -o "${1}" == "${ON_VAL}"  && return 0 
    test "${1}" == "${YES}" -o "${1}" == "${YES_STRING}"  -o "${1}" == "${YES_VAL}"  && return 0 
    return 1
}
#---------------------------------------------------------------------------------------------------#
#-------------------------- bash array creation/conversion/manipulation  ---------------------------#
#---------------------------------------------------------------------------------------------------#
function passarr(){ eval array=("$(echo '${'$1'[@]}')"); }
#---------------------------------------------------------------------------------------------------#
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
    local OPTIND
    local is_member=$FALSE_VAL
    local is_member_var='REPLY'
    local echo_on=$FALSE
    local return_type="-n"
    for arg in "$@"; do
        shift
        case "$arg" in
            --numeric)                        set -- "$@" "-n";;
            --bool)                           set -- "$@" "-b";;
            --string|--text)                  set -- "$@" "-s";;
            --print)                          set -- "$@" "-p";;
            --variable*=*|--set-variable=*)   set -- "$@" "-v ${arg#*=}";;
            --help)                           set -- "$@" "-h";;
            *)                                set -- "$@" "$arg"
        esac
    done
    while getopts 'nbspv:h' opt; do
        case $opt in
            n) return_type="-n";;
            b) return_type="-b";;
            s) return_type="-s";;
            p) echo_on=$TRUE;;
            v) is_member_var=${OPTARG};;
            h) usage >&2;;
            *) error "Unexpected option ${flag}";;
        esac
    done
    shift $(( OPTIND - 1 ))
    local arrstr="${@:2}"
    #is_member=$(returnval "ismember $1 ${arrstr}" )
    is_member=$( returnval ismember $node_state ${@:2} )
    bool_by_type -v $is_member_var "${return_type}" $is_member
    if [[ $echo_on == $TRUE ]]; then echo ${!is_member_var}; fi
    return $is_member
}
function array_remove()
{   
    passarr $1
    index=$2
    array=("${array[@]:0:$index}" "${array[@]:$(( $index + 1 ))}")
    eval $1=$"(${array[@]})"
}
function array_insert()
{
    passarr $1
    index=$2
    array=("${array[@]:0:$index}" $3 "${array[@]:$index}")
    eval $1=$"(${array[@]})"
}
function array_replace()
{
    passarr $1
    index=$2
    array=("${array[@]:0:$index}" $3 "${array[@]:$(($index+1))}")
    eval $1=$"(${array[@]})"
}
function arraymod()
{
    local OPTIND
    while getopts 'idr' opt; do
        case $opt in
            i) shift; array_insert $1 $2 $3;;
            d) shift; array_remove $1 $2;;
            r) shift; array_replace $1 $2 $3;;
            *) error "Unexpected option ${flag}";;
        esac
    done  
}
function chgarray()
{
    local OPTIND
    value=''
    echo_result='false'
    target_var=""
    arr=("$@")
    while getopts 'pi:d:r:v:t:a:' opt; do
        case $opt in
            i) f=array_insert; index=${OPTARG};;
            d) f=array_remove; index=${OPTARG};;
            r) f=array_replace; index=${OPTARG};;
            v) value="${OPTARG}";;
            t) target_var=${OPTARG};;
            a) target_var=${OPTARG}; eval arr=("$(echo '${'${OPTARG}'[@]}')");;
            p) echo_result='true';;
            *) error "Unexpected option ${flag}";;
        esac
    done
    ${f} "${arr[@]}" $index $value
    if [[ $echo_result == 'true' ]]; then echo "result=${array[@]}"; fi
    if [[ -n $target_var ]]; then eval $target_var=$"(${array[@]})"; fi
}
function arrayop()
{   
    local OPTIND
    echo_result='false'
    target_var=""
    offset=0
    while getopts 'pidrt:' opt; do
        case $opt in
            i) f=i; offset=$(($offset+1));;
            d) f=d; offset=$(($offset+1));;
            r) f=r; offset=$(($offset+1));;
            t) target_var=${OPTARG};offset=$(($offset+2));;
            p) echo_result='true';offset=$(($offset+1));;
            *) error "Unexpected option ${flag}";;
        esac
    done
    shift $(( OPTIND - 1 ))
    #shift $offset #$(( ${#@}-$offset ))
    passarr $1
    index=$2
    case $f in
        i) array=("${array[@]:0:$index}" $3 "${array[@]:$index}");;
        d) array=("${array[@]:0:$index}" "${array[@]:$(( $index + 1 ))}");;
        r) array=("${array[@]:0:$index}" $3 "${array[@]:$(($index+1))}");;
        *) error "Unexpected option ${flag}";;
    esac
    if [[ $echo_result == 'true' ]]; then echo "result=${array[@]}"; fi
    if [[ -z $target_var ]]; then target_var="$1";fi 
    eval $target_var=$"(${array[@]})"
}
function apply_varnames()
{   
    passarr $1
    varnames=("${array[@]}")
    outstring=''
    for item in ${varnames[@]}; do export outstring="${outstring}${!item}"; done
}
function printarr()
{   
    passarr $1
    for item in ${array[@]}; do echo "${item}"; done
}
#------------------------------------------------------------------------------------------------------------#
#---------------------------------- PBS queue manager queries/interactions ----------------------------------#
#------------------------------------------------------------------------------------------------------------#
function nodeinfo() { pbsnodes $1 | sed -r -n -e '/Mom|queue|state/p'; }
#------------------------------------------------------------------------------------------------------------#
function getpbsnodearray () { pbsnodes -a | grep --color=auto -v = | sed /^s*$/d | sort -d | tr '\n' ' '; }
function getpbsnodes () 
{
    local nodes=( $(getpbsnodearray) )      
    printf '%s\n' ${nodes[@]}
}
function pbsavailnodes () 
{
    unset avail_qnodes; avail_qnodes=()
    local avail_qnode_info=()
    local requested_info=(${@:2})
    local qnodes=()
    for node in "${allnodes[@]}"; do
        node_queue=$( pbsnodefield "$node" 'queue' )
        if [[ ${node_queue} == "$1" ]]; then qnodes+=(${node}); fi
    done
    for node in "${qnodes[@]}"; do
        node_state=$(pbsnodefield "$node" 'state' | tr ',' ' ')
        node_pcpus=$(pbsnodefield "$node" 'pcpus')
        #array_member_test -p -s $node_state "${UNAVAILABLE_NODE_STATES[@]}" 
        is_member=$( returnval ismember $node_state ${UNAVAILABLE_NODE_STATES[@]} )
        if [[ $is_member != $TRUE_VAL ]]; then 
            avail_qnode_info=':'
            for info in "${requested_info[@]}"; do
                avail_qnode_info="${avail_qnode_info} ${info}=$(pbsnodefield $node $info),"
            done
            avail_qnodes+=("${node}${avail_qnode_info%?}")
        fi
    done
    echo "${avail_qnodes[@]}"
}
function pbsavailtardisnodes () { avail_tardis_nodes=( $(pbsavailnodes tardis ${@}) ); }
function pbstardisnodes () 
{
    local tardis_nodes=()
    for node in "${allnodes[@]}"; do
        node_queue=$( pbsnodefield "$node" 'queue' )
        if [[ ${node_queue} == 'tardis' ]]; then tardis_nodes+=(${node}); fi
    done
    echo "${tardis_nodes[@]}"
}
function pbsqnodes () 
{
    local OPTIND
    local availabiles=$OFF
    local echo_on=$OFF
    local node_sep="$DEFAULT_IFS"
    local queue='all'
    local qnodes=(${allnodes[@]})
    local qnodes_queried=()
    local qnodes_info=()
    for arg in "$@"; do
        shift
        case "$arg" in
            --avail*=*|--check*=*)   set -- "$@" "-a";;
            --queue*=*)              set -- "$@" "-q ${arg#*=}";;
            --print*=*)              set -- "$@" "-p";;
            --sep*=*|--new*=*)       set -- "$@" "-n";;
            *)                       set -- "$@" "$arg";;
        esac
    done
    while getopts 'aq:pn' opt; do
        case $opt in
            a) availabiles=$ON;;
            q) queue=${OPTARG};;
            p) echo_on=$ON;;
            n) node_sep='\n';;
            *) error "Unexpected option ${flag}";;
        esac
    done
    shift $(( OPTIND - 1 ))
    local requested_info=("$@")
    #echo "availabiles=${availabiles}, queue=${queue}, echo_on=${echo_on}"
    #echo "requested_info=${requested_info}"
    if [[ "$queue" == 'all' ]]; then qnodes=(${allnodes[@]}); else 
        qnodes=()
        for node in "${allnodes[@]}"; do
            node_queue=$( pbsnodefield "$node" 'queue' )
            if [[ ${node_queue} == "$queue" ]]; then qnodes+=(${node}); fi
        done
    fi
    #echo "qnodes=\n${qnodes[@]}"
    if [[ $availabiles == $ON ]]; then  
        for node in "${qnodes[@]}"; do
            node_state=$(pbsnodefield "$node" 'state' | tr ',' ' ' | tr -d '<' | tr -d '>' )
            is_member=$( returnval ismember $node_state ${UNAVAILABLE_NODE_STATES[@]} )
            if [[ $is_member == $FALSE_VAL ]]; then 
                qnodes_queried+=( ${node} )
            fi
        done
    else qnodes_queried="${qnodes[@]}"; fi
    #echo "qnodes_queried=\n${qnodes_queried[@]}"
    for node in "${qnodes_queried[@]}"; do
        qnode_info=':'
        for info in "${requested_info[@]}"; do
            qnode_info="${qnode_info} ${info}=$(pbsnodefield $node $info),"
        done
        qnodes_info+=("${node}${qnode_info%?}")
    done            
    #echo "qnodes_info=\n${qnodes_info[@]}"
    if [[ $echo_on == $TRUE ]]; then printf "%s${node_sep}" "${qnodes_info[@]}"; print_newline; fi
}
#------------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------------#
#------------------------------------------ pCT user/login tasks --------------------------------------------#
#------------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------------#
function load_CUDA_modules()
{
    #---------------------------------------------------------------------------------------------#
    print "\nLoading modules required by selected version of CUDA..." 0,32
    #---------------------------------------------------------------------------------------------#
    node_ID=$HOSTNAME
    if [ $node_ID == "whartnell" ]
    then
        load_CUDA=$version_CUDA_Tardis_Headnode
    #---------------------------------------------------------------------------------------------#
    elif [ $node_ID == "ecsn002" -o $node_ID == "ecsn003" -o $node_ID == "ecsn004" -o $node_ID == "ecsn005" ]
    then
        load_CUDA=$version_CUDA_Tardis
    #---------------------------------------------------------------------------------------------#
    elif [ $node_ID == "tardis-student1" -o $node_ID == "tardis-student2" ]
    then
        load_CUDA=$version_CUDA_Workstation
    else
        load_CUDA="none"
    fi
    #---------------------------------------------------------------------------------------------#
    if [ ${load_CUDA} == 55 ]
    then
        #print_module_load "unload gcc"
        print_module_load "load cuda55"
        print_module_load "load cuda55/blas/5.5.22"
        print_module_load "load cuda55/fft/5.5.22"
        print_module_load "load cuda55/toolkit/5.5.22"
    #---------------------------------------------------------------------------------------------#
    elif [ ${load_CUDA} == 65 ]
    then
        #print_module_load "unload gcc"
        #print_module_load "load gcc/4.8.4"
        print_module_load "load cuda65/blas/6.5.14"
        print_module_load "load cuda65/fft/6.5.14"
        print_module_load "load cuda65/gdk/340.29"
        print_module_load "load cuda65/nsight/6.5.14"
        print_module_load "load cuda65/profiler/6.5.14"
        print_module_load "load cuda65/toolkit/6.5.14"
    #---------------------------------------------------------------------------------------------#
    elif [ ${load_CUDA} == 70 ]
    then
        #print_module_load "unload gcc"
        #print_module_load "load gcc/4.9.2"
        print_module_load "load cuda70"
        print_module_load "load cuda70/blas/7.0.28"
        print_module_load "load cuda70/fft/7.0.28"
        print_module_load "load cuda70/gdk/346.46"
        print_module_load "load cuda70/nsight/7.0.28"
        print_module_load "load cuda70/profiler/7.0.28"
        print_module_load "load cuda70/toolkit/7.0.28"
    elif [ ${load_CUDA} == 75 ]
    then
        #print_module_load "unload gcc"
        #print_module_load "load gcc/4.9.2"
        #print_module_load "load cuda75"
        print_module_load "load cuda75/blas/7.0.18"
        print_module_load "load cuda75/fft/7.0.18"
        #print_module_load "load cuda75/gdk/346.46"
        print_module_load "load cuda75/nsight/7.0.18"
        print_module_load "load cuda75/profiler/7.0.18"
        print_module_load "load cuda75/toolkit/7.0.18"
    elif [ ${load_CUDA} == 80 ]
    then
        #print_module_load "unload gcc"
        #print_module_load "load gcc/4.9.2"
        #print_module_load "load cuda80"
        print_module_load "load cuda80/blas/8.0.61"
        print_module_load "load cuda80/fft/8.0.61"
        #print_module_load "load cuda80/gdk/346.46"
        print_module_load "load cuda80/nsight/8.0.61"
        print_module_load "load cuda80/profiler/8.0.61"
        print_module_load "load cuda80/toolkit/8.0.61"
    fi
}
function login_tasks()
{
    #--------------------------- Query/print host information and status -------------------------#
    print_section "Host Information" 1,33 5,40
    print_info "Hostname" "${host_ID} ${LightBlue}(${host_name})"
    print_info "Host IP" "$(hostname -i) ${LightBlue}($(hostname -I))"
    print_info "Host Users/Activity" "\n$(w)\n"
    #print_info "Host computational load" "\n$(top)\n"
    print_info "Tardis Queue Activity" "\n$(qstat -t tardis)\n"
    #---------------------- Query/print operating system information/properties ------------------#
    print_info "OS" "$(uname -o) ${LightBlue}($(uname -m))"
    print_info "$(uname -s) Kernel Version" "$(uname -v)"
    print_info "$(uname -s) Kernel Release" "$(uname -r)"
    #------------------------ Query/print user/group information and status ----------------------#
    print_section "User Information" 1,33 5,40
    print_info "Username" "$(id -un) ${LightBlue}($(id -u))"
    print_info "User Group(s)" "$(id -Gn) ${LightBlue}($(id -G))"
    print_info "Current Group" "$(id -gn) ${LightBlue}($(id -g))"
    print_info "User Home" "${user_home}"
    print_info "Login Home" "${login_dir}"
    print_info "User Data Home" "${user_home}${pct_data_folder}"
    print_info "User Code Home" "${user_home}${pct_code_folder}"
    #---------------------------------------------------------------------------------------------#
    get_current_node_alias
    pctusers
    #---------------------------------------------------------------------------------------------#
    print_info "Current git Access" "${current_rcode_git}"
    print_info "Current git Account" "${current_rcode_account}"
    print_info "Current git Repository" "${current_rcode_repo}"
    print_info "Current git Branch" "${current_rcode_branch}\n"
    set_rcode -a "$current_rcode_account" -r "$current_rcode_repo" -b "$current_rcode_branch" $current_set_rcode_git_flag
    #---------------------------------------------------------------------------------------------#
    print_section "pCT User Configuration Complete" 1,33 5,40
    #---------------------------------------------------------------------------------------------#
    color_text "[$(now)]" 0,33 5,49; now_string=$REPLY
    color_text "$PWD" 0,35 5,49; pwd_string=$REPLY
    color_text "${git_branch}${git_dirty}" 0,34 5,49; git_string=$REPLY
    color_text "[${current_user}.${HOSTNAME}/$current_node_alias]" 0,36 5,49; current_user_string=$REPLY
    print "$now_string\n$pwd_string $git_string" 0,35 6,49
    print "$current_user_string\n" 0,36 5,49
    print_result "$(ls -C)\n"
}
function tardis_login_tasks()
{
    print_section "Loading of program and compiler modules" 1,33 5,40
    #get_tardis_node_info $1
    print "Loading modules..." 0,32
    for i in "${tardis_modules[@]}"
    do 
        print_module_load "$i"
    done
    load_CUDA_modules
    #---------------------------------------------------------------------------------------------#
    print "\nCurrently loaded modules:" 0,32
    print_module_load "-l list"
    #---------------------------------------------------------------------------------------------#
    if [[ $node_num == 0 ]]; then login_dir=${user_home}
    else login_dir="${current_tardis_rcode_path}"; fi
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
function get_tardis_node_info()
{
    #CLUSTER NODE SYSTEMS
    #   [1] ecsn001 - whartnell  - 192.168.225.1
    #   [2] ecsn002 - ptroughton - 192.168.225.2
    #   [3] ecsn003 - jpertwee   - 192.168.225.3
    #   [4] ecsn004 - tbaker     - 192.168.225.4 ${BROWN}
    #   [5] ecsn005 - pdavison   - 192.168.225.5
    node_num=$1
    if [[ $node_num == 0 ]]; then node_type="head_node"
    else node_type="compute_node${node_num}"; fi
    list_num=$(( $node_num + 1 ))
    export ID_varbase="tardis_${node_type}_ID"
    export alias_varbase="tardis_${node_type}_alias"
    export IP_varbase="tardis_${node_type}_IP"
    export REPLY="${FMTLIST}[$list_num] ${GREEN}${!ID_varbase} - ${LIGHTBLUE}${!alias_varbase}  - ${LIGHTPURPLE}${!IP_varbase}${FMTRESET}"
}
function get_current_node_alias()
{
    node_ID=$HOSTNAME
    if [ $node_ID == "kodiak" -o $node_ID == "n130"  -o $node_ID == "login001" ]; then node_alias="Kodiak"
    elif [ $node_ID == "ecsn001" -o $node_ID == "whartnell" ]; then node_alias="WHartnell"
    elif [ $node_ID == "ecsn002" ]; then node_alias="PTroughton"
    elif [ $node_ID == "ecsn003" ]; then node_alias="JPertwee"
    elif [ $node_ID == "ecsn004" ]; then node_alias="TBaker"
    elif [ $node_ID == "ecsn005" ]; then node_alias="PDavison"
    elif [ $node_ID == "tardis-student1" ]; then node_alias="Workstation #1"
    elif [ $node_ID == "tardis-student2" ]; then node_alias="Workstation #2"
    fi
    current_node_alias=${node_alias}
}
function print_tardis_node_info()
{
    get_tardis_node_info $1
    echo "${REPLY}"
}
#------------------------------------------------------------------------------------------------------------#
#-------------------------------------- user session prompt/appearance --------------------------------------#
#------------------------------------------------------------------------------------------------------------#
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
#------------------------------------------------------------------------------------------------------------#
function PSi_fmt() {       REPLY="\[$1\]"; }
function PSi_fmtstr(){     export $1=$"\[$2\[${FMTRESET}\] \]"; }
function PS1_pwd(){        PS1_PWD="\[${1}\]"'$(pwd)'; }
function PS1_gitinfo(){    PS1_GITINFO="\[${1}\]${prompt_git_info}"; }
function PS1_date(){       PS1_DATE="\[${1}\]$2"; }             # prompt_date: [${prompt_date}]
function PS1_promptsep(){  PS1_PROMPTSEP="\[${1}\]\[${2}\]"; }  # prompt_separator: ${ARROWHEAD}
function PS1_login_info(){ PS1_LOGIN_INFO="\[${1}\]$2"; }       # prompt_login_info:[\u.\h/${current_node_alias}]
function PSi_set_order()
{   
    order_specs=$1 
    #echo ${order_specs}
    order_arr=()
    for (( i=0; i<${#order_specs}; i++ )); do
        item="${order_specs:$i:1}"
        case $item in        
            D) order_arr+=( PS1_DATE );;
            L) order_arr+=( PS1_LOGIN_INFO );;
            P) order_arr+=( PS1_PWD );;
            G) order_arr+=( PS1_GITINFO );;
            S) order_arr+=( PS1_PROMPTSEP );;
            s) order_arr+=( SPACE_CHAR );;
            c) order_arr+=( COLON_CHAR );;
            _) order_arr+=( NEWLINE );;
            *) error "Unexpected order spec ${flag}";;
        esac
        #echo ${order_arr[@]}
    done
    #echo ${order_arr[@]}
}
function PSi_set_colors()
{   
    color_specs=$1 
    color_arr=()
    for (( i=0; i<${#color_specs}; i++ )); do
        item="${color_specs:$i:1}"
        case $item in        
            s) ;;
            S) ;;
            _) ;;
            *) color_LUT $item;;
        esac
        color_arr+=( $colorref )
    done
}
function PSi_apply_colors()
{   
    order_specs=$1 
    passarr $2
    colors=("${array[@]}")
    for (( i=0; i<${#order_specs}; i++ )); do
        color="${colors[$i]}"
        item="${order_specs:$i:1}"
        case $item in        
            D) PS1_date ${!color} "${prompt_date}";;
            L) PS1_login_info ${!color} "${prompt_login_info}";;
            P) PS1_pwd ${!color};;
            G) PS1_gitinfo ${!color};;
            S) PS1_promptsep ${!color} "${prompt_separator}";;
            s) ;;
            c) ;;
            _) ;;
            *) error "Unexpected order spec ${flag}";;
        esac
    done
}
function PS1_combine_specs()
{
    num_lines=$1
    order_num=$2
    case $num_lines in        
        2) prefix="two";;
        3) prefix="three";;
        4) prefix="four";;
        *) error "Unexpected order spec ${flag}";;
    esac
    color_specs_name="${prefix}Line_color${order_num}"
    order_specs_name="${prefix}Line_order${order_num}"
    eval export color_specs='${'"$(echo ${prefix}Line_color${order_num})"'}'
    eval export order_specs='${'"$(echo ${prefix}Line_order${order_num})"'}'
}
function set_PS1()
{   
    order_specs=$1 
    color_specs=$2 
    PSi_set_colors $color_specs
    #PSi_apply_colors $order_specs "${color_arr[@]}"
    PSi_apply_colors $order_specs color_arr
    PSi_set_order $order_specs
    apply_varnames ${order_arr[@]}
    PSi_fmtstr PS1 "${outstring}"
}
function set_PS1def()
{   
    PS1_combine_specs $1 $2  
    PSi_set_colors $color_specs
    PSi_apply_colors $order_specs "${color_arr[@]}"
    PSi_set_order $order_specs
    apply_varnames ${order_arr[@]}
    PSi_fmtstr PS1 "${outstring}"
}
function set_profile()
{   
    passarr $1; shift
    export prompt_date=${all_date_options[${array[2]}]}
    export prompt_login_info=${all_login_options[${array[3]}]}
    export prompt_separator=${promptsep_options[${array[4]}]}
    PS1_combine_specs ${array[0]} ${array[1]}  
    PSi_set_colors $color_specs
    PSi_apply_colors $order_specs color_arr
    PSi_set_order $order_specs
    apply_varnames order_arr
    PSi_fmtstr PS1 "${outstring}"
}
function profile()
{   
    if [[ $1 < ${#profiles[@]} ]]
    then 
        set_profile ${profiles[$1]}
    else echo "Invalid Profile Selected"
    fi
}
#if [[ \$? = "0" ]];
####################################################################################################
####################################################################################################
############################################ DEVELOPMENT ###########################################
####################################################################################################
####################################################################################################
