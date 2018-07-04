--------------------------------------------------------------------------------------------------------------------------------------
pCT Tools
--------------------------------------------------------------------------------------------------------------------------------------

#### This repository contains scripts and other tools useful to pCT users.  Bash scripts are executed be entering `./<script_name>` and many have required and/or optional execution parameters/flags that control their behavior.  Users can execute `<script name> -h` to print the script's help dialog, which provides a description of the scripts purpose, usage, and execution parameters/flags.    

#### Bash scripts are sourced by adding `. <path/script_name>`, thereby inserting their code in another script as if it had been written there explicitly.  For example, `load_pct_functions.sh` is sourced by `.bash_profile` so the pCT user functions/shortcuts it defines are automatically loaded and made available to users upon login.
--------------------------------------------------------------------------------------------------------------------------------------
## Contents 
--------------------------------------------------------------------------------------------------------------------------------------
#### **(1)** **_/bash_scripts/.bash_profile_**:              Generic bash profile for pCT users making useful functions, variables, and aliases sourced from `load_pct_functions` available automatically and applying hostname dependent login actions.  
#### **(2)** **_/bash_scripts/pct_user_script.sh_**:              Defines basic aliases and loads functions, variables, and other aliases by sourcing `load_pct_functions.sh`, determines node being logged into and performs node dependent tasks, and prints login information to the console window.  
#### **(3)** **_/bash_scripts/load_pct_functions.sh_**:              Loads functions, variables, and aliases useful for pCT    
#### **(4)** **_/bash_scripts/link_raw_data.sh_**:                    Generates soft data links to raw data files (`/ion/pCT_data/raw_data/<run_date>`) for a particular run date and organizes these in the `/ion/pCT_data/organized_data` directory by phantom name according to the standardized naming/organizational scheme.    
#### **(5)** **_/bash_scripts/link_projection_data.sh_**:             Generates soft data links to preprocessed data files (`/ion/pCT_data/preprocessed_data/<run_date>`) for a particular run date and organizes these in the `/ion/pCT_data/organized_data` directory by phantom name according to the standardized naming/organizational scheme.    
#### **(6)** **_/bash_scripts/rename-files.sh_**:                     Rename preprocessed data files in current folder, changing each file with `.data.root.reco.root.bin` extension to `projection_xxx.bin` for each angle `xxx`.     
#### **(7)** **_stage_preprocessed_data.sh_**:                       Used to stage preprocessed data named/organized for immediate sharing by specifying location of preprocessed_data and corresponding readme.txt file.      
--------------------------------------------------------------------------------------------------------------------------------------
