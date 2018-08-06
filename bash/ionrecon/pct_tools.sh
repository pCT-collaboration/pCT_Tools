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
    char_matches $parent_path "/"
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
function recon_dirs()
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
    #--------------------------------------------------------------------------------------------------#
    conditional_exec $echo_on printc -t 0,33 -b 1,49 --skip='both' "Reading Windows formatted text file..." 
    #--------------------------------------------------------------------------------------------------#
    filename="$1"
    parameters=()
    nicknames=()
    precisions=()
    paramvals=()
    num_paramvals=()
    while read -r line
    do
        line_data_arr=( $(echo "${line[*]}" | pipe_trimall ) )
        echoif $echo_on "${line_data_arr[@]}"
        parameters+=( "${line_data_arr[0]}" )
        nicknames+=( "${line_data_arr[1]}" )
        precisions+=( "${line_data_arr[2]}" )
        if test $(exitcode isfloat -b "${line_data_arr[@]:3}")  == $TRUE_VAL; then 
            current_paramvals="${line_data_arr[@]:3}"
            paramvals+=( $( setprecisions current_paramvals ${line_data_arr[2]} ) )
        else 
            paramvals+=( "${line_data_arr[@]:3}" )
        fi
        num_paramvals+=( $(echo "${line_data_arr[@]:3}" | wc -w) )
    done < "$filename"
    #--------------------------------------------------------------------------------------------------#
    offset=0
    num_paramval_combos=1
    param_values_offsets=()
    paramval_combo_divisors=()
    param_value_repeats=()
    for values_this_param in ${num_paramvals[@]}
    do
        param_values_offsets+=($offset)
        offset=$(($offset + $values_this_param))
        num_paramval_combos=$(($num_paramval_combos*$values_this_param))
        paramval_combo_divisors+=($(($num_paramval_combos)))
    done

    # Calculate repetitions of each value for each parameter to xtruct parameter value combinations (i.e. (3)->(2) )
    for divisor in ${paramval_combo_divisors[@]}
    do
        param_value_repeats+=($(($num_paramval_combos / $divisor)))
    done
    #--------------------------------------------------------------------------------------------------#
    conditional_exec $echo_on print_key_value -s 'before' -A 55 -k "# of reconstructions (hence, # of directories)" -v "$num_paramval_combos" -c 0,32 -C 0,33,6,49
    #--------------------------------------------------------------------------------------------------#
    ####################################################################################################
    #-------- Iterate through cfgvals for each parameter value combination. Parameters/options --------#
    #------ specified w/ explicit/varying values in pct_params.txt are assigned values according ------# 
    #------- to the current parameter value combination, all others are assigned their default --------# 
    #---------- pct_cfgdef.sh defined values: "--param_name param_value # param description. ----------# 
    ####################################################################################################
    #--------------------------------------------------------------------------------------------------#
    conditional_exec $echo_on printc -t 0,33 -b 1,49 -f 4 --skip='both' "Generated reconstruction directory list:"
    #--------------------------------------------------------------------------------------------------#
    directories=()
    for i in `seq 0 $(( num_paramval_combos - 1 )) | tr '\n' ' '`
    do
        paramval_combo_index=0
        paramval_index=0
        combo_values_indices=()
        directory=''
        get_combo_index $i num_paramvals param_values_offsets param_value_repeats combo_values_indices
        #echo "combo_values_indices=${combo_values_indices[@]}"
        # for reps in ${param_value_repeats[@]}
        # do
            # div=$(($i / $reps))
            # modv=$(($div % ${num_paramvals[$paramval_combo_index]}))
            # param_values_index=$(($modv + ${param_values_offsets[$paramval_combo_index]}))
            # combo_values_indices+=($param_values_index)
            # paramval_combo_index=$(($paramval_combo_index+1))
        # done
        
        # Construct cfg file output string, combining parameter names/values/descriptions with the user supplied parameter values replacing the default values when the list reaches the corresponding parameter name for each of the combinations of user supplied parameter values  
        for parameter in `seq 0 $((${#parameters[@]} - 1)) | tr '\n' ' '`
        do
            next_param_values_index=${combo_values_indices[$paramval_index]}
            paramval=${paramvals[$next_param_values_index]}
            paramval_index=$(($paramval_index+1))
            if [[ -z "$directory" ]]; then prefix="$EMPTY_STRING"; else prefix="${directory}_"; fi
            directory="${prefix}${parameters[${parameter}]}_${paramval}"
        done    
        directories+=( "${directory}" )
        echoif $echo_on "directory=${directory}"
    done   
    recon_dirs_var=${2:-REPLY}
    refarr_assign $recon_dirs_var directories
}
function recon_dir_repeats()
{
    dir_repeats=()
    for dir in ${dirs[@]}; do 
        reps=( $(ls -d ${dir}* | tr '\n' ' '))
        dir_repeats+=( ${#reps[@]} )
        echo "dir=$dir (${#reps[@]})"
    done
    recon_dir_repeats_var=${1:-REPLY}
    refarr_assign $recon_dir_repeats_var dir_repeats
}
function recon_dir_count()
{
    dir_repeats=()
    dircount=0
    for dir in ${dirs[@]}; do 
        reps=( $(ls -d ${dir}* | tr '\n' ' '))
        dir_repeats+=( ${#reps[@]} )
        dircount=$(( dircount + ${#reps[@]} ))
        #echo "dir=$dir (${#reps[@]})"
    done
    recon_dir_count_var=${1:-REPLY}
    refvar_assign $recon_dir_count_var dircount
}
#recon_dirs -p "/ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/Test_Parameters_1_win.txt" dirs
