#!/bin/bash
###################################################################################################
#-------------- Source pCT (1) constant variable and (2) function definition scripts -------------#
###################################################################################################
#-------------------------------------------------------------------------------------------------#
# source /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/ionrecon/bashvars.sh
# source /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/ionrecon/bash_tools.sh
# source /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/ionrecon/pct_tools.sh
# . /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/bashvars.sh
# . /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/bash_tools.sh
# . /ion/pCT_code/git/pCT-collaboration/pCT_Tools/bash/pct_tools.sh
source bashvars.sh
source bash_tools.sh
source pct_tools.sh
#. bashvars.sh
#. bash_tools.sh
#. pct_tools.sh
####################################################################################################
#------- Calculate the (1) # of parameter value combinations, (2) # of repetitions of each --------#
#----- value for each parameter by (3) 1st calculating the # of combinations possible from the ----#
#------ remainder of parameter values of subsequent (higher index) parameters (i.e. divisor) ------#
####################################################################################################
filename="Test_Parameters_1_win.txt"
#--------------------------------------------------------------------------------------------------#
print "\nReading Windows formatted text file...\n" 0,33 1,49
#--------------------------------------------------------------------------------------------------#
function setprecision() { echo "scale=$2; $1/1" | bc | sed -r 's/^(-?)\./\10./'; }
function setprecisions() 
{ 
    local valsname=$1[@]
    local vals=("${!valsname}")
    local setvals=()
    for val in ${vals[@]}
    do
        setvals+=( $(setprecision $val $2) )
    done
    setprecisions_var=${3:-REPLY}
    refarr_assign $setprecisions_var setvals
    echo "${setvals[@]}"
}
parameters=()
nicknames=()
precisions=()
paramvals=()
num_paramvals=()
while read -r line
do
    line_data_arr=( $(echo "${line[*]}" | pipe_trimall ) )
    echo "${line_data_arr[@]}"
    parameters+=( "${line_data_arr[0]}" )
    nicknames+=( "${line_data_arr[1]}" )
    #precision="${line_data_arr[2]}"
    #precision="0.${line_data_arr[2]}f"
    precisions+=( "${line_data_arr[2]}" )
    if test $(exitcode isfloat -b "${line_data_arr[@]:3}")  == $TRUE_VAL; then 
 #       
 #       paramvals_elem=$( setprecisions line_data_arr ${line_data_arr[2]} )
        current_paramvals="${line_data_arr[@]:3}"
        paramvals+=( $( setprecisions current_paramvals ${line_data_arr[2]} ) )
    else 
        paramvals+=( "${line_data_arr[@]:3}" )
    fi
    num_paramvals+=( $(echo "${line_data_arr[@]:3}" | wc -w) )
done < "$filename"
#--------------------------------------------------------------------------------------------------#
echo "parameters=${parameters[@]}"
echo "nicknames=${nicknames[@]}"
echo "precisions=${precisions[@]}"
echo "paramvals=${paramvals[@]}"  
echo "num_paramvals=${num_paramvals[@]}"  
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
echo "param_values_offsets=${param_values_offsets[@]}"
echo "paramval_combo_divisors=${paramval_combo_divisors[@]}"
echo "paramval_combo_divisors=${paramval_combo_divisors[@]}"
echo "param_value_repeats=${param_value_repeats[@]}"  
#--------------------------------------------------------------------------------------------------#
print_key_value -s 'both' -A 55 -k "# of parameter value combinations" -v "$num_paramval_combos" -c 0,32 -C 0,33,6,49
print_key_value -s 'after' -A 55 -k "total # of reconstructions to be performed (hence, # of directories)" -v "$num_paramval_combos" -c 0,32 -C 0,33,6,49
#--------------------------------------------------------------------------------------------------#
####################################################################################################
#-------------------------------- Print pCT configuration file info -------------------------------#
####################################################################################################
#--------------------------------------------------------------------------------------------------#
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
#-------- Iterate through cfgvals for each parameter value combination. Parameters/options --------#
#------ specified w/ explicit/varying values in pct_params.txt are assigned values according ------# 
#------- to the current parameter value combination, all others are assigned their default --------# 
#---------- pct_cfgdef.sh defined values: "--param_name param_value # param description. ----------# 
####################################################################################################
#--------------------------------------------------------------------------------------------------#
print "\nGenerated reconstruction directory list:\n" 0,33 1,49 4
#--------------------------------------------------------------------------------------------------#
#local cfg_filenum=1
directories=()
for i in `seq 0 $(( num_paramval_combos - 1 ))`
do
    paramval_combo_index=0
    paramval_index=0
    combo_values_indices=()
    directory=''
    get_combo_index $i num_paramvals param_values_offsets param_value_repeats combo_values_indices
    echo "combo_values_indices=${combo_values_indices[@]}"
    
    # Construct cfg file output string, combining parameter names/values/descriptions with the user supplied parameter values replacing the default values when the list reaches the corresponding parameter name for each of the combinations of user supplied parameter values  
    for parameter in `seq 0 $((${#parameters[@]} - 1))`
    do
        next_param_values_index=${combo_values_indices[$paramval_index]}
        paramval=${paramvals[$next_param_values_index]}
        paramval_index=$(($paramval_index+1))
        #echo "next_param_values_index=${next_param_values_index}"
        #echo "paramval=${paramval}"
        #echo "paramval_index=${paramval_index}"
        if [[ -z "$directory" ]]; then prefix="$EMPTY_STRING"; else prefix="${directory}_"; fi
        directory="${prefix}${parameters[${parameter}]}_${paramval}"
        #directory[$parameter]="--${parameters[${parameter}]} ${paramval} ${optdesc[${parameter}]}"
    done    
    directories+=( "${directory}" )
    echo "directory=${directory}"
done   
#--------------------------------------------------------------------------------------------------#
echo "directories:\n${directories[@]}"
#--------------------------------------------------------------------------------------------------#
#return 1
exit 1
