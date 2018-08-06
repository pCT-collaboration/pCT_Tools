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
alias nvcc11="nvcc -std=c++11 -gencode arch=${rcode_compute},code=${rcode_sm} ${rcode_flags}"
#alias evaltabs='$(echo "$1" | expand)'
alias getnodes='pbsnodes -a | grep -v = | sed '/^\s*$/d''
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
#-------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------#
#------------------------------ General helper/utility functions ---------------------------------#
#-------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------#
function mcd () { mkdir -p $1; cd $1; }
function exe() { echo -e " $@" ; "$@" ; }
function refvar_assign() { if [[ -n $1 ]]; then eval $1=\"\${$2}\"; fi; }
function now() { date +"%T %Z (%a) %m-%d-%Y"; }
function current_date() { date +"%y-%m-%d"; }
function charrep() { printf '%*s' "$2" | tr ' ' "$1" ; }
function evaltabs() { eval echo \"\${$1}\" | expand; }
function newline() { printf "\n"; }
function getcols() { export columns=$(tput cols);}
function setfmt() { textfmt "" $1; echo -e $REPLY; }
function fmtprint() { textfmt "$1" $2; echo -e "$REPLY"; }
function print_newline() { echo -e ""; }
function print_info() { echo -e "${GREEN}$1: ${LIGHTCYAN}$2 " ; }
function print_label() { echo -e "${GREEN}$@: ${LIGHTCYAN}" ; }
function print_result() { echo -e "${LIGHTCYAN}$@ ${NOCOLOR}" ; }
function nodeinfo() { pbsnodes $1 | sed -r -n -e '/Mom|queue|state/p'; }
function dec2int() { echo "scale=0; $@/1" | bc ; }
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
#----------------------------------------------------------------------------------------------------#
#----------------------------------- File/Directory Path Manipulation -----------------------------------#
#--------------------------------------------------------------------------------------------------------#
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
function extract {
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
    background_code=$DEFAULT_BACKGROUND_COLOR
    text_code=$DEFAULT_TEXT_COLOR
    format_code=$DEFAULT_FORMAT   
    #DEFAULT_BACKGROUND_COLOR="6,49"
# DEFAULT_TEXT_COLOR="0,37"
# DEFAULT_FORMAT="10"
# DEFAULT_BACKGROUND_CODE="6;40"
# DEFAULT_TEXT_CODE="0;37"
# DEFAULT_FORMAT_CODE="10"
# DEFAULT_ESCAPE_CODE="${DEFAULT_TEXT_CODE};${DEFAULT_BACKGROUND_CODE};${DEFAULT_FORMAT_CODE}m"
# DEFAULT_PRINT_SEQUENCE="${ESCAPE_SEQUENCE}${DEFAULT_ESCAPE_CODE}"
# echo "${DEFAULT_PRINT_SEQUENCE}Hello"
    for arg in "$@"; do        #set -- "$@" "-t" ;;
        shift
        case "$arg" in
            --back*=*) set -- "$@" "-b ${arg#*=}";; #skip_lines="${arg#*=}";;
            --skip=*) skip_lines="${arg#*=}";;
            #--skip=*) skip_lines="${arg#*=}";;
            #--skip=*) skip_lines="${arg#*=}";;
            #--skip=*) skip_lines="${arg#*=}";;
            *)              set -- "$@" "$arg"
        esac
    done
    while getopts 'b:t:f:' opt; do
        case $opt in
            b) background_code=${OPTARG};;
            t) text_code=${OPTARG};;
            f) format_code=${OPTARG};;
            #K) key=${OPTARG}; keyval_sep_fmt='C';colstart=$((${#key}+2));;
            #v) value=${OPTARG};;
            #a) colstart=${OPTARG}; keyval_sep_fmt='c';;
            #A) colstart=${OPTARG}; keyval_sep_fmt='C';;
            *) error "Unexpected option ${flag}";;
        esac
    done
    # if [ -z "$2" ]; then
        # set_color ${DEFAULT_TEXT_COLOR} ${DEFAULT_BACKGROUND_COLOR}
    # else
        # if [ -z "$3" ]; then
            # set_color $2 ${DEFAULT_BACKGROUND_COLOR}
        # else
            # set_color $2 $3
        # fi
    # fi
    # if [ -z "$4" ]; then
        # underline_code="";
    # else
        # underline_code="${ESCAPE_SEQUENCE}${UNDERLINE_TEXT}m";
    # fi
    # echo -e "${REPLY}${underline_code}${1}${CLOSE_COLOR_ESCAPE_SEQ}"
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
    echo -e "${REPLY}"
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
    while getopts 'c:C:k:K:v:a:A:s:i:' opt; do
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
            *) error "Unexpected option ${flag}";;
        esac
    done
    keystr=$(evaltabs 'key')
    valstr=$(evaltabs 'value')
    keylen=${#keystr}
    paddist=$(( $keylen + ${#keyval_sep}))
    #echo $value,$keylen,$paddist,$keyval_sep,"${valstr}", "o${padding}o"
    coltext -t "${valstr}" -v valcol -s $paddist -S $shift_dist -i $indent -C ${value_color_coding} -P $key_color_coding
    if [[ $keyval_sep_fmt == 'c' ]]
    then
        #textfmt "${valcol}" ${value_color_coding}
        textfmt "${keystr}${keyval_sep}${valcol}" ${key_color_coding}
    elif [[ $keyval_sep_fmt == 'C' ]]
    then
        #textfmt "${valcol}" ${value_color_coding}
        textfmt "${keystr}${keyval_sep}${valcol}" ${key_color_coding}
    else
        #textfmt "${valcol}" ${value_color_coding}
        textfmt "${keystr}${keyval_sep}${valcol}" ${key_color_coding}
    fi
    echo -e "${REPLY}"
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
#----------------------------------------------------------------------------------------------------#
#----------------------------------------------------------------------------------------------------#
#------------------------------------- Data naming/organization -------------------------------------#
#----------------------------------------------------------------------------------------------------#
#----------------------------------------------------------------------------------------------------#
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
#----------------------------------------------------------------------------------------------------#
#----------------------------------------- pCT file parsing -----------------------------------------#
#----------------------------------------------------------------------------------------------------#
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
#----------------------------------------------------------------------------------------------------#
#------------------------------- pCT file/directory path construction -------------------------------#
#----------------------------------------------------------------------------------------------------#
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
function set_current_rdata()
{
    construct_recon_path -o $current_phantom_name -r $current_run_date -n $current_run_number -d $current_preprocessed_date 
    current_rdata=${org_data_path}/${input_path}
    current_lrdata=${tardis_org_data_path}/${input_path}
    echo $current_rdata
    echo $current_lrdata
}
#---------------------------------------------------------------------------------------------------#
#---------------------------------------- pCT Data Manipulation -----------------------------------------#
#--------------------------------------------------------------------------------------------------------#
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
    #################################################################################################
    ######### Determine the run date for the data in the current projection data directory ##########
    #################################################################################################
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
#---------------------------------------------------------------------------------------------------#
#------------------------------------ Code transferring/compilation/execution ------------------------------------#
#-----------------------------------------------------------------------------------------------------------------#
function scp_recon()
{   
    echo -e ${REPLY}
    scp ${user_home}${rcode_subdir_path}${user_folder}/src ${1}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    scp ${user_home}${rcode_subdir_path}${user_folder}/include ${1}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    print_newline
}
function txrecon2all()
{
    print_section "Transferring reconstruction code to all Tardis compute nodes" 1,33  5,40
    print "\nCurrent user: " 0,32;  print "${current_user}" 0,35
    print "\nTransferring to: " 0,32;  print "${tardis_compute_node1_alias}" 0,35
    set_color ${DEFAULT_TEXT_COLOR} ${DEFAULT_BACKGROUND_COLOR} 
    echo -e ${REPLY}
    scp ${user_home}${rcode_subdir_path}${user_folder}/src ${current_user}@${tardis_compute_node1_alias}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    scp ${user_home}${rcode_subdir_path}${user_folder}/include ${current_user}@${tardis_compute_node1_alias}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    print "\nTransferring to: " 0,32;  print "${tardis_compute_node2_alias}" 0,35
    set_color ${DEFAULT_TEXT_COLOR} ${DEFAULT_BACKGROUND_COLOR}
    echo -e $REPLY
    scp ${user_home}${rcode_subdir_path}${user_folder}/src ${current_user}@${tardis_compute_node2_alias}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    scp ${user_home}${rcode_subdir_path}${user_folder}/include ${current_user}@${tardis_compute_node2_alias}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    print "\nTransferring to: " 0,32;  print "${tardis_compute_node3_alias}" 0,35
    set_color ${DEFAULT_TEXT_COLOR} ${DEFAULT_BACKGROUND_COLOR}
    echo -e $REPLY
    scp ${user_home}${rcode_subdir_path}${user_folder}/src ${current_user}@${tardis_compute_node3_alias}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    scp ${user_home}${rcode_subdir_path}${user_folder}/include ${current_user}@${tardis_compute_node3_alias}:${tardis_pct_folder}${rcode_subdir_path}${user_folder}
    print "\nTransferring to: " 0,32;  print "${tardis_compute_node4_alias}" 0,35
   set_color ${DEFAULT_TEXT_COLOR} ${DEFAULT_BACKGROUND_COLOR}
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
    #/ion/pCT_code/Reconstruction/schultze/BaylorICTHUS/pCT_Reconstruction 
    #/ion${home_folder}/ionrecon/pCT_code/Reconstruction/schultze/BaylorICTHUS/pCT_Reconstruction
    #/local/pCT_code/Reconstruction/schultze/BaylorICTHUS/pCT_Reconstruction
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
        print_section "Using compute/sm 35 (default)" 0,34 5,47
        nvcc_cmd="nvcc -std=c++11 -gencode arch=$rcode_compute,code=$rcode_sm ${rcode_flags} ${target_source_code} -o ${rcode_object}"
        print "${nvcc_cmd}" 1,33 5,40
        set_color 0,31 5,40; echo -e $REPLY
        echo -e "$(${nvcc_cmd})"
    else
        if [ -z "$2" ]
        then
            print_section "Using compute/sm ${1} (default)" 0,34 5,47
            nvcc_cmd="nvcc -std=c++11 -gencode arch=compute_$1,code=sm_$1 ${rcode_flags} ${target_source_code} -o ${rcode_object}"
            print "${nvcc_cmd}" 1,33 5,40
            set_color 0,31 5,40; echo -e $REPLY
            echo -e "$(${nvcc_cmd})"      
        else
            if [ $1 -gt $2 ]
            then
                heading_separator="${ESCAPE_SEQUENCE}${RED}$separator_string${ESCAPE_SEQUENCE}${NOCOLOR}"
                echo -e $heading_separator
                echo -e "${RED}ERROR:${LIGHTRED} Incompatible code generation requested\n"
                echo -e "${LIGHTRED}\tThe selected target SM architecture (sm_$2) only supports code generation from compute_$2 or an older instruction set"
                echo -e $heading_separator
            else
                print_section "Using compute_${1}/sm_${2}" 0,34 5,47

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
                 echo -e "${RED}  ERROR:${LIGHTRED} Incompatible code generation requested\n"
                 echo -e "${LIGHTRED}\tTarget SM architecture (sm_$2) only supports code generation from compute_$2 or an older instruction set"
             else
                 nvccgen $1 $2
                 ./recon.out
             fi
         fi
     fi
}
#####################################################################################################
###################################################################################################################
################################################### DEVELOPMENT ###################################################
###################################################################################################################
###################################################################################################################
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
#---------------------------------------------------------------------------------------------------#
#------------------------------------------------------ Git ------------------------------------------------------#
#-----------------------------------------------------------------------------------------------------------------#
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
    if [ $HOSTNAME == "kodiak" -o $HOSTNAME == "n130"  -o $HOSTNAME == "login001" ]
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
#---------------------------------------------------------------------------------------------------#
#------------------------------------ pCT user/data management  ------------------------------------#
#---------------------------------------------------------------------------------------------------#
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
#---------------------------------------------------------------------------------------------------#
#-------------------------- bash array creation/conversion/manipulation  ---------------------------#
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
    local member
    is_member=0
    is_member_var='REPLY'
    echo_on=$FALSE
    return_type=$NUMERIC_TYPE
    for arg in "$@"; do
        shift
        case "$arg" in
            "--numeric")                         set -- "$@" "-n" ;;
            "--bool")                         set -- "$@" "-b" ;;
            "--string"|"text")                         set -- "$@" "-s" ;;
            "--print")                         set -- "$@" "-p" ;;
            "--variable"|"--set-variable")   set -- "$@" "-v" ;;
            "--help")                           set -- "$@" "-h" ;;
            *)                                  set -- "$@" "$arg"
        esac
    done
    while getopts 'nbspv:h' opt; do
        case $opt in
            n) return_type=$STRING_TYPE;;
            b) return_type=$BOOL_TYPE;;
            s) return_type=$STRING_TYPE;;
            p) echo_on=$TRUE;;
            v) is_member_var=${OPTARG};;
            h) usage >&2;;
            *) error "Unexpected option ${flag}";;
        esac
    done
    #case "${myarray[@]}" in  *"two"*) echo "found" ;; esac
    for member in "${@:2}"; do 
        if [[ "$member" == "$1" ]]; then 
            is_member=1
        fi
    done
    refvar_assign $is_member_var is_member
    # if [[ $return_type == $BOOL_TYPE ]]; then 
         
    # elif [[ $return_type == $STRING_TYPE ]]; then 
    
    # fi
    if [[ $echo_on == $TRUE ]]; then 
        echo $is_member
    fi
    return $is_member
    # return_type
    # TRUE_STRING='TRUE'
# FALSE_STRING='FALSE'
# BOOL_TYPE='bool'
# STRING_TYPE='string'
# NUMERIC_TYPE='numeric'
    # return 1
}
function bool_by_type()
{ 
    local OPTIND
    local echo_on=$FALSE
    local bool_type=$NUMERIC_TYPE
    local false_val=0
    local true_val=1  
    for arg in "$@"; do
        shift
        case "$arg" in
            "--numeric")                      set -- "$@" "-n" ;;
            "--bool")                         set -- "$@" "-b" ;;
            "--string"|"text")                set -- "$@" "-s" ;;
            "--print")                        set -- "$@" "-p" ;;
            "--variable"|"--set-variable")    set -- "$@" "-v" ;;
            "--help")                         set -- "$@" "-h" ;;
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
    local bool_val=$1
    bool_type=${2:-$bool_type}
    echo "1=$1, 2=$2, 3=$3"
    if [[ -n $3 ]]; then bool_var=$3; else bool_var='_bool_by_type'; fi
    if [[ $bool_type == $BOOL_TYPE ]]; then 
        false_val=$FALSE
        true_val=$TRUE      
    elif [[ $bool_type == $STRING_TYPE ]]; then 
        false_val=$FALSE_STRING
        true_val=$TRUE_STRING       
    fi
    if [[ $bool_val -eq $TRUE || $bool_val -eq $TRUE_STRING  || $bool_val -eq 1 ]]; then 
        local bool_val_out=$true_val  
    else
        local bool_val_out=$false_val
    fi
    refvar_assign $bool_var bool_val_out
    if [[ $echo_on == $TRUE ]]; then 
        echo $bool_val_out
    fi
}
# bool_by_type 0 ; echo $_bool_by_type 
# bool_by_type 1 ; echo $_bool_by_type 
# bool_by_type 0 $BOOL_TYPE; echo $_bool_by_type 
# bool_by_type 1 $BOOL_TYPE; echo $_bool_by_type 
# bool_by_type 0 $STRING_TYPE; echo $_bool_by_type 
# bool_by_type 1 $STRING_TYPE; echo $_bool_by_type 
# bool_by_type 0 ; echo $_bool_by_type 
# bool_by_type 0 ; echo $_bool_by_type 
#function refvar_assign() { if [[ -n $1 ]]; then eval $1=\"\${$2}\"; fi; }
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
function passarr(){ eval array=("$(echo '${'$1'[@]}')"); }
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
#---------------------------------------------------------------------------------------------------#
#---------------------------------------------- pCT user/login tasks ---------------------------------------------#
#-----------------------------------------------------------------------------------------------------------------#
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
function pbstardisnodeinfo () 
{
    for node in "${allnodes[@]}"; do #  | grep -o "^Mom\K.*"
        node_info=$(pbsnodes "$node" | sed -r -n -e '/Mom|queue|state|pcpus/p')
        node_mom=$(pbsnodes "$node" | sed -r -n -e '/Mom/p')
        node_queue=$(pbsnodes "$node" | sed -r -n -e '/queue/p' )
        node_state=$(pbsnodes "$node" | sed -r -n -e '/state/p' )
        node_pcpus=$(pbsnodes "$node" | sed -r -n -e '/pcpus/p' )
        #echo "node_info=$node_info" 
        node_mom=${node_mom//"     Mom = "/}
        node_queue=${node_queue//"     queue = "/}
        node_state=${node_state//"     state = "/}
        node_pcpus=${node_pcpus//"     pcpus = "/}
        #unknown_state=$( $node_state = *"state-unknown"*)
        #state-unknown,down,offline
        if [[ $node_queue == 'tardis' ]]; then
            tardis_nodes+=($node_mom)
            tardis_node_states+=($node_state)
            tardis_node_pcpus+=($node_pcpus)
            tardis_node_query+=("${node_mom}=${node_state} (pcpus=$node_pcpus)")
            if [[ $node_state != *"state-unknown"* && $node_state != *"down"* && $node_state != *"offline"* ]]; then
                echo "state-unknown"
                avail_tardis_nodes+=($node_mom)
                avail_tardis_node_states+=($node_state)
                avail_tardis_node_pcpus+=($node_pcpus)
                avail_tardis_node_query+=("${node_mom}=${node_state} (pcpus=$node_pcpus)")
            fi      
        fi
        #echo "$node_mom"
        #echo "$node_queue"
        #echo "$node_state"
    done
    echo "${tardis_nodes[@]}"
    echo "${tardis_node_states[@]}"
    echo "${tardis_node_pcpus[@]}"
    echo "${tardis_node_query[@]}"
    echo "${avail_tardis_nodes[@]}"
    echo "${avail_tardis_node_states[@]}"
    echo "${avail_tardis_node_pcpus[@]}"
    echo "${avail_tardis_node_query[@]}"
}
function pbsnodeinfo () 
{
    queue_available_check='FALSE'
    for arg in "$@"; do
        shift
        case "$arg" in
            "--available")                      set -- "$@" "-a" ;;
            "--help")                           set -- "$@" "-h" ;;
            *)                                  set -- "$@" "$arg"
        esac
    done
    while getopts 'a' opt; do
        case $opt in
            a) queue_available_check='TRUE';;
            h) usage >&2;;
            *) error "Unexpected option ${flag}";;
        esac
    done
    node_info=$(pbsnodes "$1" | sed -r -n -e '/Mom|queue|state|pcpus/p')
    node_mom=$(pbsnodes "$1" | sed -r -n -e '/Mom/p')
    node_queue=$(pbsnodes "$1" | sed -r -n -e '/queue/p' )
    node_state=$(pbsnodes "$1" | sed -r -n -e '/state/p' )
    node_pcpus=$(pbsnodes "$1" | sed -r -n -e '/pcpus/p' )
    #echo "node_info=$node_info" 
    node_mom=${node_mom//"     Mom = "/}
    node_queue=${node_queue//"     queue = "/}
    node_state=${node_state//"     state = "/}
    node_pcpus=${node_pcpus//"     pcpus = "/}
    if [[ $node_state != *"state-unknown"* && $node_state != *"down"* && $node_state != *"offline"* ]]; then
        queue_available='FALSE'
    else
        queue_available='TRUE'
    fi
    echo "$1 Queue available: $queue_available"
    echo "node_mom=$node_mom"
    echo "node_queue=$node_queue"
    echo "node_state=$node_state"
    echo "node_pcpus=$node_pcpus"
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