#!/bin/bash
usage="$(basename "$0") [-h] [-p <path>] [-i <theta>][-E][-G][-T][-P][-R] -- program to generate and organize soft links to preprocessed data files organized by run date

Unless otherwise specified using execution parameters, this script assumes it is being executed from the directory containing the preprocessed data and that it is experimental.  

Execution parameters/flags:
    -h  show this help text
    -p  path to raw data
    -E  Experimental data flag (default)
    -G  GEANT4 simulated data flag
    -T  TOPAS simulated data flag
    -i  angle interval, if applicable"
######################################################################################################################################
########################### Determine the run date for the data in the current projection data directory #############################
######################################################################################################################################
pct_data_parent="/ion/pCT_data"
raw_data_folder="raw_data"
preprocessed_data_folder="preprocessed_data"
organized_data_folder="organized_data"
experimental_data_folder="Experimental"
simulated_data_folder="Simulated"
raw_data_folder="raw_data"
GEANT4_run_data_prefix="G_"
TOPAS_run_data_prefix="T_"
raw_link_folder="Input"
projection_link_folder="Output"

execution_path=$PWD
data_path=$PWD  
error_flag="false"                                                          # Initialize error_flag indicating unknown Phantom ID 
angle_interval=4  
scan_type='Experimental' 
data_type='Raw'

scan_type_folder="${experimental_data_folder}"
data_type_folder="${raw_data_folder}"
run_date_folder_prefix=""
link_folder="${raw_link_folder}"
manual_preprocessed_data='false'
while getopts 'd:D:p:i:t:hEGTPR' opt; do
    case $opt in
        h) echo "${usage}"; exit 0;;
        d) run_date="${OPTARG}";;
        D) preprocessed_date="${OPTARG}"; manual_preprocessed_data='true';;
        p) run_date="${OPTARG##*/}";;
        i) printf -v angle_interval "%d" ${OPTARG};;
        E) scan_type_folder="${experimental_data_folder}";;
        G) run_date_folder_prefix="${GEANT4_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;
        T) run_date_folder_prefix="${TOPAS_run_data_prefix}"; scan_type_folder="${simulated_data_folder}";;
        R) data_type_folder="${raw_data_folder}"; link_folder="${raw_link_folder}";;
        P) data_type_folder="${preprocessed_data_folder}"; link_folder="${raw_link_folder}";;
        *) error "Unexpected option ${flag}";;
    esac
done
run_date_folder="${run_date_folder_prefix}${run_date}"                                          # Extract run date from last directory in the path
data_path="${pct_data_parent}/${data_type_folder}/${run_date_folder}"
pCT_path=${data_path%%${data_type_folder}*}   

echo  "Data type folder:$data_type_folder"
echo "Source data path: $data_path"
echo "Run date: $run_date"
echo  "Execution path:$execution_path"
echo  "pCT data parent directory:$pCT_path"                                 # Print path to pCT data directory to terminal windowecho  "$data_type data source path:$data_directory"
echo  "Scan Type: ${scan_type}"                                         # Extract pCT data path from projection data path
cd "${data_path}"
#exit 0
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
            if [[ $data_type_folder == "${raw_data_folder}" ]]
            then
                echo "/------------------------------------------------------------------------------/"
                link_path="${pCT_path}organized_data/${object_name}/${scan_type_folder}/${run_date_folder}/${run_num}/${link_folder}/"
                link_file="raw_${angle_str}.bin"
                echo "Raw data filename = $file"
            elif [[ $data_type_folder == "${preprocessed_data_folder}" ]]
            then
                if [[ manual_preprocessed_data == 'false' ]]
				then
					if [[ $angle == 0 ]]; then preprocessed_date=$(date +"%y-%m-%d" -r "${data_file}"); echo hello; fi                                                # Extract run date from last directory in the path            
                fi
				link_path="${pCT_path}organized_data/${object_name}/${scan_type_folder}/${run_date_folder}/${run_num}/${link_folder}/${preprocessed_date}/"
                link_file="projection_${angle_str}.bin"
                echo "Projection data filename = $file"
                echo "Preprocessed date = ${preprocessed_date}"
            fi
            ##########################################################################################################################
            ################### Print scan properties/characteristics and directory/file names of data and links## ###################
            ##########################################################################################################################
            echo "Object Name = ${object_name}"
            echo "Run # = ${run_num}"
            echo -e "Link destination = ${link_path}${link_file}"
            ##########################################################################################################################
            ############## Create appropriate directories/subdirectories and create/organize the projection data links ###############
            ##########################################################################################################################
            #mkdir -p "${link_path}"                                         # Create directories/subdirectories for links
            #ln -s "${data_path}/${data_file}" "${link_path}${link_file}"    # Create the soft links to the projection data
        fi
        if [[ $error_flag == "true" ]]
        then
            echo "ERROR: Unknown Phantom ID '$objectID' encountered"
            error_flag=false;
            break
        fi
    done
done
