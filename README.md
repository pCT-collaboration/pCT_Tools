=============
pCT_Tools
=============
#####This repository contains scripts and other tools useful for pCT users.  Users can get help on these scripts by entering `<script name> -h`, which will print a help dialog for the bash script including a description of the scripts purpose, usage, and execution options.    
------------
##Contents
------------
**(1)** **_/bash_scripts/load_pct_functions.sh_**:              Loads functions, variables, and aliases useful for pCT    
**(2)** **_/bash_scripts/link_raw_data.sh_**:                    Generates soft data links to raw data files (`/ion/pCT_data/raw_data/<run_date>`) for a particular run date and organizes these in the `/ion/pCT_data/organized_data` directory by phantom name according to the standardized naming/organizational scheme.    
**(3)** **_/bash_scripts/link_projection_data.sh_**:             Generates soft data links to preprocessed data files (`/ion/pCT_data/preprocessed_data/<run_date>`) for a particular run date and organizes these in the `/ion/pCT_data/organized_data` directory by phantom name according to the standardized naming/organizational scheme.    
**(4)** **_/bash_scripts/rename-files.sh_**:                     Rename preprocessed data files in current folder, changing each file with `.data.root.reco.root.bin` extension to `projection_xxx.bin` for each angle `xxx`. 
