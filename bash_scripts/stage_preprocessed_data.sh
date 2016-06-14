#!/bin/bash
. /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash_scripts/load_pct_functions.sh

usage="stage_preprocessed_data [-h][-v][-O][-p <README/data path>] [-f <README filename>] -- parse the 'readme' text file included with preprocessed data specifying the filename(s) of the input raw data used as input from which the phantom name, run #/tag(s), and projection angle can be parsed.  

    where:
        -h  show this help text
        -v  verbose terminal output (default: off)
        -O  specifies old date format MMDDYYYY is used (default: YY-MM-DD)
        -d  date of preprocessing (default: parsed from data path '.../Output/<preprocessed date>')
        -p  path to data and readme text file (default: current working directory)
        -f  filename of readme text file (default: readme.txt)"
#local OPTIND
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
stage_preprocessed_data -p $preprocessed_path -f $filename $flag_string

