//PRINT_STATUS										= true;
//C:\Users\Blake\Documents\GitHub\pCT-collaboration\pCT_Tools\ImageJ
macro "merge_data"
{
	//***************************************************************************************************************************************************************************************************//
	//************* Execution control Booleans and general parameter value test and multiplot behavior Booleans ************************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	simulated_scan 														= false;
	experimental_scan 													= !simulated_scan;
	log_printing														= true;			
	exporting_log														= false;		
	debug_path_printing													= false;
	printing_ROI_definitions											= true;		
	printing_reconstructed_image_analysis_info							= true;
	printing_PVT_info													= true;
	printing_multiplot_parameter_info									= true;	
	print_ROI_definitions_path											= false;		
	print_directories_created											= false;	
	print_input_data_path												= false;
	print_input_CSV_path												= false;
	print_input_TXT_path												= false;
	print_input_PNG_paths												= false;
	print_output_CSV_path												= true;
	print_output_TXT_path												= true;
	print_output_PNG_paths												= false;
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************ CSV file merging Booleans ************************************************************************************//
	//***************************************************************************************************************************************************************************************************//			
	perform_data_merging												= true;	
	merge_ROI_analysis_CSVs												= true;
	merge_ROI_analysis_RSP_Error_CSVs									= true;
	merge_ROI_analysis_RSP_CSVs											= true;
	merge_ROI_analysis_Std_Dev_CSVs										= true;
	merge_TV_CSVs														= true;
	merge_multiplot_CSVs												= true;
	merge_multiplot_RSP_Error_CSVs										= true && merge_multiplot_CSVs;
	merge_multiplot_RSP_CSVs											= true && merge_multiplot_CSVs;
	merge_multiplot_Std_Dev_CSVs										= true && merge_multiplot_CSVs;
	merge_multiplot_TV_CSVs												= true  && merge_multiplot_CSVs;
	write_merged_data 													= true;
	write_merged_CSV_data 												= true && write_merged_data;
	write_merged_TXT_data 												= true && write_merged_data;
	write_merged_RSP_CSV_data 											= true && write_merged_CSV_data;
	write_merged_RSP_Error_CSV_data 									= true && write_merged_CSV_data;
	write_merged_Std_Dev_CSV_data 										= true && write_merged_CSV_data;
	write_merged_TV_CSV_data 											= true && write_merged_CSV_data;
	write_merged_RSP_TXT_data 											= true && write_merged_TXT_data;
	write_merged_RSP_Error_TXT_data 									= true && write_merged_TXT_data;
	write_merged_Std_Dev_TXT_data 										= true && write_merged_TXT_data;
	write_merged_TV_TXT_data 											= true && write_merged_TXT_data;
	overwrite_merged_data 												= false;
	overwrite_merged_CSV_data 											= true && overwrite_merged_data;
	overwrite_merged_TXT_data 											= true && overwrite_merged_data;
	overwrite_merged_RSP_CSV_data 										= true && overwrite_merged_CSV_data;
	overwrite_merged_RSP_Error_CSV_data 								= true && overwrite_merged_CSV_data;
	overwrite_merged_Std_Dev_CSV_data 									= true && overwrite_merged_CSV_data;
	overwrite_merged_TV_CSV_data 										= true && overwrite_merged_CSV_data;
	overwrite_merged_RSP_TXT_data 										= true && overwrite_merged_TXT_data;
	overwrite_merged_RSP_Error_TXT_data 								= true && overwrite_merged_TXT_data;
	overwrite_merged_Std_Dev_TXT_data 									= true && overwrite_merged_TXT_data;
	overwrite_merged_TV_TXT_data 										= true && overwrite_merged_TXT_data;
	write_merged_multiplot_data 										= true;
	write_merged_multiplot_CSV_data 									= true && write_merged_multiplot_data;
	write_merged_multiplot_TXT_data 									= true && write_merged_multiplot_data;
	write_merged_multiplot_RSP_CSV_data 								= true && write_merged_multiplot_CSV_data;
	write_merged_multiplot_RSP_Error_CSV_data 							= true && write_merged_multiplot_CSV_data;
	write_merged_multiplot_Std_Dev_CSV_data 							= true && write_merged_multiplot_CSV_data;
	write_merged_multiplot_TV_CSV_data 									= true && write_merged_multiplot_CSV_data;
	write_merged_multiplot_RSP_TXT_data 								= true && write_merged_multiplot_TXT_data;
	write_merged_multiplot_RSP_Error_TXT_data 							= true && write_merged_multiplot_TXT_data;
	write_merged_multiplot_Std_Dev_TXT_data 							= true && write_merged_multiplot_TXT_data;
	write_merged_multiplot_TV_TXT_data 									= true && write_merged_multiplot_TXT_data;
	overwrite_merged_multiplot_data 									= false;
	overwrite_merged_multiplot_CSV_data 								= true && overwrite_merged_multiplot_data;
	overwrite_merged_multiplot_TXT_data 								= true && overwrite_merged_multiplot_data;
	overwrite_merged_multiplot_RSP_CSV_data 							= true && overwrite_merged_multiplot_CSV_data;
	overwrite_merged_multiplot_RSP_Error_CSV_data 						= true && overwrite_merged_multiplot_CSV_data;
	overwrite_merged_multiplot_Std_Dev_CSV_data 						= true && overwrite_merged_multiplot_CSV_data;
	overwrite_merged_multiplot_TV_CSV_data 								= true && overwrite_merged_multiplot_CSV_data;
	overwrite_merged_multiplot_RSP_TXT_data 							= true && overwrite_merged_multiplot_TXT_data;
	overwrite_merged_multiplot_RSP_Error_TXT_data 						= true && overwrite_merged_multiplot_TXT_data;
	overwrite_merged_multiplot_Std_Dev_TXT_data 						= true && overwrite_merged_multiplot_TXT_data;
	overwrite_merged_multiplot_TV_TXT_data 								= true && overwrite_merged_multiplot_TXT_data;
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************ Define Boolean constants *************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	INTERNAL_MACRO_CALLER							= true;
	EXTERNAL_MACRO_CALLER							= false;
	IJIO_CONFIG_OPTIONS_ON							= true;
	IJIO_CONFIG_OPTIONS_OFF							= false;
	CLOSE_WINDOW									= true;
	DONT_CLOSE_WINDOW								= false;	
	CLOSE_PNG										= true;
	DONT_CLOSE_PNG									= false;
	MAKE_TOP_DIR									= true;
	DONT_MAKE_TOP_DIR								= false;
	MAKE_TOP_DIRECTORY								= true;
	DONT_MAKE_TOP_DIRECTORY							= false;
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	ALL_BOOL 										= false;
	NONE_BOOL 										= true;
	AND_LOGIC 										= true;
	OR_LOGIC 										= false;
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	FORCE_VALUE_2_ARRAY								= true;
	DONT_FORCE_VALUE_2_ARRAY						= false;
	ARRAY_FILL_CYCLIC								= true;
	ARRAY_FILL_DUPLICATE							= false;
	RETURN_MATCH_INDEX								= true;
	RETURN_MATCH_TF									= false;
	RETURN_FORCE_ARRAY								= true;
	RETURN_DONT_FORCE_ARRAY							= false;
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	PRINT_MAJOR_SECTION								= true;
	PRINT_MINOR_SECTION								= false;	
	PRINT_IO_INFO									= true;
	DONT_PRINT_IO_INFO								= false;	
	PRINT_PATH										= true;
	DONT_PRINT_PATH									= false;	
	PRINT_DIRECTORIES_CREATED						= true;
	DONT_PRINT_DIRECTORIES_CREATED					= false;
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	USE_TAB_CMD_STRING								= true;
	USE_TAB_SPACES_STRING							= false;
	IMPLICATION_ARROW								= true;
	DASH_SHAFT_ARROW								= false;
	REMOVE_TRAILING_ZEROS							= true;
	DONT_REMOVE_TRAILING_ZEROS						= false;
	SHORTEN_STRINGS									= true;
	DONT_SHORTEN_STRINGS							= false;	
	RETURN_PRECISIONS								= true;
	RETURN_STRINGS									= false;
	STRING_ADD_SPACES								= true;
	STRING_DONT_ADD_SPACES							= false;
	MULTIVALUE_ONLY_ON								= true;
	MULTIVALUE_ONLY_OFF								= false;
	REMOVE_PARAMETER_VALUE_ONLY						= true;
	REMOVE_PARAMETER_PREFIX_AND_VALUE				= false;
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	COLUMN_MAJOR									= true;
	ROW_MAJOR										= false;
	COLUMN_ORDER									= true;
	ROW_ORDER										= false;
	SERIES_SUMMATION								= true;
	SERIES_PRODUCT									= false;
	SERIES_OP_UP_TO_INDEX							= true;
	SERIES_OP_FROM_INDEX							= false;
	SWITCH_OPERANDS									= true;
	DONT_SWITCH_OPERANDS							= false;
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	RETURN_ERROR_CODE								= -1;
	BOOL_CONVERSION									= -1;
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	PRINTING_ON										= 0;
	PRINTING_OFF									= 1;	
	PRINTING_GROUPS									= 2;	
	PRINTING_VARS									= 3;	
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	MULTIPLICATION									= 0;
	DIVISION										= 1;
	ADDITION										= 2;
	SUBTRACTION										= 3;
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	ARRAY_HAS_NUMBERS								= 1;
	ARRAY_HAS_STRINGS								= 2;
	ARRAY_HAS_MIXED_TYPE							= 3;
	IS_NOT_ARRAY									= -1;
	IS_EMPTY_ARRAY									= 0;
	IS_NUMBER_ARRAY									= 1;
	IS_STRING_ARRAY									= 2;
	IS_MIXED_ARRAY									= 3;
	RETURN_MIN										= 0;
	RETURN_MAX 										= 1;
	RETURN_MINMAX									= 2;
	PRINT_MATCH										= 0;
	DONT_PRINT_MATCH								= 1;
	THROW_MISMATCH_ERROR							= 2;
	DONT_THROW_MISMATCH_ERROR						= 4;
	ARRAY_VALUES_RANGE_TYPE_BRACKETED				= 0;										// Parameter value range string construction form: <label>[#-#]
	ARRAY_VALUES_RANGE_TYPE_EQUALS					= 1;										// Parameter value range string construction form: <label> = [#-#]
	ARRAY_VALUES_RANGE_TYPE_UNDERSCORED				= 2;										// Parameter value range string construction form: <label>_[#-#]
	ARRAY_VALUES_RANGE_OMIT_SINGLE_VALUE			= 0;										// Parameter value range string construction for non-multivalue parameter: <label>[#]
	ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE			= 1;										// Parameter value range string construction for non-multivalue parameter: <label>=#
	ARRAY_VALUES_RANGE_EQUALS_SINGLE_VALUE			= 2;										// Parameter value range string construction for non-multivalue parameter: omit <label> & value info string
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	ARRAY_SLICING_VALUES_BELOW						= 0;
	ARRAY_SLICING_VALUES_EQUAL						= 1;
	ARRAY_SLICING_VALUES_ABOVE						= 2;
	ARRAY_SLICING_VALUES_UNEQUAL					= 3;
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	RETURN_SPLIT_STRINGS							= 0;
	RETURN_SPLIT_PREFIXES							= 1;
	RETURN_SPLIT_VALUES								= 2;
	RETURN_SPLIT_SHORT_VALUES						= 3;
	RETURN_EQUALS_STRINGS							= 4;
	RETURN_PADDED_EQUALS_STRINGS					= 5;
	RETURN_EQUALS_SHORT_STRINGS						= 6;
	RETURN_PADDED_EQUALS_SHORT_STRINGS				= 7;
	RETURN_NEW_STRINGS								= 3;
	RETURN_NEW_VALUES								= 4;
	RETURN_NEW_PREFIXES								= 5;
	REMOVE_PARAMETER_STRING							= 0;
	REMOVE_VALUE_STRINGS							= 1;
	INSERT_PARAMETER_STRING_BEFORE					= 2;
	INSERT_PARAMETER_STRING_AFTER					= 3;
	REPLACE_PARAMETER_STRING						= 4;
 	REFORMAT_PARAMETER_VALUES_STRING				= 5;
 	REFORMAT_PARAMETER_VALUE_STRINGS				= 5;
//	CONVERT_VALUES_2_RANGES							= 8;
//	CONVERT_RANGES_2_VALUES							= 9;
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************ Define numeric constants *************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	LOOP_LOWER_BOUND								= 0;
	LOOP_UPPER_BOUND								= 1;
	TOLERANCE										= 0.0000001;								// Tolerance separating min/max values of array used in findMinima/findMaxima
	DASHES_PER_CHAR 								= 1.3;										// Average width of a character in terms of the width of a dash character 
	NUM_TAB_SPACES 									= 8;
	FLOAT_ARRAY_2_FILE_PRECISION					= 6;										// Precision to use for writing TV reduction values to CSV files
	MIN_SUM_ARROW_LENGTH							= 3;
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************ Define array constants *************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	EMPTY_ARRAY 									= newArray();								// Passed to set_plot_extrema when no additional lines are plotted
	SEQUENTIAL_VALUES_ARRAY							= Array.getSequence(100);					// Long sequential values array which other sequence arrays can be sliced from	
//	POWERS_OF_2										= newArray(0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512);
	POWERS_OF_2										= array_powers_of_2(14);
	MISSING_COLUMN_RESULTS 							= newArray("null", NaN);
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************* Define string constants *************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	FOLDER_SEPARATOR								= File.separator;
	TXT 											= ".txt";
	CSV 											= ".csv";
	PNG 											= ".png";
	GIF 											= ".gif";
	AVI 											= ".avi";
	IJM 											= ".ijm";
	EMPTY_STRING 									= "";										// String constant: empty string
	SPACE_STRING 									= " ";										// String constant: space character string
	UNDERSCORE_STRING 								= "_";										// String constant: underscore character string
	COMMA_STRING 									= ",";										// String constant: comma character string
	DECIMAL_STRING 									= ".";										// String constant: decimal character string
	PERIOD_STRING 									= ".";										// String constant: period character string
	EQUALS_STRING 									= "=";										// String constant: equals character string
	PLUS_SIGN_STRING 								= "+";										// String constant: equals character string
	DASH_STRING 									= "-";										// String constant: dash character string
	RIGHT_CARAT_STRING 								= ">";										// String constant: right carat character string
	LEFT_BRACKET_STRING 							= "[";										// String constant: right carat character string
	RIGHT_BRACKET_STRING 							= "]";										// String constant: right carat character string
	NEWLINE_CMD_STRING								= "\n";
	TAB_CMD_STRING									= "\t";
	TAB_AS_SPACES_STRING							= string_tab_construction(USE_TAB_SPACES_STRING, NUM_TAB_SPACES);	
	TAB_STRING										= string_tab_construction(exporting_log, NUM_TAB_SPACES);	
	PADDED_EQUALS_STRING 							= SPACE_STRING + EQUALS_STRING + SPACE_STRING;
	PADDED_PLUS_SIGN_STRING							= SPACE_STRING + PLUS_SIGN_STRING + SPACE_STRING;
	TRUE_STRING											= "true";
	FALSE											= "false";
	add_operation									= "add";
	multiply_operation								= "multiply";
	BOOL_TRUE_STRING								= "True";
	BOOL_FALSE_STRING								= "False";
	x_direction										= "x";
	y_direction										= "y";	 					
	OVAL_SELECTION									= "oval";
	CENTERED_SELECTION								= "centered";
	circular_ROI									= "circle";
	square_ROI										= "square";		
	no_compression									= "None";
	JPEG_compression								= "JPEG";
	PNG_compression									= "PNG";
	ROI_definition_numbers_decoding_op				= "parseFloat";	
	ROI_definition_strings_decoding_op				= "none";	
	ROI_material_RSP_column_label 					= "Predicted RSP";
	RSP_error_column_label 							= "% Error";
	mean_column_label 								= "Mean";	
	COLUMN_SUM_ROW_LABEL 							= "Sum";	
	TV_before_TVS_label 							= "TV: Before TVS";	
	TV_after_TVS_label 								= "TV: After TVS";
	TV_reduction_label 								= "TVS TV Reduction";
	TV_table_titles									= newArray(TV_before_TVS_label, TV_after_TVS_label, TV_reduction_label);
	MONTH_NAMES 									= newArray("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
	DAY_NAMES 										= newArray("Sun", "Mon","Tue","Wed","Thu","Fri","Sat");
	ASK_KILL_DIALOG_TITLE							= "Continue or cancel execution?";
	ASK_KILL_DIALOG_STATEMENT						= "Select 'OK' to continue or 'Cancel' to halt execution";
	//***********************************************************************************************************************************************************************************************************//
	//******************************************************* Execution status/progress logging variables and printing properties, settings, and control ********************************************************//
	//***********************************************************************************************************************************************************************************************************//
	//PRINT_STATUS									= PRINT_ON();
	//PRINT_STATUS									= PRINT_OFF();
	//PRINT_STATUS									= PRINT_GROUPVARS_ONLY();
	PRINT_STATUS									= PRINT_SEPVARS_ONLY();
	num_input_data_sets 							= 0;
	num_loops 										= 0;
	debug_print_counter								= 1;
	//***********************************************************************************************************************************************************************************************//
	//******************************************************** Construct commonly used strings for parameter values and files/folders ***************************************************************//
	//***********************************************************************************************************************************************************************************************//			
	//loop_bounds									= newArray(0, 1);
	INPUT_FILE_LIST 								= newArray();   		
	OUTPUT_FILE_LIST								= newArray();
	CSV_OUTPUT_FILE_LIST							= newArray();
	COPIED_FILE_LIST								= newArray();
	COPIED_FILE_FROM_LIST							= newArray();
	COPIED_FILE_TO_LIST								= newArray();
	DIRECTORIES_CREATED								= newArray();
	//***********************************************************************************************************************************************************************************************//
	//***************************************************************************** Set reconstruction data directory/file info *********************************************************************//
	//***********************************************************************************************************************************************************************************************//
	IJ_plugins_directory							= getDirectory("plugins");
	IJ_macro_directory								= getDirectory("macros");
	IJ_program_directory							= getDirectory("imagej") ;
	IJ_launch_directory								= getDirectory("startup");
	USER_HOME_DIRECTORY								= getDirectory("home");
	IJ_previous_macro								= getInfo("macro.filepath");
	github_macro_directory_Baylor_ICTHUS			= "C:\\Users\\Blake\\Documents\\GitHub\\Baylor_ICTHUS\\pCT_Reconstruction\\Tools\\ImageJ";
 	github_macro_directory_pCT_Collaboration		= "C:\\Users\\Blake\\Documents\\GitHub\\pCT-collaboration\\pCT_Tools\\ImageJ";
 	reconstruction_data_directory_drive_C			= "C:\\Users\\Blake\\Documents\\Education\\Research\\pCT\\pCT_data\\reconstruction_data";
	reconstruction_data_directory_drive_D			= "D:\\pCT\\pCT_data\\reconstruction_data";
	autobreak_filename 								= "autobreak.txt";
	material_RSP_defs_filename 						= "material_RSP_defs.txt";
	ROI_analysis_macro_filename 					= "ROI_Analysis.ijm";
	multiplotting_macro_filename 					= "Multiplotting.ijm";
	test_result_comparison_macro_filename 			= "Test_Result_Comparison.ijm";
	auto_break_path 								= IJ_macro_directory + autobreak_filename;
	material_RSP_defs_path 							= IJ_macro_directory + material_RSP_defs_filename;
	ROI_analysis_macro_path 						= github_macro_directory_pCT_Collaboration + FOLDER_SEPARATOR + ROI_analysis_macro_filename;
	multiplotting_macro_path 						= github_macro_directory_pCT_Collaboration + FOLDER_SEPARATOR + multiplotting_macro_filename;
	test_result_comparison_macro_path 				= github_macro_directory_pCT_Collaboration + FOLDER_SEPARATOR + test_result_comparison_macro_filename;
	print_ImageJ_info								();

	reconstruction_data_folder						= FOLDER_SEPARATOR + "reconstruction_data";
	simulated_data_folder							= FOLDER_SEPARATOR + "Simulated";
	experimental_data_folder						= FOLDER_SEPARATOR + "Experimental";
	output_folder									= FOLDER_SEPARATOR + "Output";
	geant4_data_folder_basename						= FOLDER_SEPARATOR + "G_";
	phantom_basename								= "CTP404_Sensitom";
	//phantom_basename								= "CTP404_Sensitom_4M";
	phantom_name_folder								= FOLDER_SEPARATOR + phantom_basename;
	run_date										= "15-05-24";
	//run_date 										= "14-12-11";
	run_date_folder									= geant4_data_folder_basename + run_date;
	run_number_folder								= FOLDER_SEPARATOR + "0001";
	preprocess_date_folder							= FOLDER_SEPARATOR + "15-05-24";
	//preprocess_date								= FOLDER_SEPARATOR + "14-12-11";
	
	// Options controlling construction of reconstruction_data_directory/test_batch_directory
	simulated_data									= "Simulated";
	experimental_data								= "Experimental";	
	drive_C											= "C";
	drive_D											= "D";
	current_reconstruction_data_drive				= "D";
	current_reconstruction_data_type				= experimental_data;
	
	if												(current_reconstruction_data_drive == drive_C)				
		reconstruction_data_directory 				= reconstruction_data_directory_drive_C;
	else if											(current_reconstruction_data_drive == drive_D)			
		reconstruction_data_directory 				= reconstruction_data_directory_drive_D;
	if												(current_reconstruction_data_type == simulated_data) 			
		test_batch_directory 						= reconstruction_data_directory + phantom_name_folder + simulated_data_folder + run_date_folder + run_number_folder + output_folder + preprocess_date_folder + FOLDER_SEPARATOR;
	else if											(current_reconstruction_data_type == experimental_data)	
		test_batch_directory 						= reconstruction_data_directory + phantom_name_folder + experimental_data_folder + run_date_folder + run_number_folder + output_folder + preprocess_date_folder + FOLDER_SEPARATOR;		
	
	//TEST_BATCH_DIR 								= RECON_DATA_DIR + PHANTOM_NAME_FOLDER + EXPERIMENTAL_DATA_FOLDER + FOLDER_SEPARATOR + "B_25600" + FOLDER_SEPARATOR;		
	test_batch_directory 							= reconstruction_data_directory + phantom_name_folder + experimental_data_folder + FOLDER_SEPARATOR + "B_25600" + FOLDER_SEPARATOR;		

	// ImageJ macro & execution parameters/settings/configurations/logging file info
	parameter_test_info_basename					= "Test_Parameters_";
	ANALYSIS_LOG_FNAME 								= "AnalysisLog.nfo";
	ROI_definitions_filename_suffix					= "_ROIs" + TXT;	
	ROI_definitions_filename						= phantom_basename + ROI_definitions_filename_suffix;
	ROI_definitions_file_path						= github_macro_directory_pCT_Collaboration + FOLDER_SEPARATOR + ROI_definitions_filename;
		
	// Input/Output directory/subdirectory names/prefixes 
	iteration_2_analyze_folder_prefix 				= "Iteration_";
	slice_2_analyze_folder_prefix 					= "Slice_";
	slice_2_analyze_folder_short_prefix 			= "s";
	ROI_selection_diameter_folder_prefix 			= "d";

	// Data/image input/output filename prefixes
	reconstructed_image_file_basenames 				= "x_";
	reconstructed_image_file_short_basenames 		= "x";
	profile_CSV_basename 							= "Line_Profiles";
	profile_data_files_basename 					= "Line_Profile";
	regions_data_files_basename						= "Region_Statistics";
	gradient_CSV_basename 							= "Gradients";
	gradient_data_files_basename 					= "Gradient";	
	
	RSP_data_files_basename							= "RSP";
	RSP_error_data_files_basename					= "RSP_Error";
	RSP_Error_data_files_basename					= "RSP_Error";
	Std_Dev_data_files_basename						= "Std_Dev";
	TV_data_files_basename							= "TV";
	TV_measurements_basename						= "TV_measurements";
	TV_step_data_files_basename						= "TV_step";
	TV_difference_data_files_basename				= "TV_difference";	
	
	RSP_data_files_short_basename					= "RSP";
	RSP_error_data_files_short_basename				= "RSPe";
	RSP_Error_data_files_short_basename				= "RSPe";
	Std_Dev_data_files_short_basename				= "SD";
	TV_data_files_short_basename					= "TV";
	TV_measurements_data_files_short_basename		= "TV";
	TV_step_data_files_short_basename				= "TVs";
	TV_difference_data_files_short_basename			= "TVd";	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***************************************************************************************************************************************************************************************************//
	//************************* Close all windows and clear results table *******************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	internal_macro_caller			= macro_caller();
	//multiplot_parameter_prefix 		= macro_caller_variable("TV");
	//multiplot_parameter_prefix 		= macro_caller_variable("L");
	multiplot_parameter_prefix 		= macro_caller_variable("A");
	DONT_KILL_LOOP					= true;
	//DONT_KILL_LOOP					= false;
	DEBUG_LOOP_KILL_INDEX			= 0;
	//DEBUG_LOOP_KILL_INDEX			= 23;
	KILL_LOOP_INDEX					= macro_caller_config(0, DONT_KILL_LOOP);
	//print("KILL_LOOP_INDEX = " + KILL_LOOP_INDEX); exit();
	_list 							= getList("window.titles");
	ROI_ANALYSIS_KILL_INDEX			= KILL_LOOP_INDEX;
	//ROI_ANALYSIS_LKILL				= DEBUG_LOOP_KILL_INDEX;
	 //eprintvar						("_list", _list);
	//getDirectory("image")
	//getFileList(directory)
	// run("Properties... ", "stroke=&color font=12");
    //.run("Add Selection...");
    //run("Select None");
    setBatchMode					(true);	
	//setBatchMode					(false);
	//***********************************************************************************************************************************************************************************************//
	//***********************************************************************************************************************************************************************************************//
	//***********************************************************************************************************************************************************************************************//
	print_section									("Generating multi-curve plots vs target test parameter for a user specified parameter, with each plot having individual curves for each value of this parameter, then writing the plot data and resulting images to disk as PNG", true);
	//***********************************************************************************************************************************************************************************************//
	//************************************************** Import ROI definitions for current phantom and set corresponding internal variables/arrays *************************************************//
	//***********************************************************************************************************************************************************************************************//
	ROI_parameter_decodings							= newArray(ROI_definition_strings_decoding_op, ROI_definition_strings_decoding_op, ROI_definition_strings_decoding_op, ROI_definition_strings_decoding_op, ROI_definition_numbers_decoding_op, ROI_definition_numbers_decoding_op, ROI_definition_numbers_decoding_op, ROI_definition_strings_decoding_op);		
	ROI_definitions_parameter_list					= newArray("ROI_material_names", "ROI_labels", "ROI_label_nicknames", "ROI_shapes", "ROI_diameters", "ROI_selection_radii", "ROI_profile_radius_beyond_ROI", "bulk_material" );
	ROI_parameter_strings							= file_2_key_value_pairs(github_macro_directory_pCT_Collaboration, ROI_definitions_filename, phantom_basename, 	ROI_definitions_parameter_list, ROI_parameter_decodings, ROI_definition_numbers_decoding_op, print_ROI_definitions_path);		
	ROI_material_names 								= ROI_parameter_string_2_values(0, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_definition_numbers_decoding_op, FORCE_VALUE_2_ARRAY		);	
	ROI_labels 										= ROI_parameter_string_2_values(1, ROI_parameter_strings,  	ROI_parameter_decodings, ROI_definition_numbers_decoding_op, FORCE_VALUE_2_ARRAY		);
	ROI_label_nicknames 							= ROI_parameter_string_2_values(2, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_definition_numbers_decoding_op, FORCE_VALUE_2_ARRAY		);					//bulk_material = bulk_material[0];
	ROI_shapes 										= ROI_parameter_string_2_values(3, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_definition_numbers_decoding_op, FORCE_VALUE_2_ARRAY		);	
	ROI_diameters 									= ROI_parameter_string_2_values(4, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_definition_numbers_decoding_op, FORCE_VALUE_2_ARRAY		);
	ROI_selection_radii 							= ROI_parameter_string_2_values(5, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_definition_numbers_decoding_op, FORCE_VALUE_2_ARRAY		);
	ROI_profile_radius_beyond_ROI	 				= ROI_parameter_string_2_values(6, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_definition_numbers_decoding_op, DONT_FORCE_VALUE_2_ARRAY	);	//ROI_profile_radius_beyond_ROI = ROI_profile_radius_beyond_ROI[0];
	bulk_material 									= ROI_parameter_string_2_values(7, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_definition_numbers_decoding_op, DONT_FORCE_VALUE_2_ARRAY	);					//bulk_material = bulk_material[0];
	bulk_material_RSP 								= ROI_material_name_2_RSP(bulk_material, simulated_scan);
	ROI_material_RSPs 								= ROI_material_names_2_RSPs(ROI_material_names, simulated_scan);
	num_ROIs_2_analyze 								= ROI_material_names.length; 						// # of material ROI ROIs in phantom
	print_ROI_definitions							();
	//print_ROI_definitions						();
	//***********************************************************************************************************************************************************************************************//
	//************************************************************************************** Parameter value arrays *********************************************************************************//
	//***********************************************************************************************************************************************************************************************//
	IJIO_READ_CSV									= 6;
	IJIO_WRITE_CSV									= 6;
	IJIO_READ_IMAGE									= 6;
	IJIO_WRITE_IMAGE								= 6;
	IJIO_precision_image							= 5;
	IJIO_precision_CSV								= 6;
	IJIO_precision_image							= 5;
	IJIO_ResultsTable_extension 					= ".csv";
	IJIO_ResultsTable_options 						= "copy_column copy_row save_column save_row";
	IJIO_jpeg_quality 								= 85;
	IJIO_transparent_index 							= -1;
	IJROI_analysis_measurements 					= "area mean standard min max ";
	IJROI_analysis_redirect 						= "None";
	IJROI_analysis_CSV_precision 					= IJIO_precision_CSV;
	IJROI_analysis_image_precision 					= IJIO_precision_image;
	IJROI_analysis_shape 							= OVAL_SELECTION;
	num_specs 										= 4;										// # of test parameter properties specified in Specs file
	voxel_width 									= 1;										// 
	voxel_height									= 1;
	voxel_thickness									= 2.5;	
	voxel_dimensions								= newArray(voxel_width, voxel_height, voxel_thickness);
	voxels_per_mm									= 1;			
	flip_horizontally								= false;									// Specify if correct orientation of reconstructed images requires flipping horizontally
	flip_vertically									= true;										// Specify if correct orientation of reconstructed images requires flipping vertically
	num_recon_iterations 							= 12;										// # of iterations of feasibility seeking performed in reconstruction
	images_per_reconstruction 						= num_recon_iterations + 1;					// 	
	first_iteration_2_analyze						= 0;
	last_iteration_2_analyze						= 12;
	//iterations_2_analyze							= Array.slice(SEQUENTIAL_VALUES_ARRAY, first_iteration_2_analyze, last_iteration_2_analyze + 1);
	iterations_2_analyze							= sequential_value_array(first_iteration_2_analyze, last_iteration_2_analyze + 1);
	num_iterations_2_analyze						= iterations_2_analyze.length;				// # of iterations of feasibility seeking image results to analyze
	iterations_2_analyze_string_precision 			= 0;										// # of digits after decimal point to use in conversion of iteration # to string 	
	//recon_iterations_2_analyze					= Array.slice(SEQUENTIAL_VALUES_ARRAY, 1, last_iteration_2_analyze + 1);
	recon_iterations_2_analyze						= sequential_value_array(1, last_iteration_2_analyze + 1);
	recon_iterations_2_analyze_strings 				= getStringSequence(1, recon_iterations_2_analyze.length, 0);
	first_slice_2_analyze							= 11;
	last_slice_2_analyze							= 11;
	//slices_2_analyze								= Array.slice(SEQUENTIAL_VALUES_ARRAY, first_slice_2_analyze, last_slice_2_analyze + 1);
	slices_2_analyze								= sequential_value_array(first_slice_2_analyze, last_slice_2_analyze + 1);
	num_slices_2_analyze							= slices_2_analyze.length;					// 
	slices_2_analyze_string_precision 				= 0;										// # of digits after decimal point to use in conversion of slice # to string 	
	ROI_radii 										= newArray(ROI_diameters.length);			// radii of circular selections used to analyze phantom ROIs
	ROI_profile_radii 								= newArray(ROI_diameters.length);			// Set distance to extend profile line left/right from material insert ROI centers
	ROI_std_selection_radii 						= newArray(3.5, 4.0, 6.0);					// radii of circular selections used to analyze phantom ROIs
	//ROI_selection_radii 							= Array.slice(ROI_std_selection_radii,0,1);	// radii of circular selections used to analyze phantom ROIs
	ROI_selection_diameters 						= newArray(ROI_selection_radii.length);		// diameters of circular selections used to analyze phantom ROIs	
	ROI_selection_diameter_string_precision			= 0;										// # of digits after decimal point to use in conversion of an ROI selection diameter value to string	
	num_ROI_selection_diameters						= ROI_selection_diameters.length;			// diameters of circular selections used to analyze phantom ROIs 
	TV_reduction_string_precision					= 6;										// Precision to use for writing TV reduction values to CSV files
	//***********************************************************************************************************************************************************************************************//
	//************************************************************ Construct commonly used strings for parameter values and files/folders ***********************************************************//
	//***********************************************************************************************************************************************************************************************//	
	reconstructed_image_strings 					= string_array_concatenation(iterations_2_analyze, iterations_2_analyze_string_precision, 							reconstructed_image_file_basenames, 		EMPTY_STRING);
	reconstructed_image_folders 					= string_array_concatenation(iterations_2_analyze, iterations_2_analyze_string_precision, 		FOLDER_SEPARATOR +	reconstructed_image_file_basenames, 		EMPTY_STRING);
	reconstructed_image_short_strings 				= string_array_concatenation(iterations_2_analyze, iterations_2_analyze_string_precision, 							reconstructed_image_file_short_basenames, 	EMPTY_STRING);
	reconstructed_image_short_folders 				= string_array_concatenation(iterations_2_analyze, iterations_2_analyze_string_precision, 		FOLDER_SEPARATOR +	reconstructed_image_file_short_basenames,	EMPTY_STRING);
	reconstructed_image_filenames 					= string_array_concatenation(iterations_2_analyze, iterations_2_analyze_string_precision, 							reconstructed_image_file_basenames, 		TXT			);
	reconstructed_image_range_string				= generate_parameter_value_range_string(reconstructed_image_file_short_basenames, recon_iterations_2_analyze_strings, iterations_2_analyze_string_precision, REMOVE_TRAILING_ZEROS, STRING_DONT_ADD_SPACES, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE);
	iterations_2_analyze_strings 					= string_array_concatenation(iterations_2_analyze, iterations_2_analyze_string_precision, 		EMPTY_STRING, 													EMPTY_STRING);
	iterations_2_analyze_folders 					= string_array_concatenation(iterations_2_analyze, iterations_2_analyze_string_precision, 		FOLDER_SEPARATOR +	iteration_2_analyze_folder_prefix, 			EMPTY_STRING);
	iterations_2_analyze_range_string				= generate_parameter_value_range_string(EMPTY_STRING, iterations_2_analyze_strings, iterations_2_analyze_string_precision, REMOVE_TRAILING_ZEROS, STRING_DONT_ADD_SPACES, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE);
	slices_2_analyze_strings 						= string_array_concatenation(slices_2_analyze, slices_2_analyze_string_precision, 				EMPTY_STRING, 													EMPTY_STRING);
	slices_2_analyze_folders 						= string_array_concatenation(slices_2_analyze, slices_2_analyze_string_precision, 				FOLDER_SEPARATOR + 	slice_2_analyze_folder_prefix, 				EMPTY_STRING);
	slices_2_analyze_short_strings 					= string_array_concatenation(slices_2_analyze, slices_2_analyze_string_precision, 				EMPTY_STRING, 													EMPTY_STRING);
	slices_2_analyze_short_folders 					= string_array_concatenation(slices_2_analyze, slices_2_analyze_string_precision, 				FOLDER_SEPARATOR + 	slice_2_analyze_folder_short_prefix, 		EMPTY_STRING);
	ROI_analysis_slices_2_analyze_folders 			= string_array_concatenation(slices_2_analyze, slices_2_analyze_string_precision, 				FOLDER_SEPARATOR + 	slice_2_analyze_folder_prefix, 				EMPTY_STRING);
	ROI_selection_diameters 						= array_apply_op(ROI_selection_radii, 2, MULTIPLICATION, DONT_SWITCH_OPERANDS);
	ROI_selection_diameter_strings 					= string_array_concatenation(ROI_selection_diameters, ROI_selection_diameter_string_precision,	EMPTY_STRING, 													EMPTY_STRING);
	ROI_selection_diameter_folders 					= string_array_concatenation(ROI_selection_diameters, ROI_selection_diameter_string_precision, FOLDER_SEPARATOR + ROI_selection_diameter_folder_prefix, 		EMPTY_STRING);
	ROI_radii 										= array_apply_op(ROI_diameters, 2, DIVISION, DONT_SWITCH_OPERANDS);
	ROI_profile_radii 								= array_apply_op(ROI_radii, ROI_profile_radius_beyond_ROI, ADDITION, DONT_SWITCH_OPERANDS);
	print_reconstructed_image_info					();
	print_ROI_analysis_info							();
	//exit();
	//***********************************************************************************************************************************************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	//************************************************************ Set Parameter Names/Values and Construct Paths to Corresponding Data *************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	//---------------------------------------------- Specifications used to identify file containing specifications of parameters of parameter value test -------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	parameter_test_number							= 1;
	parameter_test_info_filename					= parameter_test_info_basename + d2s(parameter_test_number, 0)  + TXT;
	parameter_test_info 							= file_2_array(test_batch_directory, parameter_test_info_filename, print_input_data_path);
	num_parameters 									= parameter_test_info.length;
	parameter_values 								= newArray();
	num_parameter_values 							= newArray(num_parameters);
	parameter_string_prefixes 						= newArray(num_parameters);
	parameter_string_short_prefixes 				= newArray(num_parameters);
	parameter_string_precisions 					= newArray(num_parameters);				
	parameter_string_max_precisions 				= newArray();				
	parameter_string_min_precisions 				= newArray();				
	parameter_string_min_precisions2 				= newArray();				
//	RETURN_PRECISIONS								= true;
//	RETURN_STRINGS									= false;
	
	for(i = 0; i < num_parameters; i++)
	{
		parameter_info 								= split(parameter_test_info[i]);
		parameter_string_prefixes[i] 				= parameter_info[0];
		parameter_string_short_prefixes[i] 			= parameter_info[1];
		parameter_string_precisions[i] 				= parseInt(parameter_info[2]);
		num_parameter_values[i] 					= parameter_info.length - 3;
		parameter_elements 							= Array.slice(parameter_info, 3, parameter_info.length);
		parameter_values 							= Array.concat(parameter_values, parameter_elements);	
		min_precisions 								= minimize_string_precision(parameter_elements, 	parameter_string_precisions[i], RETURN_PRECISIONS, RETURN_FORCE_ARRAY);
		max_precisions 								= array_match_length_fill(parameter_elements, 		parameter_string_precisions[i]);	
		parameter_string_min_precisions				= Array.concat(parameter_string_min_precisions, min_precisions);	
		parameter_string_max_precisions				= Array.concat(parameter_string_max_precisions, max_precisions);	
	}
	//exit();
	parameter_value_offsets							= series_ops(num_parameter_values, SERIES_SUMMATION, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
	parameter_value_strings 						= generate_parameter_value_strings(parameter_values, parameter_string_max_precisions, DONT_REMOVE_TRAILING_ZEROS);
	parameter_value_short_strings 					= generate_parameter_value_strings(parameter_values, parameter_string_min_precisions, DONT_REMOVE_TRAILING_ZEROS);
	modulo_values 									= series_ops(num_parameter_values, SERIES_PRODUCT, SERIES_OP_FROM_INDEX, EMPTY_ARRAY);
	total_combinations								= series_op(num_parameter_values, SERIES_PRODUCT, num_parameters, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
	all_parameter_indices							= sequential_value_array(0, num_parameters);
	print_test_parameter_file_info					();
	//exit();
	//***********************************************************************************************************************************************************************************************//
	//************************************************************************************** Parameter value test  *********************************************************************************//
	//***********************************************************************************************************************************************************************************************//	
	//xaxis_param								= num_parameters;
	target_test_parameter						= num_parameters;
	TTP_index									= num_parameters - 1;
	TTP_prefix									= parameter_string_prefixes[TTP_index];
	TTP_values 									= extract_parameter_values(TTP_index, parameter_values, num_parameter_values, parameter_string_prefixes);
	TTP_values 									= extract_parameter_values(parameter_string_prefixes[TTP_index], parameter_values, num_parameter_values, parameter_string_prefixes);
	TTP_values_min_precisions 					= minimize_string_precision(TTP_values, parameter_string_precisions[TTP_index], RETURN_PRECISIONS, RETURN_DONT_FORCE_ARRAY);
	TTP_value_strings 							= generate_parameter_value_strings(TTP_values, parameter_string_precisions[TTP_index], DONT_REMOVE_TRAILING_ZEROS);
	TTP_value_short_strings 					= generate_parameter_value_strings(TTP_values, TTP_values_min_precisions, REMOVE_TRAILING_ZEROS);
	TTP_equals_strings 							= string_array_concatenation(TTP_value_strings, parameter_string_precisions[TTP_index], 		TTP_prefix + EQUALS_STRING, 			EMPTY_STRING);
	TTP_equals_short_strings 					= string_array_concatenation(TTP_value_short_strings, parameter_string_precisions[TTP_index], 		TTP_prefix + EQUALS_STRING, 			EMPTY_STRING);
	TTP_range_suffix							= generate_parameter_value_range_string(EMPTY_STRING, TTP_values, parameter_string_precisions[TTP_index], REMOVE_TRAILING_ZEROS, STRING_DONT_ADD_SPACES, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE);
	TTP_range_filenaming						= generate_parameter_value_range_string(parameter_string_prefixes[TTP_index], TTP_values, parameter_string_precisions[TTP_index], REMOVE_TRAILING_ZEROS, STRING_DONT_ADD_SPACES, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE);
	TTP_range_plots								= generate_parameter_value_range_string(parameter_string_prefixes[TTP_index], TTP_values, parameter_string_precisions[TTP_index], REMOVE_TRAILING_ZEROS, STRING_ADD_SPACES, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE);
	num_TTP_values 								= num_parameter_values[TTP_index];
	num_TTP_tests 								= total_combinations / num_TTP_values;
	print_TTP_info								();
	//exit();
	//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	multiplot_parameter_index					= isMember(multiplot_parameter_prefix, 															parameter_string_prefixes, RETURN_MATCH_INDEX	);
	multiplot_parameter							= multiplot_parameter_index + 1;							// Multiplot target parameter # from 1-N, not it's array index (i.e. from 0 - N-1)	
	multiplot_parameter_values 					= extract_parameter_values(			multiplot_parameter_index, parameter_values, num_parameter_values, 	parameter_string_prefixes						);
	multiplot_parameter_values_min_precisions 	= minimize_string_precision(multiplot_parameter_values, parameter_string_precisions[multiplot_parameter_index], RETURN_PRECISIONS, RETURN_DONT_FORCE_ARRAY);
	multiplot_parameter_value_strings 			= generate_parameter_value_strings	(multiplot_parameter_values, 	parameter_string_precisions[multiplot_parameter_index], DONT_REMOVE_TRAILING_ZEROS					);
	multiplot_parameter_value_short_strings 	= minimize_string_precision(multiplot_parameter_values, parameter_string_precisions[multiplot_parameter_index], RETURN_STRINGS, RETURN_DONT_FORCE_ARRAY);
	multiplot_parameter_equals_strings 			= string_array_concatenation		(multiplot_parameter_values, 	parameter_string_precisions[multiplot_parameter_index], multiplot_parameter_prefix + EQUALS_STRING, 			EMPTY_STRING);
	multiplot_parameter_equals_short_strings 	= string_array_concatenation		(multiplot_parameter_values, 	multiplot_parameter_values_min_precisions, 				multiplot_parameter_prefix + EQUALS_STRING, 			EMPTY_STRING);
	multiplot_parameter_range_suffix			= generate_parameter_value_range_string(EMPTY_STRING, 											multiplot_parameter_values, parameter_string_precisions[multiplot_parameter_index], REMOVE_TRAILING_ZEROS, STRING_DONT_ADD_SPACES, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE);
	multiplot_parameter_range_filenaming		= generate_parameter_value_range_string(parameter_string_prefixes[multiplot_parameter_index], 	multiplot_parameter_values, parameter_string_precisions[multiplot_parameter_index], REMOVE_TRAILING_ZEROS, STRING_DONT_ADD_SPACES, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE);
	multiplot_parameter_range_plots				= generate_parameter_value_range_string(parameter_string_prefixes[multiplot_parameter_index], 	multiplot_parameter_values, parameter_string_precisions[multiplot_parameter_index], REMOVE_TRAILING_ZEROS, STRING_ADD_SPACES, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE);
	num_multiplot_parameter_values				= num_parameter_values[multiplot_parameter_index];			
	reduced_TTP_index							= TTP_index - 1;
	reduced_parameter_values_lower 				= Array.slice	(parameter_values, 0, 	parameter_value_offsets[multiplot_parameter_index]								);
	reduced_parameter_values_upper 				= Array.slice	(parameter_values,  	parameter_value_offsets[multiplot_parameter], 			parameter_values.length	);
	reduced_parameter_values 					= Array.concat	(reduced_parameter_values_lower, reduced_parameter_values_upper											);	
	reduced_parameter_value_offsets				= series_ops	(num_parameter_values, SERIES_SUMMATION, 				SERIES_OP_UP_TO_INDEX, 	multiplot_parameter_index);
	reduced_modulo_values						= series_ops	(num_parameter_values, SERIES_PRODUCT, 					SERIES_OP_FROM_INDEX, 	multiplot_parameter_index);
	reduced_total_combinations					= series_op		(num_parameter_values, SERIES_PRODUCT, num_parameters, 	SERIES_OP_UP_TO_INDEX, 	multiplot_parameter_index);
	print_multiplot_parameter_info				();
	//exit();
	//***********************************************************************************************************************************************************************************************//
	//********************************************** For each parameter test value combination, determine path/folder of reconstruction results value ***********************************************//
	//***********************************************************************************************************************************************************************************************//
	test_parameter_indices						= newArray(TTP_index, multiplot_parameter_index);
	no_TTP_parameter_indices					= array_remove_indices(all_parameter_indices, TTP_index);
	no_multiplot_parameter_indices				= array_remove_indices(all_parameter_indices, multiplot_parameter_index);
	no_multiplot_TTP_parameter_indices			= array_remove_indices(all_parameter_indices, test_parameter_indices);
	PVT_identifier 								= generate_parameter_values_string(parameter_string_prefixes, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, UNDERSCORE_STRING, UNDERSCORE_STRING, STRING_DONT_ADD_SPACES, REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_OFF, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, EMPTY_ARRAY, all_parameter_indices);	
	PVTs_input_directory_parent					= test_batch_directory;
	PVTs_output_directory_parent				= test_batch_directory;	
	PVT_output_data_directory_parent 			= extend_path(PVTs_output_directory_parent, 	PVT_identifier);
	directory_created_successfully				= make_directory_recorded(PVT_output_data_directory_parent, 											DIRECTORIES_CREATED, PRINTING_ON				);//print_directories_created);
	PVT_output_data_parent_directory			= make_subdirectory	(PVTs_output_directory_parent, 				PVT_identifier, 						DIRECTORIES_CREATED, PRINTING_ON				);//print_directories_created);
	PVT_output_multiplot_data_parent_directory	= make_subdirectory	(PVT_output_data_parent_directory, 			multiplot_parameter_range_filenaming, 	DIRECTORIES_CREATED, print_directories_created	);
	PVT_output_data_parent_folder				= File.getName(PVT_output_data_parent_directory);
	directory_created_successfully2				= make_subdirectory	(PVTs_output_directory_parent, 				PVT_output_data_parent_folder, 			DIRECTORIES_CREATED, PRINTING_OFF				);
	print_PVT_parent_info						();
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***********************************************************************************************************************************************************************************************//
	//************************************************ Define and configure log output sections + description header strings for each execution task ************************************************//
	//***********************************************************************************************************************************************************************************************//
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//merge_ROI_analysis_section_statement				= "Merging ROI analysis data for each target test parameter value ", PRINT_MAJOR_SECTION);
	merge_ROI_analysis_data_read_section_statement		= "Reading ROI analysis data from CSV files for each value of target test parameter = ";
	merge_ROI_analysis_section_statement				= "Merging ROI analysis data for multiplot_analysis # ";
	merged_ROI_analysis_2_disk_section_statement		= "Writing merged ROI analysis data to CSV/TXT files for multiplot parameter value = ";
	merge_ROI_analysis_data_completed_statement			= "Finished merging ROI analysis data for each value of multiplot parameter = ";
	merge_multiplot_data_read_section_statement			= "Reading merged ROI analysis data from TXT files for each value of multiplot parameter = ";
	merge_multiplot_section_statement					= "Merging the merged ROI analysis data for multiplot analysis # ";
	merged_multiplot_2_disk_section_statement			= "Writing merged ROI analysis data to CSV/TXT files containing data for each value of multiplot parameter = ";
	merge_multiplot_data_completed_statement			= "Finished merging ROI analysis data for each value of multiplot parameter = ";
	merge_multiplot_data_completed_statement			= "Finished merging ROI analysis data for each value of multiplot parameter = ";
	merge_data_completed_statement						= "FINISHED MERGING DATA";
	//"Performing multiplot analysis # " + current_multiplot_analysis_number + " of " + num_multiplot_analyses, true);
	//"Reading input CSV files from the ROI analyses for each target test parameter value for: multiplot = " + multiplot, false);
	//merged_ROI_analysis_2_disk_section_statement = "Writing merged CSV files from the ROI analyses for each target test parameter value for: multiplot = " + multiplot, false);
	//"Finished merging data for multiplot parameter" + multiplot_parameter_prefix, true);
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***********************************************************************************************************************************************************************************************//
	//******************************************* For each parameter test value combination, determine path/folder of reconstruction results value **************************************************//
	//***********************************************************************************************************************************************************************************************//
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	parameter_combination 						= newArray		(num_parameters);
	parameter_combination_indices 				= newArray		(num_parameters);
	parameter_strings 							= newArray		(num_parameters);
	reduced_parameter_combination_indices		= newArray		(num_parameters - 1);
	reduced_parameter_combination				= newArray		(num_parameters - 1);
	all_parameter_combination_indices 			= newArray		();
	all_parameter_combinations 					= newArray		();
	all_folder_strings 							= newArray		(total_combinations);
	all_path_strings 							= newArray		(total_combinations);	
	all_reduced_parameter_combination_indices 	= newArray		();	    
	all_reduced_parameter_combinations 			= newArray		();
	all_reduced_folder_strings 					= newArray		(total_combinations);
	all_reduced_path_strings 					= newArray		(total_combinations);
	for(combination_index = 0; combination_index < total_combinations; combination_index++)
	{
		//*******************************************************************************************************************************************************************************************//
		//***************************** Generate standard parameter value combinations and folders/paths ordered by target test parameter ***********************************************************//
		//*******************************************************************************************************************************************************************************************//
		parameter_combination_indices		 				= generate_parameter_test_combination_indices(TTP_index, combination_index, modulo_values, parameter_value_offsets );
		parameter_combination 								= generate_parameter_test_combination(parameter_combination_indices, parameter_values);
		all_parameter_combination_indices 					= Array.concat(all_parameter_combination_indices, parameter_combination_indices); 	
		all_parameter_combinations 							= Array.concat(all_parameter_combinations, parameter_combination); 	
		folder_string 										= generate_parameter_values_string(parameter_combination, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, UNDERSCORE_STRING, UNDERSCORE_STRING, STRING_DONT_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_OFF, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, EMPTY_ARRAY, EMPTY_ARRAY);	
		all_folder_strings[combination_index] 				= folder_string;		
		all_path_strings[combination_index] 				= PVTs_input_directory_parent + all_folder_strings[combination_index];	
		//*******************************************************************************************************************************************************************************************//
		//********************** Generate multiplotting parameter cccccccccccccccccccc combinations and folders/paths ordered by multiplotting target parameter ****************************************************//
		//*******************************************************************************************************************************************************************************************//		
		if(combination_index < reduced_total_combinations)
		{
			reduced_parameter_combination_indices 			= generate_parameter_test_combination_indices(TTP_index - 1, combination_index, reduced_modulo_values, reduced_parameter_value_offsets );
			reduced_parameter_combination 					= generate_parameter_test_combination(reduced_parameter_combination_indices, reduced_parameter_values);			
			all_reduced_parameter_combination_indices		= Array.concat(all_reduced_parameter_combination_indices, reduced_parameter_combination_indices); 
			all_reduced_parameter_combinations 				= Array.concat(all_reduced_parameter_combinations, reduced_parameter_combination); 
			start_index 									= combination_index * num_multiplot_parameter_values;
			for(i = 0; i < num_multiplot_parameter_values; i++)
			{
				
				folder_string 								= generate_parameter_test_multiplot_folder2(multiplot_parameter_index, reduced_parameter_combination, multiplot_parameter_values[i], parameter_string_prefixes, parameter_string_precisions );							
				//folder_string 							= generate_parameter_values_string(parameter_combination, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, UNDERSCORE_STRING, UNDERSCORE_STRING, STRING_DONT_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_OFF, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, EMPTY_ARRAY, EMPTY_ARRAY);//test_parameter_indices);
				//folder_string 							= generate_parameter_test_multiplot_folder(multiplot_parameter_index, reduced_parameter_combination, i, parameter_values, parameter_value_offsets, parameter_string_prefixes, parameter_string_precisions );							
				all_reduced_folder_strings[start_index + i] = folder_string;
				all_reduced_path_strings[start_index + i] 	= PVTs_input_directory_parent + folder_string;	
			}		
			//exit();
		}				
		//exit();
	} // END for( combination_index = 0; combination_index < total_combinations; combination_index++)
	print_all_X_strings_and_combinations		();
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//	
	ROIs_per_reconstruction 					= num_ROIs_2_analyze * images_per_reconstruction;
	before_TVS_index 							= 0;
	after_TVS_index 							= 1;
	TV_measurements_per_iteration				= 2;
	num_input_directories						= lengthOf(all_reduced_path_strings);
	num_input_directories_per_multiplot			= num_multiplot_parameter_values * num_TTP_values;
	num_multiplot_analyses						= num_input_directories / num_input_directories_per_multiplot;
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//
	title_start_row		 						= 0;
	title_start_column		 					= 0;
	title_row_separation 						= 2;
	column_labels_row_separation			 	= 1;
	table_row_separation 						= 2;
	first_column 								= 1;
	//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	num_ROI_tables								= num_ROIs_2_analyze;
	num_ROI_multiplot_tables					= num_multiplot_parameter_values * num_ROI_tables;
	ROI_table_first_column						= first_column;
	ROI_table_column_separation					= 1;
	ROI_table_row_separation 					= table_row_separation; 
	ROI_table_columns							= num_recon_iterations + 1;
	ROI_table_rows								= num_TTP_values;
	ROI_table_row_offset 						= ROI_table_rows + column_labels_row_separation + ROI_table_row_separation  + 1; 
	ROI_table_grid_columns						= num_ROI_tables;//2;//
	ROI_table_total_columns						= tables_total_columns(first_column, ROI_table_grid_columns, ROI_table_columns, ROI_table_column_separation);
	ROI_table_titles 							= Array.copy(ROI_labels); 
	ROI_table_column_headers 					= Array.copy(iterations_2_analyze_strings); 
	ROI_table_row_headers 						= Array.copy(TTP_value_strings); 				
	ROI_table_title_dimensions					= newArray(title_start_column, 		title_start_row, 	title_row_separation, 	ROI_table_total_columns);
	ROI_table_dimensions						= newArray(ROI_table_first_column, 	ROI_table_columns, 	ROI_table_rows, 		ROI_table_column_separation, ROI_table_row_separation, column_labels_row_separation);					
	ROI_multiplot_table_grid_columns			= num_ROI_tables;//2;//
	ROI_multiplot_table_total_columns			= tables_total_columns(first_column, ROI_multiplot_table_grid_columns, ROI_table_columns, ROI_table_column_separation);						
	ROI_multiplot_table_title_dimensions		= newArray(title_start_column, 		title_start_row, 	title_row_separation, 	ROI_multiplot_table_total_columns);
	ROI_multiplot_table_titles 					= table_grid_row_array_duplication( ROI_labels, num_ROI_multiplot_tables);
	//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	num_TV_tables								= TV_table_titles.length;
	num_TV_multiplot_tables						= num_multiplot_parameter_values * num_TV_tables;
	TV_table_first_column						= first_column;
	TV_table_column_separation					= ROI_table_column_separation;//	= 2;
	TV_table_row_separation 					= table_row_separation; 
	TV_table_columns							= num_recon_iterations;
	TV_table_rows								= num_TTP_values;
	TV_table_grid_columns						= num_TV_tables;
	TV_table_total_columns						= tables_total_columns(TV_table_first_column, TV_table_grid_columns, TV_table_columns, TV_table_column_separation);
	TV_table_column_headers 					= Array.copy(recon_iterations_2_analyze_strings); 
	TV_table_row_headers 						= Array.copy(TTP_value_strings); 			
	TV_table_title_dimensions					= newArray(title_start_column, 		title_start_row, 	title_row_separation, 	TV_table_total_columns);
	TV_table_dimensions							= newArray(TV_table_first_column, 	TV_table_columns, 	TV_table_rows, 		TV_table_column_separation, TV_table_row_separation, column_labels_row_separation);
	TV_multiplot_table_grid_columns				= num_TV_tables;
	TV_multiplot_table_total_columns			= tables_total_columns(TV_table_first_column, TV_multiplot_table_grid_columns, TV_table_columns, TV_table_column_separation);
	TV_multiplot_table_title_dimensions			= newArray(title_start_column, 		title_start_row, 	title_row_separation, 	TV_multiplot_table_total_columns);
	TV_multiplot_table_titles 					= table_grid_row_array_duplication( TV_table_titles, num_TV_multiplot_tables);	
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//	
	ROI_analysis_TV_input_filename				= TV_measurements_basename 		+ TXT;	
	ROI_analysis_RSP_output_filename			= RSP_data_files_basename 		+ CSV;
	ROI_analysis_RSP_Error_output_filename		= RSP_error_data_files_basename	+ CSV;
	ROI_analysis_Std_Dev_output_filename		= Std_Dev_data_files_basename  	+ CSV;
	ROI_analysis_TV_output_filename				= TV_data_files_basename		+ TXT;
	
	PVT_RSP_output_filename						= RSP_data_files_basename 		+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;
	PVT_RSP_Error_output_filename				= RSP_error_data_files_basename + UNDERSCORE_STRING + TTP_range_filenaming + TXT;
	PVT_Std_Dev_output_filename					= Std_Dev_data_files_basename 	+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;
	PVT_TV_output_filename						= TV_data_files_basename 		+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;
	
	multiplot_RSP_output_basename				= RSP_data_files_basename		+ UNDERSCORE_STRING + TTP_range_filenaming + UNDERSCORE_STRING;
	multiplot_RSP_Error_output_basename			= RSP_error_data_files_basename	+ UNDERSCORE_STRING + TTP_range_filenaming + UNDERSCORE_STRING;
	multiplot_Std_Dev_output_basename			= Std_Dev_data_files_basename	+ UNDERSCORE_STRING + TTP_range_filenaming + UNDERSCORE_STRING;
	multiplot_TV_output_basename				= TV_data_files_basename		+ UNDERSCORE_STRING + TTP_range_filenaming + UNDERSCORE_STRING;
	print_input_output_filenames				();
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***********************************************************************************************************************************************************************************************//
	//*********************************************************************** Apply execution settings/options/configurations ***********************************************************************//
	//***********************************************************************************************************************************************************************************************//	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////							
	//IJROI_analysis_config_CSV					();
	//IJROI_analysis_config_image				();
	//IJIO_configOptions						(IJIO_CONFIG_OPTIONS_ON);
	//IJIO_configOptions						(IJIO_CONFIG_OPTIONS_OFF);
	//print_ImageJ_info							();
	//print_ROI_definitions						();
	//print_reconstructed_image_info				();
	//print_ROI_analysis_info						();
	//print_input_output_filenames				();
	//exit();
	PRINT_STATUS									= PRINT_ON();
	//PRINT_STATUS									= PRINT_OFF();
	//PRINT_STATUS									= PRINT_GROUPVARS_ONLY();
	//PRINT_STATUS									= PRINT_SEPVARS_ONLY();
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***********************************************************************************************************************************************************************************************//
	//************************************************************* Perform comparison of analysis of individual reconstruction results *************************************************************//
	//***********************************************************************************************************************************************************************************************//	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////							
	if(perform_data_merging)     
	{
		for(ROI_selection_diameter_index = 0; ROI_selection_diameter_index < num_ROI_selection_diameters; ROI_selection_diameter_index++)
		{
			for(slice_2_analyze_index = 0; slice_2_analyze_index < num_slices_2_analyze; slice_2_analyze_index++)
			{
			///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//***************************************************************************************************************************************************************************************//
			//************************ Establishing relevant information for the current ROI selection diameter/slice # analysis ********************************************************************//
			//***************************************************************************************************************************************************************************************//	
			///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////				
				current_test_start_folder_index										= 0;
				current_test_multiplot_start_folder_index							= 0;
				slice_2_analyze														= slices_2_analyze[slice_2_analyze_index];
				slice_2_analyze_string 												= slices_2_analyze_strings[slice_2_analyze_index];
				slice_2_analyze_folder 												= slices_2_analyze_folders[slice_2_analyze_index];
				slice_2_analyze_short_string 										= slices_2_analyze_short_strings[slice_2_analyze_index];
				slice_2_analyze_short_folder 										= slices_2_analyze_short_folders[slice_2_analyze_index];
				ROI_selection_diameter												= ROI_selection_diameters[ROI_selection_diameter_index];
				ROI_selection_diameter_string 										= ROI_selection_diameter_strings[ROI_selection_diameter_index];
				ROI_selection_diameter_folder 										= ROI_selection_diameter_folders[ROI_selection_diameter_index];
				
				current_analysis_subdirectory										= slice_2_analyze_folder + ROI_selection_diameter_folder;					
				current_analysis_short_subdirectory									= slice_2_analyze_short_folder + ROI_selection_diameter_folder;					
				current_analysis_shortest_subdirectory								= slice_2_analyze_folder_short_prefix + slice_2_analyze_short_string + "-" + ROI_selection_diameter_folder_prefix + ROI_selection_diameter_string;					
				current_ROI_analysis_subdirectory									= current_analysis_subdirectory;
				current_ROI_analysis_short_subdirectory								= current_analysis_short_subdirectory;
				
				current_analysis_ROI_analysis_TV_input_filename						= ROI_analysis_TV_input_filename;				
				current_analysis_ROI_analysis_RSP_output_filename					= current_ROI_analysis_subdirectory 	+ FOLDER_SEPARATOR + ROI_analysis_RSP_output_filename;
				current_analysis_ROI_analysis_RSP_Error_output_filename				= current_ROI_analysis_subdirectory 	+ FOLDER_SEPARATOR + ROI_analysis_RSP_Error_output_filename;
				current_analysis_ROI_analysis_Std_Dev_output_filename				= current_ROI_analysis_subdirectory 	+ FOLDER_SEPARATOR + ROI_analysis_Std_Dev_output_filename;
				current_analysis_ROI_analysis_TV_output_filename					= ROI_analysis_TV_output_filename;				
				
				current_analysis_PVT_RSP_output_filename							= current_ROI_analysis_subdirectory 	+ FOLDER_SEPARATOR + PVT_RSP_output_filename;
				current_analysis_PVT_RSP_Error_output_filename						= current_ROI_analysis_subdirectory 	+ FOLDER_SEPARATOR + PVT_RSP_Error_output_filename;
				current_analysis_PVT_Std_Dev_output_filename						= current_ROI_analysis_subdirectory 	+ FOLDER_SEPARATOR + PVT_Std_Dev_output_filename;
				current_analysis_PVT_TV_output_filename								= PVT_TV_output_filename;				
				
				current_analysis_multiplot_RSP_input_filename						= current_analysis_PVT_RSP_output_filename;
				current_analysis_multiplot_RSP_Error_input_filename					= current_analysis_PVT_RSP_Error_output_filename;
				current_analysis_multiplot_Std_Dev_input_filename					= current_analysis_PVT_Std_Dev_output_filename;
				current_analysis_multiplot_TV_input_filename						= current_analysis_PVT_TV_output_filename;				
				//exit();			
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				//***************************************************************************************************************************************************************************************//
				//******** Generate plots of RSP vs. target test parameter values with individual curves for each multiplot target parameter value ***************************************//
				//***************************************************************************************************************************************************************************************//	
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////																	
				all_RSP_multiplot_data 														= newArray();
				all_RSP_Error_multiplot_data 												= newArray();				
				all_Std_Dev_multiplot_data 													= newArray();
				all_TV_multiplot_data 														= newArray();
				//*******************************************************************************************************************************************************************************//
				//************************* User defined function definitions *******************************************************************************************************************//
				//*******************************************************************************************************************************************************************************//
				//for( reduced_path_index = 0; reduced_path_index < lengthOf(all_reduced_path_strings); reduced_path_index += num_multiplot_parameter_values * num_TTP_values)
				for( i = 0; i < num_input_directories; i += num_input_directories_per_multiplot)
				{					
					current_multiplot_analysis_number								= i / num_input_directories_per_multiplot;
					print_section													("Performing multiplot analysis # " + current_multiplot_analysis_number + " of " + num_multiplot_analyses, true);
					current_test_1st_parameter_combination							= extract_parameter_value_combination(all_reduced_parameter_combinations, num_parameters, current_test_start_folder_index, 1);
					current_test_start_folder 										= all_folder_strings[current_test_start_folder_index];
					current_test_folders											= Array.slice(all_folder_strings, current_test_start_folder_index, current_test_start_folder_index + num_TTP_values);					
					current_test_start_folder_index									+= num_TTP_values;
					//current_test_end_folder 										= all_folder_strings[current_test_start_folder_index - 1];
					Aps("current_test_folders", current_test_folders);
					//--------------------------------------------------------------------------------------------------------------------------------//
					current_test_folder_basename									= modify_parameter_values_string(current_test_start_folder, parameter_string_prefixes, REMOVE_VALUE_STRINGS, TTP_index, UNDERSCORE_STRING, UNDERSCORE_STRING, EMPTY_STRING, EMPTY_STRING, STRING_DONT_ADD_SPACES);
					current_test_folder_basename									= remove_folder_parameter(current_test_start_folder, TTP_prefix, REMOVE_PARAMETER_VALUE_ONLY, UNDERSCORE_STRING);
					match(
						current_test_folder_basename, 
						modify_parameter_values_string(current_test_start_folder, parameter_string_prefixes, REMOVE_VALUE_STRINGS, TTP_index, UNDERSCORE_STRING, UNDERSCORE_STRING, EMPTY_STRING, EMPTY_STRING, STRING_DONT_ADD_SPACES), 
						"current_test_folder_basename", 
						THROW_MISMATCH_ERROR + PRINT_MATCH
					);
					current_test_folder_split_strings									= split_parameter_value_string(current_test_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_SPLIT_STRINGS);
					Aps("current_test_folder_split_strings", current_test_folder_split_strings);
					//--------------------------------------------------------------------------------------------------------------------------------//
					current_test_parameter_value_strings 							= folder_2_parameter_value_strings(current_test_start_folder, parameter_string_prefixes, EMPTY_STRING, STRING_DONT_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS);
					current_test_parameter_value_strings							= split_parameter_value_string(current_test_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_SPLIT_VALUES);
					match(
						current_test_parameter_value_strings, 
						split_parameter_value_string(current_test_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_SPLIT_VALUES), 
						"current_test_parameter_value_strings", 
						THROW_MISMATCH_ERROR + PRINT_MATCH
					);
					//--------------------------------------------------------------------------------------------------------------------------------//
					insert_strings													= newArray(TTP_range_suffix, multiplot_parameter_range_suffix);
					replace_strings													= newArray(TTP_range_suffix, multiplot_parameter_range_suffix);
					remove_strings													= Array.copy(test_parameter_indices);
					
					App("insert_strings", insert_strings);		
					App("replace_strings", replace_strings);		
					TTP_value_strings_remove_string									= modify_parameter_value_strings(current_test_parameter_value_strings, REMOVE_PARAMETER_STRING, test_parameter_indices, EMPTY_ARRAY);
					App("TTP_value_strings_remove_string", TTP_value_strings_remove_string);		
					TTP_value_strings_insert_string_before							= modify_parameter_value_strings(current_test_parameter_value_strings, INSERT_PARAMETER_STRING_BEFORE, test_parameter_indices, insert_strings);
					App("TTP_value_strings_insert_string_before", TTP_value_strings_insert_string_before);		
					TTP_value_strings_insert_string_after							= modify_parameter_value_strings(current_test_parameter_value_strings, INSERT_PARAMETER_STRING_AFTER, test_parameter_indices, insert_strings);
					App("TTP_value_strings_insert_string_after", TTP_value_strings_insert_string_after);		
					TTP_value_strings_replace_string								= modify_parameter_value_strings(current_test_parameter_value_strings, REPLACE_PARAMETER_STRING, test_parameter_indices, replace_strings);
					App("TTP_value_strings_replace_string", TTP_value_strings_replace_string);		
					TTP_value_strings_replace_string								= modify_parameter_value_strings(current_test_parameter_value_strings, REPLACE_PARAMETER_STRING, multiplot_parameter_index, multiplot_parameter_range_suffix);
					App("TTP_value_strings_replace_string", TTP_value_strings_replace_string);		
					TTP_value_strings_replace_string								= modify_parameter_value_strings(current_test_parameter_value_strings, REPLACE_PARAMETER_STRING, TTP_index, TTP_range_suffix);
					App("TTP_value_strings_replace_string", TTP_value_strings_replace_string);		
					

					
					//--------------------------------------------------------------------------------------------------------------------------------//
					//exit();
					current_test_parameter_value_short_strings 						= minimize_string_precision(current_test_parameter_value_strings, parameter_string_precisions, RETURN_STRINGS, RETURN_DONT_FORCE_ARRAY);
					current_test_parameter_values_string 							= folder_2_parameter_values_string(current_test_start_folder, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_OFF, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, TTP_index, EMPTY_ARRAY);					
					
					match(
						current_test_parameter_values_string, 
						generate_parameter_values_string(current_test_parameter_value_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_OFF, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, TTP_index, EMPTY_ARRAY), 
						"current_test_parameter_values_string", 
						THROW_MISMATCH_ERROR + PRINT_MATCH
					);
					current_test_plot_title_parameter_values_string 				= generate_parameter_values_string(current_test_parameter_value_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_OFF, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, EMPTY_ARRAY, TTP_index);					
					current_test_plot_title_other_parameter_values_string	 		= generate_parameter_values_string(current_test_parameter_value_short_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_ON, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, test_parameter_indices, EMPTY_ARRAY);					
					current_test_parameter_equals_strings 							= folder_2_parameter_value_strings(current_test_start_folder, parameter_string_prefixes, EQUALS_STRING, STRING_DONT_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS);
					current_test_parameter_padded_equals_strings					= split_parameter_value_string(current_test_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_PADDED_EQUALS_STRINGS);
					Aps("current_test_parameter_padded_equals_strings",current_test_parameter_padded_equals_strings);
					//current_test_parameter_equals_strings							= split_parameter_value_string(current_test_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_SPLIT_VALUES);
					match(
						current_test_parameter_equals_strings, 
						split_parameter_value_string(current_test_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_EQUALS_STRINGS), 
						"current_test_parameter_equals_strings", 
						THROW_MISMATCH_ERROR + PRINT_MATCH
					);
					current_test_parameter_equals_short_strings 					= folder_2_parameter_value_strings(current_test_start_folder, parameter_string_prefixes, EQUALS_STRING, STRING_DONT_ADD_SPACES, REMOVE_TRAILING_ZEROS);
					//current_test_parameter_equals_short_strings						= split_parameter_value_string(current_test_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_SPLIT_VALUES);
					match(
						current_test_parameter_equals_short_strings, 
						split_parameter_value_string(current_test_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_EQUALS_SHORT_STRINGS), 
						"current_test_parameter_equals_short_strings", 
						THROW_MISMATCH_ERROR + PRINT_MATCH
					);
					match(
						current_test_parameter_values_string, 
						merge_strings_2_string(current_test_parameter_padded_equals_strings, TTP_index, COMMA_STRING + SPACE_STRING),
						"current_test_parameter_values_string2", 
						THROW_MISMATCH_ERROR + PRINT_MATCH
					);
					//exit();
					current_test_file_suffix 										= generate_parameter_values_string(current_test_parameter_value_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, UNDERSCORE_STRING, EQUALS_STRING, STRING_DONT_ADD_SPACES, REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_ON, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, TTP_index, multiplot_parameter_index);					
					
					current_test_multiplot_start_folder 							= all_reduced_folder_strings[i];			
					current_test_multiplot_folders									= Array.slice(all_reduced_folder_strings, current_test_multiplot_start_folder_index, current_test_multiplot_start_folder_index + num_multiplot_parameter_values);					
					current_test_multiplot_start_folder_index						+= num_TTP_values * num_multiplot_parameter_values;
					current_test_multiplot_end_folder 								= all_reduced_folder_strings[current_test_multiplot_start_folder_index - 1];			
					current_test_multiplot_folder_basename							= modify_parameter_values_string(current_test_multiplot_start_folder, parameter_string_prefixes, REMOVE_VALUE_STRINGS, TTP_index, UNDERSCORE_STRING, UNDERSCORE_STRING, EMPTY_STRING, EMPTY_STRING, STRING_DONT_ADD_SPACES);
					printvareq("current_test_multiplot_folder_basename", current_test_multiplot_folder_basename);
					current_test_multiplot_folder_basename							= remove_folder_parameter(current_test_multiplot_start_folder, TTP_prefix, REMOVE_PARAMETER_VALUE_ONLY, UNDERSCORE_STRING);
					printvareq("current_test_multiplot_folder_basename", current_test_multiplot_folder_basename);
					
					current_test_multiplot_value_strings							= split_parameter_value_string(current_test_multiplot_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_SPLIT_VALUES);
					Aps("current_test_multiplot_value_strings2", current_test_multiplot_value_strings);
					current_test_multiplot_value_strings 							= folder_2_parameter_value_strings(current_test_multiplot_start_folder, parameter_string_prefixes, EMPTY_STRING, STRING_DONT_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS);
					Aps("current_test_multiplot_value_strings", current_test_multiplot_value_strings);
					current_test_multiplot_value_short_strings					 	= minimize_string_precision(current_test_multiplot_value_strings, parameter_string_precisions, RETURN_STRINGS, RETURN_DONT_FORCE_ARRAY);
					current_test_multiplot_parameter_values_string	 				= folder_2_parameter_values_string(current_test_multiplot_start_folder, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_OFF, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, TTP_index, EMPTY_ARRAY);					
					current_test_multiplot_title_parameter_values_string 			= generate_parameter_values_string(current_test_multiplot_value_short_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_ON, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, EMPTY_ARRAY, test_parameter_indices);					
					
					Aps("current_test_multiplot_value_strings", current_test_multiplot_value_strings);
					//current_test_folder_split_strings									= split_parameter_value_string(current_test_multiplot_title_parameter_values_string, parameter_string_prefixes, COMMA_STRING, EQUALS_STRING, RETURN_SPLIT_STRINGS);
					Aps("current_test_multiplot_value_strings", current_test_multiplot_value_strings);
					printvar("current_test_multiplot_title_parameter_values_string", current_test_multiplot_title_parameter_values_string);
					Aps("current_test_folder_split_strings", current_test_folder_split_strings);
					
					
					current_test_multiplot_title_other_parameter_values_string	 	= generate_parameter_values_string(current_test_multiplot_value_short_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_ON, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, test_parameter_indices, EMPTY_ARRAY);					
					current_test_multiplot_parameter_equals_strings 				= folder_2_parameter_value_strings(current_test_multiplot_start_folder, parameter_string_prefixes, EQUALS_STRING, STRING_DONT_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS);
					current_test_multiplot_file_suffix 								= generate_parameter_values_string(current_test_multiplot_value_strings, parameter_string_short_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, UNDERSCORE_STRING, EQUALS_STRING, STRING_DONT_ADD_SPACES, REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_ON, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, TTP_index, multiplot_parameter_index);
					//exit();
					/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////				
					//---------------------------------------------- Output directories -----------------------------------------------//
					/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////				
					//output_multiplot_data_parent_directory						= generate_PVT_multiplot_data_output_directory(PVTs_output_directory_parent, multiplot_parameter_index, current_test_multiplot_value_strings, multiplot_parameter_range_filenaming, TTP_range_suffix, parameter_string_prefixes, parameter_string_precisions);
					//print															("output_multiplot_data_parent_directory =\n" + output_multiplot_data_parent_directory);
					//output_multiplot_data_parent_folder 							= File.getName(output_multiplot_data_parent_directory);
					//print															("output_multiplot_data_parent_folder =\n" + output_multiplot_data_parent_folder);
					//make_subdirectory												(PVTs_output_directory_parent, output_multiplot_data_parent_folder,	DIRECTORIES_CREATED, PRINTING_OFF);
					output_multiplot_data_parent_folder 							= generate_parameter_values_string(current_test_multiplot_value_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, UNDERSCORE_STRING, UNDERSCORE_STRING, STRING_DONT_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_OFF, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, EMPTY_ARRAY, test_parameter_indices);
					//print															("output_multiplot_data_parent_folder =\n" + output_multiplot_data_parent_folder);
					output_multiplot_data_parent_directory							= make_subdirectory	(PVTs_output_directory_parent, output_multiplot_data_parent_folder,	DIRECTORIES_CREATED, PRINTING_OFF);
					//print															("output_multiplot_data_parent_directory =\n" + output_multiplot_data_parent_directory);
					//exit();
					//print_test_parameter_file_info									();
					//print_TTP_info													();
					print_PVT_data_info												();
					//print_multiplot_parameter_info									();
					print_PVT_multiplot_data_info									();
					//exit();
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************//
//********************************************************* Merge ROI Analysis CSV Files from Each Target Test Parameter Value **********************************************************//
//***************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////																	
					// INPUT: 	test_batch_directory//current_test_folders[i]//current_ROI_analysis_subdirectory//ROI_analysis_RSP_Error_output_filename 
					//		  	= D://...//B_3200_..._L0_Nk_#//Slice_10//d7//RSP_Error.csv
					// OUTPUT: 	test_batch_directory//PVT_output_data_parent_directory//current_ROI_analysis_subdirectory//merged_RSP_Error_CSV_filename  
					merged_RSP_CSV_filename								= RSP_data_files_basename 			+ UNDERSCORE_STRING + TTP_range_filenaming + CSV;
					merged_RSP_Error_CSV_filename						= RSP_error_data_files_basename 	+ UNDERSCORE_STRING + TTP_range_filenaming + CSV;
					merged_Std_Dev_CSV_filename							= Std_Dev_data_files_basename 		+ UNDERSCORE_STRING + TTP_range_filenaming + CSV;
					merged_TV_CSV_filename								= TV_data_files_basename 			+ UNDERSCORE_STRING + TTP_range_filenaming + CSV;
					merged_RSP_TXT_filename								= RSP_data_files_basename 			+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;
					merged_RSP_Error_TXT_filename						= RSP_error_data_files_basename 	+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;
					merged_Std_Dev_TXT_filename							= Std_Dev_data_files_basename 		+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;
					merged_TV_TXT_filename								= TV_data_files_basename 			+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;

					merge_multiplot_CSV_folder							= output_multiplot_data_parent_directory;
					merge_multiplot_RSP_CSV_folder						= merge_multiplot_CSV_folder 		+ FOLDER_SEPARATOR + current_analysis_subdirectory;
					merge_multiplot_RSP_Error_CSV_folder				= merge_multiplot_CSV_folder 		+ FOLDER_SEPARATOR + current_analysis_subdirectory;
					merge_multiplot_Std_Dev_CSV_folder					= merge_multiplot_CSV_folder 		+ FOLDER_SEPARATOR + current_analysis_subdirectory;
					//merge_multiplot_RSP_CSV_folder					= merge_multiplot_CSV_folder 		+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;
					//merge_multiplot_RSP_Error_CSV_folder				= merge_multiplot_CSV_folder 		+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;
					//merge_multiplot_Std_Dev_CSV_folder				= merge_multiplot_CSV_folder 		+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;
					merge_multiplot_TV_CSV_folder						= merge_multiplot_CSV_folder;
					merge_multiplot_PVT_CSV_folder						= PVT_output_multiplot_data_parent_directory;
					merge_multiplot_PVT_RSP_CSV_folder					= merge_multiplot_PVT_CSV_folder 	+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;;
					merge_multiplot_PVT_RSP_Error_CSV_folder			= merge_multiplot_PVT_CSV_folder 	+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;;
					merge_multiplot_PVT_Std_Dev_CSV_folder				= merge_multiplot_PVT_CSV_folder 	+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;;
					merge_multiplot_PVT_TV_CSV_folder					= merge_multiplot_PVT_CSV_folder;
					
					merge_multiplot_file_suffix 						= generate_parameter_values_string(current_test_multiplot_value_short_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, UNDERSCORE_STRING, EQUALS_STRING, STRING_DONT_ADD_SPACES, REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_ON, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, test_parameter_indices, EMPTY_ARRAY);					
					merge_multiplot_CSV_file_suffix						= UNDERSCORE_STRING 					+ merge_multiplot_file_suffix	 	+ UNDERSCORE_STRING + TTP_range_filenaming + CSV;
					merge_multiplot_TXT_file_suffix						= UNDERSCORE_STRING 					+ merge_multiplot_file_suffix 		+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;
					merge_multiplot_CSV_filename						= TV_data_files_basename 				+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_TXT_filename						= TV_data_files_basename 				+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_RSP_CSV_filename					= RSP_data_files_basename 				+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_RSP_TXT_filename					= RSP_data_files_basename 				+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_RSP_CSV_short_filename				= RSP_data_files_short_basename 		+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_RSP_TXT_short_filename				= RSP_data_files_short_basename 		+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_RSP_Error_CSV_filename				= RSP_Error_data_files_basename 		+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_RSP_Error_TXT_filename				= RSP_Error_data_files_basename 		+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_RSP_Error_CSV_short_filename		= RSP_Error_data_files_short_basename 	+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_RSP_Error_TXT_short_filename		= RSP_Error_data_files_short_basename	+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_Std_Dev_CSV_filename				= Std_Dev_data_files_basename 			+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_Std_Dev_TXT_filename				= Std_Dev_data_files_basename 			+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_Std_Dev_CSV_short_filename			= Std_Dev_data_files_short_basename 	+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_Std_Dev_TXT_short_filename			= Std_Dev_data_files_short_basename 	+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_TV_CSV_filename						= TV_data_files_basename 				+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_TV_TXT_filename						= TV_data_files_basename 				+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_TV_CSV_short_filename				= TV_data_files_short_basename 			+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_TV_TXT_short_filename				= TV_data_files_short_basename 			+ merge_multiplot_TXT_file_suffix;

					MERGED_RSP_FILE_PATH_LIST							= newArray(); MERGED_RSP_CSV_FILE_PATH_LIST 		= newArray(); MERGED_RSP_TXT_FILE_PATH_LIST 		= newArray(); MERGED_RSP_CSV_FOLDER_LIST 		= newArray(); MERGED_RSP_CSV_FILENAME_LIST 			= newArray(); MERGED_RSP_TXT_FILENAME_LIST 			= newArray();
					MERGED_RSP_ERROR_FILE_PATH_LIST						= newArray(); MERGED_RSP_ERROR_CSV_FILE_PATH_LIST 	= newArray(); MERGED_RSP_ERROR_TXT_FILE_PATH_LIST 	= newArray(); MERGED_RSP_ERROR_CSV_FOLDER_LIST 	= newArray(); MERGED_RSP_ERROR_CSV_FILENAME_LIST 	= newArray(); MERGED_RSP_ERROR_TXT_FILENAME_LIST 	= newArray();
					MERGED_STD_DEV_FILE_PATH_LIST						= newArray(); MERGED_STD_DEV_CSV_FILE_PATH_LIST 	= newArray(); MERGED_STD_DEV_TXT_FILE_PATH_LIST 	= newArray(); MERGED_STD_DEV_CSV_FOLDER_LIST 	= newArray(); MERGED_STD_DEV_CSV_FILENAME_LIST 		= newArray(); MERGED_STD_DEV_TXT_FILENAME_LIST 		= newArray();
					MERGED_TV_FILE_PATH_LIST							= newArray(); MERGED_TV_CSV_FILE_PATH_LIST 			= newArray(); MERGED_TV_TXT_FILE_PATH_LIST 			= newArray(); MERGED_TV_CSV_FOLDER_LIST 		= newArray(); MERGED_TV_CSV_FILENAME_LIST 			= newArray(); MERGED_TV_TXT_FILENAME_LIST 			= newArray();
								    						    			
					MERGED_PVT_RSP_FILE_PATH_LIST						= newArray(); MERGED_PVT_RSP_CSV_FILE_PATH_LIST 		= newArray(); MERGED_PVT_RSP_TXT_FILE_PATH_LIST 		= newArray(); MERGED_PVT_RSP_FOLDER_LIST 		= newArray(); MERGED_PVT_RSP_CSV_FILENAME_LIST 			= newArray(); MERGED_PVT_RSP_TXT_FILENAME_LIST 			= newArray();
					MERGED_PVT_RSP_ERROR_FILE_PATH_LIST					= newArray(); MERGED_PVT_RSP_ERROR_CSV_FILE_PATH_LIST 	= newArray(); MERGED_PVT_RSP_ERROR_TXT_FILE_PATH_LIST 	= newArray(); MERGED_PVT_RSP_ERROR_FOLDER_LIST 	= newArray(); MERGED_PVT_RSP_ERROR_CSV_FILENAME_LIST 	= newArray(); MERGED_PVT_RSP_ERROR_TXT_FILENAME_LIST 	= newArray();
					MERGED_PVT_STD_DEV_FILE_PATH_LIST					= newArray(); MERGED_PVT_STD_DEV_CSV_FILE_PATH_LIST 	= newArray(); MERGED_PVT_STD_DEV_TXT_FILE_PATH_LIST 	= newArray(); MERGED_PVT_STD_DEV_FOLDER_LIST 	= newArray(); MERGED_PVT_STD_DEV_CSV_FILENAME_LIST 		= newArray(); MERGED_PVT_STD_DEV_TXT_FILENAME_LIST 		= newArray();
					MERGED_PVT_TV_FILE_PATH_LIST						= newArray(); MERGED_PVT_TV_CSV_FILE_PATH_LIST 			= newArray(); MERGED_PVT_TV_TXT_FILE_PATH_LIST 			= newArray(); MERGED_PVT_TV_FOLDER_LIST 		= newArray(); MERGED_PVT_TV_CSV_FILENAME_LIST 			= newArray(); MERGED_PVT_TV_TXT_FILENAME_LIST 			= newArray();
								    
					MERGED_MULTIPLOT_RSP_FILE_PATH_LIST					= newArray(); MERGED_MULTIPLOT_RSP_CSV_FILE_PATH_LIST 		= newArray(); MERGED_MULTIPLOT_RSP_TXT_FILE_PATH_LIST 		= newArray(); MERGED_MULTIPLOT_RSP_FOLDER_LIST			= newArray(); MERGED_MULTIPLOT_RSP_CSV_FILENAME_LIST 			= newArray(); MERGED_MULTIPLOT_RSP_TXT_FILENAME_LIST 			= newArray();
					MERGED_MULTIPLOT_RSP_ERROR_FILE_PATH_LIST			= newArray(); MERGED_MULTIPLOT_RSP_ERROR_CSV_FILE_PATH_LIST = newArray(); MERGED_MULTIPLOT_RSP_ERROR_TXT_FILE_PATH_LIST = newArray(); MERGED_MULTIPLOT_RSP_ERROR_FOLDER_LIST 	= newArray(); MERGED_MULTIPLOT_RSP_ERROR_CSV_FILENAME_LIST 		= newArray(); MERGED_MULTIPLOT_RSP_ERROR_TXT_FILENAME_LIST 		= newArray();
					MERGED_MULTIPLOT_STD_DEV_FILE_PATH_LIST				= newArray(); MERGED_MULTIPLOT_STD_DEV_CSV_FILE_PATH_LIST 	= newArray(); MERGED_MULTIPLOT_STD_DEV_TXT_FILE_PATH_LIST 	= newArray(); MERGED_MULTIPLOT_STD_DEV_FOLDER_LIST 		= newArray(); MERGED_MULTIPLOT_STD_DEV_CSV_FILENAME_LIST 		= newArray(); MERGED_MULTIPLOT_STD_DEV_TXT_FILENAME_LIST 		= newArray();
					MERGED_MULTIPLOT_TV_FILE_PATH_LIST					= newArray(); MERGED_MULTIPLOT_TV_CSV_FILE_PATH_LIST 		= newArray(); MERGED_MULTIPLOT_TV_TXT_FILE_PATH_LIST 		= newArray(); MERGED_MULTIPLOT_TV_FOLDER_LIST 			= newArray(); MERGED_MULTIPLOT_TV_CSV_FILENAME_LIST 			= newArray(); MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST 			= newArray();

					DEBUG_LOOP_KILL_INDEX			= 23;
					if(merge_ROI_analysis_CSVs)
					{
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						print_section							("Merging the CSV files from the ROI analyses for each target test parameter value", true);
						merged_multiplot_RSP_data_by_ROI 				= newArray();
						merged_multiplot_RSP_Error_data_by_ROI 			= newArray();
						merged_multiplot_Std_Dev_data_by_ROI 			= newArray();
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						for(multiplot = 0; multiplot < num_multiplot_parameter_values; multiplot++)		
						{ 
							print_loop_status							(merge_ROI_analysis_data_read_section_statement, TTP_prefix, PRINT_MINOR_SECTION);								//"Reading ROI analysis..."
							multiplot_parameter_values_string 			= folder_2_parameter_values_string(current_test_multiplot_folders[multiplot], parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_OFF, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, TTP_index, EMPTY_ARRAY);					
							merge_ROI_analysis_folders_basename			= modify_parameter_values_string(current_test_multiplot_folders[multiplot], parameter_string_prefixes, REMOVE_VALUE_STRINGS, TTP_index, UNDERSCORE_STRING, UNDERSCORE_STRING, EMPTY_STRING, EMPTY_STRING, STRING_DONT_ADD_SPACES);
							printvareq("merge_ROI_analysis_folders_basename", merge_ROI_analysis_folders_basename);
							merge_ROI_analysis_folders_basename			= remove_folder_parameter(current_test_multiplot_folders[multiplot], TTP_prefix, REMOVE_PARAMETER_VALUE_ONLY, UNDERSCORE_STRING);
							printvareq("merge_ROI_analysis_folders_basename", merge_ROI_analysis_folders_basename);
							merged_PVT_parameter_value_strings 			= folder_2_parameter_value_strings(current_test_multiplot_folders[multiplot], parameter_string_prefixes, EMPTY_STRING, STRING_DONT_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS);
							merged_PVT_parameter_values_string 			= generate_parameter_values_string(merged_PVT_parameter_value_strings, parameter_string_short_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, UNDERSCORE_STRING, EQUALS_STRING, STRING_DONT_ADD_SPACES, REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_ON, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, TTP_index, EMPTY_ARRAY);
							merged_PVT_RSP_CSV_filename					= RSP_data_files_short_basename 		+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + CSV;
							merged_PVT_RSP_Error_CSV_filename			= RSP_error_data_files_short_basename 	+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + CSV;
							merged_PVT_Std_Dev_CSV_filename				= Std_Dev_data_files_short_basename 	+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + CSV;
							merged_PVT_TV_CSV_filename					= TV_data_files_short_basename 			+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + CSV;
							merged_PVT_RSP_TXT_filename					= RSP_data_files_short_basename 		+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + TXT;
							merged_PVT_RSP_Error_TXT_filename			= RSP_error_data_files_short_basename 	+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + TXT;
							merged_PVT_Std_Dev_TXT_filename				= Std_Dev_data_files_short_basename 	+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + TXT;
							merged_PVT_TV_TXT_filename					= TV_data_files_short_basename 			+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + TXT;
							merged_PVT_CSV_folder						= PVT_output_data_parent_directory;
							merged_PVT_ROI_analysis_CSV_folder			= PVT_output_data_parent_directory 	+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;
							merged_PVT_RSP_CSV_folder					= merged_PVT_ROI_analysis_CSV_folder;
							merged_PVT_RSP_Error_CSV_folder				= merged_PVT_ROI_analysis_CSV_folder;
							merged_PVT_Std_Dev_CSV_folder				= merged_PVT_ROI_analysis_CSV_folder;
							merged_PVT_TV_CSV_folder					= merged_PVT_CSV_folder;
							merged_PVT_RSP_CSV_path						= merged_PVT_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + merged_PVT_RSP_CSV_filename;
							merged_PVT_RSP_Error_CSV_path				= merged_PVT_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + merged_PVT_RSP_Error_CSV_filename;
							merged_PVT_Std_Dev_CSV_path					= merged_PVT_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + merged_PVT_Std_Dev_CSV_filename;
							merged_PVT_TV_CSV_path						= merged_PVT_CSV_folder 				+ FOLDER_SEPARATOR + merged_PVT_TV_CSV_filename;
							
							merged_CSV_folder							= test_batch_directory 	+ merge_ROI_analysis_folders_basename + TTP_range_suffix;
							merged_RSP_CSV_folder						= merged_CSV_folder 	+ current_ROI_analysis_subdirectory;
							merged_RSP_Error_CSV_folder					= merged_CSV_folder 	+ current_ROI_analysis_subdirectory;
							merged_Std_Dev_CSV_folder					= merged_CSV_folder 	+ current_ROI_analysis_subdirectory;							
							merged_TV_CSV_folder						= merged_CSV_folder;
							merged_RSP_CSV_path							= merged_RSP_CSV_folder 		+ FOLDER_SEPARATOR + merged_RSP_CSV_filename;										 			
							merged_RSP_Error_CSV_path					= merged_RSP_Error_CSV_folder 	+ FOLDER_SEPARATOR + merged_RSP_Error_CSV_filename;										 			
							merged_Std_Dev_CSV_path						= merged_Std_Dev_CSV_folder 	+ FOLDER_SEPARATOR + merged_Std_Dev_CSV_filename;										 			
							merged_TV_CSV_path							= merged_TV_CSV_folder 			+ FOLDER_SEPARATOR + merged_TV_CSV_filename;										 			
							merged_RSP_TXT_path							= merged_RSP_CSV_folder 		+ FOLDER_SEPARATOR + merged_RSP_TXT_filename;										 			
							merged_RSP_Error_TXT_path					= merged_RSP_Error_CSV_folder 	+ FOLDER_SEPARATOR + merged_RSP_Error_TXT_filename;										 			
							merged_Std_Dev_TXT_path						= merged_Std_Dev_CSV_folder 	+ FOLDER_SEPARATOR + merged_Std_Dev_TXT_filename;										 			
							merged_TV_TXT_path							= merged_TV_CSV_folder 			+ FOLDER_SEPARATOR + merged_TV_TXT_filename;										 			
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							print_merged_output_file_info				();	 
				    		make_merged_CSV_directories					();
				    		append_2_log								(merged_CSV_folder);
							append_2_log								(merged_PVT_CSV_folder);
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							merged_RSP_data 							= newArray();						
							merged_RSP_Error_data 						= newArray();						
							merged_Std_Dev_data 						= newArray();						
							merged_TV_data 								= newArray();						
							merged_before_TVS_TV_data 					= newArray();						
							merged_after_TVS_TV_data 					= newArray();						
							merged_TV_reduction_data 					= newArray();						
							merged_interleaved_TV_data 					= newArray();						
							merged_concat_TV_data 						= newArray();						
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							for											(N = 0; N < num_TTP_values; N++)
							{
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								import_CSV_folder						= test_batch_directory 			+  merge_ROI_analysis_folders_basename + UNDERSCORE_STRING + d2s(N + 1, 0);
								import_RSP_CSV_folder					= import_CSV_folder 			+ current_ROI_analysis_subdirectory;
								import_RSP_Error_CSV_folder				= import_CSV_folder 			+ current_ROI_analysis_subdirectory;
								import_Std_Dev_CSV_folder				= import_CSV_folder 			+ current_ROI_analysis_subdirectory;
								import_TV_CSV_folder					= import_CSV_folder;
								import_RSP_CSV_path						= import_RSP_CSV_folder 		+ FOLDER_SEPARATOR + ROI_analysis_RSP_output_filename;
								import_RSP_Error_CSV_path				= import_RSP_Error_CSV_folder 	+ FOLDER_SEPARATOR + ROI_analysis_RSP_Error_output_filename;
								import_Std_Dev_CSV_path					= import_Std_Dev_CSV_folder 	+ FOLDER_SEPARATOR + ROI_analysis_Std_Dev_output_filename;
								import_TV_CSV_path						= import_TV_CSV_folder 			+ FOLDER_SEPARATOR + ROI_analysis_TV_input_filename;								
								print("import_TV_CSV_path " + import_TV_CSV_path );
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								copied_RSP_CSV_filename					= RSP_data_files_basename 		+  UNDERSCORE_STRING + parameter_string_prefixes[TTP_index] + UNDERSCORE_STRING + d2s(N + 1, 0) + CSV;
								copied_RSP_Error_CSV_filename			= RSP_error_data_files_basename	+  UNDERSCORE_STRING + parameter_string_prefixes[TTP_index] + UNDERSCORE_STRING + d2s(N + 1, 0) + CSV;
								copied_Std_Dev_CSV_filename				= Std_Dev_data_files_basename  	+  UNDERSCORE_STRING + parameter_string_prefixes[TTP_index] + UNDERSCORE_STRING + d2s(N + 1, 0) + CSV;
								copy_distributed_file					(import_RSP_CSV_folder, 		ROI_analysis_RSP_output_filename, 		merged_RSP_CSV_folder, 			copied_RSP_CSV_filename, 					print_input_CSV_path);
								copy_distributed_file					(import_RSP_Error_CSV_folder, 	ROI_analysis_RSP_Error_output_filename, merged_RSP_Error_CSV_folder, 	copied_RSP_Error_CSV_filename, 				print_input_CSV_path);
								copy_distributed_file					(import_Std_Dev_CSV_folder, 	ROI_analysis_Std_Dev_output_filename, 	merged_Std_Dev_CSV_folder, 		copied_Std_Dev_CSV_filename, 				print_input_CSV_path);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								RSP_data 								= csv_2_array(import_RSP_CSV_folder, 		ROI_analysis_RSP_output_filename, 		iterations_2_analyze_strings, num_ROIs_2_analyze, ROW_MAJOR, 	true);
								RSP_error_data 							= csv_2_array(import_RSP_Error_CSV_folder, 	ROI_analysis_RSP_Error_output_filename, iterations_2_analyze_strings, num_ROIs_2_analyze, ROW_MAJOR, 	true);
								Std_Dev_data 							= csv_2_array(import_Std_Dev_CSV_folder, 	ROI_analysis_Std_Dev_output_filename, 	iterations_2_analyze_strings, num_ROIs_2_analyze, ROW_MAJOR, 	true);
								TV_data 								= file_2_float_array(import_TV_CSV_folder, 	ROI_analysis_TV_input_filename, 																		print_input_TXT_path);
								Aps("TV_data", TV_data);
								merged_RSP_data 						= Array.concat(merged_RSP_data, 			RSP_data);																							
								merged_RSP_Error_data 					= Array.concat(merged_RSP_Error_data, 		RSP_error_data);																							
								merged_Std_Dev_data 					= Array.concat(merged_Std_Dev_data, 		Std_Dev_data);		
								merged_TV_data 							= Array.concat(merged_TV_data, 				TV_data);		
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								before_TVS_TV_data 						= newArray();						
								after_TVS_TV_data 						= newArray();						
								TV_reduction_data 						= newArray();						
								for										(iteration = 0; iteration < num_recon_iterations; iteration++)
								{		
									TV_index							= iteration * TV_measurements_per_iteration;
									before_TVS_data_value				= TV_data[TV_index + before_TVS_index];
									after_TVS_data_value				= TV_data[TV_index + after_TVS_index];
									before_TVS_TV_data 					= Array.concat(before_TVS_TV_data, 	before_TVS_data_value);						
									after_TVS_TV_data 					= Array.concat(after_TVS_TV_data,	after_TVS_data_value);
									TV_reduction_data 					= Array.concat(TV_reduction_data, 	before_TVS_data_value - after_TVS_data_value);				
								}				
								merged_before_TVS_TV_data 				= Array.concat(merged_before_TVS_TV_data, 	before_TVS_TV_data);						
								merged_after_TVS_TV_data 				= Array.concat(merged_after_TVS_TV_data,	after_TVS_TV_data);
								merged_TV_reduction_data 				= Array.concat(merged_TV_reduction_data, 	TV_reduction_data);	
								merged_interleaved_TV_data				= Array.concat(merged_interleaved_TV_data,	before_TVS_TV_data);
								merged_interleaved_TV_data				= Array.concat(merged_interleaved_TV_data,	after_TVS_TV_data);
								merged_interleaved_TV_data				= Array.concat(merged_interleaved_TV_data,	TV_reduction_data);
								num_input_data_sets++;
							}
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							by_ROI_index = 0;
							merged_RSP_data_by_ROI 						= newArray(merged_RSP_data.length);
							merged_RSP_Error_data_by_ROI 				= newArray(merged_RSP_Error_data.length);
							merged_Std_Dev_data_by_ROI 					= newArray(merged_Std_Dev_data.length);
							for											(ROI = 0; ROI < num_ROIs_2_analyze; ROI++)
								for										(N = 0; N < num_TTP_values; N++)
									for									(iteration = 0; iteration <= num_recon_iterations; iteration++)
									{
										index 										= ROI + iteration * num_ROIs_2_analyze + N * (num_recon_iterations + 1) * num_ROIs_2_analyze;
										merged_RSP_data_by_ROI[by_ROI_index]		= merged_RSP_data[index];
										merged_RSP_Error_data_by_ROI[by_ROI_index]	= merged_RSP_Error_data[index];
										merged_Std_Dev_data_by_ROI[by_ROI_index]	= merged_Std_Dev_data[index];
										by_ROI_index++;
									}
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							merged_multiplot_RSP_data_by_ROI 			= Array.concat(merged_multiplot_RSP_data_by_ROI, merged_RSP_data_by_ROI);
							merged_multiplot_RSP_Error_data_by_ROI 		= Array.concat(merged_multiplot_RSP_Error_data_by_ROI, merged_RSP_Error_data_by_ROI);
							merged_multiplot_Std_Dev_data_by_ROI 		= Array.concat(merged_multiplot_Std_Dev_data_by_ROI, merged_Std_Dev_data_by_ROI);
							merged_concat_TV_data						= Array.concat(merged_concat_TV_data, merged_before_TVS_TV_data);
							merged_concat_TV_data						= Array.concat(merged_concat_TV_data, merged_after_TVS_TV_data);
							merged_concat_TV_data						= Array.concat(merged_concat_TV_data, merged_TV_reduction_data);
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							ROI_table_grid_titles 						= array_from_data(multiplot_parameter_values_string); 
							ROI_table_grid_labels 						= Array.concat(ROI_table_grid_titles, ROI_table_titles, ROI_table_column_headers, ROI_table_row_headers);
							ROI_table_grid_labels_lengths				= Array.concat((ROI_table_grid_titles.length), (ROI_table_titles.length),(ROI_table_column_headers.length),(ROI_table_row_headers.length));
							ROI_table_grid_label_indices 				= series_ops(ROI_table_grid_labels_lengths, SERIES_SUMMATION, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							TV_table_grid_titles 						= array_from_data(multiplot_parameter_values_string); 
							TV_table_grid_labels 						= Array.concat(TV_table_grid_titles, TV_table_titles, TV_table_column_headers, TV_table_row_headers);
							TV_table_grid_labels_lengths				= Array.concat((TV_table_grid_titles.length), (TV_table_titles.length),(TV_table_column_headers.length),(TV_table_row_headers.length));
							TV_table_grid_label_indices 				= series_ops(TV_table_grid_labels_lengths, SERIES_SUMMATION, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							print_loop_status							(merge_ROI_analysis_section_statement, current_multiplot_analysis_number + 1, PRINT_MAJOR_SECTION);						//"Reading ROI analysis..."
							print_loop_status							(merged_ROI_analysis_2_disk_section_statement, multiplot, PRINT_MINOR_SECTION);										//"Reading ROI analysis..."
							//------------------------------------------ Merge RSP CSV Data Files --------------------------------------------------------------------------------------------------------//
							clearResults								();
							IJROI_analysis_config_CSV					();
							IJIO_configOptions							(IJIO_CONFIG_OPTIONS_OFF);
							num_ROI_tables								= num_ROIs_2_analyze;
							num_ROI_multiplot_tables					= num_multiplot_parameter_values * num_ROI_tables;
							ROI_table_first_column						= first_column;
							ROI_table_column_separation					= 1;
							ROI_table_row_separation 					= table_row_separation; 
							ROI_table_columns							= num_recon_iterations + 1;
							ROI_table_rows								= num_TTP_values;
							ROI_table_row_offset 						= ROI_table_rows + column_labels_row_separation + ROI_table_row_separation  + 1; 
							ROI_table_grid_columns						= num_ROI_tables;//2;//
							ROI_table_total_columns						= tables_total_columns(first_column, ROI_table_grid_columns, ROI_table_columns, ROI_table_column_separation);
							ROI_table_titles 							= Array.copy(ROI_labels); 
							ROI_table_column_headers 					= Array.copy(iterations_2_analyze_strings); 
							ROI_table_row_headers 						= Array.copy(TTP_value_strings); 				
							ROI_table_title_dimensions					= newArray(title_start_column, 		title_start_row, 	title_row_separation, 	ROI_table_total_columns);
							ROI_table_dimensions						= newArray(ROI_table_first_column, 	ROI_table_columns, 	ROI_table_rows, 		ROI_table_column_separation, ROI_table_row_separation, column_labels_row_separation);					
							ROI_multiplot_table_grid_columns			= num_ROI_tables;//2;//
							ROI_multiplot_table_total_columns			= tables_total_columns(first_column, ROI_multiplot_table_grid_columns, ROI_table_columns, ROI_table_column_separation);						
							ROI_multiplot_table_title_dimensions		= newArray(title_start_column, 		title_start_row, 	title_row_separation, 	ROI_multiplot_table_total_columns);
							ROI_multiplot_table_titles 					= table_grid_row_array_duplication( ROI_labels, num_ROI_multiplot_tables);
							//exit();
							function table_query_nColumns()
							{
								_last_column_index = 0;
								//while(getResultString(_last_column_index++, _row) != "null");// && _loops < 125)
								while( !isMember(getResultString(_last_column_index++, 0), MISSING_COLUMN_RESULTS, RETURN_MATCH_TF));
								return _last_column_index - 1;
							}
							function table_add_Excel_code(_column, _row, _total_columns, _code)
							{
								_total_columns		= table_query_nColumns();
								if					(_row >= nResults)
									_current_row	= table_add_empty_rows			( _total_columns, nResults, _row - nResults + 1);								
								setResult			(_column,  _row, EQUALS_STRING + _code);	
								return _row;
							}
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							if											(merge_ROI_analysis_RSP_CSVs)
							{	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								current_row								= table_grid_fill_all(ROI_table_grid_labels, ROI_table_grid_label_indices, ROI_table_grid_columns, ROI_table_title_dimensions, ROI_table_dimensions, merged_RSP_data_by_ROI, ROW_ORDER);
								current_row								= table_add_Excel_code(0,  current_row + 2, ROI_table_total_columns, "34/2");
								//exit();
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								results_table_2_CSV_if					(merged_RSP_CSV_folder, 				merged_RSP_CSV_filename, 							true, true, 	true, false);//print_output_CSV_path
								results_table_2_CSV_if					(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_RSP_CSV_filename, 						write_merged_RSP_CSV_data, overwrite_merged_RSP_CSV_data, 	true, false);
								float_array_2_TXT_if					(merged_RSP_CSV_folder, 				merged_RSP_TXT_filename, merged_RSP_data_by_ROI, 	write_merged_RSP_TXT_data, overwrite_merged_RSP_TXT_data, 	true		);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								MERGED_RSP_CSV_FOLDER_LIST				= Array.concat(MERGED_RSP_CSV_FOLDER_LIST, 			merged_RSP_CSV_folder);
								MERGED_RSP_TXT_FILENAME_LIST			= Array.concat(MERGED_RSP_TXT_FILENAME_LIST, 		merged_RSP_TXT_filename);
								MERGED_RSP_TXT_FILE_PATH_LIST			= Array.concat(MERGED_RSP_TXT_FILE_PATH_LIST, 		merged_RSP_TXT_path);
								MERGED_PVT_RSP_TXT_FILENAME_LIST		= Array.concat(MERGED_PVT_RSP_TXT_FILENAME_LIST, 	merged_PVT_RSP_TXT_filename);
							}
							//exit();
							lKill(num_loops, ROI_ANALYSIS_KILL_INDEX);
							//------------------------------------------ Repeat for the RSP Error CSV Data Files -----------------------------------------------------------------------------------------//
							if											(merge_ROI_analysis_RSP_Error_CSVs)
							{	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								table_grid_fill_all						(ROI_table_grid_labels, ROI_table_grid_label_indices, ROI_table_grid_columns, ROI_table_title_dimensions, ROI_table_dimensions, merged_RSP_Error_data_by_ROI, ROW_ORDER);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								results_table_2_CSV_if					(merged_RSP_Error_CSV_folder, 			merged_RSP_Error_CSV_filename, 									write_merged_RSP_Error_CSV_data, overwrite_merged_RSP_Error_CSV_data, 	print_output_CSV_path, false);
								results_table_2_CSV_if					(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_RSP_Error_CSV_filename, 								write_merged_RSP_Error_CSV_data, overwrite_merged_RSP_Error_CSV_data, 	print_output_CSV_path, false);
								float_array_2_TXT_if					(merged_RSP_Error_CSV_folder, 			merged_RSP_Error_TXT_filename, merged_RSP_Error_data_by_ROI,	write_merged_RSP_Error_TXT_data, overwrite_merged_RSP_Error_TXT_data, 			print_output_TXT_path		);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								MERGED_RSP_ERROR_CSV_FOLDER_LIST		= Array.concat(MERGED_RSP_ERROR_CSV_FOLDER_LIST, 		merged_RSP_Error_CSV_folder);
								MERGED_RSP_ERROR_TXT_FILENAME_LIST		= Array.concat(MERGED_RSP_ERROR_TXT_FILENAME_LIST, 		merged_RSP_Error_TXT_filename);
								MERGED_RSP_ERROR_TXT_FILE_PATH_LIST		= Array.concat(MERGED_RSP_ERROR_TXT_FILE_PATH_LIST, 	merged_RSP_Error_TXT_path);
								MERGED_PVT_RSP_ERROR_TXT_FILENAME_LIST	= Array.concat(MERGED_PVT_RSP_ERROR_TXT_FILENAME_LIST,	merged_PVT_RSP_Error_TXT_filename);
							}
							lKill(num_loops, ROI_ANALYSIS_KILL_INDEX);
							//exit();
							//------------------------------------------ Repeat for the Standard Deviation CSV Data Files --------------------------------------------------------------------------------//
							if											(merge_ROI_analysis_Std_Dev_CSVs)
							{	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								table_grid_fill_all						(ROI_table_grid_labels, ROI_table_grid_label_indices, ROI_table_grid_columns, ROI_table_title_dimensions, ROI_table_dimensions, merged_Std_Dev_data_by_ROI, ROW_ORDER);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								results_table_2_CSV_if					(merged_Std_Dev_CSV_folder, 			merged_Std_Dev_CSV_filename, 								write_merged_Std_Dev_CSV_data, overwrite_merged_Std_Dev_CSV_data, 	print_output_CSV_path, false);
								results_table_2_CSV_if					(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_Std_Dev_CSV_filename, 							write_merged_Std_Dev_CSV_data, overwrite_merged_Std_Dev_CSV_data, 	print_output_CSV_path, false);
								float_array_2_TXT_if					(merged_Std_Dev_CSV_folder, 			merged_Std_Dev_TXT_filename, merged_Std_Dev_data_by_ROI, 	write_merged_Std_Dev_TXT_data, overwrite_merged_Std_Dev_TXT_data, 		print_output_TXT_path		);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								MERGED_STD_DEV_CSV_FOLDER_LIST			= Array.concat(MERGED_STD_DEV_CSV_FOLDER_LIST, 			merged_Std_Dev_CSV_folder);
								MERGED_STD_DEV_TXT_FILENAME_LIST		= Array.concat(MERGED_STD_DEV_TXT_FILENAME_LIST, 		merged_TV_TXT_filename);
								MERGED_STD_DEV_TXT_FILE_PATH_LIST		= Array.concat(MERGED_STD_DEV_TXT_FILE_PATH_LIST, 		merged_Std_Dev_TXT_path);
							    MERGED_PVT_STD_DEV_TXT_FILENAME_LIST	= Array.concat(MERGED_PVT_STD_DEV_TXT_FILENAME_LIST, 	merged_PVT_Std_Dev_TXT_filename);
							}
							lKill(num_loops, ROI_ANALYSIS_KILL_INDEX);
							//exit();
							//------------------------------------------ Create TV CSV Data Files from TV TXT files --------------------------------------------------------------------------------------//
							if											(merge_TV_CSVs)
							{	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								table_grid_fill_all						(TV_table_grid_labels, TV_table_grid_label_indices, TV_table_grid_columns, TV_table_title_dimensions, TV_table_dimensions, merged_concat_TV_data, ROW_ORDER);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								results_table_2_CSV_if					(merged_TV_CSV_folder, 	merged_TV_CSV_filename, 						write_merged_TV_CSV_data, overwrite_merged_TV_CSV_data, print_output_CSV_path, false	);
								results_table_2_CSV_if					(merged_PVT_CSV_folder, merged_PVT_TV_CSV_filename, 					write_merged_TV_CSV_data, overwrite_merged_TV_CSV_data, print_output_CSV_path, false	);
								float_array_2_TXT_if					(merged_TV_CSV_folder, 	merged_TV_TXT_filename, merged_concat_TV_data, 	write_merged_TV_TXT_data, overwrite_merged_TV_TXT_data, print_output_TXT_path			);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								MERGED_TV_CSV_FOLDER_LIST				= Array.concat(MERGED_TV_CSV_FOLDER_LIST, 		merged_TV_CSV_folder);
								MERGED_TV_TXT_FILENAME_LIST				= Array.concat(MERGED_TV_TXT_FILENAME_LIST,		merged_TV_TXT_filename);
								MERGED_TV_TXT_FILE_PATH_LIST			= Array.concat(MERGED_TV_TXT_FILE_PATH_LIST, 	merged_TV_TXT_path);
								MERGED_PVT_TV_TXT_FILENAME_LIST			= Array.concat(MERGED_PVT_TV_TXT_FILENAME_LIST, merged_PVT_TV_TXT_filename);
							}
							lKill(num_loops, ROI_ANALYSIS_KILL_INDEX);
							//exit();
						}	
						print_loop_status								(merge_ROI_analysis_data_completed_statement, multiplot_parameter_prefix, PRINT_MINOR_SECTION);										//"Reading ROI analysis..."
					}// END: if(merge_ROI_analysis_CSVs)
					//exit();
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
//*************************************************** Merge the CSV files for each multiplot parameter value and target test parameter value ********************************************************//
//***************************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
					if													(merge_multiplot_CSVs)
					{	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						print_loop_status								(merge_multiplot_data_read_section_statement, multiplot_parameter_prefix, PRINT_MINOR_SECTION);	//"Reading ROI analysis..."
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						merge_multiplot_RSP_Error_data 					= newArray();
						merge_multiplot_Std_Dev_data 					= newArray();
						merge_multiplot_RSP_data 						= newArray();
						merge_multiplot_TV_data 						= newArray();
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						RSP_multiplot_table_grid_titles 				= array_from_data(MERGED_PVT_RSP_TXT_FILENAME_LIST); 
						RSP_multiplot_table_grid_labels 				= Array.concat(	 RSP_multiplot_table_grid_titles, 			 ROI_multiplot_table_titles, 			 ROI_table_column_headers, 				 ROI_table_row_headers			);
						RSP_multiplot_table_grid_labels_lengths			= Array.concat(	(RSP_multiplot_table_grid_titles.length), 	(ROI_multiplot_table_titles.length),	(ROI_table_column_headers.length),		(ROI_table_row_headers.length)	);
						RSP_multiplot_table_grid_label_indices 			= series_ops(RSP_multiplot_table_grid_labels_lengths, SERIES_SUMMATION, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						RSP_Error_multiplot_table_grid_titles 			= array_from_data(MERGED_PVT_RSP_ERROR_TXT_FILENAME_LIST); 
						RSP_Error_multiplot_table_grid_labels 			= Array.concat(	 RSP_Error_multiplot_table_grid_titles, 			 ROI_multiplot_table_titles, 			 ROI_table_column_headers, 				 ROI_table_row_headers			);
						RSP_Error_multiplot_table_grid_labels_lengths	= Array.concat(	(RSP_Error_multiplot_table_grid_titles.length), 	(ROI_multiplot_table_titles.length),	(ROI_table_column_headers.length),		(ROI_table_row_headers.length)	);
						RSP_Error_multiplot_table_grid_label_indices 	= series_ops(RSP_Error_multiplot_table_grid_labels_lengths, SERIES_SUMMATION, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						Std_Dev_multiplot_table_grid_titles 			= array_from_data(MERGED_PVT_STD_DEV_TXT_FILENAME_LIST); 
						Std_Dev_multiplot_table_grid_labels 			= Array.concat(	 Std_Dev_multiplot_table_grid_titles, 			 ROI_multiplot_table_titles, 			 ROI_table_column_headers, 				 ROI_table_row_headers			);
						Std_Dev_multiplot_table_grid_labels_lengths		= Array.concat(	(Std_Dev_multiplot_table_grid_titles.length), 	(ROI_multiplot_table_titles.length),	(ROI_table_column_headers.length),		(ROI_table_row_headers.length)	);
						Std_Dev_multiplot_table_grid_label_indices 		= series_ops(Std_Dev_multiplot_table_grid_labels_lengths, SERIES_SUMMATION, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						TV_multiplot_table_grid_titles 					= array_from_data(MERGED_PVT_TV_TXT_FILENAME_LIST); 
						TV_multiplot_table_grid_labels 					= Array.concat(		 TV_multiplot_table_grid_titles, 		  TV_multiplot_table_titles, 		  TV_table_column_headers, 			 TV_table_row_headers			);
						TV_multiplot_table_grid_labels_lengths			= Array.concat(		(TV_multiplot_table_grid_titles.length), (TV_multiplot_table_titles.length), (TV_table_column_headers.length), 	(TV_table_row_headers.length)	);
						TV_multiplot_table_grid_label_indices 			= series_ops(TV_multiplot_table_grid_labels_lengths, SERIES_SUMMATION, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						//write_merged_multiplot_Std_Dev_CSV_data, overwrite_merged_Std_Dev_CSV_data, merge_multiplot_PVT_CSV_folder, merge_multiplot_Std_Dev_CSV_short_filename, print_output_CSV_path
						//write_merged_multiplot_Std_Dev_TXT_data, overwrite_merged_Std_Dev_TXT_data, merge_multiplot_PVT_CSV_folder, merge_multiplot_Std_Dev_TXT_short_filename, print_output_TXT_path, 
						print_merge_multiplot_output_file_info			();
						make_merge_multiplot_CSV_directories			();
						append_2_log									(merge_multiplot_CSV_folder);
						append_2_log									(merge_multiplot_PVT_CSV_folder);
						//exit();
						//******************************************* REMOVE TV[0-1] from filenames since files are written to TV[0-1] subdirectory
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						print_loop_status								(merge_multiplot_section_statement, 		current_multiplot_analysis_number + 1, 	PRINT_MAJOR_SECTION);	//"Reading ROI analysis..."
						print_loop_status								(merged_multiplot_2_disk_section_statement, multiplot_parameter_prefix, 			PRINT_MINOR_SECTION);											//"Reading ROI analysis..."
						if												(merge_multiplot_RSP_CSVs)
						{// merge_multiplot_RSP_CSV_folder, merge_multiplot_PVT_RSP_CSV_folder, merge_multiplot_RSP_CSV_short_filename, merge_multiplot_RSP_TXT_short_filename, merge_multiplot_RSP_data, write_merged_multiplot_RSP_CSV_data, write_merged_multiplot_RSP_TXT_data, overwrite_merged_RSP_CSV_data, overwrite_merged_RSP_TXT_data, print_output_CSV_path, print_output_TXT_path, false  
							merge_multiplot_RSP_data					= table_grid_fill_all_imported(RSP_multiplot_table_grid_labels, RSP_multiplot_table_grid_label_indices, ROI_multiplot_table_grid_columns, ROI_multiplot_table_title_dimensions, ROI_table_dimensions, MERGED_RSP_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
							results_table_2_CSV_if						(merge_multiplot_RSP_CSV_folder, 		merge_multiplot_RSP_CSV_short_filename, 							write_merged_multiplot_RSP_CSV_data, overwrite_merged_RSP_CSV_data, 		print_output_CSV_path, false);
							results_table_2_CSV_if						(merge_multiplot_PVT_RSP_CSV_folder, 	merge_multiplot_RSP_CSV_short_filename, 							write_merged_multiplot_RSP_CSV_data, overwrite_merged_RSP_CSV_data, 		print_output_CSV_path, false);
							float_array_2_TXT_if						(merge_multiplot_RSP_CSV_folder, 		merge_multiplot_RSP_TXT_short_filename, merge_multiplot_RSP_data, 	write_merged_multiplot_RSP_TXT_data, overwrite_merged_RSP_TXT_data, 		print_output_TXT_path		);
							float_array_2_TXT_if						(merge_multiplot_PVT_RSP_CSV_folder, 	merge_multiplot_RSP_TXT_short_filename, merge_multiplot_RSP_data, 	write_merged_multiplot_RSP_TXT_data, overwrite_merged_RSP_TXT_data, 		print_output_TXT_path		);
						}
						lKill											(num_loops, ROI_ANALYSIS_KILL_INDEX);
						//exit();
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						if												(merge_multiplot_RSP_Error_CSVs)
						{
							merge_multiplot_RSP_Error_data				= table_grid_fill_all_imported(RSP_Error_multiplot_table_grid_labels, RSP_Error_multiplot_table_grid_label_indices, ROI_multiplot_table_grid_columns, ROI_multiplot_table_title_dimensions, ROI_table_dimensions, MERGED_RSP_ERROR_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
							results_table_2_CSV_if						(merge_multiplot_RSP_Error_CSV_folder, 		merge_multiplot_RSP_Error_CSV_short_filename, 									write_merged_multiplot_RSP_Error_CSV_data, overwrite_merged_RSP_Error_CSV_data, 	print_output_CSV_path, false	);
							results_table_2_CSV_if						(merge_multiplot_PVT_RSP_Error_CSV_folder, 	merge_multiplot_RSP_Error_CSV_short_filename, 									write_merged_multiplot_RSP_Error_CSV_data, overwrite_merged_RSP_Error_CSV_data, 	print_output_CSV_path, false	);
							float_array_2_TXT_if						(merge_multiplot_RSP_Error_CSV_folder, 		merge_multiplot_RSP_Error_TXT_short_filename, merge_multiplot_RSP_Error_data, 	write_merged_multiplot_RSP_Error_TXT_data, overwrite_merged_RSP_Error_TXT_data, 	print_output_TXT_path			);
							float_array_2_TXT_if						(merge_multiplot_PVT_RSP_Error_CSV_folder, 	merge_multiplot_RSP_Error_TXT_short_filename, merge_multiplot_RSP_Error_data, 	write_merged_multiplot_RSP_Error_TXT_data, overwrite_merged_RSP_Error_TXT_data, 	print_output_TXT_path			);
						}
						lKill											(num_loops, ROI_ANALYSIS_KILL_INDEX);
						//exit();
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						if												(merge_multiplot_Std_Dev_CSVs)
						{
							merge_multiplot_Std_Dev_data				= table_grid_fill_all_imported(Std_Dev_multiplot_table_grid_labels, Std_Dev_multiplot_table_grid_label_indices, ROI_multiplot_table_grid_columns, ROI_multiplot_table_title_dimensions, ROI_table_dimensions, MERGED_STD_DEV_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
							results_table_2_CSV_if						(merge_multiplot_Std_Dev_CSV_folder, 		merge_multiplot_Std_Dev_CSV_short_filename, 								write_merged_multiplot_Std_Dev_CSV_data, overwrite_merged_Std_Dev_CSV_data, 	print_output_CSV_path, false);
							results_table_2_CSV_if						(merge_multiplot_PVT_Std_Dev_CSV_folder, 	merge_multiplot_Std_Dev_CSV_short_filename, 								write_merged_multiplot_Std_Dev_CSV_data, overwrite_merged_Std_Dev_CSV_data, 	print_output_CSV_path, false);
							float_array_2_TXT_if						(merge_multiplot_Std_Dev_CSV_folder,		merge_multiplot_Std_Dev_TXT_short_filename, merge_multiplot_Std_Dev_data, 	write_merged_multiplot_Std_Dev_TXT_data, overwrite_merged_Std_Dev_TXT_data, 	print_output_TXT_path		);
							float_array_2_TXT_if						(merge_multiplot_PVT_Std_Dev_CSV_folder,	merge_multiplot_Std_Dev_TXT_short_filename, merge_multiplot_Std_Dev_data, 	write_merged_multiplot_Std_Dev_TXT_data, overwrite_merged_Std_Dev_TXT_data, 	print_output_TXT_path		);
						}
						lKill											(num_loops, ROI_ANALYSIS_KILL_INDEX);
						//exit();
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						if												(merge_multiplot_TV_CSVs)
						{
							merge_multiplot_TV_data						= table_grid_fill_all_imported(TV_multiplot_table_grid_labels, TV_multiplot_table_grid_label_indices, TV_multiplot_table_grid_columns, TV_multiplot_table_title_dimensions, TV_table_dimensions, MERGED_TV_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
							results_table_2_CSV_if						(merge_multiplot_TV_CSV_folder, 						merge_multiplot_TV_CSV_short_filename, 								write_merged_multiplot_TV_CSV_data, overwrite_merged_TV_CSV_data, 	print_output_CSV_path, false);
							results_table_2_CSV_if						(merge_multiplot_PVT_TV_CSV_folder, 					merge_multiplot_TV_CSV_short_filename, 								write_merged_multiplot_TV_CSV_data, overwrite_merged_TV_CSV_data, 	print_output_CSV_path, false);
							float_array_2_TXT_if						(merge_multiplot_TV_CSV_folder, 						merge_multiplot_TV_TXT_short_filename, merge_multiplot_TV_data, 	write_merged_multiplot_TV_TXT_data, overwrite_merged_TV_TXT_data,	print_output_TXT_path		);					
							float_array_2_TXT_if						(merge_multiplot_PVT_TV_CSV_folder, 					merge_multiplot_TV_TXT_short_filename, merge_multiplot_TV_data, 	write_merged_multiplot_TV_TXT_data, overwrite_merged_TV_TXT_data,	print_output_TXT_path		);					
							MERGED_MULTIPLOT_TV_FOLDER_LIST				= Array.concat(MERGED_MULTIPLOT_TV_FOLDER_LIST, 		merge_multiplot_PVT_CSV_folder);
					    	MERGED_MULTIPLOT_TV_CSV_FILENAME_LIST		= Array.concat(MERGED_MULTIPLOT_TV_CSV_FILENAME_LIST,	merge_multiplot_TV_CSV_filename);
					    	MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST		= Array.concat(MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST, 	merge_multiplot_TV_TXT_filename);
						}	
						lKill											(num_loops, ROI_ANALYSIS_KILL_INDEX);			
						print_loop_status								(merge_multiplot_data_completed_statement, multiplot_parameter_prefix, PRINT_MINOR_SECTION);					//"Reading ROI analysis..."
					}
					lKill												(num_loops, KILL_LOOP_INDEX);
				}// END for( i = 0; i < lengthOf(all_reduced_path_strings); i+=num_input_directories_per_multiplot)		
			}// END for(slice_2_analyze_index = 0; slice_2_analyze_index < num_slices_2_analyze; slice_2_analyze_index++)		
		}// END for(ROI_selection_diameter_index = 0; ROI_selection_diameter_index < num_ROI_selection_diameters; ROI_selection_diameter_index++)
		print_section("FINISHED MERGING DATA", true);
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
//************************* Directories/files created ***********************************************************************************************************************************************//
//***************************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
		PRINT_STATUS										= PRINTING_ON;
		print_finished_execution_info();
	}// END if(perform_data_merging)	
	print_section("FINISHED ALL DATA MERGING", true);			
}// END macro multiplotting
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
//************************* User defined function definitions ***************************************************************************************************************************************//
//***************************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//----------------------------------------------------------------------- Basic user defined system task function definitions -----------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
//showMessageWithCancel	("Array mismatch at: \n" + _array[i] + NEWLINE_CMD_STRING + _array_2_match[i]);
function Ap						(_array)								{ Array.print			(_array);																										}
function App					(_print_statement, _array)				{ print					("-----> " + _print_statement + PADDED_EQUALS_STRING); 		Ap			(_array);								}
function Appc					(_print_statement, _array)				{ cprint				("-----> " + _print_statement + PADDED_EQUALS_STRING); 		printca		(_array);								}
function Aps					(_print_statement, _array)				{ print					(_print_statement + PADDED_EQUALS_STRING); 	for(i = 0; i < _array.length; i++)	print(TAB_STRING + _array[i]);	}
function Apsc					(_print_statement, _array)				{ cprint				(_print_statement + PADDED_EQUALS_STRING); 	for(i = 0; i < _array.length; i++)	cprint(TAB_STRING + _array[i]);	}
function Appexit				(_print_statement, _array)				{ App					(_print_statement, _array); 								Ap			(_array);								}
function autobreak				()										{ autobreak_bool	 	= file_2_array(IJ_macro_directory, autobreak_filename, !PRINT_PATH);	exitIf(autobreak_bool[0]);				}
function ceil					(value)									{ return 				conditional_return( (value - round(value) > 0), round(value + 1), round(value) ); 								}
function clearResults			()										{ run					("Clear Results");																								}
function Apc					(_array)								{ Array.print			(_array);																										}
function Appc					(_print_statement, _array)				{ print					("-----> " + _print_statement + PADDED_EQUALS_STRING); 		Ap			(_array);								}
function Apsc					(_print_statement, _array)				{ print					(_print_statement + PADDED_EQUALS_STRING); 	for(i = 0; i < _array.length; i++)	print(TAB_STRING + _array[i]);	}
function askKill				(_message)								{ showMessageWithCancel	(ASK_KILL_DIALOG_TITLE, _message + NEWLINE_CMD_STRING + ASK_KILL_DIALOG_STATEMENT); 							}
function dKill					()										{ dump					(); 														exit		();										}
function errKill				(_err_statement)						{ exit					("ERROR: " + _err_statement);								exit		();										}
function lKill					(_loop_variable, _loop_kill_index)		{ if					(_loop_variable >= _loop_kill_index) 						exit		("-----> Reached loop kill index"); 	}
function Kill					()										{ exit					("-----> Manual exit initiated");																				}
function earlyExit				(_print_statement)						{ print					("Early Exit:" + _print_statement); 						exit		();										}
function endProgram				(_print_statement)						{ print_section			("Execution Complete:" + _print_statement, PRINT_MAJOR_SECTION); exit	();										}
function exitIf					(_exit_condition)						{ if					(_exit_condition)											exit		();	}
function eprint					(_print_statement)						{ print					(_print_statement); 										exit		();										}
function eprintvar				(_print_statement, _variable)			{ _variable_array		= array_from_data(_variable);								Appexit		(_print_statement, _variable_array);	}
function eprintvareq			(_print_statement, _variable)			{ print					(_print_statement + PADDED_EQUALS_STRING + toString(_variable)); 												}
function ifNaN					(_value, _ifNaN_true, _ifNaN_false)		{ return				conditional_return(isNaN(_value), _ifNaN_true, _ifNaN_false);													}
function ifSkipIndex			(_index, _skip_indices)					{ return isMember		(i, _skip_indices_array, RETURN_MATCH_TF);																		}
function IJROI_analysis_config_CSV()									{ IJROI_analysis_config	(IJROI_analysis_measurements, IJROI_analysis_redirect, IJIO_precision_CSV);										}
function IJROI_analysis_config_image()									{ IJROI_analysis_config	(IJROI_analysis_measurements, IJROI_analysis_redirect, IJIO_precision_image);									}
function insert_right_arrow		(_length, _prefix, _suffix, _type)		{ return 				_prefix + right_arrow(_length, _type) + _suffix;																}
function isArray				(_value)								{ _array				= array_from_data(_value); 	return conditional_return		( (_array.length != 1), true, false);				}
function isArrayType			(_array, _is_array_type)				{ _array_type			= array_type(_array);		return	conditional_return		( (_array_type == _is_array_type), true, false);	}
function isEmptyArray			(_array)								{ return 				isArrayType(_array, IS_EMPTY_ARRAY);																			}
function isNumberArray			(_array)								{ return 				isArrayType(_array, IS_NUMBER_ARRAY);																			}
function isString				(_value)								{ return 				!( isNumber(_value) || isArray(_value) );																		}
function isStringArray			(_array)								{ return 				isArrayType(_array, IS_STRING_ARRAY);																			}
function isMixedArray			(_array)								{ return 				isArrayType(_array, IS_MIXED_ARRAY);																			}
function peq					(_print_statement, _variable)			{ print					(_print_statement + PADDED_EQUALS_STRING + toString(_variable)); 												}
function printc					(_print_statement)						{ if					(PRINT_STATUS == PRINT_SEPVARS())								print		(_print_statement);						}
function printca				(_array)								{ if					(PRINT_STATUS == PRINT_SEPVARS())								Array.print	(_array);								}
function printcas				(_print_statement, _variable)			{ printc				(_print_statement); 										printca		(_array);								}
function printn					(_print_statement, _variable)			{ print					(_print_statement +  NEWLINE_CMD_STRING  + _variable );															}
function print_loop_status		(_statement, _loop_num, _section_type)	{ print_section			(_statement + _loop_num, _section_type);																		}
function print_newline			()										{ print					(NEWLINE_CMD_STRING);																							}
function printcvar				(_print_statement, _variable)			{ _variable_array		= array_from_data(_variable);								Appc		(_print_statement, _variable_array);	}
function printvar				(_print_statement, _variable)			{ _variable_array		= array_from_data(_variable);								App			(_print_statement, _variable_array);	}
function printvareq				(_print_statement, _variable)			{ print					(_print_statement + PADDED_EQUALS_STRING + toString(_variable)); 												}
function pt						()										{ print					("=======> Debugging location marker print #" + debug_print_counter++);											}	
function PRINT_ON				()										{ return 				PRINTING_ON;																									}
function PRINT_OFF				()										{ return 				PRINTING_OFF;																									}
function PRINT_GROUPVARS_ONLY	()										{ return 				PRINTING_GROUPS;																								}
function PRINT_SEPVARS_ONLY		()										{ return 				PRINTING_VARS;																									}
function PRINT_GROUPVARS		()										{ return 				(PRINT_STATUS == PRINTING_GROUPS	|| PRINT_STATUS == PRINTING_ON);													}
function PRINT_SEPVARS			()										{ return 				(PRINT_STATUS == PRINTING_SEPVARS 	|| PRINT_STATUS == PRINTING_ON);													}
function sequential_value_array	(_start_index, _end_index)				{ return 				Array.slice(SEQUENTIAL_VALUES_ARRAY, _start_index, _end_index);													}
function string_2_array			(string) 								{ return 				split(string); 																									}
function string_cut_last_N_chars(_string, _N)							{ return 				substring(_string, 0, lengthOf(_string) - _N);																	}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

//	IJIO_precision_CSV										= 6;	
//	IJIO_precision_image									= 5;
//	IJROI_analysis_measurements 						= "area mean standard min max ";
//	IJROI_analysis_redirect 							= "None";
//	IJROI_analysis_CSV_precision 						= IJIO_precision_CSV;
//	IJROI_analysis_image_precision 						= IJIO_precision_image;
//	IJIO_ResultsTable_extension 						= ".csv";
//	IJIO_ResultsTable_options 							= "copy_column copy_row save_column save_row";
//	IJIO_jpeg_quality 									= 85;
//	IJIO_transparent_index 								= -1;
function IJIO_config(_IJIO_jpeg_quality, _IJIO_transparent_index, _IJIO_ResultsTable_extension, _IJIO_ResultsTable_options)
{
	_IJIO_jpeg_quality_string				= "jpeg="	+ _IJIO_jpeg_quality 			+ SPACE_STRING;
	_IJIO_transparent_index_string			= "gif=" 	+ _IJIO_transparent_index 		+ SPACE_STRING;
	_IJIO_ResultsTable_extension_string		= "file=" + _IJIO_ResultsTable_extension 	+ SPACE_STRING;
	_IJIO_ResultsTable_options_string		= _IJIO_ResultsTable_options;
	run										("Input/Output...", _IJIO_jpeg_quality_string + _IJIO_transparent_index_string + _IJIO_ResultsTable_extension_string + _IJIO_ResultsTable_options_string);
	//run									("Input/Output...", "jpeg = " + _IJIO_jpeg_quality + " gif = " + _IJIO_transparent_index + " file = " + _IJIO_ResultsTable_extension + SPACE_STRING + _IJIO_ResultsTable_options);
}
function IJROI_analysis_config(_IJROI_analysis_measurements, _IJROI_analysis_redirect, _IJROI_analysis_precision)
{
	_IJROI_analysis_measurements_string		= _IJROI_analysis_measurements 					+ SPACE_STRING;
	_IJROI_analysis_redirect_string			= "redirect=" + _IJROI_analysis_redirect 		+ SPACE_STRING;
	_IJROI_analysis_precision_string		= "decimal=" 	+ _IJROI_analysis_precision;
	run										("Set Measurements...", _IJROI_analysis_measurements_string + _IJROI_analysis_redirect_string + _IJROI_analysis_precision_string);
	//run									("Set Measurements...", "area mean standard min max redirect = None decimal=" + IJIO_precision_CSV);
}
function IJIO_configOptions(_options_ON)
{
	if(_options_ON)
		IJIO_config(IJIO_jpeg_quality, IJIO_transparent_index, IJIO_ResultsTable_extension, IJIO_ResultsTable_options);
	else
		IJIO_config(IJIO_jpeg_quality, IJIO_transparent_index, IJIO_ResultsTable_extension, EMPTY_STRING);
}
function runMeasure(_shape, _centered, _x, _y, _width, _height)
{
	_width_string		= "width=" 		+ _width 	+ SPACE_STRING;
	_height_string		= "height=" 	+ _height	+ SPACE_STRING;
	_x_string			= "x=" 			+ _x		+ SPACE_STRING;
	_y_string			= "y=" 			+ _y		+ SPACE_STRING;
	_shape_string		= _shape					+ SPACE_STRING;
	_centered_string	= _centered;
	run	("Specify...", 	_width_string + _height_string + _x_string + _y_string + _shape_string + _centered_string);
	run	("Measure");
}

//run			("Close");	
//run				("Close All");
//run				("Record...");
//run				("Text Image... ", 			"open="+ path );
//run				("Duplicate...", 			"title=" + _window_title );
//run				("Size...", 				"width=" + _x_colunns + " height=" + _x_rows + " constrain average interpolation=Bilinear");	
//run			("Enhance Contrast", 		"saturated=0.35");
//run				("Flip Horizontally");
//run				("Flip Vertically");
//run				("Image to Results");
//run				("Images to Stack", 		"name=" + stack_title + " title=" + image_names_matching + " use keep");			
//run				("Images to Stack", 		"name=" + _stack_title + " title=" + _image_names_matching);			
//run				("Animation Options...", 	"speed=" + GIF_speed);
//run				("Animated Gif ... ", 		"number=0 filename=" + path);
//run				("AVI... ", 				"compression=" + compression + " frame=" + frame_rate + " save=" + path);			
//run			("Profile Plot Options...", "width=1000 height=1000 font=20 minimum=0 maximum=0 draw draw_ticks interpolate sub-pixel");
//run			("Canvas Size...", 			"width=900 height=500 position=Center");	
//run			("Colors...", 				"foreground=white background=white selection=yellow");	
//run				("Specify...", 				"width=" + ROI_selection_diameter + " height=" + ROI_selection_diameter + " x=" + selection_center_x + " y=" + selection_center_y + " oval centered");
//run				("Measure");
//run				("Convolve...", 			"text1=" + gradient_x_kernel + " normalize"); // Scharr-x		
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//------------------------------------------------------------------- ImageJ application/system/configuration function definitions ------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
function close_all_windows(_clear_results, _recording_on)
{
	run					("Close All");
	if					(_clear_results)
		clearResults	();
	if					(_recording_on)
		run				("Record...");
	_list 				= getList("window.titles");
	for					(i = 0; i < _list.length; i++ )
	{
		selectWindow	(_list[i]);
		run				("Close");		
	}
}
function close_all_windows_except(_clear_results, _recording_on, _window_exceptions)
{
	_window_exceptions_array	= array_from_data(_window_exceptions);
	run							("Close All");
	if							(_clear_results)
		clearResults			();
	if							(_recording_on)
		run						("Record...");
	_window_list 				= getList("window.titles");
	for							(i = 0; i < _window_list.length; i++ )
	{
		selectWindow			(_window_list[i]);
		if						(!isMember(_window_list[i], _window_exceptions_array, RETURN_MATCH_TF))
			run					("Close");		
	}
}
function close_windows(_clear_results, _close_all, _recording_on)
{
	if					(_close_all)
		run				("Close All");
	else
		run				("Close");
	if					(_clear_results)
		clearResults	();
	if					(_recording_on)
		run				("Record...");
	_list 				= getList("window.titles");
	for					(i = 0; i < _list.length; i++ )
	{
		selectWindow	(_list[i]);
		run				("Close");		
	}
}
function macro_caller()
{
	_INTERNAL_MACRO_CALLER	= true;
	_EXTERNAL_MACRO_CALLER	= false;
	_macro_arg 				= getArgument();
	if						(_macro_arg == EMPTY_STRING )	
		return 				_INTERNAL_MACRO_CALLER;
	else
		return 				_EXTERNAL_MACRO_CALLER;
}
function macro_caller_config(_internal_kill_loop_index, _dont_kill_loop)
{
	_NO_KILL_LOOP_INDEX				= 99999999999;
	if								(internal_macro_caller)
	{
		KILL_LOOP_INDEX				= _internal_kill_loop_index;
		close_all_windows			(true, true);
	}
	else
	{
		KILL_LOOP_INDEX				= _NO_KILL_LOOP_INDEX;
		//KILL_LOOP_INDEX				= 0;
		close_all_windows_except	(true, true, "Log");
	}
	if(_dont_kill_loop)
		return 						_NO_KILL_LOOP_INDEX;
	else
		return 						KILL_LOOP_INDEX;
}
function macro_caller_variable(_default_var_value)
{
	_macro_arg 	= getArgument();
	if			(_macro_arg == EMPTY_STRING )	
		return _default_var_value;
	else
		return _macro_arg;
}
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------- Mathematical operations/calculations/analysis function definitions ---------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
function calculate_TV(path, ROWS, COLUMNS, SLICES)
{
	run									("Text Image... ", "open="+ path );
	run									("Image to Results");
	TV 									= 0.0;
	INPUT_FILE_LIST						= Array.concat(INPUT_FILE_LIST, path);
	for( slice = 0; slice < SLICES; slice++ )
	{
		for( row = 0; row < ROWS - 1; row++ )
		{
			for( column = 0; column < COLUMNS - 1; column++ )
			{
				table_row 				= slice * ROWS + row;
				table_row_string 		= "Y" + d2s	(table_row, 0);
				table_col_string 		= "X" + d2s	(column, 0);
				table_col_right_string 	= "X" + d2s	(column + 1, 0);
				target_voxel_value 		= getResult	(table_col_string, table_row);
				right_voxel_value 		= getResult	(table_col_right_string, table_row);
				bottom_voxel_value 		= getResult	(table_col_string , table_row + 1);				
				col_diff 				= right_voxel_value - target_voxel_value;
				row_diff 				= bottom_voxel_value - target_voxel_value;
				TV 						+= sqrt		(col_diff * col_diff + row_diff * row_diff);
			}
		}
	}
	return TV;
}
function calculate_TV_opened_image( ROWS, COLUMNS, SLICES )
{
	run									("Image to Results");
	TV 									= 0.0;
	for( slice = 0; slice < SLICES; slice++ )
	{
		for( row = 0; row < ROWS - 1; row++ )
		{
			for( column = 0; column < COLUMNS - 1; column++ )
			{
				table_row 				= slice * ROWS + row;
				table_row_string 		= "Y" + d2s(table_row, 0);
				table_col_string 		= "X" + d2s(column, 0);
				table_col_right_string 	= "X" + d2s(column + 1, 0);
				target_voxel_value 		= getResult(table_col_string, table_row);
				right_voxel_value 		= getResult(table_col_right_string, table_row);
				bottom_voxel_value 		= getResult(table_col_string , table_row + 1);				
				col_diff 				= right_voxel_value - target_voxel_value;
				row_diff 				= bottom_voxel_value - target_voxel_value;
				TV 						+= sqrt(col_diff * col_diff + row_diff * row_diff);
			}
		}
	}
	return TV;
}
function elementwise_abs(_array)
{
	for(j = 0; j < _array.length; j++)						
		_array[j] = abs(_array[j]);
	return _array;
}
function elementwise_add(array, value)
{
	for(i = 0; i < array.length; i++)
		array[i] += value;
	return array;
}
function elementwise_multiply(array, value)
{
	for(i = 0; i < array.length; i++)
		array[i] *= value;
	return array;
}
function elementwise_operation(array, value_or_array, operation)
{
	num_values = value_or_array.length;
	if(operation == "add")	
	{
		for(i = 0; i < array.length; i++)
		{
			if(num_values > 1)
				array[i] += value_or_array;
			else
				array[i] += value_or_array[i];
		}
	}
	if(operation == "multiply")
	{
		for(i = 0; i < array.length; i++)
		{
			if(num_values > 1)
				array[i] *= value_or_array;
			else
				array[i] *= value_or_array[i];
		}
	}
	return array;
}
function int_2_binary(_int, _num_bits, _base_power)
{
	_bit_values 					= newArray(_num_bits);
	if								(_base_power == -1)
	{
		_int 						= _int * 2 + (_int + 1) % 2;
		_base_power 				= 0;
	}
	for								( i = 0; i < _num_bits; i++)
	{
		_index						= _num_bits - 1 - i;	//  
		_bit_value					= POWERS_OF_2[_index + _base_power];	// 4, 2
		if							(_int >= _bit_value)					// 5, 1 	
		{												// T, F
			_bit_values[_index] 	= true;			// 
			_int 					-= _bit_value;					// 1
		}
		else											// F, T
			_bit_values[_index] 	= false;			// 
	}
	return							_bit_values;
}
function modn(value, divisor)
{
	modulo_value 		= value;
	while(modulo_value >= divisor)
		modulo_value 	-= divisor;
	return modulo_value;
}
function series_op(_series, _series_op, _series_index, _op_index_range, _skip_indices)
{
	_series_elements					= _series.length;
	_series_next_index					= _series_index + 1;
	_skip_indices_array					= array_from_data(_skip_indices);
	if									(_series_op == SERIES_SUMMATION)
		_series_op_result				= 0;
	else if								(_series_op == SERIES_PRODUCT)
		_series_op_result				= 1;
	else
		errKill							("Unknown '_series_op' passed to 'series_op' function");
	if									(_op_index_range == SERIES_OP_UP_TO_INDEX)
		loop_bounds						= newArray(0, _series_index);
	else if								(_op_index_range == SERIES_OP_FROM_INDEX)
		loop_bounds						= newArray(_series_next_index, _series_elements);
	else
		errKill							("Unknown '_op_index_range' passed to 'series_ops' function");
	for									(i = loop_bounds[LOOP_LOWER_BOUND]; i < loop_bounds[LOOP_UPPER_BOUND]; i++)
		if								(!isMember(i, _skip_indices_array, RETURN_MATCH_TF))
			_series_op_result			= series_op_apply(_series[i], _series_op, _series_op_result);
	return 								_series_op_result;
}
function series_op_apply(_series_value, _series_op, _series_op_result)
{
	if							(_series_op == SERIES_SUMMATION)
		_series_op_result		+= _series_value;
	else if						(_series_op == SERIES_PRODUCT)
		_series_op_result		*= _series_value;
	return						_series_op_result;
}
function series_ops(_series, _series_op, _op_index_range, _skip_indices)
{
	_series_elements 				= _series.length;
	_skip_indices_array				= array_from_data(_skip_indices);
	_series_op_results				= newArray();
	if								(_series_op == SERIES_SUMMATION)
		_series_op_end_index		= _series_elements;
	else if							(_series_op == SERIES_PRODUCT)
		_series_op_end_index		= _series_elements - 1;
	for								(i = 0; i < _series_op_end_index; i++)
		if							( !ifSkipIndex(i, _skip_indices_array) )
			_series_op_results		= Array.concat(_series_op_results,	( series_op(_series, _series_op, i, _op_index_range, _skip_indices) )	);
	return 							_series_op_results;
}
function set_ROI_y_coordinates(slice, rows_per_slice, y_offsets)
{
	y_upper_LHS 			= (slice - 1) * rows_per_slice;			// y-coordinate of upper left corner of slice to be analyzed
	y_coordinates 			= Array.copy(y_offsets);
	for (i = 0; i < y_offsets.length; i++)
		y_coordinates[i] 	+= y_upper_LHS;
	return y_coordinates;
}
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//-------------------------------------------------------------------------- Logic assignment/control function definitions --------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
function conditional_return(_condition, _return_if_true, _return_if_false)
{
	if			(_condition)
		return 	_return_if_true;
	else
		return 	_return_if_false;
}
function if_else(_condition, _value_if_true, _value_if_false)
{
	if			(_condition)
		return 	_value_if_true;
	else
		return 	_value_if_false;
}
function isNumber(_value)
{
	if				(isArray(_value))
		return 		false;
	_parsed_value	= parseFloat(toString(_value));
	return 			ifNaN(_parsed_value, false, true);
}
function match(_1st_item, _2nd_item, _statement, _bool_control)
{
	_1st_item_array						= array_from_data(_1st_item);
	_2nd_item_array						= array_from_data(_2nd_item);
	_bool_control_array					= int_2_binary	(_bool_control, 4, 	BOOL_CONVERSION);
	_print_match 						= _bool_control_array[0];
	_dont_print_match 					= _bool_control_array[1];
	_throw_mismatch_error 				= _bool_control_array[2];
	_dont_throw_mismatch_error 			= _bool_control_array[3];
	if									(_statement != EMPTY_STRING)
		print							(_statement);
	for									(i = 0; i < _1st_item_array.length; i++)
		if								( _1st_item_array[i] != _2nd_item_array[i] )
		{
			if							(_throw_mismatch_error)	
				showMessageWithCancel	("Mismatch: \n" + _1st_item_array[i] + NEWLINE_CMD_STRING + _2nd_item_array[i]);
			return 						false;
		}	
	if							(_print_match)	
		Aps("Matching items", _1st_item_array);
	return 								true;
}
function only_bool_array_assign(_only_bools, _all_bools, _none_bools)
{
	_only_bool_index = only_bool_uniqueness_check(_only_bools);
	if(_only_bool_index == -1)
		return;
	for(i = 0; i < _only_bools.length; i++)
	{
		if(i != _only_bool_index)
		{
			_all_bools[i]	= false;
			_none_bools[i]	= true;
		}
	}
	return;
}
function only_bool_array_control(_bool_index, _only_bools, _bool_default, _all_or_none)
{
	_only_bool_index = only_bool_uniqueness_check(_only_bools);
	if(_only_bool_index == _bool_index)
		return _bool_default;
	if(_only_bool_index == -1)
		return _bool_default;
	else
		return _all_or_none;		
}
function only_bool_uniqueness_check(_only_bools)
{
	num_only_bools = 0;
	for(i = 0; i < _only_bools.length; i++)
	{
		if(_only_bools[i])
		{
			num_only_bools++;
			_only_bool_index = i;
		}
	}	
	if(num_only_bools > 1)
		exit("Multiple 'only' Booleans provided, conflicting with each other!");
	if(num_only_bools == 0)
		return -1;
	else
		return _only_bool_index;
}
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//------------------------------------------------------------------------ File/directory naming and IO function definitions ------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
function append_2_log(_dir)
{
	if( (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON))
		print("Execution info appended to execution log at:\n" + _dir);
	_time_stamp = create_time_stamp(false, false);		
	File.append("merge_data.ijm: " + _time_stamp, _dir + File.separator + ANALYSIS_LOG_FNAME) 							
}
function array_2_CSV(_rows, _columns, _array, _directory, _filename, _print_path, _overwrite_existing_CSV)
{
	for						(_row = 0; _row < _rows; _row++)
		for 				(_column = 0; _column < _columns; _column++)
			setResult		(_column, _row, _array[_row * _columns + _column]);	
	_CSV_filename 			= extend_path(_directory, _filename);		
	if						(_print_path)
		print				("Writing to CSV at\n------->" + _CSV_filename);
	if						(!File.exists(_CSV_filename) || _overwrite_existing_CSV)						
	{
		saveAs				("Measurements", _CSV_filename);			
		OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, _CSV_filename);					
	}
	clearResults			();
}	
function array_2_TXT(path, filename, data_array, print_path, overwrite_existing_TXT)	
{
	TXT_filename 			= extend_path(path, filename);		
	if(print_path)
		print				("Writing to TXT at:\n------->" + TXT_filename);
	if(!File.exists(TXT_filename) || overwrite_existing_TXT)
	{
		filehandle 			= File.open(TXT_filename);		
		for (i = 0; i < data_array.length; i++)
			print			(filehandle, data_array[i]);
		File.close			(filehandle);	
		OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, TXT_filename);
	}					
}
function construct_image_set_filenames(common_filename_prefix, image_set_filename_endings, image_extension)
{
	num_images					= image_set_filename_endings.length;
	image_set_filenames 		= newArray(num_images);
	for(i = 0; i < num_images; i++)
		image_set_filenames[i] 	= common_filename_prefix + UNDERSCORE_STRING + image_set_filename_endings[i] + image_extension;
		return image_set_filenames;
}
function copy_distributed_file(_from_directory, _from_filename, _to_directory, _to_filename, _print_to_path)
{
	_from_path = extend_path(_from_directory, _from_filename);
	_to_path = extend_path(_to_directory, _to_filename);
	File.copy(_from_path, _to_path);
	if(_print_to_path)
		print("File copied to :\n------->" + _to_path);
	return _to_path;
}
function copy_input_data_file(_input_directory, _input_filename, _output_directory, _output_basename, _output_suffix, _file_extension, _copied_from_log, _copied_to_log, _print_paths)
{
	_copied_input_data_file_output_filename = _output_basename + UNDERSCORE_STRING + _output_suffix + _file_extension; 
	_copy_input_data_file_from				= extend_path(_input_directory, _input_filename);
	_copy_input_data_file_to				= extend_path(_output_directory, _copied_input_data_file_output_filename);		
	if(_print_paths)
	{
		print								("copy_input_data_file_from 	=\n------->  " +  _copy_input_data_file_from);
		print								("copy_input_data_file_to 		=\n------->  " +  _copy_input_data_file_to);
	}
	File.copy								(_copy_input_data_file_from, _copy_input_data_file_to);	
	_copied_from_log						= Array.concat(_copied_from_log, _copy_input_data_file_from);				
	_copied_to_log							= Array.concat(_copied_to_log, _copy_input_data_file_to);				
	return 									_copy_input_data_file_to;
}
function copy_PVT_input_data_files(input_directory, input_filename, output_directory, output_basename, multiplot_parameter_prefix, multiplot_parameter_value_string, TTP_range_filenaming, multiplot_parameter_range_filenaming)
{
	copied_input_data_file_output_filename = output_basename + UNDERSCORE_STRING + TTP_range_filenaming + UNDERSCORE_STRING + multiplot_parameter_range_filenaming + UNDERSCORE_STRING + multiplot_parameter_prefix + "=" + multiplot_parameter_value_string + ".txt"; 
	copy_input_data_file_from			= extend_path(input_directory, input_filename);
	copy_input_data_file_to				= extend_path(output_directory, copied_input_data_file_output_filename);		
	//print("copy_input_data_file_from				= " +  copy_input_data_file_from);
	//print("copy_input_data_file_to 			= " +  copy_input_data_file_to);
	File.copy								(copy_input_data_file_from, copy_input_data_file_to);					
	return copy_input_data_file_to;
}
function count_duplicate_parameter_value_reconstructions(reconstruction_directory, start_duplicate_check)
{
	duplicates = start_duplicate_check;
	if(endsWith(reconstruction_directory, File.separator))
		reconstruction_directory = substring(reconstruction_directory, 0, lengthOf(reconstruction_directory) - 1);
	duplicate_reconstruction_directory_check = reconstruction_directory + UNDERSCORE_STRING + d2s(start_duplicate_check + 1, 0);
	if( File.exists(duplicate_reconstruction_directory_check) )
		duplicates = count_duplicate_parameter_value_reconstructions(reconstruction_directory, start_duplicate_check + 1);
	return duplicates;
}
function csv_2_array(path, filename, column_headings, rows, element_order, print_path)
{
	file 				= extend_path(path, filename);			
	if(print_path)
		print			("Reading CSV at:\n------->" + file);
	data_array			= newArray(rows * column_headings.length);
	open				(file);
	for(column = 0; column < column_headings.length; column++)
	{	
		for(row = 0; row < rows; row++)
		{
			if(element_order == ROW_MAJOR)
				index = column * rows + row;
			else
				index = row * columns + column;
			data_array[index] = getResult(column_headings[column], row);	
		}
	}
	INPUT_FILE_LIST		= Array.concat(INPUT_FILE_LIST, file);			
	return data_array;
}
function csv_path_2_array(path, column_headings, rows, element_order, print_path)
{
	if(print_path)
		print			("Reading CSV at:\n------->" + path);
	data_array			= newArray(rows * column_headings.length);
	open				(path);
	for(column = 0; column < column_headings.length; column++)
	{	
		for(row = 0; row < rows; row++)
		{
			if(element_order == ROW_MAJOR)
				index = column * rows + row;
			else
				index = row * columns + column;
			data_array[index] = getResult(column_headings[column], row);	
		}
	}
	INPUT_FILE_LIST		= Array.concat(INPUT_FILE_LIST, path);			
	return data_array;
}
function extend_path(_directory, _file_or_folder)
{
	while					(startsWith		(_file_or_folder, FOLDER_SEPARATOR)				)
		_file_or_folder 	= substring		(_file_or_folder, 1, lengthOf(_file_or_folder)	);
	while					(endsWith		(_directory, FOLDER_SEPARATOR)					)
		_directory 			= substring		(_directory, 0, lengthOf(_directory) - 1		);
	return					_directory + FOLDER_SEPARATOR + _file_or_folder;
}
function file_2_array(_path, _filename, _print_path)
{
	_file_path 		= extend_path(_path, _filename);		
	if(_print_path)
		print		("Importing array from:\n------->" + _file_path);
	_str 			= File.openAsString(_file_path); 
	_lines 			= split(_str,NEWLINE_CMD_STRING);
	_array 			= newArray(_lines.length);
	for(i = 0; i < _array.length; i++)
		_array[i] 	= _lines[i];
	INPUT_FILE_LIST	= Array.concat(INPUT_FILE_LIST, _file_path);			
	return _array;
}
function file_2_float_array(_path, _filename, _print_path)
{
	_file_path 		= extend_path(_path, _filename);		
	if(_print_path)
		print		("Importing array from:\n------->" + _file_path);
	_str 			= File.openAsString(_file_path); 
	_lines 			= split(_str,NEWLINE_CMD_STRING);
	_array 			= newArray(_lines.length);
	for(i = 0; i < _array.length; i++)
		_array[i] 	= parseFloat(_lines[i]);
	INPUT_FILE_LIST	= Array.concat(INPUT_FILE_LIST, _file_path);			
	return _array;
}
function file_2_key_value_pairs(_ROI_definitions_directory, _ROI_definitions_filename, _phantom_basename, _ROI_definitions_parameter_list, _ROI_parameter_decodings, _ROI_parameter_value_parseFloat, _print_ROI_definitions_path)
{
	_ROI_definition_file_key_value_pairs		= file_2_array(_ROI_definitions_directory, _ROI_definitions_filename, _print_ROI_definitions_path);
	_num_ROI_key_value_pairs					= _ROI_definition_file_key_value_pairs.length;
	_ordered_ROI_parameter_strings				= newArray(_num_ROI_key_value_pairs);
	for(i = 0; i < _num_ROI_key_value_pairs; i++)
	{
		separated_key_value_pair 				= split(_ROI_definition_file_key_value_pairs[i], "=");
		key_string 								= separated_key_value_pair[0];
		_spaceless_key_string 					= strip_surrounding_spaces(key_string);
		_ROI_parameter_values_string			= strip_surrounding_spaces(separated_key_value_pair[1]);
		for(j = 0; j < _ROI_definitions_parameter_list.length; j++)
			if(_spaceless_key_string == _ROI_definitions_parameter_list[j] )
				_ordered_ROI_parameter_strings[j] = _ROI_parameter_values_string;
	}	
	return _ordered_ROI_parameter_strings;	
}
function file_list_2_float_array(_paths, _filenames, _print_path)
{
	_combined_array	= newArray();
	for( _file = 0; _file < _paths.length; _file++)
	{
		_file_array = file_2_float_array(_paths[_file], _filenames[_file], _print_path);
		_combined_array = Array.concat( _combined_array, _file_array);
	}
	return _combined_array;
}
function filepath_2_float_array(_file_path, _print_path)
{
	if(_print_path)
		print		("Importing array from:\n------->" + _file_path);
	_str 			= File.openAsString(_file_path); 
	_lines 			= split(_str,NEWLINE_CMD_STRING);
	_array 			= newArray(_lines.length);
	for(i = 0; i < _array.length; i++)
		_array[i] 	= parseFloat(_lines[i]);
	INPUT_FILE_LIST	= Array.concat(INPUT_FILE_LIST, _file_path);			
	return _array;
}
function filepath_list_2_float_array(_file_paths, _print_path)
{
	_combined_array	= newArray();
	for( _file = 0; _file < _file_paths.length; _file++)
	{
		_file_array = filepath_2_float_array(_file_paths[_file], _print_path);
		_combined_array = Array.concat( _combined_array, _file_array);
	}
	return _combined_array;
}
function float_array_2_TXT(_path, _filename, _data_array, _overwrite_existing_TXT, _print_path)	
{
	_TXT_filename 			= extend_path(_path, _filename);		
	if(_print_path)
		print				("Writing to TXT at:\n------->" + _TXT_filename);
	if(!File.exists(_TXT_filename) || _overwrite_existing_TXT)
	{
		_filehandle 			= File.open(_TXT_filename);		
		for (i = 0; i < _data_array.length; i++)
			print			(_filehandle, d2s(_data_array[i], FLOAT_ARRAY_2_FILE_PRECISION));
		File.close			(_filehandle);	
		OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, _TXT_filename);				
}
function float_array_2_TXT_if(_path, _filename, _data_array, _write_ON, _overwrite_existing_TXT, _print_path)	
{
	if(_write_ON)
	{
		_TXT_filename 			= extend_path(_path, _filename);		
		if(_print_path)
			print				("Writing to TXT at:\n------->" + _TXT_filename);
		if(!File.exists(_TXT_filename) || _overwrite_existing_TXT)
		{
			_filehandle 			= File.open(_TXT_filename);		
			for (i = 0; i < _data_array.length; i++)
				print			(_filehandle, d2s(_data_array[i], FLOAT_ARRAY_2_FILE_PRECISION));
			File.close			(_filehandle);	
			OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, _TXT_filename);
		}
	}					
}
function make_directory_chain(top_directory, subdirectory_chain, FOLDER_SEPARATOR, _make_top_directory, _print_directories_created)
{
	path 								= top_directory;
	subdirectory_chain_folders 			= split(subdirectory_chain, FOLDER_SEPARATOR);
	new_folder_paths 					= newArray(subdirectory_chain_folders.length);
	if(_make_top_directory)
	{
		if(_print_directories_created)
			print							("------->Creating top directory:\n" + path );
		directory_created_successfully	= make_directory_recorded(path, DIRECTORIES_CREATED, _print_directories_created);
	}
	for(i = 0; i < subdirectory_chain_folders.length; i++)
	{
		path 							+= FOLDER_SEPARATOR + subdirectory_chain_folders[i];
		new_folder_paths[i] 			= path;
		if(_print_directories_created)
			print						("------->Creating directory:\n" + path );
		directory_created_successfully	= make_directory_recorded(path, DIRECTORIES_CREATED, _print_directories_created);
	}
	return new_folder_paths;											
}
function make_directory_parents(top_directory, bottom_directory, FOLDER_SEPARATOR, _make_top_directory, _print_directories_created)
{
	bottom_directory_folders 					= split(bottom_directory, FOLDER_SEPARATOR);
	top_directory_folders 						= split(top_directory, FOLDER_SEPARATOR);
	return_statement							= "------->Top directory through target directory already exist\n";
	if											(top_directory_folders.length != bottom_directory_folders.length)
	{
		if										(_make_top_directory)
		{
			if									(!File.exists(top_directory))
			{
				directory_created_successfully	= make_directory_recorded(top_directory, DIRECTORIES_CREATED, _print_directories_created);		
				return_statement 				=  "------->Top directory created:\n" + top_directory;	
			}
			else
				return_statement 				= EMPTY_STRING;			
		}
		path 									= top_directory;
		return_statement 						= return_statement + "------->Subdirectories created:\n";
		subdirectories_2_create 				= Array.slice(bottom_directory_folders, top_directory_folders.length, bottom_directory_folders.length);		
		for										(i = 0; i < subdirectories_2_create.length; i++)
		{
			path 								+= FOLDER_SEPARATOR + subdirectories_2_create[i];
			if									(!File.exists(path))
				directory_created_successfully	= make_directory_recorded(path, DIRECTORIES_CREATED, _print_directories_created);		
			//else
			//	print("------->Directory already exists");
			return_statement 					= return_statement + path + NEWLINE_CMD_STRING;
		}
		return 									subdirectories_2_create;
	}
	else
		return_statement 						= return_statement + "--------------->Top directory and target directory are the same\n";
	if											(_print_directories_created)
		print									(return_statement);
	return 										return_statement;											
}
function make_directory_recorded(_directory_2_create, _directory_creation_record, _print_directory_path)
{
	if(!File.exists(_directory_2_create))
	{
		if(_print_directory_path)
			print("\n------->Creating directory and adding it to the directory created log:\n" + _directory_2_create);
		File.makeDirectory							(_directory_2_create);
		_directory_creation_record					= Array.concat(_directory_creation_record, _directory_2_create);		
		if(!File.exists(_directory_2_create))
			print("**************ERROR: Directory creation failure*********************\n" + _directory_2_create);
		return false;
	}
	else
		return true;
	//else
	//	print("------->Directory already exists");
	//return File.exists							(directory_2_create);
}
function make_directory_set(_common_parent_directory, _subdirectory_set, _directory_creation_record, _print_directories_created)
{
	_all_subdirectories_created			= newArray();
	for(i = 0; i < _subdirectory_set.length; i++)
	{					
		_subdirectories_created 		= make_subdirectory(_common_parent_directory, _subdirectory_set[i], _directory_creation_record, _print_directories_created);
		_all_subdirectories_created 	= Array.concat(_all_subdirectories_created, _subdirectories_created);
	}
	return _all_subdirectories_created;
}
function make_merged_CSV_directories()
{
	File.makeDirectory				(merged_CSV_folder																																									);
	File.makeDirectory				(merged_PVT_CSV_folder																																								);
	make_directory_parents			(merged_PVT_CSV_folder, 				merged_PVT_ROI_analysis_CSV_folder, 	FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_RSP_CSV_folder, 				FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_RSP_Error_CSV_folder, 		FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_Std_Dev_CSV_folder, 			FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_TV_CSV_folder, 				FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merged_CSV_folder, 					merged_RSP_CSV_folder, 					FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merged_CSV_folder, 					merged_RSP_Error_CSV_folder, 			FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merged_CSV_folder,	 					merged_Std_Dev_CSV_folder, 				FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merged_CSV_folder, 					merged_TV_CSV_folder, 					FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merged_CSV_folder, 					merged_RSP_CSV_folder, 					FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
}
function make_merge_multiplot_CSV_directories()
{
	File.makeDirectory				(merge_multiplot_PVT_CSV_folder																													);
	File.makeDirectory				(merge_multiplot_CSV_folder																														);
	make_directory_parents			(merge_multiplot_PVT_CSV_folder, 	merge_multiplot_PVT_RSP_CSV_folder, 		FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR,  (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merge_multiplot_PVT_CSV_folder, 	merge_multiplot_PVT_RSP_Error_CSV_folder, 	FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR,  (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merge_multiplot_PVT_CSV_folder, 	merge_multiplot_PVT_Std_Dev_CSV_folder, 	FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR,  (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merge_multiplot_PVT_CSV_folder, 	merge_multiplot_PVT_TV_CSV_folder, 			FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR,  (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merge_multiplot_CSV_folder, 		merge_multiplot_RSP_CSV_folder, 			FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR,  (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merge_multiplot_CSV_folder, 		merge_multiplot_RSP_Error_CSV_folder, 		FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR,  (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merge_multiplot_CSV_folder,	 	merge_multiplot_Std_Dev_CSV_folder, 		FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR,  (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merge_multiplot_CSV_folder, 		merge_multiplot_TV_CSV_folder, 				FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR,  (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merged_CSV_folder, 				merged_RSP_CSV_folder, 						FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR,  (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
}
function make_subdirectory(_parent_directory, _subdirectory, _directory_creation_record, _print_directories_created)
{
	_parent_directory_folders 			= split(_parent_directory, File.separator);
	_subdirectory_folders 				= split(_subdirectory, File.separator);
	_directory_2_create 				= _parent_directory;
	_directories_created				= newArray();
	make_directory_recorded(_parent_directory, _directory_creation_record, _print_directories_created);
	for(i = 0; i < _subdirectory_folders.length; i++)
	{
		_directory_2_create = extend_path(_directory_2_create, _subdirectory_folders[i]);
		//_directory_2_create	+= _subdirectory_folders[i];
		make_directory_recorded(_directory_2_create, _directory_creation_record, false);
		_directories_created = Array.concat(_directories_created, _directory_2_create);
	}
	if(_print_directories_created)
	{
		print("-------> Subdirectories created:\n");
		Array.print(_directories_created);
	}
	return _directory_2_create;
}
function listFiles(dir) 
{
	list 				= getFileList(dir);
	for (i = 0; i < list.length; i++) 
	{
	if(endsWith(list[i], "/"))
	   	listFiles	("------->" + dir + list[i]);
	else
		print		("------->" + (count++) + ": " + dir + list[i]);
     }
}
function listFolders(dir) 
{
	count 					= 1;
	list 					= getFileList(dir);
	folders					= newArray();
	for (i = 0; i < list.length; i++) 
    {
		if (File.isDirectory(dir + list[i]))
		{
	   		print			("------->" + (count++) + ": " + dir + list[i]);
			folders 		= Array.concat(folders, list[i] );
		}
     }
     return folders;
}
function open_images(image_type, _directories, _filenames, print_path)
{
	_directories_array			= array_from_data(_directories);
	_filenames_array			= array_from_data(_filenames);
	_num_images					= maxOf(_directories_array.length, _filenames_array.length);
	_directories_array			= array_match_length_fill(_directories_array, _directories);
	_filenames_array			= array_match_length_fill(_filenames_array, _filenames);
	
	image_path 					= extend_path(directory, filename);	
	if(print_image_paths)
		print					("------->Opening image from:\n" + image_path);
	if(image_type == TXT)
		run						("Text Image... ", "open=" + image_path);
	if(image_type == PNG)
		open					(image_path);
	run							("Size...", "width=x_frame_size height=y_frame_size constrain average interpolation=Bilinear");	
	//run							("Set Measurements...", "area mean standard min redirect = None decimal = 4");		
	IJROI_analysis_config_image();
	INPUT_FILE_LIST				= Array.concat(INPUT_FILE_LIST, image_path);			
	return image_path;
}
function open_image(image_type, directory, filename, print_path)
{
	image_path 					= extend_path(directory, filename);	
	if(print_image_paths)
		print					("------->Opening image from:\n" + image_path);
	if(image_type == TXT)
		run						("Text Image... ", "open=" + image_path);
	if(image_type == PNG)
		open					(image_path);
	run							("Size...", "width=x_frame_size height=y_frame_size constrain average interpolation=Bilinear");	
	//run							("Set Measurements...", "area mean standard min redirect = None decimal = 4");		
	IJROI_analysis_config_image();
	INPUT_FILE_LIST				= Array.concat(INPUT_FILE_LIST, image_path);			
	return image_path;
}
function open_image_set(image_type, directory, filenames, print_image_paths)
{
	num_images_2_open 			= filenames.length;
	image_set 				= newArray(num_images_2_open);
	for(i = 0; i < num_images_2_open; i++)
	{
		image_filename 			= filenames[i] + image_type;
		image_set[i] 			= image_filename;
		open_image				(image_type, directory, image_filename, print_image_paths);
	}
	return image_set;
}			
function open_PNG_path(image_path, print_path)
{
	if(print_image_paths)
		print				("------->Opening PNG image from:\n" + image_path);
	open					(image_path);
	//run						("Set Measurements...", "area mean standard min redirect = None decimal = 4");		
	//IJROI_analysis_config_CSV();
	IJROI_analysis_config_image();
	//IJIO_configOptions(IJIO_CONFIG_OPTIONS_ON);
	//IJIO_configOptions(IJIO_CONFIG_OPTIONS_OFF);
	run						("Size...", "width=x_frame_size height=y_frame_size constrain average interpolation=Bilinear");	
	INPUT_FILE_LIST			= Array.concat(INPUT_FILE_LIST, image_path);	
	return image_path;
}
function open_PNG_paths(PNG_paths, print_image_paths)
{
	num_PNGs_2_open 		= PNG_paths.length;
	image_set 				= newArray(num_PNGs_2_open);
	for(i = 0; i < num_PNGs_2_open; i++)
	{
		open_PNG_path		(PNG_paths[i], print_image_paths);		
		INPUT_FILE_LIST		= Array.concat(INPUT_FILE_LIST, PNG_paths[i]);			
	}
	//return image_set;
}			
function open_reconstructed_image(directory, filename)
{
	file_path 		= extend_path(directory, filename);		
	run				("Text Image... ", "open=" + file_path);
	//run				("Set Measurements...", "area mean standard min redirect = None decimal = 4");	
	//IJROI_analysis_config_CSV();
	IJROI_analysis_config_image();
	//IJIO_configOptions(IJIO_CONFIG_OPTIONS_ON);
	//IJIO_configOptions(IJIO_CONFIG_OPTIONS_OFF);
	INPUT_FILE_LIST	= Array.concat(INPUT_FILE_LIST, file_path);					
}																						
function PNG_sequence_2_animations(_PNG_sequence_directory, _PNG_sequence_paths, _group_2_extract, _num_groups, _group_size, _property_Booleans, _PNG_basename, _PNG_image_Booleans, _animation_filename, _animated_GIF_info, _AVI_info, _close_stack_after_saving)
{
	_print_input_PNG_paths			= _PNG_image_Booleans[0];
	_close_stack_images				= _PNG_image_Booleans[1];
	_print_multiplot_GIF_paths		= _animated_GIF_info[0];
	_close_multiplot_stack_images	= _animated_GIF_info[2];
	_GIF_frame_rate					= _animated_GIF_info[3];
	_print_multiplot_AVI_paths		= _AVI_info[0];
	_AVI_frame_rate					= _AVI_info[3];
	_AVI_compression_format			= _AVI_info[4];
	_write_GIF						= _property_Booleans[3];
	_overwrite_GIF					= _property_Booleans[4];
	_write_AVI						= _property_Booleans[5];
	_overwrite_AVI					= _property_Booleans[6];
//	_PNG_subsequence_paths 			= extract_subsequence_group(PNG_sequence_paths, group_2_extract, num_groups, group_size);	
	_PNG_subsequence_paths 			= extract_interleaved_data(_PNG_sequence_paths, _group_2_extract, _num_groups, _group_size);
	open_PNG_paths					(_PNG_subsequence_paths, _print_input_PNG_paths);
	opened_image_set_2_stack		(_PNG_basename, _animation_filename, _close_stack_images);											
	stack_2_animated_GIF			(_animation_filename, _PNG_sequence_directory, _animation_filename + GIF, 							_GIF_frame_rate, _write_GIF, _overwrite_GIF, _print_multiplot_GIF_paths, DONT_CLOSE_WINDOW);
	stack_2_AVI						(_animation_filename, _PNG_sequence_directory, _animation_filename + AVI, _AVI_compression_format, 	_AVI_frame_rate, _write_AVI, _overwrite_AVI, _print_multiplot_AVI_paths, _close_stack_after_saving);
	return PNG_subsequence_paths;
}
function PNG_sequence_2_stack(_PNG_sequence_paths, _group_2_extract, _num_groups, _group_size, _property_Booleans, _PNG_basename, _PNG_image_Booleans, _stack_title, _animated_GIF_info, _AVI_info, _close_stack_after_saving)
{
	_print_input_PNG_paths			= _PNG_image_Booleans[0];
	_close_stack_images				= _PNG_image_Booleans[1];
	_print_multiplot_GIF_paths		= _animated_GIF_info[0];
	_close_multiplot_stack_images	= _animated_GIF_info[2];
	_GIF_frame_rate					= _animated_GIF_info[3];
	_print_multiplot_AVI_paths		= _AVI_info[0];
	_AVI_frame_rate					= _AVI_info[3];
	_AVI_compression_format			= _AVI_info[4];
	_write_GIF						= _property_Booleans[3];
	_overwrite_GIF					= _property_Booleans[4];
	_write_AVI						= _property_Booleans[5];
	_overwrite_AVI					= _property_Booleans[6];
//	_PNG_subsequence_paths 			= extract_subsequence_group(_PNG_sequence_paths, _group_2_extract, _num_groups, _group_size);	
	_PNG_subsequence_paths 			= extract_interleaved_data(PNG_sequence_paths, group_2_extract, num_groups, group_size;)
	open_PNG_paths					(_PNG_subsequence_paths, _print_input_PNG_paths);
	opened_image_set_2_stack		(_PNG_basename, _stack_title, true);											
	//opened_image_set_2_stack		(_PNG_basename, _stack_title, _close_stack_images);											
	return _PNG_subsequence_paths;
}
function prompt_4_image_set(directory, image_type, stack_suffix, dialog_position_x, dialog_position_y, dialog_character_width)
{		
	directory_folder 			= File.getName(directory_path);
	default_image_basename		= "x_";
	Dialog.create				("Specify reconstructed image set to open");
	Dialog.addString			("Basename common to images in set", default_image_basename); 
	Dialog.addNumber			("Specify 1st image #", 0, 0, dialog_character_width, EMPTY_STRING); 
	Dialog.addNumber			("Specify 2nd image #", 12, 0, dialog_character_width, EMPTY_STRING); 
	Dialog.addChoice			("Combine image set into image stack", newArray(TRUE_STRING, FALSE), TRUE_STRING);
	Dialog.setLocation			(dialog_position_x, dialog_position_y);
	Dialog.show					();
	_image_basename 			= Dialog.getString();
	first_image_number 			= Dialog.getNumber();
	second_image_number 		= Dialog.getNumber();
	do_image_set_2_stack	 	= Dialog.getChoice();
	filenames					= number_range_2_filenames(_image_basename, EMPTY_STRING, first_image_number, second_image_number, 0);
	image_set					= open_image_set(image_type, directory, filenames, TRUE_STRING);
	stack_name					= _image_basename + stack_suffix;
	if(do_image_set_2_stack == TRUE_STRING)
		opened_image_set_2_stack(_image_basename, stack_name, FALSE);
	return 						stack_name;
}
function read_ROI_definitions(_path, _reconstruction_data_folder, _ROI_definition_file_directory, _ROI_definitions_filename_suffix, _ROI_parameter_value_parseFloat, _print_path)
{
	_phantom_name 								= path_2_phantom_name(_path, _reconstruction_data_folder);
	_ROI_definition_filename					= _phantom_name_folder + _ROI_definitions_filename_suffix;
	_ROI_definition_file_key_value_pairs		= file_2_array(_ROI_definition_file_directory, _ROI_definition_filename, _print_path);
	_num_ROI_key_value_pairs					= _ROI_definition_file_key_value_pairs.length;
	_ROI_definition_file_key_values				= newArray(_num_ROI_key_value_pairs);
	_ROI_parameter_keys 						= newArray(_num_ROI_key_value_pairs);
	_bulk_material_decoding_op					= "none";//	= epoxy
	_ROI_profile_radius_beyond_ROI_decoding_op 	= "parseFloat";//	= 8														
	_ROI_selection_radii_decoding_op			= "parseFloat"; //	= 3.5, 4, 6
	_ROI_shapes_decoding_op						= "none";// = circular_ROI, circular_ROI, circular_ROI, circular_ROI, circular_ROI, circular_ROI, circular_ROI, circular_ROI
	_ROI_material_names_decoding_op				= "none"; //= air, air, PMP, LDPE,	polystyrene, acrylic, delrin, teflon
	_ROI_labels_decoding_op						= "none"; //= Air(bottom), Air(top), PMP, LDPE, Polystyrene, Acrylic, Delrin, Teflon
	_ROI_diameters_decoding_op					= "parseFloat";	//= 12.2, 12.2, 12.2, 12.2, 12.2, 12.2, 12.2, 12.2
	_ROI_parameter_decoding_ops					= newArray(_bulk_material_decoding_op, _ROI_profile_radius_beyond_ROI_decoding_op, _ROI_selection_radii_decoding_op, _ROI_shapes_decoding_op, _ROI_material_names_decoding_op, _ROI_labels_decoding_op, _ROI_diameters_decoding_op);	
	ROI_definition_numbers_decoding_op			= "parseFloat";	
	ROI_definition_strings_decoding_op			= "none";		
	_all_ROI_parameter_values 					= newArray();
	for(i = 0; i < num_ROI_key_value_pairs; i++)
	{
		_ROI_key_value_pair_separation_index	= indexOf(_ROI_definition_file_key_value_pairs[i], "=");
		_ROI_values_string						= substring(_ROI_definition_file_key_value_pairs[i], _ROI_key_value_pair_separation_index + 1);
		_ROI_parameter_key 						= substring(_ROI_definition_file_key_value_pairs[i], 0, _ROI_key_value_pair_separation_index);
		_spaceless_key_string 					= strip_surrounding_spaces(_ROI_parameter_key);
		_ROI_parameter_keys[i] 					= _spaceless_key_string;
		_ROI_parameter_values					= split(_ROI_values_string, ",");
		_num_ROI_parameter_values 				= _ROI_parameter_values.length;
		for(j = 0; j < _num_ROI_parameter_values; j++)
		{
			_spaceless_value_string 			= strip_surrounding_spaces(_ROI_parameter_values[j]);
			_ROI_parameter_values[j] 			= _spaceless_value_string;
			if(_ROI_parameter_decoding_ops[i] == _ROI_parameter_value_parseFloat)
				_ROI_parameter_values[j] 		= parseFloat(_spaceless_value_string);
		}
		_all_ROI_parameter_values 				= Array.concat(_all_ROI_parameter_values, _num_ROI_parameter_values, _ROI_parameter_values);
	}
	return _all_ROI_parameter_values;	
}
function results_table_2_CSV(_directory, _filename, _overwrite_existing, _print_path, _clear_results)
{
	_filepath 				= extend_path(_directory, _filename);	
	if						(_print_path)
		print				("Writing contents of results table to CSV at:\n------->" + _filepath);
	if						(!File.exists(_filepath) || _overwrite_existing)
	{
		saveAs				("Measurements", _filepath);	
		OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, _filepath);			
	}
	if						(_clear_results)
		clearResults		();
}
function results_table_2_CSV_if(_directory, _filename, _write_ON, _overwrite_existing, _print_path, _clear_results)
{
	if							(_write_ON)
	{
		_filepath 				= extend_path(_directory, _filename);	
		if						(_print_path)
			print				("Writing contents of results table to CSV at:\n------->" + _filepath);
		if						(!File.exists(_filepath) || _overwrite_existing)
		{
			saveAs				("Measurements", _filepath);	
			OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, _filepath);			
		}
	}
	if							(_clear_results)
		clearResults			();
}
function save_AVI(directory, filename, compression, frame_rate, overwrite_existing, print_path, close_stack_after_saving)
{
	path 					= extend_path(directory, filename);	
	if(print_path)
		print				("------->Saving image stack as AVI and writing to:\n" + path);
	if(!File.exists(path) || overwrite_existing)
	{
		run					("AVI... ", "compression=" + compression + " frame=" + frame_rate + " save=" + path);			
		OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, path);		
	}
	if(close_stack_after_saving)
		run					("Close All");
}
function save_GIF(directory, filename, overwrite_existing, print_path, _close_stack_after_saving)
{
	path 		= extend_path(directory, filename);	
	if(print_path)
		print	("------->Saving image stack as GIF and writing to:\n" + path);
	if(!File.exists(path) || overwrite_existing)
	{
		run("Animated Gif ... ", "number=0 filename=" + path);
		OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, path);	
	}	
	if(_close_stack_after_saving)
		run					("Close All");
}
function save_PNG(directory, filename, overwrite_existing, close_image, print_path)
{
	PNG_filename 			= extend_path(directory, filename);		
	if(print_path)
		print				("------->Saving plot as PNG image and writing to:\n" + PNG_filename);
	if(!File.exists(PNG_filename) || overwrite_existing)
	{
		saveAs				("PNG", PNG_filename);			
		OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, PNG_filename);		
	}
	if(close_image)
		close				();	
	return PNG_filename;	
}
function slice_2_PNG(directory, filename, slice, flip_horizontally, flip_vertically, min, max, overwrite_existing, window_title, close_image )
{					
	print				("-------> Extracting and saving PNG image of the slice of x being analysed...");			
	dimensions 			= query_open_image_dimensions();
	columns 			= dimensions[0];
	rows  				= dimensions[1];					
	image_slices 		= dimensions[2]; 					
	x_colunns 			= x_magnification * columns;
	x_rows 				= x_magnification * rows;
	y_upper_LHS 		= (slice - 1) * rows;			// y-coordinate of upper left corner of slice to be analyzed
	makeRectangle		( 0, y_upper_LHS, columns, rows);
	//imageCalculator	("Copy create", filename ,filename );
	//run				("Enhance Contrast", "saturated=0.35");
	run					("Duplicate...", "title=" + window_title );
	setMinAndMax		(min, max);
	if(flip_horizontally)
		run				("Flip Horizontally");
	if(flip_vertically)
		run				("Flip Vertically");
	run					("Size...", "width=x_columns height=x_rows constrain average interpolation=Bilinear");
	save_PNG			(directory, filename, overwrite_existing, close_image, false);				
}
function stack_2_animated_GIF(_stack_title, _GIF_directory, _GIF_filename, _GIF_speed, _GIF_2_disk, _overwrite_GIF, _print_GIF_path, _close_stack_after_saving)
{
	selectImage		(_stack_title);
	run				("Animation Options...", "speed=" + _GIF_speed);
	if(_GIF_2_disk)
		save_GIF	(_GIF_directory, _GIF_filename, _overwrite_GIF, _print_GIF_path, _close_stack_after_saving);
	
}
function stack_2_AVI(stack_title, directory, filename, compression, frame_rate, AVI_2_disk, overwrite_AVI, print_path, close_stack_after_saving)
{
	selectImage		(stack_title);
	if(AVI_2_disk)
		save_AVI	(directory, filename, compression, frame_rate, overwrite_AVI, print_path, close_stack_after_saving);
}
function subdirectory_array_concatenation(_subdirectory_array, _front_concatenation_subdirectory, _back_concatenation_subdirectory)
{
	_num_array_subdirectories 					= _subdirectory_array.length;
	_concatenated_subdirectory_array 			= newArray(_num_array_subdirectories);
	for											(i = 0; i < _num_array_subdirectories; i++)
	{
		if										(lengthOf(_front_concatenation_subdirectory) > 0)
		{	
			_concatenated_subdirectory 			= extend_path(_front_concatenation_subdirectory, _subdirectory_array[i]);
			if									(lengthOf(_back_concatenation_subdirectory) > 0)						
				_concatenated_subdirectory 		= extend_path(_concatenated_subdirectory, _back_concatenation_subdirectory);
		}							
		else
		{
			if									(lengthOf(_back_concatenation_subdirectory) > 0)						
				_concatenated_subdirectory 		= extend_path(_subdirectory_array[i], _back_concatenation_subdirectory);
			else
				_concatenated_subdirectory 		= _subdirectory_array[i];
		}		
		_concatenated_subdirectory_array[i]		= _concatenated_subdirectory;			
	}
	return 										_concatenated_subdirectory_array;
}
function verify_distributed_files(_paths)
{
	_num_files = _paths.length;
	if(_num_files == 0)
		return false;
	for(i = 0; i < _num_files; i++)
	{
		//file_path = extend_path(directories[i], filenames[i]);
		if(!File.exists(_paths[i]))
			return false;
	}
	return true;
}
function verify_distributed_file_set(directories, filenames)
{
	num_files = filenames.length;
	if(num_files == 0)
		return false;
	for(i = 0; i < num_files; i++)
	{
		file_path = extend_path(directories[i], filenames[i]);
		if(!File.exists(file_path))
			return false;
	}
	return true;
}
function verify_file_set(common_directory, common_basename, filename_suffixes, file_extension)
{
	num_files = filename_suffixes.length;
	file_set_validated = true;
	for(i = 0; i < num_files; i++)
	{
		file_path = extend_path(common_directory, common_basename + filename_suffixes[i] + file_extension);
		if(!File.exists(file_path))
			return false;
	}
	return true;
}
function verify_paths_exist(_path_strings, _print_missing_paths)
{
	_missing_paths = newArray();
	for(i = 0; i < _path_strings.length; i++)
	{
		if(!File.exists(_path_strings[i]))
        	_missing_paths = Array.concat(_missing_paths, _path_strings[i]);		
	}
	if(_missing_paths.length > 0)
	{
		print("=======> One or more paths were not found");
	    if(_print_missing_paths)
	    	Array.print(_missing_paths);
	}
	else
		print("=======> All paths exist");
	return _missing_paths;
}
function verify_reconstruction_output(_reconstruction_data_directory, _reconstruction_output_directory, _reconstructed_image_filenames, _TV_input_data_filename, _print_path)
{
	_reconstruction_output_directory_path = extend_path(_reconstruction_data_directory, _reconstruction_output_directory);		
	if(_print_path)
		print				("-------> Verifying reconstruction output data exists for:\n" + _reconstruction_output_directory_path				);		
	else
		print				("-------> Verifying reconstruction output data exists...");		
	data_verified 			= true;
	_num_iterations			= _reconstructed_image_filenames.length;
	for(iteration = 0; iteration < _num_iterations; iteration++)
	{
		check_image_path 	= _reconstruction_output_directory_path + File.separator + _reconstructed_image_filenames[iteration];
		if(!File.exists(check_image_path))
		{
			print			("ERROR: reconstructed image does not exist:\n" + check_image_path);
			data_verified 	= false;
			missing_data	= Array.concat(missing_data, check_image_path);
		}			
	}
	check_TV_path			= _reconstruction_output_directory_path + File.separator + _TV_input_data_filename;
	if(!File.exists(check_TV_path))
	{
		print				("ERROR: TV measurement file does not exist:\n" + check_TV_path);
		data_verified 		= false;
		missing_data		= Array.concat(missing_data, check_TV_path);
	}
	if(data_verified)
		print		("=======> RECONSTRUCTION OUTPUT DATA VERIFIED\n");
	else
		print		("=======> RECONSTRUCTION OUTPUT DATA NOT FOUND\n");
	
	return data_verified;			
}
function verify_ROI_analysis_output_files(_common_directory, _PVT_data_folder, _ROI_analysis_RSP_output_filename, _ROI_analysis_RSP_Error_output_filename, _ROI_analysis_Std_Dev_output_filename, _ROI_analysis_TV_input_filename, _slices_2_analyze_folders, _ROI_selection_diameter_folders, _print_path)
{
	_missing_data 		= false;
	if(_print_path)
		print				("-------> Verifying ROI analysis has been performed on the reconstruction data at:\n" + _PVT_data_folder				);		
	else
		print				("-------> Verifying ROI analysis has been performed on the reconstruction data");		
	for(_ROI_selection_diameter_index = 0; _ROI_selection_diameter_index < _ROI_selection_diameter_folders.length; _ROI_selection_diameter_index++)
	{
		for(_slice_2_analyze_index = 0; _slice_2_analyze_index < _slices_2_analyze_folders.length; _slice_2_analyze_index++)
		{
			_slice_2_analyze_folder 			= _slices_2_analyze_folders[_slice_2_analyze_index];
			_ROI_selection_diameter_folder 		= _ROI_selection_diameter_folders[_ROI_selection_diameter_index];					
			_current_analysis_subdirectory		= _slice_2_analyze_folder + _ROI_selection_diameter_folder;					
			_current_ROI_analysis_subdirectory	= _slice_2_analyze_folder + _ROI_selection_diameter_folder;					
				
			_current_analysis_ROI_analysis_RSP_output_filename			= _current_ROI_analysis_subdirectory 	+ File.separator 	+ _ROI_analysis_RSP_output_filename;
			_current_analysis_ROI_analysis_RSP_Error_output_filename	= _current_ROI_analysis_subdirectory 	+ File.separator 	+ _ROI_analysis_RSP_Error_output_filename;
			_current_analysis_ROI_analysis_Std_Dev_output_filename		= _current_ROI_analysis_subdirectory 	+ File.separator 	+ _ROI_analysis_Std_Dev_output_filename;
			_current_analysis_ROI_analysis_TV_input_filename			=  _ROI_analysis_TV_input_filename;				
			
			_source_folder		= extend_path(_common_directory, _PVT_data_folder				);
			_RSP_file_path		= extend_path(_source_folder, _current_analysis_ROI_analysis_RSP_output_filename			);
			_RSP_Error_file_path= extend_path(_source_folder, _current_analysis_ROI_analysis_RSP_Error_output_filename	);
			_Std_Dev_file_path	= extend_path(_source_folder, _current_analysis_ROI_analysis_Std_Dev_output_filename		);
			_TV_file_path		= extend_path(_source_folder, _current_analysis_ROI_analysis_TV_input_filename			);

			if(!File.exists(_RSP_file_path))
				_missing_data = true;
			if(!File.exists(_RSP_Error_file_path))
				_missing_data = true;
			if(!File.exists(_Std_Dev_file_path))
				_missing_data = true;
			if(!File.exists(_TV_file_path))
				_missing_data = true;				
		}
	}
	if(_missing_data)
		print		("=======> ROI analysis data missing for:\n" + _PVT_data_folder);
	else
		print		("=======> ROI ANALYSIS HAS BEEN COMPLETED\n" + _PVT_data_folder);
	return _missing_data;						
}
function verify_ROI_analysis_output_file_set(_common_directory, _PVT_data_folders, _current_analysis_RSP_input_data_filenames, _current_analysis_RSP_Error_input_data_filenames, _current_analysis_Std_Dev_input_data_filenames, _current_analysis_TV_input_data_filenames)
{
	missing_data_directories = newArray();
	print_section		("------->Verifying ROI analysis output data files exist for specified set of reconstructions:\n", PRINT_MAJOR_SECTION);
	for( i = 0; i < _PVT_data_folders.length; i++)
	{
		missing_data = false;
		directory 	= _common_directory + _PVT_data_folders[i];
		if(!File.exists(directory + _current_analysis_RSP_input_data_filenames))
			missing_data = true;
		if(!File.exists(directory + _current_analysis_RSP_Error_input_data_filenames))
			missing_data = true;
		if(!File.exists(directory + _current_analysis_Std_Dev_input_data_filenames))
			missing_data = true;
		if(!File.exists(directory + _current_analysis_TV_input_data_filenames))
			missing_data = true;
		if(missing_data)
			missing_data_directories = Array.concat(missing_data_directories, directory);		
	}
	if(missing_data_directories.length > 0)
	{
		print		("=======> ROI analysis data missing for:\n", PRINT_MINOR_SECTION);
		for(i=0; i < missing_data_directories.length; i++)
			print("-------> " + missing_data_directories[i]);
	}
	return missing_data_directories;						
}
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//----------------------------------------------------------------------- Array construction/manipulation function definitions ----------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
function array_2_string(array, precisions)
{
	string 			= EMPTY_STRING;
	for(i = 0; i < lengthOf(array); i++)
	{
		if( precisions[i] == -1 )
			string 	+= array[i] + " ";
		else
			string 	+= d2s(array[i], precisions[i]) + " ";
	}
	return string;
}
function array_2_tables( array, row, column, I, J, K)
{																
	index 		= i + j * I + k * J * I;
	//index 		= k + i * K + J * I * K;
	for(i = 0; i < I; i++){	
		for(j = 0; j <= J; j++){	
			for(k = 0; k < K; k++){
				index 		= i + j * I + k * J * I;
				setResult	(j + column,  row, array[index]);	
	}}}
}
function array_apply_op(_array, _coefficient, _operation, _switch_operands)
{
	_result_array					= Array.copy(_array);
	_coefficient_array				= array_match_length_fill(_array, _coefficient);
	if								(_switch_operands)
	{
		_left_operand_array			= Array.copy(_coefficient_array);
		_right_operand_array		= Array.copy(_array);
	}
	else
	{
		_left_operand_array			= Array.copy(_array);
		_right_operand_array		= Array.copy(_coefficient_array);
	}
	for								(i = 0; i < _array.length; i++)
	{
			if						(_operation == ADDITION)
				_result_array[i] 	= _left_operand_array[i] + _right_operand_array[i];
			else if					(_operation == SUBTRACTION)
				_result_array[i] 	= _left_operand_array[i] - _right_operand_array[i];
			else if					(_operation == MULTIPLICATION)
				_result_array[i] 	= _left_operand_array[i] * _right_operand_array[i];
			else if					(_operation == DIVISION)
				_result_array[i] 	= _left_operand_array[i] / _right_operand_array[i];
			else
				errKill				("Unknown '_operation' passed to 'array_apply_op' function");
	}
	return 							_result_array;
}
function array_fill(_array, _fill_term)
{
	for(i = 0; i < _array.length; i++)
		_array[i] 	=  _fill_term;
	return 			_array;
}
function array_from_data(_data)
{
	_new_array			= newArray();
	_new_array			= Array.concat(_new_array, _data);
	return 				_new_array;
}
function array_init(_array_length, _fill_value)
{
	_new_array		= array_new(_array_length);
	_init_array 	= array_fill(_new_array, _fill_value);
	return 			_init_array;
}
function array_match_length_fill(_array, _fill_term)
{
	_fill_term_array						= array_from_data(_fill_term);
	_fill_term_array2						= array_from_data(_fill_term);
	_fill_term_array_length					= _fill_term_array.length;
	_fill_term_array_length_deficiency		= _array.length - _fill_term_array_length;
	for										(i = 0; i < _fill_term_array_length_deficiency; i++)
	{
		if									(_fill_term == ARRAY_FILL_CYCLIC)
			_fill_term_array_index			= i % _fill_term_array_length;
		else if								(_fill_term == ARRAY_FILL_DUPLICATE)
			_fill_term_array_index			= _fill_term_array_length - 1;
		else
			_fill_term_array_index			= 0;
		_fill_term_array2					= Array.concat(_fill_term_array2, _fill_term_array[_fill_term_array_index]);
		_fill_term_array					= Array.concat(_fill_term_array, _fill_term_array[_fill_term_array_length - 1]);
	}
	match(_fill_term_array2, _fill_term_array, EMPTY_STRING, THROW_MISMATCH_ERROR + DONT_PRINT_MATCH);
	//match(_1st_item, _2nd_item, _statement, _bool_control);
	return 									_fill_term_array;
}
function array_new(_array_length)
{
	_new_array			= newArray(_array_length);
	for(i = 0; i < _new_array.length; i++)
		_new_array[i] 	=  EMPTY_STRING;
	return 				_new_array;
}
function array_powers_of_2(_power)
{
	_powers_of_2			= newArray(_power);
	for						(i = 0; i < _power; i++)
		_powers_of_2[i]		= pow(2,i);
	return					_powers_of_2;
}
function array_remove_indices(_array, _indices_2_remove)
{
	_reduced_array				= newArray();
	_indices_2_remove_array		= array_from_data(_indices_2_remove);
	for							(i = 0; i < _array.length; i++)
		if						(!isMember(i, _indices_2_remove_array, RETURN_MATCH_TF))
			_reduced_array		= Array.concat(_reduced_array, _array[i]);
	return 						_reduced_array;
}
function array_slicing_ops(_array, _reference_array, _slicing_op_values, _slicing_op)
{
	_sliced_array				= newArray();
	_slicing_op_values_array	= array_from_data(_slicing_op_values);
	_slicing					= array_init(_slicing_op_values_array.length, 0);
	if							(_reference_array.length == 0)
		_reference_array		= Array.copy(_array);
	_reference_values			= _reference_array.length;
	for							(i = 0; i < _reference_values; i++)
	{
		_value					= _array[i];
		_ref_value				= _reference_array[i];
		for						(j = 0; j < _slicing_op_values_array.length;j++)
		{
			_slicing_op_value	= _slicing_op_values_array[j];
			if						
			( 
								( (_slicing_op 	== 	ARRAY_SLICING_VALUES_BELOW		&& 	_ref_value 	>= 	_slicing_op_value) ) ||
								( (_slicing_op 	== 	ARRAY_SLICING_VALUES_EQUAL		&& 	_ref_value 	!= 	_slicing_op_value) ) ||
								( (_slicing_op 	== 	ARRAY_SLICING_VALUES_ABOVE		&& 	_ref_value 	<= 	_slicing_op_value) ) ||
								( (_slicing_op 	== 	ARRAY_SLICING_VALUES_UNEQUAL	&& 	_ref_value 	== 	_slicing_op_value) ) 
			)
				_slicing[j]		= 1;
			else
				_slicing[j]		= 0;
		}
		if						( (_slicing_op == ARRAY_SLICING_VALUES_UNEQUAL) && isMember(1, _slicing, RETURN_MATCH_TF))
			_sliced_array 		= Array.concat(_sliced_array, _value);
		else if					(!isMember(0, _slicing, RETURN_MATCH_TF))
			_sliced_array 		= Array.concat(_sliced_array, _value);
		Array.fill				(_slicing, 0);
	}
	return						_sliced_array;
}
function array_sort_by(_array, _sorting_indices)
{
	_sorted_array			= newArray(_array.length);	
	for						(i = 0; i < _array.length; i++)
		_sorted_array[i]	= _array[_sorting_indices[i]];
	return 					_sorted_array;
}
function array_type(_array)
{
	_number_count	= 0;
	is_array		= isArray(_array);
	if				(!is_array)
		return 		IS_NOT_ARRAY;
	_array_elements	= _array.length;
	if				(_array_elements == 0)
		return 		IS_EMPTY_ARRAY;
	for				(i = 0; i < _array_elements; i++)
		if			(isNumber(_array[i]))
			_number_count++;
	if				(_number_count == 0)
		return		ARRAY_HAS_STRINGS;
	else if			(_number_count < _array_elements)
		return		ARRAY_HAS_STRINGS + ARRAY_HAS_NUMBERS;
	else if			(_number_count == _array_elements)
		return		ARRAY_HAS_NUMBERS;
	else
		return		RETURN_ERROR_CODE;
}
function extract_interleaved_data(_interleaved_data, _interleaved_data_group_start_index, _num_interleaved_data_groups, _interleaved_data_elements)
{
	_data 									= newArray(_interleaved_data_elements);
	for										(_interleaved_data_element = 0; _interleaved_data_element < _interleaved_data_elements; _interleaved_data_element++)
		_data[_interleaved_data_element] 	= _interleaved_data[_interleaved_data_group_start_index + _interleaved_data_element * _num_interleaved_data_groups];
	return 									_data;
}
function extract_from_multi_array(_multi_array, _multi_array_start_indices, _multi_array_index)
{
	_multi_array_end_indices = Array.concat(_multi_array_start_indices, (_multi_array.length));
	_multi_array_end_indices = Array.slice(_multi_array_end_indices, 1);
	return Array.slice(_multi_array, _multi_array_start_indices[_multi_array_index], _multi_array_end_indices[_multi_array_index]);
}
function extract_subsequence_group(sequence, group_2_extract, num_groups, group_size)
{
	subsequence_group = newArray(group_size);
	for(group_element = 0; group_element < group_size; group_element++)
	{
		index = group_2_extract + group_element * num_groups;
		subsequence_group[group_element] = sequence[index];
	}
	return subsequence_group;
}
function find_array_extrema(_data_array, _tolerance, _notify_equality)
{
	_extrema 			= newArray(2);
	_min_val_indices 	= Array.findMinima(_data_array, _tolerance);
	_max_val_indices 	= Array.findMaxima(_data_array, _tolerance);
	if(_min_val_indices.length == 0)
	{
		if(_notify_equality)
			print		("------->All array data values are equal");
		_constant_val 	= _data_array[0];									
		_extrema[0] 		= _constant_val;
		_extrema[1] 		= _constant_val;	
	}
	else
	{							
		_extrema[0] 		= _data_array[_min_val_indices[0]];
		_extrema[1] 		= _data_array[_max_val_indices[0]];	
	}
	return _extrema;
}
function isMember(_match, _array, _return_index)
{
	for				(i = 0; i < _array.length; i++)	
		if			(_array[i] == _match)		
			return	conditional_return(_return_index, i, true);	
	return			conditional_return(_return_index, -1, false);
}					
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------- String construction/manipulation function definitions ----------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
function create_time_stamp(_print_time_stamp, _pop_time_stamp_message)
{
	getDateAndTime			(_year, _month, _day_of_week, _day_of_month, _hour, _minute, _second, _msec);
	if (_day_of_month < 10) {_day_of_month = "0" + _day_of_month;}
	if (_hour < 10) 		{_hour = "0" + _hour;}
	if (_minute < 10) 		{_minute = "0" + _minute;}
	if (_second < 10) 		{_second = "0" + _second;}
	_time_stamp_date 	= "Date: " + DAY_NAMES[_day_of_week] + " " + _day_of_month + "-" + MONTH_NAMES[_month] + "-" + _year;
	_time_stamp_time	= "Time: " + _hour + ":" + _minute + ":" + _second;
	_time_stamp			= _time_stamp_date + NEWLINE_CMD_STRING + _time_stamp_time;
	if(_print_time_stamp)
		print				(_time_stamp);
	if(_pop_time_stamp_message)
		showMessage			(_time_stamp);
	return 					_time_stamp;
}
function find_min_d2s_precision(value_string, max_precision)
{
	min_precision 			= 0;
	value 					= parseFloat(value_string);
	for(i=0; i< max_precision;i++)
	{
		new_value_string 	= d2s(value, i);
		new_value 			= parseFloat(new_value_string);
		if(value - new_value != 0)
			min_precision++;
	}
	return min_precision;
}
function getStringSequence(_sequence_start_num, _sequence_end_num, _string_precision)
{
	_sequential_values			= Array.getSequence(_sequence_end_num + 1);					
	_sequential_values_subset	= Array.slice(_sequential_values, _sequence_start_num, _sequence_end_num + 1);	
	_sequential_strings			= newArray();
	for( i = 0; i < _sequential_values_subset.length; i++)
		_sequential_strings = Array.concat(_sequential_strings, d2s( _sequential_values_subset[i], _string_precision));
	return _sequential_strings;
}
function minimize_string_precision(_value_strings, _max_precisions, _return_precision, _force_array)
{
	_value_strings_array							= array_from_data(_value_strings);
	_max_precisions_array							= array_match_length_fill(_value_strings_array, _max_precisions);
	_return_value_array								= array_new(_value_strings_array.length);
	for												(_string = 0; _string < _return_value_array.length; _string++)
	{
		_value_string								= _value_strings_array[_string];	
		_max_precision								= _max_precisions_array[_string];	
		_value 										= parseFloat(_value_string);
		if											(_max_precision < 0)
		{
			i 										= 0;
			_continue								= true;
			while									(_continue)
			{
				_new_value_string 					= d2s(_value, i);
				_new_value 							= parseFloat(_new_value_string);
				if									(_value - _new_value == 0)
					_continue 						= false;
				i++;
			}
			_return_value						= if_else(_return_precision, precisionOf(_new_value_string), _new_value_string);
			_return_value_array[_string] 		= _return_value;
			//_return_value_array[_string] 		= if_else(_return_precision, precisionOf(_new_value_string), _new_value_string);
		}
		else
		{
			_return_value							= if_else(_return_precision, _max_precision, _value_string);
			for										(i = 0; i < _max_precision; i++)
			{
				_new_value_string 					= d2s(_value, i);
				_new_value 							= parseFloat(_new_value_string);
				_return_value						= if_else(_return_precision, precisionOf(_new_value_string), _new_value_string);
				if									(_value - _new_value == 0)
					i 								= _max_precision;
			}
			if										( i < _max_precision)
				_return_value						= if_else(_return_precision, _max_precision, _value_string);
			_return_value_array[_string] 			= _return_value;	
			//if									( i >= _max_precision)
				//_return_value_array[_string] 		= _return_value;	
			//else
				//_return_value_array[_string] 		= if_else(_return_precision, _max_precision, _value_string);
		}
	}
	if(	_force_array || _return_value_array.length > 1)	
		return _return_value_array;							
	else
		return _return_value_array[0];
}
function precisionOf(_string)
{
	_decimal_position_index			= indexOf(_string, DECIMAL_STRING);
	if								(_decimal_position_index != -1)
	{
		_decimal_value_string		= substring	(_string, _decimal_position_index + 1 );
		_decimal_value_precision	= lengthOf(_decimal_value_string);
		return						_decimal_value_precision;
	}
	else
		return						0;
}
function right_arrow(_arrow_length, _implication_arrow)
{
	right_arrow_string			= EMPTY_STRING;
	if							(_implication_arrow == IMPLICATION_ARROW)
		right_arrow_base_char	= EQUALS_STRING;
	else
		right_arrow_base_char	= DASH_STRING;
	for							(i = 0; i < _arrow_length; i++)
		right_arrow_string		+= right_arrow_base_char;
	return 						right_arrow_string + RIGHT_CARAT_STRING;
}
function string_array_concatenation(_string_array, _string_array_precisions, _strings_2_prepend, _strings_2_append)//, _minimize_string_precision)
{
		
	_string_precisions_array		= array_match_length_fill(_string_array, _string_array_precisions);
	_strings_2_prepend_array		= array_match_length_fill(_string_array, _strings_2_prepend);
	_strings_2_append_array			= array_match_length_fill(_string_array, _strings_2_append);
	_new_string_array				= Array.copy(_string_array);
	for								(i = 0; i < _string_array.length; i++)
		_new_string_array[i]		= _strings_2_prepend_array[i] + d2s(_string_array[i], _string_precisions_array[i]) + _strings_2_append_array[i];
	return 							_new_string_array;
}
function string_max_length(_string_array)
{
	_max_string_array_length			= 0;
	for									(i = 0; i < _string_array.length; i++)
		if								(lengthOf(_string_array[i]) > _max_string_array_length)
			_max_string_array_length	= lengthOf(_string_array[i]);
	return 								_max_string_array_length;
}
function string_separator_construction(_prefix, _separator_substring, _separator_duplications, _suffix)
{
	String.resetBuffer; 
	for						(i = 0; i < _separator_duplications; i++)
		String.append		(_separator_substring);
	_separator_string		= _prefix + String.buffer + _suffix;
	return					_separator_string;
}
function string_tab_construction(_use_tab_command, _num_tab_spaces)
{
	String.resetBuffer; 
	for							(i = 0; i < _num_tab_spaces; i++)
		String.append			(SPACE_STRING);
	TAB_AS_SPACES_STRING		= String.buffer;
	if							(_use_tab_command)
		return					TAB_CMD_STRING;
	else
		return					TAB_AS_SPACES_STRING;
	
}
function strip_surrounding_spaces(string)
{
	spaceless_string 			= string;
	do 
	{
		starts_with_space 		= startsWith(spaceless_string, SPACE_STRING) || startsWith(spaceless_string, NEWLINE_CMD_STRING) || startsWith(spaceless_string, TAB_CMD_STRING);
		if(starts_with_space)
			spaceless_string 	= substring(spaceless_string, 1);
	} 
	while (starts_with_space);
	do 
	{
		string_length			= lengthOf(spaceless_string); 
		ends_with_space 		= endsWith(spaceless_string, SPACE_STRING) || endsWith(spaceless_string, NEWLINE_CMD_STRING) || endsWith(spaceless_string, TAB_CMD_STRING);
		if(ends_with_space)
			spaceless_string 	= substring(spaceless_string, 0, string_length - 1);
	} 
	while (ends_with_space);	
	return spaceless_string;
}
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------- Image construction/manipulation function definitions -----------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
function extract_slice(slice, magnification, flip_horizontally, flip_vertically, grayscale_min, grayscale_max, overwrite_existing, window_title, close_image)
{
	print				("Extracting and saving PNG image of the slice of x being analysed...");			
	dimensions 			= query_open_image_dimensions();
	image_columns 		= dimensions[0];
	image_rows  		= dimensions[1];					
	image_slices 		= dimensions[2]; 					
	image_size_x 		= magnification * image_columns;
	image_size_y 		= magnification * image_rows;
	y_upper_LHS 		= (slice - 1) * image_rows;			// y-coordinate of upper left corner of slice to be analyzed
	makeRectangle		( 0, y_upper_LHS, image_columns, image_rows);
	//imageCalculator	("Copy create", filename ,filename );
	//run				("Enhance Contrast", "saturated=0.35");
	run					("Duplicate...", "title=" + window_title );
	setMinAndMax		(grayscale_min, grayscale_max);
	if(flip_horizontally)
		run				("Flip Horizontally");
	if(flip_vertically)
		run				("Flip Vertically");
	run					("Size...", "width=image_size_x height=image_size_y constrain average interpolation=Bilinear");	
}
function image_set_2_animated_GIF(image_type, directory, filenames, image_names_matching, GIF_filename, GIF_speed, print_image_paths, close_image_set, GIF_2_disk, overwrite_GIF, print_GIF_path, close_stack_after_saving)
{
	stack_dimensions 		= image_set_2_stack(image_type, directory, filenames, image_names_matching, GIF_filename, print_image_paths, close_image_set);
	stack_2_animated_GIF	(GIF_filename, directory, GIF_filename, GIF_speed, GIF_2_disk, overwrite_GIF, print_GIF_path, close_stack_after_saving);
	return stack_dimensions;
}			
function image_set_2_AVI(image_type, directory, filenames, image_names_matching, filename, compression, frame_rate, print_image_paths, close_image_set, AVI_2_disk, overwrite_AVI, print_path, close_stack_after_saving)
{
	stack_dimensions 	= image_set_2_stack(image_type, directory, filenames, image_names_matching, filename, print_image_paths, close_image_set);
	stack_2_AVI			(filename, directory, filename, compression, frame_rate, AVI_2_disk, overwrite_AVI, print_path, close_stack_after_saving);
	return stack_dimensions;
}
function image_set_2_stack(image_type, directory, filenames, image_names_matching, stack_title, print_image_paths, close_image_set)
{
	image_set			= open_image_set(image_type, directory, filenames, print_image_paths);
	stack_dimensions 	= opened_image_set_2_stack(image_names_matching, stack_title, close_image_set);
	if(close_image_set)
		for(i = 0; i < image_set.length; i++)
			close		(image_set[i]);
	return stack_dimensions;
}	
function line_profile(_ROI_number, _ROI_x, _ROI_y, _ROI_radius, _profile_radius, _profile_direction, _base_value, _ref_value, _voxel_dimensions, _title, _text, _text_size, _xlabel, _ylabel, _legend_entries, _legend_text_size, _plot_parameters, _is_gradient_analysis)
{
							
	_voxel_width 				= _plot_parameters[0]; 	_tolerance		= _plot_parameters[1]; 	_lower_limits_scale	= _plot_parameters[2]; _upper_limits_scale 	= _plot_parameters[3]; 
	_difference_scale 			= _plot_parameters[4]; 	_x_frame_size  	= _plot_parameters[5]; 	_y_frame_size 		= _plot_parameters[6]; _text_xpos_ratio 		= _plot_parameters[7]; 
	_text_ypos_ratio 			= _plot_parameters[8]; 	_add_line_color 	= _plot_parameters[9]; 	_linewidth 			= _plot_parameters[10]; 
	_voxel_width 				= _voxel_dimensions[0]; 	_voxel_height 	= _voxel_dimensions[1];	_voxel_thickness 	= _voxel_dimensions[2];
	
	_ROI_selection_diameter = _ROI_radius * 2;
	if(_ROI_selection_diameter % 2 == 1)
	{
		_profile_center_x = _ROI_x + 0.5; 
		_profile_center_y = _ROI_y + 0.5; 
	}
	else
	{
		_profile_center_x = _ROI_x; 
		_profile_center_y = _ROI_y; 
	}
	//run											("Specify...", "width=" + ROI_selection_diameter + " height=" + ROI_selection_diameter + " x=" + selection_center_x + " y=" + selection_center_y + " oval centered");							
	if(_profile_direction == x_direction)
	{
		_ROI_varying_direction 	= _profile_center_x;
		_ROI_constant_direction = _profile_center_y;
		_voxel_dimension	 	= _voxel_width;
	}
	else
	{
		_ROI_varying_direction 	= _profile_center_y;
		_ROI_constant_direction = _profile_center_x;
		_voxel_dimension 		= _voxel_height;
	}
	_data_shifted_distance		= _ROI_varying_direction - floor(_ROI_varying_direction);
	
	_profile_1st_edge			= floor((	_ROI_varying_direction - _profile_radius						) 	* _voxel_dimension	);
	_profile_2nd_edge			= ceil(( 	_ROI_varying_direction + _profile_radius 						) 	* _voxel_dimension	);		
	_ROI_1st_edge				= ( 		_ROI_varying_direction - _ROI_radius - _data_shifted_distance	) 	* _voxel_dimension;
	_ROI_2nd_edge				= ( 		_ROI_varying_direction + _ROI_radius - _data_shifted_distance	) 	* _voxel_dimension;		
	_center_coordinate 			= ( 		_ROI_varying_direction 											)	* _voxel_dimension;														
	
	if(_profile_direction == x_direction)
		makeLine				(_profile_1st_edge, _ROI_constant_direction, _profile_2nd_edge, _ROI_constant_direction );	
	else
		makeLine				(_ROI_constant_direction, _profile_1st_edge, _ROI_constant_direction, _profile_2nd_edge );		
	_profile 					= getProfile();
	_profile_elements			= _profile.length;
	getSelectionCoordinates		(_xpoints, _ypoints);
	_selection_length			= _xpoints[1] - _xpoints[0];
	_point_separation			= _selection_length / (_profile_elements - 1);
	//_x_axis_coordinates 		= Array.slice(SEQUENTIAL_VALUES_ARRAY, _profile_1st_edge, _profile_2nd_edge + 1);
	_x_axis_coordinates			= sequential_value_array(_profile_1st_edge, _profile_2nd_edge + 1);
	_predicted_profile_coords 	= newArray(_profile_1st_edge, _ROI_1st_edge, _ROI_1st_edge, _ROI_1st_edge, _ROI_2nd_edge, _ROI_2nd_edge, _ROI_2nd_edge, _profile_2nd_edge);
	_predicted_profile 			= newArray(_base_value, _base_value, _base_value, _ref_value, _ref_value, _base_value, _base_value, _base_value );			
	//setResult					(1, ROI_number, profile[0]);
	for(i = 0; i < _profile.length; i++)							
		setResult				(i, _ROI_number, _profile[i]);
	_profile_extrema 			= set_plot_extrema(_profile, _predicted_profile, _tolerance, _lower_limits_scale, _upper_limits_scale, _difference_scale);
	_plot_ymin 					= _profile_extrema[0];
	_plot_ymax 					= _profile_extrema[1];
	_center_line_x 				= newArray(_center_coordinate, _center_coordinate);
	_center_line_y 				= newArray(_plot_ymin, _plot_ymax);
	if(_is_gradient_analysis)
	{
		if( _ref_value > _base_value)
			_predicted_profile 	= newArray(0.0, 0.0, _plot_ymax, 0.0, 0.0, _plot_ymin, 0.0, 0.0 );				
		else
			_predicted_profile 	= newArray(0.0, 0.0, _plot_ymin, 0.0, 0.0, _plot_ymax, 0.0, 0.0 );
	}
	Plot.create					(_title, _xlabel, _ylabel, _x_axis_coordinates, _profile																);
	Plot.setLimits				(_profile_1st_edge, _profile_2nd_edge, _plot_ymin, _plot_ymax														);
	set_plot_props				(_legend_entries, _legend_text_size, _x_frame_size, _y_frame_size, _text, _text_size, _text_xpos_ratio, _text_ypos_ratio, _add_line_color, _linewidth	);					
	Plot.setColor				("green"																										);
	Plot.add					("line", _predicted_profile_coords, _predicted_profile															);
	Plot.setColor				("yellow"																										);
	Plot.add					("line", _center_line_x, _center_line_y																			);					
	set_plot_data_props			(_data_line_color, _add_text_justification																		);			
	return _profile;
}
function opened_image_set_2_stack(_image_names_matching, _stack_title, _close_image_set)
{
	_open_image_list 		= getList("image.titles");	
	if(_close_image_set)
		run						("Images to Stack", "name=" + _stack_title + " title=" + _image_names_matching);			
	else
		run						("Images to Stack", "name=" + _stack_title + " title=" + _image_names_matching + " use keep");			
	Stack.getDimensions		(_width, _height, _channels, _slices, _frames);
	_stack_dimensions 		= newArray(_width, _height, _channels, _slices, _frames);
	return _stack_dimensions;			
}			
function query_image_dimensions(_directory_path, _image_filename)
{
	_file_path 			= extend_path(_directory_path, _image_filename);		
	run					("Text Image... ", "open=" + _file_path);
	getDimensions		(_image_columns, _image_height, _image_channels, _image_layers, _image_frames);
	_image_rows 		= _image_columns;
	_image_slices 		= _image_height / _image_rows;
	_image_dimensions 	= newArray(_image_columns, _image_rows, _image_slices, _image_height, _image_channels, _image_layers, _image_frames);
	run					("Close");	
	return 				_image_dimensions;
}
function query_open_image_dimensions()
{
	getDimensions		(image_columns, image_height, image_channels, image_layers, image_frames);
	image_rows 			= image_columns;
	image_slices 		= image_height / image_rows;
	image_dimensions 	= newArray(image_columns, image_rows, image_slices, image_height, image_channels, image_layers, image_frames);
	//run				("Close");	
	return image_dimensions;
}
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//------------------------------------------------------------------ Results table construction/manipulation function definitions -------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
function table_add(_current_row, _start_column, _columns_2_skip, _data, _num_columns, _num_rows, _row_headers, _leftmost_table)
{							
	for(N = 0; N < _num_rows; N++)
	{		
		_current_column 	= _start_column;
		_data_start_index 	= N * _num_columns;
		if(_leftmost_table)
			for(i = 0; i < _start_column - 1; i++)	
				setResult	(i, _current_row, EMPTY_STRING);	
		setResult			(_current_column - 1,  _current_row, N + 1);
		_current_column 	= table_fill_columns(_current_row, _current_column, _columns_2_skip, _data, _data_start_index, _num_columns);								
		_current_row++;
	}
	return _current_row;
}
function table_add_colsum_row( _start_row, _start_column, _num_columns, _num_rows, _max_row_label_length)
{									
	_COLUMN_SUM_ROW_LABEL_STRING	= table_add_colsum_row_label( _start_row, _start_column, _num_rows, _max_row_label_length);
	for(_column = 0; _column < _num_columns; _column++, _colsum = 0)
	{
		for(_row = 0; _row < _num_rows; _row++)
			_colsum 				+= getResult(  d2s(_start_column + _column, 0), _start_row + _row );
		setResult					( _start_column + _column, _start_row  + _num_rows, _colsum);
	}
	return _start_column + _num_columns;
}
function table_add_colsum_row_label( _start_row, _start_column, _num_rows, _max_row_label_length)
{									
	_COLUMN_SUM_ROW_LABEL_LENGTH		= lengthOf(COLUMN_SUM_ROW_LABEL);
	String.resetBuffer; 
	String.append						(COLUMN_SUM_ROW_LABEL); 
	String.append						(SPACE_STRING); 
	_dashes_2_append					= maxOf(MIN_SUM_ARROW_LENGTH, DASHES_PER_CHAR * (_max_row_label_length - _COLUMN_SUM_ROW_LABEL_LENGTH  - 2) + 1);
	for(i = 0; i < _dashes_2_append; i++)
		String.append					(DASH_STRING); 
	String.append						(RIGHT_CARAT_STRING); 
	_COLUMN_SUM_ROW_LABEL_STRING		= String.buffer;
	setResult							(_start_column - 1,  _start_row  + _num_rows, _COLUMN_SUM_ROW_LABEL_STRING);
	return 								_COLUMN_SUM_ROW_LABEL_STRING;
}
function table_add_colsum_rows( _current_row, _start_row, _start_column, _num_columns, _num_rows, _num_tables, _table_colskip, _max_row_label_lengths)
{									
	_current_column 			= _start_column;
	for(i = 0; i < _start_column - 1; i++)	
		setResult				(i, _current_row, EMPTY_STRING);	
	for(i = 0; i < _num_tables - 1; i++)
	{
		_current_column 		= table_add_colsum_row	(_start_row, 	_current_column, 		_num_columns, 	_num_rows, _max_row_label_lengths[i]);
		_current_column 		= table_skip_columns	(_current_row, 	_current_column + 1, 	_table_colskip										);
	}
	_current_column 			= table_add_colsum_row	(_start_row, 	_current_column, 		_num_columns, 	_num_rows, _max_row_label_lengths[i]);
	_current_column 			= table_skip_columns	(_current_row, 	_current_column, 		0													);
	return _current_row;
}
function table_add_col_header_line(_first_column, _header_row, _num_tables, _table_headers, _column_labels, _table_colskip)
{
	_current_column 		= _first_column;
	_column_skip_array		= newArray();
	for(i = 0; i < _table_colskip; i++)
		_column_skip_array 	= Array.concat(_column_skip_array, EMPTY_STRING);
	for(i = 0; i < _num_tables; i++)
	{
		_current_column 	= table_add_col_headers(_current_column, 	_header_row, 	_table_headers[i]);
		_current_column 	= table_add_col_headers(_current_column, 	_header_row, 	_column_labels);
		if( i != _num_tables - 1 )
			_current_column = table_add_col_headers(_current_column, 	_header_row, 	_column_skip_array);
	}
}
function table_add_col_headers(_start_column, _row_num, _header_array)
{					
	_current_column 		= _start_column;
	_forced_header_array 	= newArray();
	_forced_header_array 	= Array.concat(_forced_header_array, _header_array);
	for(i = 0; i < _forced_header_array.length; i++)	
		setResult			(_current_column++, _row_num, _forced_header_array[i]);	
	return 					_current_column;
}
function table_add_empty_rows( _num_columns, _start_row, _num_rows)
{									
	for(_row = 0; _row < _num_rows; _row++)
		for(_column = 0; _column < _num_columns; _column++)
			setResult(_column,  _start_row + _row, EMPTY_STRING);	
		return _start_row + _num_rows - 1;
}
function table_add_row(_current_row, _start_column, _row_label, _columns_2_skip, _data, _data_start_index, _data_points, _first_table, _last_table)
{
	_row_data			= table_extract_row_data(_data, _data_start_index, _data_points);
	if(_first_table)
		for( j = 0; j < _start_column; j++)			
			setResult	(_start_column - j - 1, _current_row, EMPTY_STRING );//N + 1);
	setResult			(_start_column++,  _current_row, _row_label);	
	for(i = 0; i < _row_data.length; i++)
		setResult		(_start_column++,  _current_row, _row_data[i]);	
	if(!_last_table)
		for(i = 0; i < _columns_2_skip; i++)
			setResult	(_start_column++,  _current_row, EMPTY_STRING);	
	return _start_column;
}
function table_add_subarray(_current_row, _start_column, _columns_2_skip, _data, _start_index, _num_columns, _num_rows)
{							
	_subarray				= Array.slice(_data, _start_index, _start_index + _num_columns * _num_rows);
	for(N = 0; N < _num_rows; N++)
	{		
		_current_column 	= _start_column;
		_start_row 			= N * _num_columns;
		setResult			(_current_column - 1,  _current_row, N + 1);
		_current_column 	= table_fill_columns(_current_row, _current_column, _columns_2_skip, _subarray, _start_row, _num_columns);								
		_current_row++;
	}
	return _current_row;
}
function table_add_title_line(_title_start_column, _title_start_row, _title_row_separation, _table_columns, _header_array)
{					
	_forced_header_array 	= newArray();
	_forced_header_array 	= Array.concat(_forced_header_array, _header_array);
	_current_row			= table_add_empty_rows( _table_columns, 0, _title_start_row + 1);
	for(i = 0; i < _forced_header_array.length; i++)	
		setResult			(_title_start_column + i, _current_row, _forced_header_array[i]);	
	_current_row			= table_add_empty_rows( _table_columns, ++_current_row, _title_row_separation);			
	return _current_row;				
}
function table_add_title_lines(_title_start_column, _title_start_row, _title_row_separation, _table_columns, _header_array, _clear_results)
{					
	if(_clear_results)
		clearResults		();
	_forced_header_array 	= newArray();
	_forced_header_array 	= Array.concat(_forced_header_array, _header_array);
	_current_row			= table_add_empty_rows( _table_columns, 0, _title_start_row + _forced_header_array.length);
	for(i = 0; i < _forced_header_array.length; i++)	
		setResult			(_title_start_column, _title_start_row + i, _forced_header_array[i]);	
	_current_row			= table_add_empty_rows( _table_columns, ++_current_row, _title_row_separation);			
	return _current_row;				
}
function table_column_order_index(_num_columns, _num_rows, _num_tables, _column_num, _row_num, _table_num)
{
	_column_index			= _table_num * _num_columns 
	_elements_per_row		= _num_tables * _num_columns;
	_row_start_index		= _row_num * _elements_per_row;  
	_column_start_index		= _row_start_index + _column_index;  
	_column_index			= _column_start_index + _column_num;  
	return 					_column_index;
}
function table_data_index(_num_columns, _num_rows, _num_tables, _column_num, _row_num, _table_num, _data_order)
{
	if(_data_order == COLUMN_ORDER)
		_column_index		= table_column_order_index(_num_columns, _num_rows, _num_tables, _column_num, _row_num, _table_num);
	else
		_column_index		= table_row_order_index(_num_columns, _num_rows, _column_num, _row_num, _table_num);
	return 					_column_index;
}
function table_extract_row_data(_data, _data_start_index, _data_points)
{
	_row_data	= Array.slice(_data, _data_start_index, _data_start_index + _data_points);
	return 		_row_data;
}
function table_fill(_tables_start_row, _num_tables, _table_colnums, _table_colskip, _merged_concat_data, _table_columns, _table_rows, _row_headers)
{
	_table_elements				= _table_columns * _table_rows;
	_table_colskip_array 		= newArray();
	for(i = 0; i < _num_tables - 1; i++)
		_table_colskip_array	= Array.concat(_table_colskip_array, _table_colskip);
	_table_colskip_array		= Array.concat(_table_colskip_array, 0);
	for(i = 0; i < _num_tables; i++)
	{
		_start_index			= i * _table_elements;
		_table_data				= Array.slice(_merged_concat_data, _start_index, _start_index + _table_elements);
		_current_row 			= table_add(_tables_start_row, _table_colnums[i], _table_colskip_array[i], _table_data, _table_columns, _table_rows, _row_headers, (i == 0) );	
	}
	return 						_current_row;
}
function table_fill_columns(_current_row, _start_column, _columns_2_skip, _data, _data_start_index, _data_points)
{
	_current_column 	= _start_column;
	for(i = 0; i < _data_points; i++)
	{	
		setResult		(_current_column,  _current_row, _data[_data_start_index + i]);	
		_current_column++;
	}
	_current_column 	= table_skip_columns( _current_row, _current_column, _columns_2_skip);
	return 				_current_column;
}
function table_grid_add_row(_tables_start_row, _start_column, _table_colskip, _table_rowskip, _table_titles, _column_headers, _row_headers, _column_labels_row_separation, _data, _num_columns, _num_rows, _table_grid_columns, _table_grid_row, _data_order)
{
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	_current_row						= _tables_start_row;
	_num_tables 						= _table_titles.length;
	_table_grid_columns					= minOf(_num_tables, _table_grid_columns);
	_table_grid_rows 					= _num_tables / _table_grid_columns;
	_total_grid_columns					= _start_column + _table_grid_columns * (_num_columns + _table_colskip + 1) - _table_colskip - 1;
	_table_num							= _table_grid_row * _table_grid_columns;
	_table_grid_row_table_titles		= Array.slice(_table_titles, _table_num, _table_num + _table_grid_columns);
	_max_row_label_lengths				= table_grid_max_row_label_lengths(_table_titles, _row_headers);
	table_add_col_header_line			( _start_column - 1, _tables_start_row, _table_grid_columns, _table_grid_row_table_titles, _column_headers, _table_colskip);
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	for									(N = 0; N < _num_rows; N++)
	{
		_current_column 				= _start_column;
		_table_num						= _table_grid_row * _table_grid_columns;
		for								(i = 0; i < _table_grid_columns; i++)
		{
			_data_start_index 			= table_data_index(_num_columns, _num_rows, _num_tables, 0, N, _table_num, _data_order);
			_current_column 			= table_add_row(_current_row + 1, _current_column - 1, _row_headers[N], _table_colskip + 1, _data, _data_start_index, _num_columns, (i == 0), (i == _table_grid_columns - 1));
			_table_num++;
		}
		_current_row++;
	}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	if									(_table_grid_row != _table_grid_rows - 1)
		_current_row					= table_add_empty_rows( _total_grid_columns, _current_row + 1, _table_rowskip + _column_labels_row_separation);
	else
		_current_row					= table_add_empty_rows( _total_grid_columns, _current_row + 1, 1);
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	_current_row						= table_add_colsum_rows( _current_row, _tables_start_row + 1, _start_column, _num_columns, _num_rows, _table_grid_columns, _table_colskip, _max_row_label_lengths);
	return 								_current_row;
}
function table_grid_fill(_tables_start_row, _start_column, _table_colskip, _table_rowskip, _table_titles, _column_headers, _row_headers, _column_labels_row_separation, _data, _num_columns, _num_rows, _table_grid_columns, _data_order)
{
	_num_columns_array					= array_from_data(_num_columns);
	_table_elements 					= _num_columns * _num_rows;
	_num_tables 						= _data.length / _table_elements;
	_table_titles 						= table_grid_row_array_duplication( _table_titles, _num_tables);
	_table_grid_rows 					= _num_tables / _table_grid_columns;
	_table_num							= 0;
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	for(_table_grid_row = 0; _table_grid_row < _table_grid_rows; _table_grid_row++)
		_tables_start_row 				= table_grid_add_row(_tables_start_row, _start_column, _table_colskip, _table_rowskip, _table_titles, _column_headers, _row_headers, _column_labels_row_separation, _data, _num_columns, _num_rows, _table_grid_columns, _table_grid_row, _data_order);
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	return 								_tables_start_row;
}							
function table_grid_fill_all(_table_grid_labels, _table_grid_label_indices, _table_grid_columns, _table_title_dimensions, _table_dimensions, _data, _data_order)
{
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	_table_grid_titles					= extract_from_multi_array(_table_grid_labels, _table_grid_label_indices, 0);
	_table_titles						= extract_from_multi_array(_table_grid_labels, _table_grid_label_indices, 1);
	_column_headers						= extract_from_multi_array(_table_grid_labels, _table_grid_label_indices, 2);
	_row_headers						= extract_from_multi_array(_table_grid_labels, _table_grid_label_indices, 3);
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	_start_column						= _table_dimensions[0];
	_num_columns						= _table_dimensions[1];
	_num_rows							= _table_dimensions[2];
	_table_colskip						= _table_dimensions[3];
	_table_rowskip						= _table_dimensions[4];
	_column_labels_row_separation		= _table_dimensions[5];
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	_num_columns_array					= array_from_data(_num_columns);
	_table_elements 					= _num_columns * _num_rows;
	_num_tables 						= _data.length / _table_elements;
	_tables_start_row 					= table_add_title_lines(_table_title_dimensions[0], _table_title_dimensions[1], _table_title_dimensions[2], _table_title_dimensions[3], _table_grid_titles, true);
	_table_titles 						= table_grid_row_array_duplication( _table_titles, _num_tables);
	_table_grid_rows 					= _num_tables / _table_grid_columns;
	_table_num							= 0;
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	for(_table_grid_row = 0; _table_grid_row < _table_grid_rows; _table_grid_row++)
		_tables_start_row 					= table_grid_add_row(_tables_start_row, _start_column, _table_colskip, _table_rowskip, _table_titles, _column_headers, _row_headers, _column_labels_row_separation, _data, _num_columns, _num_rows, _table_grid_columns, _table_grid_row, _data_order);
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	return _tables_start_row;
}							
function table_grid_fill_all_imported(_table_grid_labels, _table_grid_label_indices, _table_grid_columns, _table_title_dimensions, _table_dimensions, _data_filepaths, _print_input_TXT_path, _data_order)
{
	_data 								= filepath_list_2_float_array(_data_filepaths, _print_input_TXT_path);						
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	_table_grid_titles					= extract_from_multi_array(_table_grid_labels, _table_grid_label_indices, 0);
	_table_titles						= extract_from_multi_array(_table_grid_labels, _table_grid_label_indices, 1);
	_column_headers						= extract_from_multi_array(_table_grid_labels, _table_grid_label_indices, 2);
	_row_headers						= extract_from_multi_array(_table_grid_labels, _table_grid_label_indices, 3);
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	_start_column						= _table_dimensions[0];
	_num_columns						= _table_dimensions[1];
	_num_rows							= _table_dimensions[2];
	_table_colskip						= _table_dimensions[3];
	_table_rowskip						= _table_dimensions[4];
	_column_labels_row_separation		= _table_dimensions[5];
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	_num_columns_array					= array_from_data(_num_columns);
	_table_elements 					= _num_columns * _num_rows;
	_num_tables 						= _data.length / _table_elements;
	_tables_start_row 					= table_add_title_lines(_table_title_dimensions[0], _table_title_dimensions[1], _table_title_dimensions[2], _table_title_dimensions[3], _table_grid_titles, true);
	_table_titles 						= table_grid_row_array_duplication( _table_titles, _num_tables);
	_table_grid_rows 					= _num_tables / _table_grid_columns;
	_table_num							= 0;
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	for(_table_grid_row = 0; _table_grid_row < _table_grid_rows; _table_grid_row++)
		_tables_start_row 					= table_grid_add_row(_tables_start_row, _start_column, _table_colskip, _table_rowskip, _table_titles, _column_headers, _row_headers, _column_labels_row_separation, _data, _num_columns, _num_rows, _table_grid_columns, _table_grid_row, _data_order);
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	return _data;
}							
function table_grid_max_row_label_lengths(_table_titles, _row_labels)
{
	_max_row_label_lengths			= newArray();
	for(_table = 0; _table < _table_titles.length; _table++)
	{
		_max_row_label_length			= lengthOf(_table_titles[_table]);
		for(i = 0; i < _row_labels.length; i++)
			if(lengthOf(_row_labels[i]) > _max_row_label_length)
				_max_row_label_length	= lengthOf(_row_labels[i]);
		_max_row_label_lengths			= Array.concat(_max_row_label_lengths, _max_row_label_length);
	}
	return _max_row_label_lengths;
}
function table_grid_row_array_duplication(_array_2_duplicate, _num_tables)
{
	_grid_array			= Array.copy(_array_2_duplicate);
	_num_array_tables	= _array_2_duplicate.length;
	_num_duplications	= _num_tables / _num_array_tables - 1;
	for(i = 0; i < _num_duplications; i++)
		_grid_array		= Array.concat(_grid_array, _array_2_duplicate);
	return 				_grid_array;
}
function table_indexed_colnums(_num_TV_tables, _first_column, _table_offset)
{
	_table_colnums 		= newArray();
	for(_table = 0; _table < _num_TV_tables; _table++)
		_table_colnums 	= Array.concat(_table_colnums, _first_column + _table * _table_offset);
	return 			_table_colnums;
}
function table_init(_num_table_columns, _num_table_rows)
{
	table_add_empty_rows( _num_table_columns, 0, _num_table_rows);
}
function table_max_row_label_length(_table_title, _row_labels)
{
	_max_row_label_length			= lengthOf(_table_title);
	for(i = 0; i < _row_labels.length; i++)
		if(lengthOf(_row_labels[i]) > _max_row_label_length)
			_max_row_label_length	= lengthOf(_row_labels[i]);
	return _max_row_label_length;
}
function table_row_order_index(_num_columns, _num_rows, _column_num, _row_num, _table_num)
{
	_table_elements			= _num_columns * _num_rows;
	_table_start_index		= _table_num * _table_elements;
	_row_start_index		= _row_num * _num_columns;
	_column_index			= _table_start_index + _row_start_index + _column_num;
	return 					_column_index;
}
function table_skip_columns(_current_row, _start_column, _columns_2_skip)
{
	for(i = 0; i < _columns_2_skip; i++)
		setResult	(_start_column + i,  _current_row, EMPTY_STRING);
	return _start_column + _columns_2_skip;
}
function tables_total_columns(_1st_column, _griddims_x, _tabledims_x, _colskip)
{
	return _1st_column + _griddims_x * (_tabledims_x + _colskip + 1) - _colskip - 1;
}
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------- Console window ("Log") printing function definitions -----------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
function print_aligned_key_value_pairs(key, value, aligned_at_column)
{
	key_string_length 		= lengthOf(key);
	value_string_length 	= lengthOf(value);
	padding_spaces			= aligned_at_column - key_string_length;
	padding_string			= EMPTY_STRING;
	for						(i = 0; i < padding_spaces; i++)
		padding_string 		+= "-";
	print					(key + padding_string + PADDED_EQUALS_STRING + value);	
}
function printBoolean(_print_statement, _bool_variable)
{
	_bool_string		= if_else(_bool_variable, BOOL_TRUE_STRING, BOOL_FALSE_STRING);
	print				(_print_statement + PADDED_EQUALS_STRING + _bool_string);
	return 				_bool_string;
}
function print_finished_execution_info()
{	
	if(PRINT_GROUPVARS())
	{
		print_section	("Input/output directories and filenames created during execution", true								);
		print					("Total # of econstruction data sets = " 					+ num_input_directories						);
		print					("Reconstruction data sets used = " 						+ num_input_data_sets						);
		print					("Total # of loops executed = " 							+ num_loops									);
		print					("Total # of multiplot analyses performed = " 				+ num_multiplot_analyses					);
		App						(" MERGED_RSP_ERROR_CSV_FOLDER_LIST:		\n------->"	, 	MERGED_RSP_ERROR_CSV_FOLDER_LIST			); 						
		App						(" MERGED_RSP_ERROR_TXT_FILENAME_LIST:		\n------->", 	MERGED_RSP_ERROR_TXT_FILENAME_LIST			); 						
		App						(" MERGED_STD_DEV_CSV_FOLDER_LIST:			\n------->", 	MERGED_STD_DEV_CSV_FOLDER_LIST				); 						
		App						(" MERGED_STD_DEV_TXT_FILENAME_LIST:		\n------->", 	MERGED_STD_DEV_TXT_FILENAME_LIST			); 						
		App						(" MERGED_RSP_CSV_FOLDER_LIST:				\n------->", 	MERGED_RSP_CSV_FOLDER_LIST					); 						
		App						(" MERGED_RSP_TXT_FILENAME_LIST:			\n------->", 	MERGED_RSP_TXT_FILENAME_LIST				); 						
		App						(" MERGED_TV_CSV_FOLDER_LIST:				\n------->",	MERGED_TV_CSV_FOLDER_LIST					); 						
		App						(" MERGED_TV_TXT_FILENAME_LIST:				\n------->",	MERGED_TV_TXT_FILENAME_LIST					); 						
		App						(" MERGED_PVT_RSP_ERROR_TXT_FILENAME_LIST:	\n------->", 	MERGED_PVT_RSP_ERROR_TXT_FILENAME_LIST		); 						
		App						(" MERGED_PVT_RSP_TXT_FILENAME_LIST:		\n------->", 	MERGED_PVT_RSP_TXT_FILENAME_LIST			); 						
		App						(" MERGED_PVT_STD_DEV_TXT_FILENAME_LIST:	\n------->", 	MERGED_PVT_STD_DEV_TXT_FILENAME_LIST		); 						
		App						(" MERGED_PVT_TV_TXT_FILENAME_LIST:			\n------->", 	MERGED_PVT_TV_TXT_FILENAME_LIST				); 						
		App						(" MERGED_MULTIPLOT_TV_FOLDER_LIST:			\n------->", 	MERGED_MULTIPLOT_TV_FOLDER_LIST				); 						
		App						(" MERGED_MULTIPLOT_TV_CSV_FILENAME_LIST:	\n------->", 	MERGED_MULTIPLOT_TV_CSV_FILENAME_LIST		); 						
		App						(" MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST:	\n------->", 	MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST		); 						
		/*
		print		(" MERGED_RSP_ERROR_CSV_FOLDER_LIST:\n------->"			); 	Array.print(MERGED_RSP_ERROR_CSV_FOLDER_LIST		); 						
		print		(" MERGED_RSP_ERROR_TXT_FILENAME_LIST:\n------->"		); 	Array.print(MERGED_RSP_ERROR_TXT_FILENAME_LIST		); 						
		print		(" MERGED_STD_DEV_CSV_FOLDER_LIST:\n------->"			); 	Array.print(MERGED_STD_DEV_CSV_FOLDER_LIST			); 						
		print		(" MERGED_STD_DEV_TXT_FILENAME_LIST:\n------->"			); 	Array.print(MERGED_STD_DEV_TXT_FILENAME_LIST		); 						
		print		(" MERGED_RSP_CSV_FOLDER_LIST:\n------->"				); 	Array.print(MERGED_RSP_CSV_FOLDER_LIST				); 						
		print		(" MERGED_RSP_TXT_FILENAME_LIST:\n------->"				); 	Array.print(MERGED_RSP_TXT_FILENAME_LIST			); 						
		print		(" MERGED_TV_CSV_FOLDER_LIST:\n------->"				); 	Array.print(MERGED_TV_CSV_FOLDER_LIST				); 						
		print		(" MERGED_TV_TXT_FILENAME_LIST:\n------->"				); 	Array.print(MERGED_TV_TXT_FILENAME_LIST				); 						
		print		(" MERGED_MULTIPLOT_TV_FOLDER_LIST:\n------->"			); 	Array.print(MERGED_MULTIPLOT_TV_FOLDER_LIST			); 						
		print		(" MERGED_MULTIPLOT_TV_CSV_FILENAME_LIST:\n------->"	); 	Array.print(MERGED_MULTIPLOT_TV_CSV_FILENAME_LIST	); 						
		print		(" MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST:\n------->"	); 	Array.print(MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST	); 						
		*/
		//print		(" COPIED_FILE_LIST:\n------->"			); 	Array.print(COPIED_FILE_LIST); 						
		//print		(" COPIED_FILE_FROM_LIST:\n------->"	); 	Array.print(COPIED_FILE_FROM_LIST); 				
		//print		(" COPIED_FILE_TO_LIST:\n------->"		); 	Array.print(COPIED_FILE_TO_LIST); 					
		//print		(" DIRECTORIES_CREATED:\n------->"		); 	Array.print(DIRECTORIES_CREATED); 					
		//print		(" CSV_OUTPUT_FILE_LIST:\n------->"				); 	Array.print(CSV_OUTPUT_FILE_LIST); 		
	}
}
function print_ImageJ_info()
{
	if(PRINT_GROUPVARS())
	{
		print_section("Printing ImageJ info", PRINT_MAJOR_SECTION);
		print("-------> IJ_plugins_directory =\n ", IJ_plugins_directory);
		print("-------> IJ_macro_directory =\n ", IJ_macro_directory);
		print("-------> IJ_launch_directory =\n ", IJ_launch_directory);
		print("-------> IJ_previous_macro =\n ", IJ_previous_macro);
		print("-------> github_macro_directory_Baylor_ICTHUS =\n ", github_macro_directory_Baylor_ICTHUS);
		print("-------> github_macro_directory_pCT_Collaboration =\n ", github_macro_directory_pCT_Collaboration);
		print("-------> reconstruction_data_directory_drive_C =\n ", reconstruction_data_directory_drive_C);
		print("-------> reconstruction_data_directory_drive_D =\n ", reconstruction_data_directory_drive_D);
		print("-------> ROI_analysis_macro_filename =\n ", ROI_analysis_macro_filename);
		print("-------> autobreak_filename =\n ", autobreak_filename);
		print("-------> auto_break_path =\n ", auto_break_path);						
		print("-------> ROI_analysis_macro_path =\n ", ROI_analysis_macro_path);
		print("-------> multiplotting_macro_filename =\n ", multiplotting_macro_filename);
		print("-------> multiplotting_macro_path =\n ", multiplotting_macro_path);
		print("-------> test_result_comparison_macro_filename =\n ", test_result_comparison_macro_filename);
		print("-------> test_result_comparison_macro_path =\n ", test_result_comparison_macro_path);
	}
}
function print_input_output_filenames()
{
	if(PRINT_GROUPVARS())
	{
		print_section("Printing input/output filenames of ROI analysis, parameter value test comparisons, and parameter value test comparison multiplots", PRINT_MAJOR_SECTION);
		print		("\n*ROI analysis input/output filenames----------------------------> "															);	
		print		("-------> ROI_analysis_TV_input_filename 							=\n " 	+ ROI_analysis_TV_input_filename					);									// 
		print		("-------> ROI_analysis_RSP_output_filename 						=\n " 	+ ROI_analysis_RSP_output_filename					);									// 
		print		("-------> ROI_analysis_RSP_Error_output_filename 					=\n " 	+ ROI_analysis_RSP_Error_output_filename			);									// 
		print		("-------> ROI_analysis_Std_Dev_output_filename 					=\n " 	+ ROI_analysis_Std_Dev_output_filename				);									// 
		print		("-------> ROI_analysis_TV_output_filename 							=\n " 	+ ROI_analysis_TV_output_filename					);									// 
		
		print		("\n*Parameter value test input/output filenames--------------------> "															);	
		print		("-------> PVT_RSP_output_filename 									=\n " 	+ PVT_RSP_output_filename							);									// 
		print		("-------> PVT_RSP_Error_output_filename 							=\n " 	+ PVT_RSP_Error_output_filename						);									// 
		print		("-------> PVT_Std_Dev_output_filename 								=\n " 	+ PVT_Std_Dev_output_filename						);									// 
		print		("-------> PVT_TV_output_filename 									=\n " 	+ PVT_TV_output_filename							);									// 
		
		print		("\n*Multiplot input/output filenames-------------------------------> "															);	
		print		("-------> multiplot_RSP_output_basename 							=\n " 	+ multiplot_RSP_output_basename						);									// 
		print		("-------> multiplot_RSP_Error_output_basename 						=\n " 	+ multiplot_RSP_Error_output_basename				);									// 
		print		("-------> multiplot_Std_Dev_output_basename 						=\n " 	+ multiplot_Std_Dev_output_basename					);									// 
		print		("-------> multiplot_TV_output_basename 							=\n " 	+ multiplot_TV_output_basename						);									// 						
	}
}
function print_merged_output_file_info()
{
	if(PRINT_GROUPVARS())
	{
		print_section("CSV data merging output folders/filenames:", false				);
		print("merged_CSV_folder = 					\n" 	+ merged_CSV_folder					);
		print("merged_RSP_CSV_folder = 				\n" 	+ merged_RSP_CSV_folder				);
		print("merged_RSP_Error_CSV_folder = 		\n" 	+ merged_RSP_Error_CSV_folder		);
		print("merged_Std_Dev_CSV_folder = 			\n" 	+ merged_Std_Dev_CSV_folder			);
		print("merged_TV_CSV_folder = 				\n"	 	+ merged_TV_CSV_folder				);
		print("merged_TV_CSV_filename = 			\n" 	+ merged_TV_CSV_filename			);
		print("merged_PVT_CSV_folder = 				\n" 	+ merged_PVT_CSV_folder				);
		print("merged_PVT_RSP_CSV_folder = 			\n" 	+ merged_PVT_RSP_CSV_folder			);
		print("merged_PVT_RSP_Error_CSV_folder =	\n" 	+ merged_PVT_RSP_Error_CSV_folder	);
		print("merged_PVT_Std_Dev_CSV_folder = 		\n" 	+ merged_PVT_Std_Dev_CSV_folder		);
		print("merged_PVT_TV_CSV_folder = 			\n" 	+ merged_PVT_TV_CSV_folder			);
		print("merged_RSP_CSV_filename = 			\n" 	+ merged_RSP_CSV_filename			);
		print("merged_RSP_TXT_filename = 			\n" 	+ merged_RSP_TXT_filename			);
		print("merged_RSP_Error_CSV_filename = 		\n" 	+ merged_RSP_Error_CSV_filename		);
		print("merged_RSP_Error_TXT_filename = 		\n" 	+ merged_RSP_Error_TXT_filename		);
		print("merged_Std_Dev_CSV_filename = 		\n" 	+ merged_Std_Dev_CSV_filename		);
		print("merged_Std_Dev_TXT_filename = 		\n" 	+ merged_Std_Dev_TXT_filename		);
		print("merged_TV_CSV_filename = 			\n" 	+ merged_TV_CSV_filename			);
		print("merged_TV_TXT_filename = 			\n" 	+ merged_TV_TXT_filename			);
		print("merged_PVT_RSP_CSV_filename = 		\n" 	+ merged_PVT_RSP_CSV_filename		);
		print("merged_PVT_RSP_TXT_filename = 		\n" 	+ merged_PVT_RSP_TXT_filename		);
		print("merged_PVT_RSP_Error_CSV_filename = 	\n" 	+ merged_PVT_RSP_Error_CSV_filename	);
		print("merged_PVT_RSP_Error_TXT_filename = 	\n" 	+ merged_PVT_RSP_Error_TXT_filename	);
		print("merged_PVT_Std_Dev_CSV_filename = 	\n" 	+ merged_PVT_Std_Dev_CSV_filename	);
		print("merged_PVT_Std_Dev_TXT_filename = 	\n" 	+ merged_PVT_Std_Dev_TXT_filename	);
		print("merged_PVT_TV_CSV_filename = 		\n" 	+ merged_PVT_TV_CSV_filename		);
		print("merged_PVT_TV_TXT_filename = 		\n" 	+ merged_PVT_TV_TXT_filename		);
		//print("merged_PVT_RSP_CSV_path = 			\n" 	+ merged_PVT_RSP_CSV_path			);						
	}
}
function print_merge_multiplot_output_file_info()
{
	if(PRINT_GROUPVARS())
	{
		print_section("Multiplot data merging output folders/filenames:", false										);
		print("merge_multiplot_CSV_folder = 						\n" 	+ merge_multiplot_CSV_folder						);
		print("merge_multiplot_RSP_CSV_folder = 					\n" 	+ merge_multiplot_RSP_CSV_folder					);
		print("merge_multiplot_RSP_Error_CSV_folder = 				\n" 	+ merge_multiplot_RSP_Error_CSV_folder				);
		print("merge_multiplot_Std_Dev_CSV_folder = 				\n" 	+ merge_multiplot_Std_Dev_CSV_folder				);
		print("merge_multiplot_TV_CSV_folder = 						\n"	 	+ merge_multiplot_TV_CSV_folder						);
		print("merge_multiplot_TV_CSV_filename = 					\n" 	+ merge_multiplot_TV_CSV_filename					);
		print("merge_multiplot_PVT_CSV_folder = 					\n" 	+ merge_multiplot_PVT_CSV_folder					);
		print("merge_multiplot_PVT_RSP_CSV_folder = 				\n" 	+ merge_multiplot_PVT_RSP_CSV_folder				);
		print("merge_multiplot_PVT_RSP_Error_CSV_folder =			\n" 	+ merge_multiplot_PVT_RSP_Error_CSV_folder			);
		print("merge_multiplot_PVT_Std_Dev_CSV_folder = 			\n" 	+ merge_multiplot_PVT_Std_Dev_CSV_folder			);
		print("merge_multiplot_PVT_TV_CSV_folder = 					\n" 	+ merge_multiplot_PVT_TV_CSV_folder					);
		print("merge_multiplot_RSP_CSV_short_filename = 			\n" 	+ merge_multiplot_RSP_CSV_short_filename			);
		print("merge_multiplot_RSP_TXT_short_filename = 			\n" 	+ merge_multiplot_RSP_TXT_short_filename			);
		print("merge_multiplot_RSP_Error_CSV_short_filename = 		\n" 	+ merge_multiplot_RSP_Error_CSV_short_filename		);
		print("merge_multiplot_RSP_Error_TXT_short_filename = 		\n" 	+ merge_multiplot_RSP_Error_TXT_short_filename		);
		print("merge_multiplot_Std_Dev_CSV_short_filename = 		\n" 	+ merge_multiplot_Std_Dev_CSV_short_filename		);
		print("merge_multiplot_Std_Dev_TXT_short_filename = 		\n" 	+ merge_multiplot_Std_Dev_TXT_short_filename		);
		print("merge_multiplot_TV_CSV_short_filename = 				\n" 	+ merge_multiplot_TV_CSV_short_filename				);
		print("merge_multiplot_TV_TXT_short_filename = 				\n" 	+ merge_multiplot_TV_TXT_short_filename				);
	//	print("merge_multiplot_PVT_RSP_CSV_short_filename = 		\n" 	+ merge_multiplot_PVT_RSP_CSV_short_filename		);
	//	print("merge_multiplot_PVT_RSP_TXT_short_filename = 		\n" 	+ merge_multiplot_PVT_RSP_TXT_short_filename		);
	//	print("merge_multiplot_PVT_RSP_Error_CSV_short_filename = 	\n" 	+ merge_multiplot_PVT_RSP_Error_CSV_short_filename	);
	//	print("merge_multiplot_PVT_RSP_Error_TXT_short_filename = 	\n" 	+ merge_multiplot_PVT_RSP_Error_TXT_short_filename	);
	//	print("merge_multiplot_PVT_Std_Dev_CSV_short_filename = 	\n" 	+ merge_multiplot_PVT_Std_Dev_CSV_short_filename	);
	//	print("merge_multiplot_PVT_Std_Dev_TXT_short_filename = 	\n" 	+ merge_multiplot_PVT_Std_Dev_TXT_short_filename	);
	//	print("merge_multiplot_PVT_TV_CSV_short_filename = 			\n" 	+ merge_multiplot_PVT_TV_CSV_short_filename			);
	//	print("merge_multiplot_PVT_TV_TXT_short_filename = 			\n" 	+ merge_multiplot_PVT_TV_TXT_short_filename			);
	//print("merged_PVT_RSP_CSV_path = 						\n" 	+ merged_PVT_RSP_CSV_path						);						
	}
}
function print_multiplot_parameter_info()
{			
	if(PRINT_GROUPVARS())
	{
		print_section("Printing parameter test multiplot info", PRINT_MAJOR_SECTION								);
		print		("-------> multiplot_parameter_index 					=\n " 	+ multiplot_parameter_index				);
		print		("-------> multiplot_parameter	 						=\n " 	+ multiplot_parameter					);
		print		("-------> multiplot_parameter_prefix 					=\n " 	+ multiplot_parameter_prefix			);
		print		("-------> multiplot_parameter_values 					: 	" 											);	Array.print	(multiplot_parameter_values);
		print		("-------> multiplot_parameter_value_strings 			: 	" 											);	Array.print	(multiplot_parameter_value_strings);
		print		("-------> multiplot_parameter_value_short_strings 		: 	" 											);	Array.print	(multiplot_parameter_value_short_strings);
		print		("-------> multiplot_parameter_values_min_precisions 	: 	" 											);	Array.print	(multiplot_parameter_values_min_precisions);
		print		("-------> multiplot_parameter_equals_strings 			: 	" 											);	Array.print	(multiplot_parameter_equals_strings);	
		print		("-------> multiplot_parameter_equals_short_strings 	: 	" 											);	Array.print	(multiplot_parameter_equals_short_strings);	
		print		("-------> multiplot_parameter_range_suffix	 			=\n " 	+ multiplot_parameter_range_suffix		);
		print		("-------> multiplot_parameter_range_filenaming	 		=\n " 	+ multiplot_parameter_range_filenaming	);
		print		("-------> multiplot_parameter_range_plots	 			=\n " 	+ multiplot_parameter_range_plots		);
		print		("-------> num_multiplot_parameter_values 				=\n " 	+ num_multiplot_parameter_values		);
		print		("-------> reduced_parameter_values_lower 				: 	" 											);	Array.print	(reduced_parameter_values_lower);
		print		("-------> reduced_parameter_values_upper 				: 	" 											);	Array.print	(reduced_parameter_values_upper);
		print		("-------> reduced_parameter_values 					: 	" 											);	Array.print	(reduced_parameter_values);
		print		("-------> reduced_parameter_value_offsets 				: 	"											);	Array.print	(reduced_parameter_value_offsets);
		print		("-------> reduced_modulo_values     					: 	"											);	Array.print	(reduced_modulo_values);
		print		("-------> reduced_TTP_index 							=\n " 	+ reduced_TTP_index	);	
		print		("-------> reduced_total_combinations 					=\n " 	+ reduced_total_combinations			);
	//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	//exit();
	}	
}
function print_all_X_strings_and_combinations()
{
	if(PRINT_GROUPVARS())
	{
		print_section("Printing current parameter value test info", 		PRINT_MAJOR_SECTION							);
		App("-------> all_parameter_combination_indices						", 		all_parameter_combination_indices			);
		App("-------> all_parameter_combinations 		 					", 		all_parameter_combinations					);
		App("-------> all_folder_strings			 						", 		all_folder_strings							);
		App("-------> all_path_strings  									", 		all_path_strings							);
		App("-------> all_reduced_parameter_combination_indices  			",		all_reduced_parameter_combination_indices	);
		App("-------> all_reduced_parameter_combinations  					",		all_reduced_parameter_combinations			);
		App("-------> all_reduced_folder_strings  							",		all_reduced_folder_strings					);
		App("-------> all_reduced_path_strings  							",		all_reduced_path_strings					);
	}
}
function print_PVT_data_info()
{
	if(PRINT_GROUPVARS())
	{
		print_section("Printing current parameter value test info", PRINT_MAJOR_SECTION											);
		print("-------> current_test_1st_parameter_combination 					= 	" 														);	Array.print(current_test_1st_parameter_combination);		
		print("-------> current_test_start_folder 								=\n " 	+ current_test_start_folder							);				
		//print("-------> current_test_end_folder 						 		=\n " 	+ current_test_end_folder							);				
		print("-------> current_test_folder_basename							=\n " 	+ current_test_folder_basename						);
		print("-------> current_test_folders									: 	" 														);	Array.print(current_test_folders);			
		print("-------> current_test_parameter_value_strings 		 			: 	" 														);	Array.print(current_test_parameter_value_strings);		
		print("-------> current_test_parameter_value_short_strings 		 		: 	" 														);	Array.print(current_test_parameter_value_short_strings);		
		print("-------> current_test_parameter_values_string			 		=\n " 	+ current_test_parameter_values_string				);				
		print("-------> current_test_plot_title_parameter_values_string  		=\n " 	+ current_test_plot_title_parameter_values_string	);						
		print("-------> current_test_plot_title_other_parameter_values_string  	=\n " 	+ current_test_plot_title_other_parameter_values_string	);						
		print("-------> current_test_parameter_equals_strings  					: 	"														);	Array.print(current_test_parameter_equals_strings);					
		print("-------> current_test_parameter_equals_short_strings  			: 	"														);	Array.print(current_test_parameter_equals_short_strings);									
		print("-------> current_test_file_suffix  								=\n " 	+ current_test_file_suffix							);										
	}			
}
function print_PVT_multiplot_data_info()
{
	if(PRINT_GROUPVARS())
	{
		print_section("Printing current parameter value test multiplot info...", PRINT_MAJOR_SECTION												);
		print("-------> current_test_multiplot_start_folder 			 			=\n " 	+ current_test_multiplot_start_folder							);	
		print("-------> current_test_multiplot_end_folder 			 				=\n " 	+ current_test_multiplot_end_folder								);				
		print("-------> current_test_multiplot_folder_basename 			 			=\n " 	+ current_test_multiplot_folder_basename								);				
		print("-------> current_test_multiplot_folders					 			= 	" 																	);	Array.print(current_test_multiplot_folders);
		print("-------> current_test_multiplot_value_strings 		 				= 	" 																	);	Array.print(current_test_multiplot_value_strings);	
		print("-------> current_test_multiplot_value_short_strings 		 			= 	" 																	);	Array.print(current_test_multiplot_value_short_strings);	
		
		print("-------> current_test_multiplot_title_parameter_values_string		=\n " 	+ current_test_multiplot_title_parameter_values_string			);		
		print("-------> current_test_multiplot_title_other_parameter_values_string	=\n " 	+ current_test_multiplot_title_other_parameter_values_string	);								
		print("-------> current_test_multiplot_parameter_values_string  			=\n " 	+ current_test_multiplot_parameter_values_string				);						
		print("-------> current_test_multiplot_parameter_equals_strings 			: 	" 																	);	Array.print(current_test_multiplot_parameter_equals_strings);	
		//print("-------> current_test_multiplot_parameter_equals_short_strings 		: 	" 																);	Array.print(current_test_multiplot_parameter_equals_short_strings);	
		print("-------> current_test_multiplot_file_suffix  						=\n " 	+ current_test_multiplot_file_suffix							);												
	}	
}
function print_reconstructed_image_info()
{	
	if(PRINT_GROUPVARS())
	{
		print_section("Printing reconstructed image(s) properties", PRINT_MAJOR_SECTION									);
		print		("\nReconstructed image(s) properties-------------------> "														);	
		print		("-------> voxel_dimensions								: "														);	Array.print	(voxel_dimensions);	
		print		("-------> voxel_width 									=\n " 	+ voxel_width									);									// 
		print		("-------> voxel_height									=\n " 	+ voxel_height									);
		print		("-------> voxel_thickness								=\n " 	+ voxel_thickness								);
		//print		("-------> voxel_dimensions								=\n " 	+ voxel_dimensions								);
		print		("-------> voxels_per_mm								=\n " 	+ voxels_per_mm									);
		print		("-------> num_recon_iterations							=\n " 	+ num_recon_iterations							);
		print		("-------> images_per_reconstruction					=\n " 	+ images_per_reconstruction						);
		print		("-------> reconstructed_image_strings					: "														);	Array.print	(reconstructed_image_strings);
		print		("-------> reconstructed_image_folders					: "														);	Array.print	(reconstructed_image_folders);				
	}
}
function print_ROI_analysis_info()
{	
	if(PRINT_GROUPVARS())
	{
		print_section("Printing reconstructed image(s)/ROI analysis configurations/parameters", PRINT_MAJOR_SECTION		);
		print		("\nImage analysis configuration/parameters-------------> "														);	
		print		("-------> first_iteration_2_analyze					=\n " 	+ first_iteration_2_analyze						);
		print		("-------> last_iteration_2_analyze						=\n " 	+ last_iteration_2_analyze						);
		print		("-------> num_iterations_2_analyze						=\n " 	+ num_iterations_2_analyze						);
		print		("-------> iterations_2_analyze							: "														);	Array.print	(iterations_2_analyze);	
		print		("-------> iterations_2_analyze_string_precision		=\n " 	+ iterations_2_analyze_string_precision			);
		print		("-------> iterations_2_analyze_strings					: "														);	Array.print	(iterations_2_analyze_strings);
		print		("-------> iterations_2_analyze_folders					: "														);	Array.print	(iterations_2_analyze_folders);
		print		("-------> first_slice_2_analyze						=\n " 	+ first_iteration_2_analyze						);
		print		("-------> last_slice_2_analyze							=\n " 	+ last_iteration_2_analyze						);
		print		("-------> num_slices_2_analyze							=\n " 	+ num_slices_2_analyze							);
		print		("-------> slices_2_analyze								: "														);	Array.print	(slices_2_analyze);
		print		("-------> slices_2_analyze_string_precision			=\n " 	+ slices_2_analyze_string_precision				);
		print		("-------> slices_2_analyze_strings						: "														);	Array.print	(slices_2_analyze_strings);
		print		("-------> slices_2_analyze_folders						: "														);	Array.print	(slices_2_analyze_folders);
		print		("-------> num_ROIs_2_analyze							=\n " 	+ num_ROIs_2_analyze							);
		print		("-------> num_ROI_selection_diameters					=\n " 	+ num_ROI_selection_diameters					);
		print		("-------> ROI_selection_diameters						: "														);	Array.print	(ROI_selection_diameters);
		print		("-------> ROI_selection_diameter_string_precision		=\n " 	+ ROI_selection_diameter_string_precision		);
		print		("-------> ROI_selection_diameter_strings				: "														);	Array.print	(ROI_selection_diameter_strings);
		print		("-------> ROI_selection_diameter_folders				: "														);	Array.print	(ROI_selection_diameter_folders);					
	}
}
function print_ROI_definitions()
{
	if(PRINT_GROUPVARS())
	{
		print_section("Printing ROI definitions and info", PRINT_MAJOR_SECTION				);
		print	("-------> phantom_basename					= " 	+ phantom_basename					);
		print	("-------> ROI_definitions_filename			= " 	+ ROI_definitions_filename			);
		print	("-------> ROI_definitions_file_path		= " 	+ ROI_definitions_file_path			);
		print	("-------> num_ROIs_2_analyze 				= " 	+ num_ROIs_2_analyze				);
		print	("-------> ROI_material_names 				= "											); 	Array.print(ROI_material_names);	
		print	("-------> ROI_material_RSPs 				= "											); 	Array.print(ROI_material_RSPs);	
		print	("-------> ROI_labels 						= "											); 	Array.print(ROI_labels);	
		print	("-------> ROI_label_nicknames 				= "											); 	Array.print(ROI_label_nicknames);	
		print	("-------> ROI_shapes 						= "											); 	Array.print(ROI_shapes);	
		print	("-------> ROI_diameters 					= "											); 	Array.print(ROI_diameters);	
		print	("-------> ROI_selection_radii 				= "											); 	Array.print(ROI_selection_radii);	
		print	("-------> ROI_profile_radius_beyond_ROI	= " 	+ ROI_profile_radius_beyond_ROI		);
		print	("-------> bulk_material 					= " 	+ bulk_material						);
		print	("-------> bulk_material_RSP 				= " 	+ bulk_material_RSP					);				
	}
}		
function print_section(section_heading, print_major_section)
{
	slash_section_separator 			= "///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////";
	asterisk_section_separator 			= "//*************************************************************************************************************************************************************************************************************************************************************************************************";
	dash_section_separator 				= "//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------";
	length_slash_section_separator 		= lengthOf(slash_section_separator);
	length_asterisk_section_separator 	= lengthOf(asterisk_section_separator);
	length_dash_section_separator 		= lengthOf(dash_section_separator);
	length_section_heading 				= lengthOf(section_heading);
	asterisk_text_ratio 				= 332/272;
	asterisk_length_diff 				= length_asterisk_section_separator - length_section_heading*asterisk_text_ratio;
	dash_length_diff 					= length_asterisk_section_separator - length_section_heading*asterisk_text_ratio;
	length_asterisk_heading_prefix 		= floor(asterisk_length_diff / 2);
	length_asterisk_heading_suffix 		= ceil(asterisk_length_diff / 2);
	length_dash_heading_prefix 			= floor(dash_length_diff / 2);
	length_dash_heading_suffix 			= ceil(dash_length_diff / 2);
	dash_heading_suffix 				= " ";
	dash_heading_prefix 				= "//";
	asterisk_heading_suffix 			= " ";
	asterisk_heading_prefix 			= "//";
	for(i = 0; i < length_asterisk_heading_prefix - 3; i++)
		asterisk_heading_prefix 		+= "*";
	for(i = 0; i < length_asterisk_heading_suffix - 3; i++)
		asterisk_heading_suffix 		+= "*";
	for(i = 0; i < length_dash_heading_prefix - 3; i++)
		dash_heading_prefix 			+= "-";
	for(i = 0; i < length_dash_heading_suffix - 3; i++)
		dash_heading_suffix 			+= "-";
	asterisk_heading_prefix	 			+= " ";
	asterisk_heading_suffix 			+= EMPTY_STRING;
	asterisk_heading_separator 			= asterisk_heading_prefix + section_heading + asterisk_heading_suffix;
	dash_heading_prefix 				+= " ";
	dash_heading_suffix 				+= EMPTY_STRING;
	dash_heading_separator 				= dash_heading_prefix + section_heading + dash_heading_suffix;
	length_asterisk_heading_prefix 		= lengthOf(asterisk_heading_prefix);
	length_asterisk_heading_suffix 		= lengthOf(asterisk_heading_suffix);
	length_asterisk_heading_separator 	= lengthOf(asterisk_heading_separator);
	length_dash_heading_prefix 			= lengthOf(dash_heading_prefix);
	length_dash_heading_suffix 			= lengthOf(dash_heading_suffix);
	length_dash_heading_separator 		= lengthOf(dash_heading_separator);
	
	asterisk_heading_addition 			= 150;
	dash_text_ratio 					= 1;
	dash_heading_addition				= asterisk_heading_addition * dash_text_ratio;//length_dash_heading_separator/length_asterisk_heading_separator;
	slash_section_separator_addition	= asterisk_heading_addition * asterisk_text_ratio;//length_slash_section_separator/length_asterisk_heading_separator;
	
	for(i = 0; i < asterisk_heading_addition; i++)
	{
		asterisk_heading_separator += "*";
		asterisk_section_separator += "*";
	}
	for(i = 0; i < dash_heading_addition; i++)
	{
		dash_section_separator += "-";
		dash_heading_separator += "-";
	}
	for(i = 0; i < slash_section_separator_addition; i++)
		slash_section_separator += "/";
	
	//asterisk_heading_separator += "//";
	slash_section_separator += "//";
	asterisk_section_separator += "//";
	dash_section_separator += "//";
	asterisk_heading_separator += "//";
	dash_heading_separator += "//";
	if(print_major_section)
	{
		print							(slash_section_separator);
		print							(asterisk_section_separator);
		print							(asterisk_heading_separator);
		print							(asterisk_section_separator);
		print							(slash_section_separator);
	}
	else
	{
		print							(dash_section_separator);
		print							(dash_heading_separator);
		print							(dash_section_separator);			
	}
	//slash_section_separator 			= "///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////";
	//alphabet_equal_print_length 		= "abcdefghhijklmnopqrstuvwxyzqwertyuiopasdfghjklzxcvbnmabcdefghhijklmnopqrstuvwxyzqwertyuiopasdfghjklzxcvbnmabcdefghhijklmnopqrstuvwxyzqwertyuiopasdfghjklzxcvbnmabcdefghhijklmnopqrstuvwxyzqwertyuiopasdfghjklzxcvbnmabcdefghhijklmnopqrstuvwxyzqwertyuiopasdfghjklzxcvbnm";
	//slash_equal_print_length 			= "///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////";
	//asterisk_equal_print_length 		= "//**************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************";
	//dash_equal_print_length 			= "//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------";
	//slash_section_separator				= slash_equal_print_length;
	//asterisk_section_separator				= asterisk_equal_print_length;
	//dash_section_separator				= dash_equal_print_length;
	//print(slash_equal_print_length);
	//print(asterisk_equal_print_length);
	//print(dash_equal_print_length);
	//print(alphabet_equal_print_length);	
	//length_slash_equal_print_length 		= lengthOf(slash_equal_print_length);
	//length_asterisk_equal_print_length 	= lengthOf(asterisk_equal_print_length);
	//length_dash_equal_print_length 		= lengthOf(dash_equal_print_length);
	//length_alphabet_equal_print_length	= lengthOf(alphabet_equal_print_length);
	/////printvar("length_slash_section_separator", length_slash_section_separator);
	////printvar("length_asterisk_section_separator", length_asterisk_section_separator);
	////printvar("length_dash_section_separator", length_dash_section_separator);
	//printvar("length_slash_equal_print_length", length_slash_equal_print_length);
	///printvar("length_asterisk_equal_print_length", length_asterisk_equal_print_length);
	//printvar("length_dash_equal_print_length", length_dash_equal_print_length);
	//printvar("length_alphabet_equal_print_length", length_alphabet_equal_print_length);
	//slash_text_ratio 				= length_slash_equal_print_length/length_alphabet_equal_print_length;
	//asterisk_text_ratio 				= length_asterisk_equal_print_length/length_alphabet_equal_print_length;
	//dash_text_ratio 				= (length_dash_equal_print_length-2)/(length_alphabet_equal_print_length-2);
	//slash_text_ratio 				= length_slash_equal_print_length/length_alphabet_equal_print_length;
//.	asterisk_text_ratio 				= 332/272;
//	dash_text_ratio 				= 332/272;
//	asterisk_length_diff 				= length_asterisk_section_separator - length_section_heading * asterisk_text_ratio;//332/272;
//	dash_length_diff 					= length_asterisk_section_separator - length_section_heading * dash_text_ratio;
	//	printvar("slash_text_ratio", slash_text_ratio);
	//printvar("asterisk_text_ratio", asterisk_text_ratio);
	//printvar("dash_text_ratio", dash_text_ratio);
	//printvar("old", 332/272);
	//slash_equal_print_length 			= "///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////";
	//asterisk_equal_print_length 		= "//**************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************";
	//dash_equal_print_length 			= "//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------";
	//asterisks_2_add						= (length_section_heading + 2) * asterisk_text_ratio;
	//slashes_2_add						= (length_section_heading + 2) * slash_text_ratio;
	//dashes_2_add						= (length_section_heading + 2) * dash_text_ratio;//333/271;//332/272;//
	//top_bottom_strings					= dash_equal_print_length;
	//for(i = 0; i < dashes_2_add; i++)
	//	top_bottom_strings				+= "-";
	//length_asterisk_heading_prefix 		= floor(length_asterisk_equal_print_length / 2);
	//header_string_prefix				= substring(dash_equal_print_length, 0, length_asterisk_heading_prefix);
	//header_string_suffix				= substring(dash_equal_print_length, length_asterisk_heading_prefix + 1);
	//header_string						= header_string_prefix + SPACE_STRING  + section_heading + SPACE_STRING  + header_string_suffix;
	//print(header_string_prefix);
	//print(header_string_suffix);
	
	//print(top_bottom_strings);
	//print(header_string);
	//print(top_bottom_strings);
}
function print_test_parameter_file_info()
{
	if(PRINT_GROUPVARS())
	{
		print_section("Printing parameter value test info...", PRINT_MAJOR_SECTION								);
		print		("-------> parameter_test_number							=\n" 	+ parameter_test_number				);
		print		("-------> parameter_test_info_filename						=\n" 	+ parameter_test_info_filename		);
		print		("-------> num_parameters									=\n"	+ num_parameters					);
		print		("-------> parameter_values									: "											);	Array.print	(parameter_values);
		print		("-------> parameter_value_strings							: "											);	Array.print	(parameter_value_strings);
		print		("-------> parameter_value_short_strings					: "											);	Array.print	(parameter_value_short_strings);
		print		("-------> num_parameter_values								: "											);	Array.print	(num_parameter_values);
		print		("-------> parameter_value_offsets 							: "											);	Array.print	(parameter_value_offsets);
		print		("-------> parameter_string_prefixes						: "											);	Array.print	(parameter_string_prefixes);
		print		("-------> parameter_string_short_prefixes					: "											);	Array.print	(parameter_string_short_prefixes);
		print		("-------> parameter_string_precisions						: "											);	Array.print	(parameter_string_precisions);
		print		("-------> parameter_string_min_precisions					: "											);	Array.print	(parameter_string_min_precisions);
		print		("-------> parameter_string_max_precisions					: "											);	Array.print	(parameter_string_max_precisions);
		print		("-------> modulo_values 									: "											);	Array.print	(modulo_values);
		print		("-------> total_combinations 								: " 	+ total_combinations				);
		print		("-------> all_parameter_indices 							: "											);	Array.print	(all_parameter_indices);
	}
}
function print_TTP_info()
{	
	if(PRINT_GROUPVARS())
	{
		print_section("Printing parameter value test info...", PRINT_MAJOR_SECTION							);
		print		("-------> target_test_parameter							=\n" 	+ target_test_parameter			);	
		print		("-------> TTP_index										=\n" 	+ TTP_index						);	
		print		("-------> TTP_prefix										=\n" 	+ TTP_prefix					);	
		print		("-------> TTP_values 										: "										);	Array.print(TTP_values);	
		print		("-------> TTP_value_strings 								: "										);	Array.print(TTP_value_strings);
		print		("-------> TTP_value_short_strings 							: "										);	Array.print(TTP_value_short_strings);
		print		("-------> TTP_equals_strings 								: "										);	Array.print(TTP_equals_strings);	
		print		("-------> TTP_equals_short_strings 						: "										);	Array.print(TTP_equals_short_strings);	
		print		("-------> TTP_range_suffix									=\n" 	+ TTP_range_suffix				);		
		print		("-------> TTP_range_filenaming								=\n" 	+ TTP_range_filenaming			);		
		print		("-------> TTP_range_plots									=\n" 	+ TTP_range_plots				);		
		print		("-------> num_TTP_values 									=\n"	+ num_TTP_values				);
		print		("-------> num_TTP_tests									=\n"	+ num_TTP_tests					);
	}
}
function print_PVT_parent_info()
{	
	if(PRINT_GROUPVARS())
	{
		print_section("Printing parameter value test info...", 			PRINT_MAJOR_SECTION								);
		App			("-------> all_parameter_indices						",		all_parameter_indices							);
		App			("-------> test_parameter_indices						",		test_parameter_indices							);
		App			("-------> no_TTP_parameter_indices						",		no_TTP_parameter_indices						);
		App			("-------> no_multiplot_parameter_indices				",		no_multiplot_parameter_indices					);
		App			("-------> no_multiplot_TTP_parameter_indices			", 		no_multiplot_TTP_parameter_indices				);
		print		("-------> PVT_identifier								=\n" 	+ PVT_identifier								);
		print		("-------> PVTs_input_directory_parent					=\n" 	+ PVTs_input_directory_parent					);
		print		("-------> PVT_output_data_directory_parent				=\n" 	+ PVT_output_data_directory_parent				);
		print		("-------> directory_created_successfully				=\n" 	+ directory_created_successfully				);
		print		("-------> PVT_output_data_parent_directory				=\n" 	+ PVT_output_data_parent_directory				);
		print		("-------> PVT_output_multiplot_data_parent_directory	=\n" 	+ PVT_output_multiplot_data_parent_directory	);
		print		("-------> PVT_output_data_parent_folder				=\n" 	+ PVT_output_data_parent_folder					);		
		print		("-------> directory_created_successfully2				=\n" 	+ directory_created_successfully2				);		
	}
}
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//------------------------------------------------------------------------ Plot settings/configuration function definitions -------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
function set_plot_data_props(_data_line_color, _axis_label_text_size, _x_frame_size, _y_frame_size)
{	
	Plot.setColor			(_data_line_color);				
	Plot.setAxisLabelSize	(_axis_label_text_size);
	Plot.setFormatFlags		("11111111111111");	
	Plot.setFrameSize		(_x_frame_size, _y_frame_size);
	Plot.setLimitsToFit		();									
	Plot.show				();										
}
function set_plot_extrema(_plot_data, _additional_data, _tolerance, _lower_limits_scale, _upper_limits_scale, _difference_scale)
{
	_plot_extrema 				= newArray(2);
	_extrema 					= find_array_extrema(_plot_data, _tolerance, true);
	//_lower_limits_scale = 1.0;
	//_upper_limits_scale = 1.0;
	if(_additional_data.length != 0)
	{
		_additional_data_extrema	= find_array_extrema(_additional_data, _tolerance, false);
		_plot_extrema[0] 		= minOf(_extrema[0], _additional_data_extrema[0]);
		_plot_extrema[1] 		= maxOf(_extrema[1], _additional_data_extrema[1]) ;
		//plot_extrema[0] 		= minOf(extrema[0], additional_data_extrema[0]) * lower_limits_scale;
		//plot_extrema[1] 		= maxOf(extrema[1], additional_data_extrema[1]) * upper_limits_scale;
	}
	else
	{
		_plot_extrema[0] 		= _extrema[0];
		_plot_extrema[1] 		= _extrema[1];
		//plot_extrema[0] 		= extrema[0] * lower_limits_scale;
		//plot_extrema[1] 		= extrema[1] * upper_limits_scale;
	}
	_diff_adjustment 			= (_plot_extrema[1] - _plot_extrema[0]) * _difference_scale;
	_plot_extrema[0] 			*= _lower_limits_scale;
	_plot_extrema[1] 			*= _upper_limits_scale;
	//_plot_extrema[0] 			-= _diff_adjustment;
	//_plot_extrema[1] 			+= _diff_adjustment;
	
	if(_plot_extrema[0] < 0)
		_plot_extrema[0] 		*= _upper_limits_scale / _lower_limits_scale;
	if(_plot_extrema[1] < 0)
		_plot_extrema[1] 		*= _lower_limits_scale / _upper_limits_scale;
	return _plot_extrema;
}
function set_plot_props(_legend_entries, _legend_text_size, _x_frame_size, _y_frame_size, _text, _text_size, _text_xpos_ratio, _text_ypos_ratio, _add_text_justification, _add_line_color, _linewidth)
{
	//run					("Profile Plot Options...", "width=1000 height=1000 font=20 minimum=0 maximum=0 draw draw_ticks interpolate sub-pixel");
	_legend_text 			= _legend_entries[0];
	for(i = 1; i < _legend_entries.length; i++)
		_legend_text 		+= NEWLINE_CMD_STRING + _legend_entries[i];
	Plot.setFontSize		(_legend_text_size);
	Plot.addLegend			(_legend_text, "Bottom-Right");						
	Plot.setLineWidth		(_linewidth);
	setForegroundColor		(255, 255, 255);
	//run					("Colors...", "foreground=white background=white selection=yellow");	
	//run					("Canvas Size...", "width=900 height=500 position=Center");	
	Plot.setJustification	(_add_text_justification);	
	Plot.setFontSize		(_text_size);
	Plot.setFormatFlags		("11111111111111");	
	Plot.addText			(_text, _text_xpos_ratio, _text_ypos_ratio);							
	Plot.setColor			(_add_line_color);		
	//run						("Size...", "width=" + _x_frame_size + " height=" + _y_frame_size + " constrain average interpolation=Bilinear");															
}
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//----------------------------------------------------------------------- ROI/phantom properties/lookup function definitions ------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
function ROI_material_name_2_RSP(material_name, is_simulated_scan)
{
	material_names				= newArray("air", 	"PMP", 	"LDPE", 	"epoxy", "polystyrene", "PMMA", "acrylic", "delrin", "teflon"	);
	simulated_material_RSPs		= newArray(0.0013, 	0.877, 	0.9973, 	1.024,   1.0386,		1.144,  1.155,     1.356,     1.828		);
	experimental_material_RSPs	= newArray(0.0013, 	0.883, 	0.979,  	1.024,   1.024,			1.144,  1.160,     1.359,     1.79		); 	
	num_materials 				= material_names.length;
	if(is_simulated_scan)
		material_RSPs 			= simulated_material_RSPs;
	else
		material_RSPs 			= experimental_material_RSPs;
	for(j = 0; j < num_materials; j++)
		if( matches(material_name, material_names[j]) )
			return material_RSPs[j];
}
function ROI_material_names_2_RSPs(_ROI_material_names, _is_simulated_scan)
{
	_num_ROIs_2_analyze 		= _ROI_material_names.length;
	_ROI_material_RSPs 			= newArray(_num_ROIs_2_analyze);
	for(ROI = 0; ROI < _num_ROIs_2_analyze; ROI++)
		_ROI_material_RSPs[ROI] 	= ROI_material_name_2_RSP(_ROI_material_names[ROI], _is_simulated_scan);
	return _ROI_material_RSPs;
}
function ROI_parameter_string_2_values(_ROI_parameter_string_index, _ROI_parameter_strings, _ROI_parameter_decodings, _ROI_parameter_value_parseFloat, _force_array)
{
	_desired_ROI_parameter_string 				= _ROI_parameter_strings[_ROI_parameter_string_index];
	_desired_ROI_parameter_string_elements 		= split(_desired_ROI_parameter_string, ",");
	_num_desired_ROI_parameter_string_elements 	= _desired_ROI_parameter_string_elements.length;
	_desired_ROI_parameter_values				= newArray(_num_desired_ROI_parameter_string_elements);
	for(i = 0; i < _num_desired_ROI_parameter_string_elements; i++)
	{
		_spaceless_parameter_value_string 		= strip_surrounding_spaces(_desired_ROI_parameter_string_elements[i]);
		if(_ROI_parameter_decodings[_ROI_parameter_string_index] == _ROI_parameter_value_parseFloat)
			_desired_ROI_parameter_values[i] 	= parseFloat(_spaceless_parameter_value_string);
		else
			_desired_ROI_parameter_values[i] 	= _spaceless_parameter_value_string;
	}
	if( _num_desired_ROI_parameter_string_elements == 1 && !_force_array)
		return _desired_ROI_parameter_values[0];
	else
		return _desired_ROI_parameter_values;
}
function path_2_phantom_name(path, reconstruction_data_folder)
{
	folder_names 					= split(path, File.separator);
	reconstruction_data_folder_name = substring(reconstruction_data_folder, 1);
	for(i = 0; i < folder_names.length; i++)
		if(folder_names[i] == reconstruction_data_folder_name)
			return folder_names[i + 1];
}
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//------------------------------------------------------------------- Parameter value test data manipulation function definitions -------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
function extract_parameter_value_combination(_parameter_combination_array, _num_parameters, _combinations_start_index, _combination_number)
{
	_start_index		= _combinations_start_index + (_combination_number - 1) * (_num_parameters - 1);
	_end_index			= _start_index + _num_parameters - 1;					
	_combination		= Array.slice(_parameter_combination_array, _start_index, _end_index);
	return				_combination;
}
function extract_parameter_values(_parameter_ID, _parameter_values, _num_parameter_values, _parameter_string_prefixes)//, _calculate_parameter_value_offsets)
{
	_is_parameter_index					= isNumber(_parameter_ID);
	_is_parameter_prefix				= isString(_parameter_ID);
	if									(_is_parameter_index)
		_parameter_index				= _parameter_ID;
	else if								(_is_parameter_prefix)
		_parameter_index				= isMember(_parameter_ID, _parameter_string_prefixes, RETURN_MATCH_INDEX);
	if									(_parameter_index < 0 || _parameter_index > _parameter_string_prefixes.length)
		errKill							("The '_parameter_index' passed to 'extract_parameter_values' does not correspond to a valid array index");
	_num_parameters						= _num_parameter_values.length;
	_total_parameter_values				= _parameter_values.length;
	_parameter_value_offsets			= series_ops(num_parameter_values, SERIES_SUMMATION, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
	_parameter_start_index				= series_op(_num_parameter_values, SERIES_SUMMATION, _parameter_index, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
	_parameter_end_index				= series_op(_num_parameter_values, SERIES_SUMMATION, _parameter_index + 1, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
//	if									(_parameter_index == _num_parameters - 1)
//		_parameter_end_index 			= _total_parameter_values;
//	else
//		_parameter_end_index 			= _parameter_value_offsets[_parameter_index + 1] + _parameter_value_offsets[_parameter_index + 1];
	_parameter_values 					= Array.slice(_parameter_values, _parameter_start_index, _parameter_end_index); 	
	return _parameter_values;
}
function generate_ordering_indices(_num_iterations, _num_ROIs_2_analyze, _images_per_reconstruction, _num_TTP_values)
{
	ordering_indices 										= newArray(_num_ROIs_2_analyze * _images_per_reconstruction * _num_TTP_values);
	ordering_indices_position 								= 0;
	for(iteration = 0; iteration <= _num_iterations; iteration++)  
	{
		for(ROI = 0; ROI < _num_ROIs_2_analyze; ROI++)
		{
			for( N = 0; N < _num_TTP_values; N++)
			{
				ordering_index 								= _num_ROIs_2_analyze * _images_per_reconstruction * N + iteration * _num_ROIs_2_analyze + ROI;
				ordering_indices[ordering_indices_position] = ordering_index;
				ordering_indices_position++;
			}
		}
	}
	return ordering_indices;										
}
function generate_parameter_test_combination(_parameter_combination_indices, _parameter_values)
{
	_num_parameter_combination_indices 	= _parameter_combination_indices.length;
	_parameter_combination 				= newArray(_num_parameter_combination_indices);
	for(parameter = 0; parameter < _num_parameter_combination_indices; parameter++)
		_parameter_combination[parameter]	= _parameter_values[_parameter_combination_indices[parameter]];					
	return _parameter_combination;       	
}
function generate_parameter_test_combination_indices(_TTP_index, _combination_index, _modulo_values, _parameter_value_offsets )
{	
	j 								= _combination_index;
	_parameter_combination_indices 		= newArray(_TTP_index + 1);
	for(parameter = 0; parameter < _TTP_index; parameter++)
	{
		i = 0;
		while(j - _modulo_values[parameter] >= 0)
		{
			j -= _modulo_values[parameter];
			i++;
		}
		_parameter_combination_indices[parameter]					= i + _parameter_value_offsets[parameter];
	}		
	_parameter_combination_indices[_TTP_index]	= j + _parameter_value_offsets[_TTP_index];		
	return _parameter_combination_indices;       	
}
function parameter_indices_2_index(num_parameter_values_, parameter_indices_)
{
	index 			= 0;
	modulo_value 	= 1;
	for(n = 0; n < num_parameter_values_.length; n++)
	{
		index 		+= parameter_indices_[n] * modulo_value;
		modulo_value *= num_parameter_values_[n]; 
	}
	return index;
}
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//----------------------------------------------- Parameter value test data path(s)/value(s) string(s) construction/manipulation function definitions -----------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
function generate_parameter_test_multiplot_folder(_multiplot_parameter_index, _multiplot_parameter_combination, _multiplot_combination_offset, _parameter_values, _parameter_value_offsets, _parameter_string_prefixes, _parameter_string_precisions )
{
	_num_parameters					= _parameter_string_prefixes.length;		
	_folder_string 					= EMPTY_STRING;
	for(parameter = 0, index = 0; parameter < num_parameters; parameter++, index++)	
	{
		if(parameter != _multiplot_parameter_index)
			_folder_string	= _folder_string + UNDERSCORE_STRING + _parameter_string_prefixes[parameter] + UNDERSCORE_STRING + d2s( _multiplot_parameter_combination[index], _parameter_string_precisions[parameter]);
		else
			_folder_string		= _folder_string + UNDERSCORE_STRING + _parameter_string_prefixes[parameter] + UNDERSCORE_STRING + d2s( _parameter_values[_parameter_value_offsets[parameter] + _multiplot_combination_offset], _parameter_string_precisions[index--]);	
	}
	_folder_string	= substring(_folder_string, 1);				
	return _folder_string;	
}		
function generate_parameter_test_multiplot_folder2(_multiplot_parameter_index, _multiplot_parameter_combination, _multiplot_parameter_value, _parameter_string_prefixes, _parameter_string_precisions )
{
	_num_parameters				= _parameter_string_prefixes.length;		
	_folder_string 				= EMPTY_STRING;
	for							(parameter = 0, index = 0; parameter < num_parameters; parameter++, index ++)	
	{
		if						(parameter != _multiplot_parameter_index)
			_folder_string		+= UNDERSCORE_STRING + _parameter_string_prefixes[parameter] + UNDERSCORE_STRING + d2s( _multiplot_parameter_combination[index], 	_parameter_string_precisions[parameter]	);
		else
			_folder_string		+= UNDERSCORE_STRING + _parameter_string_prefixes[parameter] + UNDERSCORE_STRING + d2s( _multiplot_parameter_value, 				_parameter_string_precisions[index--]	);	
	}
	_folder_string				= substring(_folder_string, 1);				
	return 						_folder_string;	
}		
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function generate_parameter_value_range_string(_parameter_prefix, _parameter_values, _parameter_string_precision, _minimize_string_precision, _add_spaces, _value_range_form, _single_value_action)
{	
	_extrema 						= find_array_extrema(_parameter_values, TOLERANCE, false);
	if								(_add_spaces)
		_string_separation			= SPACE_STRING;
	else
		_string_separation			= EMPTY_STRING;
	if								(_minimize_string_precision)
	{
		_range_min_string			= minimize_string_precision( _extrema[0], _parameter_string_precision, RETURN_STRINGS, RETURN_DONT_FORCE_ARRAY);
		_range_max_string			= minimize_string_precision( _extrema[1], _parameter_string_precision, RETURN_STRINGS, RETURN_DONT_FORCE_ARRAY);
	}
	else
	{
		_range_min_string			= d2s( _extrema[0], _parameter_string_precision);
		_range_max_string			= d2s( _extrema[1], _parameter_string_precision);
		//_range_min_string			= minimize_string_precision( _extrema[0], _parameter_string_precision, RETURN_STRINGS, RETURN_DONT_FORCE_ARRAY);
		//_range_max_string			= minimize_string_precision( _extrema[1], _parameter_string_precision, RETURN_STRINGS, RETURN_DONT_FORCE_ARRAY);
	}
	if								(_parameter_values.length > 1)
	{
		if							(_value_range_form == ARRAY_VALUES_RANGE_TYPE_BRACKETED)
		_range_string				= _parameter_prefix + _string_separation + LEFT_BRACKET_STRING + _range_min_string + DASH_STRING + _range_max_string + RIGHT_BRACKET_STRING;
		if							(_value_range_form == ARRAY_VALUES_RANGE_TYPE_EQUALS)
		_range_string				= _parameter_prefix + _string_separation + EQUALS_STRING + _string_separation + LEFT_BRACKET_STRING + _range_min_string + DASH_STRING + _range_max_string + RIGHT_BRACKET_STRING;
		if							(_value_range_form == ARRAY_VALUES_RANGE_TYPE_UNDERSCORED)
		_range_string				= _parameter_prefix + UNDERSCORE_STRING + LEFT_BRACKET_STRING + _range_min_string + DASH_STRING + _range_max_string + RIGHT_BRACKET_STRING;
	}
	else
	{
		if							(_single_value_action == ARRAY_VALUES_RANGE_OMIT_SINGLE_VALUE)
			_range_string			= EMPTY_STRING;
		else if						(_single_value_action == ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE)
			_range_string			= _parameter_prefix + LEFT_BRACKET_STRING + _range_min_string + RIGHT_BRACKET_STRING;
		else if						(_single_value_action == ARRAY_VALUES_RANGE_EQUALS_SINGLE_VALUE)
			_range_string			= _parameter_prefix + EQUALS_STRING + _range_min_string;
		else
			errKill					("Unknown '_single_value_action' option passed to 'generate_parameter_value_range_string' function");
	}
	return 							_range_string;
}							
function generate_parameter_value_substring(_parameter_prefix, _parameter_value, _parameter_precision, _prefix_term_separation_string, _prefix_value_separation_string, _add_spaces, _minimize_string_precision)
{
	if								(_add_spaces)
		_string_separation			= SPACE_STRING;
	else
		_string_separation			= EMPTY_STRING;
	if								(_minimize_string_precision)
		_substring					= _parameter_prefix + _string_separation + _prefix_value_separation_string + _string_separation + minimize_string_precision(_parameter_value, _parameter_precision, RETURN_STRINGS, RETURN_DONT_FORCE_ARRAY) + _prefix_term_separation_string;
		//_substring					= _parameter_prefix + _string_separation + _prefix_value_separation_string + _string_separation + minimize_string_precision(_parameter_value, _parameter_precision) + _prefix_term_separation_string;
	else
		_substring					= _parameter_prefix + _string_separation + _prefix_value_separation_string + _string_separation + d2s(_parameter_value, _parameter_precision) 						+ _prefix_term_separation_string;
	return 							_substring;
}
function generate_parameter_value_strings(_parameter_values, _parameter_string_precision, _minimize_string_length)
{
	_num_parameters 			= _parameter_values.length;
	_parameter_value_strings	= newArray(_num_parameters);
	_string_precisions_array		= array_match_length_fill(_parameter_values, _parameter_string_precision);
	for(i = 0; i < _num_parameters; i++)
	{
		_parameter_value_string = d2s(_parameter_values[i], _string_precisions_array[i]);
		if(_minimize_string_length)
			_parameter_value_string = minimize_string_precision(_parameter_value_string, _string_precisions_array[i], RETURN_STRINGS, RETURN_DONT_FORCE_ARRAY);
			//_parameter_value_string = minimize_string_precision(_parameter_value_string, _string_precisions_array[i]);
		_parameter_value_strings[i]	= _parameter_value_string;
	}
	return _parameter_value_strings;
}
function generate_parameter_values_string(_parameter_value_strings, _parameter_prefixes, _parameter_values, _num_parameter_values, _parameter_precisions, _prefix_term_separation_string, _prefix_value_separation_string, _add_spaces, _minimize_string_precision, _multivalue_only, _value_range_form, _single_value_action, _omit_indices, _range_indices)
{
	_suffix 								= EMPTY_STRING;
	_range_indices_array					= array_from_data(_range_indices);
	_omit_indices_array						= array_from_data(_omit_indices);
	_num_parameters 						= _parameter_value_strings.length;
	_start_index							= 0;
	if										(_add_spaces)
		_string_separation					= SPACE_STRING;
	else
		_string_separation					= EMPTY_STRING;
	_term_separation_string					= _prefix_term_separation_string + _string_separation;
	_range_separation_string				= _prefix_term_separation_string + _string_separation;
	_term_separation_string_length			= lengthOf(_term_separation_string);
	_range_separation_string_length			= lengthOf(_range_separation_string);
	for										(i = 0; i < _num_parameters; i++)
	{
		_num_values							= _num_parameter_values[i];
		_end_index							= _start_index + _num_values;
		if									( isMember(i, _range_indices_array, RETURN_MATCH_TF) )
		{
			_values							= Array.slice(_parameter_values, _start_index, _end_index);
			_string_2_append				= generate_parameter_value_range_string(_parameter_prefixes[i], _values, _parameter_precisions[i], REMOVE_TRAILING_ZEROS, _add_spaces, _value_range_form, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE);
			//_string_2_append				= _values_range_string;
			//if							(i != _num_parameters - 1)
				_string_2_append			+= _range_separation_string;
				_last_separation_length		= _range_separation_string_length;
		}
		else
		{
			if								( !isMember(i, _omit_indices_array, RETURN_MATCH_TF) )
			{
				if							(_num_parameter_values[i] > 1 || !_multivalue_only)
					_string_2_append		= generate_parameter_value_substring(_parameter_prefixes[i], _parameter_value_strings[i], _parameter_precisions[i], _term_separation_string, _prefix_value_separation_string, _add_spaces, _minimize_string_precision);
				else 
					_string_2_append		= EMPTY_STRING;
			}
			else
				_string_2_append			= EMPTY_STRING;
			_last_separation_length			= _term_separation_string_length;
		}
		_start_index						= _end_index;
		_suffix 							+= _string_2_append;
	}
	return 									substring(_suffix, 0, lengthOf(_suffix) - _last_separation_length);						
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function folder_2_parameter_values_string(_folder, _parameter_prefixes, _parameter_values, _num_parameter_values, _parameter_precisions, _prefix_term_separation_string, _prefix_value_separation_string, _add_spaces, _minimize_string_precision, _multivalue_only, _value_range_form, _single_value_action, _omit_indices, _range_indices)
{
	_current_parameter_values	= folder_2_parameter_value_strings(_folder, _parameter_prefixes, EMPTY_STRING, STRING_DONT_ADD_SPACES, _minimize_string_precision);
	_parameter_string			= generate_parameter_values_string(_current_parameter_values, _parameter_prefixes, _parameter_values, _num_parameter_values, _parameter_precisions, _prefix_term_separation_string, _prefix_value_separation_string, _add_spaces, _minimize_string_precision, _multivalue_only, _value_range_form, _single_value_action, _omit_indices, _range_indices);
	return _parameter_string;
}
function folder_2_parameter_value_strings(_folder_name, _parameter_string_prefixes, _prefix_value_separation_string, _add_spaces, _minimize_string_precision)
{
	_num_parameters 				= _parameter_string_prefixes.length;
	_prefix_lengths 				= newArray		(_parameter_string_prefixes.length											);
	_value_strings 					= newArray		(_num_parameters															);
	for								( i = 0; i < _num_parameters - 1; i++)
	{
		_prefix 					= _parameter_string_prefixes[i];
		_prefix_length 				= lengthOf		(_prefix																	);
		_start_index 				= indexOf		(_folder_name, _prefix 														);
		_end_index 					= indexOf		(_folder_name, UNDERSCORE_STRING, 	_start_index + 		_prefix_length + 1	);
		_value_strings[i] 			= substring		(_folder_name, _start_index + 		_prefix_length + 1, _end_index			);
	}
	_next_prefix 					= indexOf		(_folder_name, _parameter_string_prefixes[_num_parameters - 1] 				);
	_start_index 					= indexOf		(_folder_name, UNDERSCORE_STRING, 	_next_prefix + 1						);
	_end_index 						= indexOf		(_folder_name, UNDERSCORE_STRING, 	_start_index + 1						);
	if								(_end_index == -1																			)
		_end_index 					= lengthOf		(_folder_name																);
	_value_strings[i] 				= substring		(_folder_name, _start_index + 1, _end_index 								);
	if								(_minimize_string_precision)
		for							( i = 0; i < _value_strings.length; i++)
			_value_strings[i] 		= substring(minimize_string_precision(_value_strings[i], precisionOf(_value_strings[i]), RETURN_STRINGS, RETURN_DONT_FORCE_ARRAY), 0);
	if								(_prefix_value_separation_string != EMPTY_STRING)
	{
		if							(_add_spaces)
			_string_separation		= SPACE_STRING + _prefix_value_separation_string + SPACE_STRING;
		else
			_string_separation		= _prefix_value_separation_string;
		for							( i = 0; i < _num_parameters; i++)
			_value_strings[i]		= _parameter_string_prefixes[i] + _string_separation + _value_strings[i];
	}
	return 							_value_strings;
}
function split_parameter_value_string(_parameter_value_string, _parameter_string_prefixes, _prefix_term_separation, _prefix_value_separation, _return_strings_option)
{
	//print_section									("Splitting string", false);
	_num_parameter_value_strings					= lengthOf(_parameter_string_prefixes);
	_parameter_strings								= newArray();
	_parameter_prefix_strings						= newArray();
	_parameter_value_strings						= newArray();
	_parameter_value_short_strings					= newArray();
	_parameter_equals_strings						= newArray();
	_parameter_padded_equals_strings				= newArray();
	_parameter_equals_short_strings					= newArray();
	_parameter_padded_equals_short_strings			= newArray();
	for												(i = 0; i < _num_parameter_value_strings; i++)
	{
		_prefix_string								= _parameter_string_prefixes[i];
		if											( startsWith				(_parameter_value_string, 					_prefix_string	)																)
		{
			_prefix_end_index 						= lengthOf					(_prefix_string																												);
			_value_start_index 						= indexOf					(_parameter_value_string, 					_prefix_value_separation, 								_prefix_end_index		);
			_value_end_index 						= indexOf					(_parameter_value_string, 					_prefix_term_separation, 								_value_start_index + 1	);
			if										( _value_end_index == -1				 																												)
				_value_end_index					= lengthOf					(_parameter_value_string																									);
			_prefix_value_string					= strip_surrounding_spaces	(substring(_parameter_value_string,			0, 														_value_end_index	)	);
			_value_string							= strip_surrounding_spaces	(substring(_parameter_value_string,			_value_start_index + 1, 								_value_end_index	)	);
			if										( lengthOf					(_parameter_value_string) != 				_value_end_index  																)
				_parameter_value_string				= strip_surrounding_spaces	(substring(_parameter_value_string, 		_value_end_index + 1)															);
			_short_value_string						= minimize_string_precision	(_value_string, 							-1, 						RETURN_STRINGS, 			RETURN_DONT_FORCE_ARRAY	);
			_parameter_strings						= Array.concat				(_parameter_strings, 						_prefix_value_string															);
			_parameter_prefix_strings				= Array.concat				(_parameter_prefix_strings,					_prefix_string																	);
			_parameter_value_strings				= Array.concat				(_parameter_value_strings, 					_value_string																	);	
			_parameter_value_short_strings			= Array.concat				(_parameter_value_short_strings, 			_short_value_string																);	
			_parameter_equals_strings				= Array.concat				(_parameter_equals_strings, 				_prefix_string 			+ 	EQUALS_STRING 			+	_value_string			);
			_parameter_padded_equals_strings		= Array.concat				(_parameter_padded_equals_strings, 			_prefix_string 			+ 	PADDED_EQUALS_STRING 	+ 	_value_string			);
			_parameter_equals_short_strings			= Array.concat				(_parameter_equals_short_strings, 			_prefix_string 			+ 	EQUALS_STRING 			+	_short_value_string		);
			_parameter_padded_equals_short_strings	= Array.concat				(_parameter_padded_equals_short_strings, 	_prefix_string 			+ 	PADDED_EQUALS_STRING 	+ 	_short_value_string		);
		}
	}
	//print_section									("Finished Splitting string", false);
	if												(_return_strings_option == RETURN_SPLIT_STRINGS)				//	0				
		return 										_parameter_strings;
	else if											(_return_strings_option == RETURN_SPLIT_PREFIXES)				//	1
		return 										_parameter_prefix_strings;
	else if											(_return_strings_option == RETURN_SPLIT_VALUES)					//	2
		return 										_parameter_value_strings;
	else if											(_return_strings_option == RETURN_SPLIT_SHORT_VALUES)			//	3
		return 										_parameter_value_short_strings;
	else if											(_return_strings_option == RETURN_EQUALS_STRINGS)				//	4
		return 										_parameter_equals_strings;
	else if											(_return_strings_option == RETURN_PADDED_EQUALS_STRINGS)		//	5
		return 										_parameter_padded_equals_strings;
	else if											(_return_strings_option == RETURN_EQUALS_SHORT_STRINGS)			//	6
		return 										_parameter_equals_short_strings;
	else if											(_return_strings_option == RETURN_PADDED_EQUALS_SHORT_STRINGS)	//	7
		return 										_parameter_padded_equals_short_strings;
	//else	
	//	errKill										("Unknown '_return_strings_option' option passed to 'split_parameter_value_string' function");
}
function remove_folder_parameter(_folder_name, _prefix_2_remove, _remove_value_only, _prefix_term_separation)
{
	_prefix_2_remove_length 			= lengthOf		(_prefix_2_remove);
	_prefix_start_index 				= indexOf		(_folder_name, _prefix_2_remove );
	_prefix_end_index 					= _prefix_start_index + _prefix_2_remove_length;
	_value_start_index 					= indexOf		(_folder_name, _prefix_term_separation, _prefix_end_index);
	_value_end_index 					= indexOf		(_folder_name, _prefix_term_separation, _value_start_index + 1);
	_before_prefix_substring		 	= substring		(_folder_name, 0, _prefix_start_index);
	_after_prefix_substring		 		= substring		(_folder_name, 0, _prefix_end_index);
	if									(_value_end_index == -1)
	{
		if								(_remove_value_only)
			_prefix_removed_string		= _after_prefix_substring;
		else
			_prefix_removed_string		= _before_prefix_substring;
	}
	else
	{
		_after_value_substring 			= substring(_folder_name, _value_end_index + 1, lengthOf(_folder_name));
		if								(_remove_value_only)
			_prefix_removed_string		= _after_prefix_substring + UNDERSCORE_STRING + _after_value_substring;
		else
			_prefix_removed_string		= _before_prefix_substring + _after_value_substring;
	}
	if									(substring(_prefix_removed_string, lengthOf(_prefix_removed_string) - 1) == UNDERSCORE_STRING)
		_prefix_removed_string			= substring(_prefix_removed_string, 0, lengthOf(_prefix_removed_string) - 1);
	return	 							_prefix_removed_string;
}
function modify_parameter_values_string(_parameter_value_string, _parameter_string_prefixes, _modification_type, _modification_indices, _string_separation, _value_separation, _new_string_separation, _new_value_separation, _add_spaces)
{
	_split_parameter_value_strings				= split_parameter_value_string(_parameter_value_string, _parameter_string_prefixes, _string_separation, _value_separation, RETURN_SPLIT_VALUES);
	_split_parameter_prefix_strings				= split_parameter_value_string(_parameter_value_string, _parameter_string_prefixes, _string_separation, _value_separation, RETURN_SPLIT_PREFIXES);
	_split_parameter_strings					= split_parameter_value_string(_parameter_value_string, _parameter_string_prefixes, _string_separation, _value_separation, RETURN_SPLIT_STRINGS);
	_num_parameters								= _split_parameter_prefix_strings.length;
	_new_parameter_values_string				= EMPTY_STRING;
	_modification_indices_array					= array_from_data(_modification_indices);
	_new_string_separation_string	= _new_string_separation;
	_new_value_separation_string	= _new_value_separation;
	if(_add_spaces)
	{
		_new_string_separation_string	= _new_string_separation + SPACE_STRING;
		_new_value_separation_string	= SPACE_STRING + _new_value_separation + SPACE_STRING;
	}
	if( _modification_type == REMOVE_VALUE_STRINGS)
		_substring_return_removes						= lengthOf(_string_separation);			
	else if( _modification_type == REFORMAT_PARAMETER_VALUES_STRING)
		_substring_return_removes						= lengthOf(_new_string_separation_string);	
	for(i = 0; i < _num_parameters; i++)
	{
		_new_string						= _split_parameter_strings[i] + _string_separation;	
		if(isMember(i, _modification_indices_array, RETURN_MATCH_TF))
		{
			if( _modification_type == REMOVE_VALUE_STRINGS)
				_new_string						= _split_parameter_prefix_strings[i] + _string_separation;			
			else if( _modification_type == REFORMAT_PARAMETER_VALUES_STRING)
				_new_string						= _split_parameter_prefix_strings[i] + _new_value_separation_string + _split_parameter_value_strings[i] + _new_string_separation_string;	
		}
		_new_parameter_values_string		+= _new_string;
	}
	return 									substring(_new_parameter_values_string, 0, lengthOf(_new_parameter_values_string) - _substring_return_removes);
}
function modify_parameter_value_strings(_parameter_value_strings, _modification_type, _modification_indices, _modification_strings)
{
	_num_parameters						= _parameter_value_strings.length;
	_modification_indices_array			= array_from_data(_modification_indices);
	_modification_strings_array			= array_from_data(_modification_strings);
	_ranked_modification_indices_array	= Array.rankPositions( _modification_indices_array);
	_modification_strings_array			= array_sort_by(_modification_strings_array, _ranked_modification_indices_array);
	_new_string_array					= newArray();
	_modification_strings_index			= 0;
	if									(_modification_type == REMOVE_PARAMETER_STRING);
	else if								(_modification_type == INSERT_PARAMETER_STRING_BEFORE || _modification_type == INSERT_PARAMETER_STRING_AFTER);
	else if								(_modification_type == REPLACE_PARAMETER_STRING);
	else 								errKill("Unknown '_modification_type' option passed to 'modify_parameter_value_strings' function");
	for(i = 0; i < _num_parameters; i++)
	{
		if(isMember(i, _modification_indices_array, RETURN_MATCH_TF))
		{// More readable using separate blocks for each option, but conditionally adding terms at the 3 possible locations is half the code and still readable
			if							(_modification_type == INSERT_PARAMETER_STRING_BEFORE )
				_new_string_array		= Array.concat(_new_string_array, _parameter_value_strings[i]);
			if							(_modification_type != REMOVE_PARAMETER_STRING)
				//_new_string_array		= Array.concat(_new_string_array, _modification_strings_array[_ranked_modification_indices_array[_modification_strings_index++]]);
				_new_string_array		= Array.concat(_new_string_array, _modification_strings_array[_modification_strings_index++]);
			if							(_modification_type == INSERT_PARAMETER_STRING_AFTER)
				_new_string_array		= Array.concat(_new_string_array, _parameter_value_strings[i]);
		}
		else
			_new_string_array			= Array.concat(_new_string_array, _parameter_value_strings[i]);
	}
	return								_new_string_array;
}
function merge_strings_2_string(_strings, _omit_string_indices, _merged_string_separation_string)
{
	_merged_string				= EMPTY_STRING;
	_omit_string_indices_array	= array_from_data(_omit_string_indices);
	for							(i = 0; i < _strings.length; i++)
		if						(!isMember(i, _omit_string_indices_array, RETURN_MATCH_TF))
			_merged_string		+= _strings[i] + _merged_string_separation_string;
	return 						substring(_merged_string, 0, lengthOf(_merged_string) - lengthOf(_merged_string_separation_string));
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//********************************************************************* Functions to look at modifying/combining/removing later *********************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//function verify_distributed_file_set(directories, filenames)
//function verify_ROI_analysis_output_files(_common_directory, _PVT_data_folder, _ROI_analysis_RSP_output_filename, _ROI_analysis_RSP_Error_output_filename, _ROI_analysis_Std_Dev_output_filename, _ROI_analysis_TV_input_filename, _slices_2_analyze_folders, _ROI_selection_diameter_folders, _print_path)
//function ROI_material_name_2_RSP(material_name, is_simulated_scan)
//function ROI_material_names_2_RSPs(_ROI_material_names, _is_simulated_scan)
//function generate_parameter_test_multiplot_folder(_multiplot_parameter_index, _multiplot_parameter_combination, _multiplot_combination_offset, _parameter_values, _parameter_value_offsets, _parameter_string_prefixes, _parameter_string_precisions )
//function generate_parameter_test_multiplot_folder2(_multiplot_parameter_index, _multiplot_parameter_combination, _multiplot_parameter_value, _parameter_string_prefixes, _parameter_string_precisions )
// Write function to return data array min/max individually or together in array via control options. i.e., RETURN_MIN, RETURN_MAX, RETURN_MINMAX