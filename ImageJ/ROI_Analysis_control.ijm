//C:\Users\Blake\Documents\GitHub\pCT-collaboration\pCT_Tools\ImageJ
// Abbreviations/Acronyms:
// PVT = Parameter value test
// TTP = target test parameter
// MVP = multivariable plot, aka, multiplot
// ifname/ofname = input/output filename
// TV = total variation
// RSP = relative stopping power
// ROI = region of interest
// CSV = somma separated values
//
//
//
macro "ROI_Analysis_control"
{
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***************************************************************************************************************************************************************************************************//
	//************************* Close all windows and clear results table *******************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	close_all_windows		(true, true);
	setBatchMode			(true);	
	//setBatchMode			(false);
	print_section("Performing ROI analysis on desired reconstruction(s)", true);
	//print_section("Generating multi-curve plots vs target test parameter for a user specified parameter, with each plot having individual curves for each value of this parameter, then writing the plot data and resulting images to disk as PNG", true);
	//print_section("Generating multi-curve plots vs target test parameter for ", true);
	//print_section("Generating multi-curve plots vs target test parameter forGenerating multi-curve plots vs target test parameter for", true);
	//print_section("Generating multi-curve plots vs target test parameter for ", false);
	//print_section("Generating multi-curve plots vs target test parameter forGenerating multi-curve plots vs target test parameter for", false);
	//***************************************************************************************************************************************************************************************************//
	//************* Execution control Booleans and general parameter value test and MVP behavior Booleans ************************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	//************* Execution control Booleans and general parameter value test and multiplot behavior Booleans ************************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	log_printing												= true;			
	exporting_log												= false;		
	debug_path_printing											= false;
	printing_ROI_definitions									= true;		
	printing_reconstructed_image_analysis_info					= true;
	printing_PVT_info											= true;
	printing_multiplot_parameter_info							= true;	
	printing_MVP_parameter_info									= true;	
	printing_input_output_filenames								= true;	
	print_ROI_definitions_path									= false;		
	PRINT_ANALYSIS_CFG_PATH										= true;
	print_directories_created									= false;	
	print_input_data_path										= false;
	print_input_CSV_path										= false;
	print_input_TXT_path										= false;
	print_input_PNG_paths										= false;
	print_output_CSV_path										= true;
	print_output_TXT_path										= true;
	print_output_PNG_paths										= false;
	print_MVP_animation_paths 									= false;		
	print_MVP_GIF_paths 										= true;		
	print_MVP_AVI_paths 										= true;		
	print_copied_file_paths										= false;
	close_input_PNG_images										= true;
	close_output_PNG_images										= true;
	close_stack_images											= true;		
	close_MVP_stack_images 										= true;									
	specify_MVP_parameter_prefix								= true;
	specify_MVP_parameter_number								= true && !specify_MVP_parameter_prefix;
	specify_MVP_parameter_index									= true && !specify_MVP_parameter_prefix && !specify_MVP_parameter_number;
	write_folder_strings 										= false;
	write_path_strings 											= false;		
	//***************************************************************************************************************************************************************************************************//
	//************* Parameter value test Booleans ************************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//	
	check_all_paths_existence 									= false;
	ROI_analysis 												= true;
	analyze_all_dir_reconstructions								= true;
	analyze_specific_data 										= false;
	only_perform_missing_analyses 								= true;
	overwrite_ROI_analyses		 								= false;
	always_perform_analyses 									= !only_perform_missing_analyses;
	generate_averaged_data										= false;
	generate_specific_averaged_data								= false;
	generate_averaged_MVP_data									= false;
	perform_all_missing_analyses								= false;
	perform_MVP_analyses										= true;
	exit_after_ROI_analyses 									= true;
	exit_after_analyzing_specific_data							= false;
	exit_after_performing_all_missing_analyses					= false;
	exit_after_performing_all_parameter_test_analyses			= false;
	exit_after_performing_MVP_ROI_analyses						= true;
	exit_after_averaging_specific_data							= false;
	//***************************************************************************************************************************************************************************************************//
	//********************************************************************************** Parameter value test Booleans **********************************************************************************//
	//***************************************************************************************************************************************************************************************************//		
	analyze_compared_data 										= false;
	add_comparison_lines_2_plots								= false;
	add_compared_data											= false;
	add_compared_RSP_data 										= false;
	add_compared_RSP_error_data 								= false;
	add_compared_std_dev_data 									= false;
	add_compared_TV_data 										= false;
	//***************************************************************************************************************************************************************************************************//
	//********************************************************************************** Parameter value test Booleans **********************************************************************************//
	//***************************************************************************************************************************************************************************************************//		
	generate_PVT_comparison_data 								= true;
	generate_PVT_RSP_comparison_data 							= false;
	generate_PVT_RSP_error_comparison_data 						= false;
	generate_PVT_std_dev_comparison_data 						= false;
	generate_PVT_TV_comparison_data	 							= true;				
	//***************************************************************************************************************************************************************************************************//
	//********************************************************************************** Parameter value test Booleans **********************************************************************************//
	//***************************************************************************************************************************************************************************************************//	
	perform_test_comparisons									= true;	
		perform_missing_analyses								= true;
		perform_TV_comparisons									= true;		
			write_TV_comparison_data 							= true;	
				overwrite_TV_comparison_data 					= true;	
			perform_TV_vs_iteration_analysis					= true;					
				create_TV_vs_iteration_plots					= true;		
					write_TV_vs_iteration_plots					= true;
						overwrite_TV_vs_iteration_plots			= true;
			perform_TV_vs_target_parameter_analysis				= true;	
				create_TV_vs_target_parameter_plots				= true;				
					write_TV_vs_target_parameter_plots			= true;
						overwrite_TV_vs_target_parameter_plots	= true;						
		perform_RSP_comparisons									= true;
			write_RSP_comparison_data							= true;
				overwrite_RSP_comparison_data					= true;
			create_RSP_comparison_plots							= true;
				write_RSP_comparison_plots						= true;
					overwrite_RSP_comparison_plots				= true;
		perform_RSP_error_comparisons 							= true;
			write_RSP_error_comparison_data						= true;
				overwrite_RSP_error_comparison_data				= true;
			create_RSP_error_comparison_plots					= true;
				write_RSP_error_comparison_plots				= true;
					overwrite_RSP_error_comparison_plots		= true;
		perform_std_dev_comparisons								= true;
			write_std_dev_comparison_data						= true;
				overwrite_std_dev_comparison_data				= true;
			create_std_dev_comparison_plots						= true;
				write_std_dev_comparison_plots					= true;
					overwrite_std_dev_comparison_plots			= true;	
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************** Multiplotting Booleans *************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	perform_test_comparisons									= true;	
	perform_test_comparisons_by_MVP_parameter_combination		= true;	
	perform_test_comparisons_by_quality_measure					= false;	
		analyze_all_parameter_test_images						= false;
		perform_missing_analyses								= false;
		generate_RSP_MVPs 										= true;			
			write_RSP_MVPs										= true;
				overwrite_RSP_MVPs								= true;
			generate_RSP_MVP_animations							= true;
				write_RSP_MVP_animated_GIFs						= true;
					overwrite_RSP_MVP_animated_GIFs				= true;
				write_RSP_MVP_AVIs								= true;
					overwrite_RSP_MVP_AVIs						= true;
		generate_RSP_error_MVPs 								= true;		
			write_RSP_error_MVPs								= true;
				overwrite_RSP_error_MVPs						= true;	
			generate_RSP_error_MVP_animations					= true;
				write_RSP_error_MVP_animated_GIFs				= true;
					overwrite_RSP_error_MVP_animated_GIFs		= true;
				write_RSP_error_MVP_AVIs						= true;
					overwrite_RSP_error_MVP_AVIs				= true;
		generate_std_dev_MVPs 									= true;			
			write_std_dev_MVPs									= true;
				overwrite_std_dev_MVPs							= true;
			generate_std_dev_MVP_animations						= true;
				write_std_dev_MVP_animated_GIFs					= true;
					overwrite_std_dev_MVP_animated_GIFs			= true;
				write_std_dev_MVP_AVIs							= true;
					overwrite_std_dev_MVP_AVIs					= true;
		generate_TV_MVPs										= true;
			plot_TV_MVPs 										= true;
				write_TV_MVPs 									= true;
					overwrite_TV_MVPs							= true;				
			plot_TV_step_MVPs 									= true;
				write_TV_step_MVPs								= true;
					overwrite_TV_step_MVPs						= true;				
			plot_TV_diff_MVPs 									= false;
				write_TV_diff_MVPs								= false;
					overwrite_TV_diff_MVPs						= false;				
		generate_TV_animations									= true;
			generate_TV_MVP_animations							= true;
				write_TV_MVP_animated_GIFs						= true;
					overwrite_TV_MVP_animated_GIFs				= true;
				write_TV_MVP_AVIs								= true;
					overwrite_TV_MVP_AVIs						= true;
			generate_TV_step_MVP_animations						= true;
				write_TV_step_MVP_animated_GIFs					= true;
					overwrite_TV_step_MVP_animated_GIFs			= true;
				write_TV_step_MVP_AVIs							= false;
					overwrite_TV_step_MVP_AVIs					= false;
			generate_TV_diff_MVP_animations						= false;
				write_TV_diff_MVP_animated_GIFs					= false;
					overwrite_TV_diff_MVP_animated_GIFs			= false;
				write_TV_diff_MVP_AVIs							= false;
					overwrite_TV_diff_MVP_AVIs					= false;
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
	ON 												= true;
	OFF 											= false;
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
	//**************************************************************************************************************************************************************************************************//
	//***************************************************************************** Set reconstruction data dir/file info ******************************************************************************//
	//**************************************************************************************************************************************************************************************************//
	PNG_image_Booleans								= newArray(print_input_PNG_paths, close_input_PNG_images);
	RSP_Booleans									= newArray(generate_RSP_MVPs, write_RSP_MVPs, overwrite_RSP_MVPs, write_RSP_MVP_animated_GIFs, overwrite_RSP_MVP_animated_GIFs, write_RSP_MVP_AVIs, overwrite_RSP_MVP_AVIs);
	RSP_error_Booleans 								= newArray(generate_RSP_error_MVPs, write_RSP_error_MVPs, overwrite_RSP_error_MVPs, write_RSP_error_MVP_animated_GIFs, overwrite_RSP_error_MVP_animated_GIFs, write_RSP_error_MVP_AVIs, overwrite_RSP_MVP_AVIs);
	std_dev_Booleans 								= newArray(generate_std_dev_MVPs, write_std_dev_MVPs, overwrite_std_dev_MVPs, write_std_dev_MVP_animated_GIFs, overwrite_std_dev_MVP_animated_GIFs, write_std_dev_MVP_AVIs, overwrite_std_dev_MVP_AVIs);
	TV_Booleans 									= newArray(plot_TV_MVPs, write_TV_MVPs, overwrite_TV_MVPs, write_TV_MVP_animated_GIFs, overwrite_TV_MVP_animated_GIFs, write_TV_MVP_AVIs, overwrite_TV_MVP_AVIs);
	TV_step_Booleans								= newArray(plot_TV_step_MVPs, write_TV_step_MVPs, overwrite_TV_step_MVPs, write_TV_step_MVP_animated_GIFs, overwrite_TV_step_MVP_animated_GIFs, write_TV_step_MVP_AVIs, overwrite_TV_step_MVP_AVIs);
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
	TRUE											= "true";
	FALSE											= "false";
	ADD_OPERATION									= "add";
	MULTIPLY_OPERATION								= "multiply";
	X_DIRECTION										= "x";
	Y_DIRECTION										= "y";	 					
	CIRCULAR_ROI									= "circle";
	SQUARE_ROI										= "square";		
	NO_COMPRESSION									= "None";
	JPEG_COMPRESSION								= "JPEG";
	PNG_COMPRESSION									= "PNG";
	ROI_DEFINITION_NUMBERS_DECODING_OP				= "parseFloat";	
	ROI_DEFINITION_STRINGS_DECODING_OP				= "none";	
	FLOAT_DECODING_OP								= "parseFloat";	
	INT_DECODING_OP									= "parseInt";	
	STRING_DECODING_OP								= "none";	
	BOOL_DECODING_OP								= "parseBool";	
	ROI_MATERIAL_RSP_COLUMN_LABEL 					= "Predicted RSP";
	RSP_ERROR_COLUMN_LABEL 							= "% Error";
	MEAN_COLUMN_LABEL 								= "Mean";	
	//----------------------------------------------------------------
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
	TRUE_STRING										= "true";
	FALSE_STRING									= "false";
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
	//***************************************************************************** Set reconstruction data dir/file info *********************************************************************//
	//***********************************************************************************************************************************************************************************************//
	//FOLDER_SEPARATOR								= File.separator;
	IMAGEJ_PLUGINS_DIR								= getDirectory("plugins");
	IMAGEJ_MACRO_DIR								= getDirectory("macros");
	IMAGEJ_PROGRAM_DIR								= getDirectory("imagej") ;
	IMAGEJ_LAUNCH_DIR								= getDirectory("startup");
	IMAGEJ_PREVIOUS_MACRO							= getInfo("macro.filepath");
	USER_HOME_DIRECTORY								= getDirectory("home");
	//GITHUB_MACRO_DIR								= "C:\\Users\\Blake\\Documents\\GitHub\\Baylor_ICTHUS\\pCT_Reconstruction\\Tools\\ImageJ";
 	//GITHUB_MACRO_DIR								= "C:\\Users\\Blake\\Documents\\GitHub\\pCT-collaboration\\pCT_Tools\\Tools\\ImageJ";
 	//github_macro_directory_Baylor_ICTHUS			= "C:\\Users\\Blake\\Documents\\GitHub\\Baylor_ICTHUS\\pCT_Reconstruction\\Tools\\ImageJ\\";
 	//github_macro_directory_pCT_Collaboration		= "C:\\Users\\Blake\\Documents\\GitHub\\pCT-collaboration\\pCT_Tools\\ImageJ\\";
 	GITHUB_MACRO_DIRECTORY_BAYLOR_ICTHUS			= "C:\\Users\\Blake\\Documents\\GitHub\\Baylor_ICTHUS\\pCT_Reconstruction\\Tools\\ImageJ\\";
 	GITHUB_MACRO_DIRECTORY_PCT_COLLABORATION		= "C:\\Users\\Blake\\Documents\\GitHub\\pCT-collaboration\\pCT_Tools\\ImageJ\\";
 	GITHUB_MACRO_DIR								= GITHUB_MACRO_DIRECTORY_PCT_COLLABORATION;
 	RECON_DATA_DIR_C								= "C:\\Users\\Blake\\Documents\\Education\\Research\\pCT\\pCT_data\\reconstruction_data";
	RECON_DATA_DIR_D								= "D:\\pCT\\pCT_data\\reconstruction_data";

	ROI_ANALYSIS_MACRO_FILENAME 					= "ROI_Analysis.ijm";
	ROI_ANALYSIS_MACRO_PATH 						= GITHUB_MACRO_DIR + FOLDER_SEPARATOR + ROI_ANALYSIS_MACRO_FILENAME;
	MULTIPLOTTING_MACRO_FILENAME 					= "Multiplotting.ijm";
	MULTIPLOTTING_MACRO_PATH 						= GITHUB_MACRO_DIR + FOLDER_SEPARATOR + MULTIPLOTTING_MACRO_FILENAME;
	TEST_RESULT_COMPARISON_MACRO_FILENAME 			= "Test_Result_Comparison.ijm";
	TEST_RESULT_COMPARISON_MACRO_PATH 				= GITHUB_MACRO_DIR + FOLDER_SEPARATOR + TEST_RESULT_COMPARISON_MACRO_FILENAME;
	RECON_DATA_FOLDER								= FOLDER_SEPARATOR + "reconstruction_data";
	SIMULATED_DATA									= "Simulated";
	SIMULATED_DATA_FOLDER							= FOLDER_SEPARATOR + SIMULATED_DATA;
	EXPERIMENTAL_DATA								= "Experimental";	
	EXPERIMENTAL_DATA_FOLDER						= FOLDER_SEPARATOR + EXPERIMENTAL_DATA;
	OUTPUT_FOLDER									= FOLDER_SEPARATOR + "Output";
	GEANT4_DATA_FOLDER_BASENAME						= FOLDER_SEPARATOR + "G_";
	PHANTOM_BASENAME								= "CTP404_Sensitom";
	//PHANTOM_BASENAME								= "CTP404_Sensitom_4M";
	PHANTOM_NAME_FOLDER								= FOLDER_SEPARATOR + PHANTOM_BASENAME;
	RUN_DATE										= "15-05-24";
	//RUN_DATE 										= "14-12-11";
	RUN_DATE_FOLDER									= GEANT4_DATA_FOLDER_BASENAME + RUN_DATE;
	RUN_NUMBER_FOLDER								= FOLDER_SEPARATOR + "0001";
	PREPROCESS_DATE_FOLDER							= FOLDER_SEPARATOR + "15-05-24";
	//PREPROCESS_DATE								= FOLDER_SEPARATOR + "14-12-11";
	RECON_DATA_PATH_SUFFIX							= "B_25600";
	
	// Options controlling construction of reconstruction_data_dir/TEST_BATCH_DIR
	DRIVE_C											= "C";
	DRIVE_D											= "D";
	SIMULATED_SCAN 									= false;
	EXPERIMENTAL_SCAN 								= !SIMULATED_SCAN;
	simulated_scan 									= SIMULATED_SCAN;
	experimental_scan 								= EXPERIMENTAL_SCAN;
	CURRENT_RECON_DATA_DRIVE						= DRIVE_D;
	CURRENT_RECON_DATA_TYPE							= EXPERIMENTAL_DATA;
	
	if(CURRENT_RECON_DATA_DRIVE == DRIVE_C)					RECON_DATA_DIR 	= RECON_DATA_DIR_C;
	else if(CURRENT_RECON_DATA_DRIVE == DRIVE_D)			RECON_DATA_DIR 	= RECON_DATA_DIR_D;
	if(CURRENT_RECON_DATA_TYPE == SIMULATED_DATA) 			TEST_BATCH_DIR 	= RECON_DATA_DIR + PHANTOM_NAME_FOLDER + SIMULATED_DATA_FOLDER + RUN_DATE_FOLDER + RUN_NUMBER_FOLDER + OUTPUT_FOLDER + PREPROCESS_DATE_FOLDER + FOLDER_SEPARATOR;
	//else if(CURRENT_RECON_DATA_TYPE == EXPERIMENTAL_DATA)	TEST_BATCH_DIR 	= RECON_DATA_DIR + PHANTOM_NAME_FOLDER + EXPERIMENTAL_DATA_FOLDER + RUN_DATE_FOLDER + RUN_NUMBER_FOLDER + OUTPUT_FOLDER + PREPROCESS_DATE_FOLDER + FOLDER_SEPARATOR;		
	else if(CURRENT_RECON_DATA_TYPE == EXPERIMENTAL_DATA)	TEST_BATCH_DIR 	= RECON_DATA_DIR + PHANTOM_NAME_FOLDER + EXPERIMENTAL_DATA_FOLDER + FOLDER_SEPARATOR;		
	
	//D:\pCT\pCT_data\reconstruction_data\CTP404_Sensitom\Experimental\B_25600\B_25600_L_0.000100_TV_1_A_0.750000_L0_0_Nk_4
	PROMPT_TEST_BATCH_DIR							= true;
	if(PROMPT_TEST_BATCH_DIR)
			TEST_BATCH_DIR 									= getDirectory("Choose a Directory");
	else
		TEST_BATCH_DIR 									= RECON_DATA_DIR + PHANTOM_NAME_FOLDER + EXPERIMENTAL_DATA_FOLDER + FOLDER_SEPARATOR + "B_25600" + FOLDER_SEPARATOR; //+ "07072018" + FOLDER_SEPARATOR;		
		
	// Input/output info and data basenames/filenames
	MATERIAL_RSP_DEFS_FILENAME 						= "material_RSP_defs.txt";
	MATERIAL_RSP_DEFS_PATH 							= GITHUB_MACRO_DIR + FOLDER_SEPARATOR + MATERIAL_RSP_DEFS_FILENAME;
	ROI_DEFINITIONS_FILENAME_SUFFIX					= "_ROIs" + TXT;	
	ROI_DEFINITIONS_FILENAME						= PHANTOM_BASENAME + ROI_DEFINITIONS_FILENAME_SUFFIX;
	ROI_DEFINITIONS_FILE_PATH						= GITHUB_MACRO_DIR + FOLDER_SEPARATOR + ROI_DEFINITIONS_FILENAME;
	AUTO_BREAK_FILENAME 							= "autobreak.txt";
	AUTO_BREAK_PATH 								= GITHUB_MACRO_DIR + AUTO_BREAK_FILENAME;
	//ANALYSIS_CFG_INFO_FILENAME						= "analysis.txt";
	ANALYSIS_CFG_INFO_FILENAME						= "analysis.cfg";
	ANALYSIS_CFG_INFO_FILE_PATH						= GITHUB_MACRO_DIR + ANALYSIS_CFG_INFO_FILENAME;
	PARAMETER_TEST_INFO_BASENAME					= "Test_Parameters_";
	SPECIFIC_DATA_FOLDERS_FILENAME 					= "ROI_analysis_folders.txt";
	RECON_FOLDERS_FILENAME 							= "reconstruction_folders.txt";
	AVERAGING_FOLDERS_FILENAME 						= "averaging_folders.txt";
	MULTIPLOT_FOLDERS_FILENAME 						= "multiplot_folders.txt";
	ANALYSIS_LOG_FNAME 								= "AnalysisLog.nfo";
	COMPARED_FOLDERS_FILENAME 						= "compared_folders.txt";	
	PROFILE_CSV_BASENAME 							= "Line_Profiles";
	PROFILE_DATA_FILE_BASENAMES 					= "Line_Profile";
	REGIONS_DATA_FILE_BASENAMES						= "Region_Statistics";
	GRADIENT_CSV_BASENAME 							= "Gradients";
	GRADIENT_DATA_FILE_BASENAMES 					= "Gradient";	
	
	// Input/Output dir/subdir names/prefixes 
	RECONSTRUCTED_IMAGE_FOLDER_PREFIX 				= "x";
	RECONSTRUCTED_IMAGE_FILE_BASENAMES 				= "x_";
	RECONSTRUCTED_IMAGE_FILE_SHORT_BASENAMES 		= "x";
	INITIAL_ITERATE_FILENAME 						= RECONSTRUCTED_IMAGE_FILE_BASENAMES + "0" + TXT;	
	COMPARED_DATA_FOLDER_SUFFIX						= "_compared";
	AVERAGED_DATA_FOLDER_SUFFIX						= "_avg";
	ITERATION_2_ANALYZE_FOLDER_PREFIX 				= "Iteration_";
	ROI_ANALYSIS_SLICE_2_ANALYZE_FOLDER_PREFIX 		= "Slice_";
	SLICE_2_ANALYZE_FOLDER_PREFIX 					= "Slice_";
	SLICE_2_ANALYZE_FOLDER_SHORT_PREFIX 			= "s";
	ROI_SELECTION_DIAMETER_FOLDER_PREFIX 			= "d";

	RSP_DATA_FILE_BASENAMES							= "RSP";
	RSP_ERROR_DATA_FILE_BASENAMES					= "RSP_Error";
	STD_DEV_DATA_FILE_BASENAMES						= "Std_Dev";
	TV_DATA_FILE_BASENAMES							= "TV";
	TV_MEASUREMENTS_BASENAME						= "TV_measurements";
	TV_STEP_DATA_FILE_BASENAMES						= "TV_step";
	TV_diff_DATA_FILE_BASENAMES						= "TV_diff";	
	
	RSP_DATA_FILE_BASE_NICKNAMES					= "RSP";
	RSP_ERROR_DATA_FILE_BASE_NICKNAMES				= "RSPe";
	STD_DEV_DATA_FILE_BASE_NICKNAMES				= "SD";
	TV_DATA_FILE_BASE_NICKNAMES						= "TV";
	TV_MEASUREMENTS_BASE_NICKNAME					= "TV";
	TV_STEP_DATA_FILE_BASE_NICKNAMES				= "TVs";
	TV_diff_DATA_FILE_BASE_NICKNAMES				= "TVd";	
	
	RSP_OUTPUT_BASENAMES							= "RSP";
	RSP_ERROR_OUTPUT_BASENAMES						= "RSP_Error";
	STD_DEV_OUTPUT_BASENAMES						= "Std_Dev";
	TV_OUTPUT_BASENAMES								= "TV";
	TV_STEP_OUTPUT_BASENAMES						= "TV_step";
	TV_diff_OUTPUT_BASENAMES						= "TV_diff";	
	
	RSP_OUTPUT_SHORT_BASENAMES						= "RSP";
	RSP_ERROR_OUTPUT_SHORT_BASENAMES				= "RSPe";
	STD_DEV_OUTPUT_SHORT_BASENAMES					= "SD";
	TV_OUTPUT_SHORT_BASENAMES						= "TV";
	TV_STEP_OUTPUT_SHORT_BASENAMES					= "TVs";
	TV_diff_OUTPUT_SHORT_BASENAMES					= "TVd";	
	
	ROI_ANALYSIS_TV_IFNAME							= TV_MEASUREMENTS_BASENAME 		+ TXT;	
	ROI_ANALYSIS_RSP_OFNAME							= RSP_DATA_FILE_BASENAMES 		+ CSV;
	ROI_ANALYSIS_RSP_ERROR_OFNAME					= RSP_ERROR_DATA_FILE_BASENAMES	+ CSV;
	ROI_ANALYSIS_STD_DEV_OFNAME						= STD_DEV_DATA_FILE_BASENAMES  	+ CSV;
	ROI_ANALYSIS_TV_OFNAME							= TV_DATA_FILE_BASENAMES		+ TXT;
	//***********************************************************************************************************************************************************************************************************//
	//********************************************************************************** Log Printing Properties and Settings ***********************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	num_tab_spaces 										= 8;
	String.resetBuffer; 
	for(i = 0; i < num_tab_spaces; i++)
		String.append(" ");
	//print_newline										= "\n";
	tab_string											= "\t";
	//tab_as_spaces_string								= "    ";
	tab_as_spaces_string								= String.buffer;
	if(exporting_log)
		print_tab										= tab_string;
	else
		print_tab										= tab_as_spaces_string;
	//***********************************************************************************************************************************************************************************************//
	//****************************************************** Parse the externally specified ROI analysis configurations from analysis.cfg file ******************************************************//
	//***********************************************************************************************************************************************************************************************//
	cfg_parameter_decodings						= newArray(BOOL_DECODING_OP, FLOAT_DECODING_OP, FLOAT_DECODING_OP, FLOAT_DECODING_OP, FLOAT_DECODING_OP, BOOL_DECODING_OP, BOOL_DECODING_OP, INT_DECODING_OP, INT_DECODING_OP, INT_DECODING_OP, INT_DECODING_OP, INT_DECODING_OP);		
	cfg_parameter_list							= newArray("simulated_scan", "voxel_width", "voxel_height", "voxel_thickness", "voxels_per_mm", "flip_horizontally", "flip_vertically", "num_recon_iterations", "first_iteration_2_analyze", "last_iteration_2_analyze", "first_slice_2_analyze", "last_slice_2_analyze" );
	//cfg_parameter_value_strings				= file_2_key_value_pairs(GITHUB_MACRO_DIR, ANALYSIS_CFG_INFO_FILENAME, 	cfg_parameter_list, DONT_PRINT_PATH);		
	cfg_parameter_values 						= parse_analysis_cfg(cfg_parameter_list, cfg_parameter_decodings, PRINT_ANALYSIS_CFG_PATH);
	simulated_scan 								= cfg_parameter_values[0];
	voxel_width 								= cfg_parameter_values[1];
	voxel_height 								= cfg_parameter_values[2];
	voxel_thickness 							= cfg_parameter_values[3];
	voxels_per_mm 								= cfg_parameter_values[4];
	flip_horizontally 							= cfg_parameter_values[5];
	flip_vertically 							= cfg_parameter_values[6];
	num_recon_iterations 						= cfg_parameter_values[7];
	first_iteration_2_analyze 					= cfg_parameter_values[8];
	last_iteration_2_analyze 					= cfg_parameter_values[9];
	first_slice_2_analyze 						= cfg_parameter_values[10];
	last_slice_2_analyze 						= cfg_parameter_values[11];
	print_analysis_cfgs							(cfg_parameter_list, cfg_parameter_values, cfg_parameter_decodings);
	//***********************************************************************************************************************************************************************************************//
	//************************************************** Import ROI definitions for current phantom and set corresponding internal variables/arrays *************************************************//
	//***********************************************************************************************************************************************************************************************//
	ROI_parameter_decodings						= newArray(ROI_DEFINITION_STRINGS_DECODING_OP, ROI_DEFINITION_STRINGS_DECODING_OP, ROI_DEFINITION_STRINGS_DECODING_OP, ROI_DEFINITION_STRINGS_DECODING_OP, ROI_DEFINITION_NUMBERS_DECODING_OP, ROI_DEFINITION_NUMBERS_DECODING_OP, ROI_DEFINITION_NUMBERS_DECODING_OP, ROI_DEFINITION_STRINGS_DECODING_OP);		
	ROI_definitions_parameter_list				= newArray("ROI_material_names", "ROI_labels", "ROI_label_nicknames", "ROI_shapes", "ROI_diameters", "ROI_selection_radii", "ROI_profile_radius_beyond_ROI", "bulk_material" );
	ROI_parameter_strings						= file_2_key_value_pairs(GITHUB_MACRO_DIR, ROI_DEFINITIONS_FILENAME, 	ROI_definitions_parameter_list, print_ROI_definitions_path);		
	ROI_material_names 							= ROI_parameter_string_2_values(ROI_definitions_parameter_list[0],  ROI_definitions_parameter_list, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_DEFINITION_NUMBERS_DECODING_OP, true);	
	ROI_labels 									= ROI_parameter_string_2_values(ROI_definitions_parameter_list[1], 	ROI_definitions_parameter_list, ROI_parameter_strings,  ROI_parameter_decodings, ROI_DEFINITION_NUMBERS_DECODING_OP, true);
	ROI_label_nicknames 						= ROI_parameter_string_2_values(ROI_definitions_parameter_list[2], 	ROI_definitions_parameter_list, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_DEFINITION_NUMBERS_DECODING_OP, true);					//bulk_material = bulk_material[0];
	ROI_shapes 									= ROI_parameter_string_2_values(ROI_definitions_parameter_list[3], 	ROI_definitions_parameter_list, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_DEFINITION_NUMBERS_DECODING_OP, true);	
	ROI_diameters 								= ROI_parameter_string_2_values(ROI_definitions_parameter_list[4],	ROI_definitions_parameter_list, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_DEFINITION_NUMBERS_DECODING_OP, true);
	ROI_selection_radii 						= ROI_parameter_string_2_values(ROI_definitions_parameter_list[5], 	ROI_definitions_parameter_list, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_DEFINITION_NUMBERS_DECODING_OP, true);
	ROI_profile_radius_beyond_ROI	 			= ROI_parameter_string_2_values(ROI_definitions_parameter_list[6],	ROI_definitions_parameter_list, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_DEFINITION_NUMBERS_DECODING_OP, false);	//ROI_profile_radius_beyond_ROI = ROI_profile_radius_beyond_ROI[0];
	bulk_material 								= ROI_parameter_string_2_values(ROI_definitions_parameter_list[7], 	ROI_definitions_parameter_list, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_DEFINITION_NUMBERS_DECODING_OP, false);					//bulk_material = bulk_material[0];
	bulk_material_RSP 							= material_name_2_RSP(bulk_material, simulated_scan);
	ROI_material_RSPs 							= ROI_material_names_2_RSPs(ROI_material_names, simulated_scan);
	num_ROIs_2_analyze 							= ROI_material_names.length; 						// # of material ROIs in phantom
	//***********************************************************************************************************************************************************************************************//
	//************************************************************************************** Parameter value arrays *********************************************************************************//
	//***********************************************************************************************************************************************************************************************//
	empty_array 										= newArray();								// Passed to set_plot_extrema when no additional lines are plotted
	sequential_values									= Array.getSequence(100);					// Long sequential values array which other sequence arrays can be sliced from	
	num_specs 											= 4;										// # of test parameter properties specified in Specs file
	voxel_width 										= 1;										// 
	voxel_height										= 1;
	voxel_thickness										= 2.5;	
	voxel_dimensions									= newArray(voxel_width, voxel_height, voxel_thickness);
	voxels_per_mm										= 1;			
	flip_horizontally									= false;									// Specify if correct orientation of reconstructed images requires flipping horizontally
	flip_vertically										= true;										// Specify if correct orientation of reconstructed images requires flipping vertically
	num_recon_iterations 								= 12;										// # of iterations of feasibility seeking performed in reconstruction
	images_per_recon 									= num_recon_iterations + 1;					// 	
	first_iteration_2_analyze							= 0;
	last_iteration_2_analyze							= 12;
	iterations_2_analyze								= Array.slice(sequential_values, first_iteration_2_analyze, last_iteration_2_analyze + 1);
	num_iterations_2_analyze							= iterations_2_analyze.length;				// # of iterations of feasibility seeking image results to analyze
	iterations_2_analyze_string_precision 				= 0;										// # of digits after decimal point to use in conversion of iteration # to string 	
	//first_slice_2_analyze 							= x_slices/2;								// first slice analyzed by pCT_Analysis macro
	//last_slice_2_analyze 								= x_slices/2;								// last slice analyzed by pCT_Analysis macro		
	first_slice_2_analyze								= 11;
	last_slice_2_analyze								= 11;
	slices_2_analyze									= Array.slice(sequential_values, first_slice_2_analyze, last_slice_2_analyze + 1);
	num_slices_2_analyze								= slices_2_analyze.length;					// 
	slices_2_analyze_string_precision 					= 0;										// # of digits after decimal point to use in conversion of slice # to string 	
	ROI_radii 											= newArray(ROI_diameters.length);			// radii of circular selections used to analyze phantom ROIs
	ROI_profile_radii 									= newArray(ROI_diameters.length);			// Set distance to extend profile line left/right from material insert ROI centers
	//ROI_std_selection_radii 							= newArray(3.5, 4.0, 6.0);					// radii of circular selections used to analyze phantom ROIs
	//ROI_selection_radii 								= Array.slice(ROI_std_selection_radii,0,1);	// radii of circular selections used to analyze phantom ROIs
	ROI_selection_diameters 							= Array.copy(ROI_selection_radii);//newArray(ROI_selection_radii.length);		// diameters of circular selections used to analyze phantom ROIs	
	ROI_selection_diameter_string_precision				= 0;										// # of digits after decimal point to use in conversion of an ROI selection diameter value to string	
	num_ROI_selection_diameters							= ROI_selection_diameters.length;			// diameters of circular selections used to analyze phantom ROIs 
	//***********************************************************************************************************************************************************************************************//
	//************************************************************ Construct commonly used strings for parameter values and files/folders ***********************************************************//
	//***********************************************************************************************************************************************************************************************//	
	reconstructed_image_strings 						= newArray(images_per_recon);		
	reconstructed_image_short_strings 					= newArray(images_per_recon);		
	reconstructed_image_folders 						= newArray(images_per_recon);		
	reconstructed_image_short_folders 					= newArray(images_per_recon);		
	reconstructed_image_filenames 						= newArray(images_per_recon);		
	iterations_2_analyze_strings 						= newArray(images_per_recon);		
	iterations_2_analyze_folders 						= newArray(images_per_recon);		
	slices_2_analyze_strings 							= newArray(num_slices_2_analyze);						
	slices_2_analyze_folders 							= newArray(num_slices_2_analyze);						
	ROI_analysis_slices_2_analyze_folders 				= newArray(num_slices_2_analyze);						
	slices_2_analyze_short_strings 						= newArray(num_slices_2_analyze);						
	slices_2_analyze_short_folders 						= newArray(num_slices_2_analyze);						
	ROI_selection_diameter_strings 						= newArray(num_ROI_selection_diameters);				
	ROI_selection_diameter_folders 						= newArray(num_ROI_selection_diameters);
	for(i = 0; i <= num_recon_iterations; i++)	
	{							
		reconstructed_image_strings[i] 					= RECONSTRUCTED_IMAGE_FILE_BASENAMES + d2s(i, iterations_2_analyze_string_precision);		
		reconstructed_image_folders[i] 					= FOLDER_SEPARATOR +  RECONSTRUCTED_IMAGE_FILE_BASENAMES + d2s(i, iterations_2_analyze_string_precision);	
		reconstructed_image_short_strings[i] 			= RECONSTRUCTED_IMAGE_FILE_SHORT_BASENAMES + d2s(i, iterations_2_analyze_string_precision);		
		reconstructed_image_short_folders[i] 			= FOLDER_SEPARATOR +  RECONSTRUCTED_IMAGE_FILE_SHORT_BASENAMES + d2s(i, iterations_2_analyze_string_precision);	
		reconstructed_image_filenames[i] 				= RECONSTRUCTED_IMAGE_FILE_BASENAMES + d2s(i, iterations_2_analyze_string_precision) + TXT;		
		iterations_2_analyze_strings[i] 				= d2s(i, iterations_2_analyze_string_precision);		
		iterations_2_analyze_folders[i] 				= FOLDER_SEPARATOR + ITERATION_2_ANALYZE_FOLDER_PREFIX + d2s(i, iterations_2_analyze_string_precision);	
	}	
	for(i = 0; i < num_slices_2_analyze; i++)	
	{							
		slices_2_analyze_strings[i] 					= d2s(slices_2_analyze[i], slices_2_analyze_string_precision);		
		slices_2_analyze_folders[i] 					= FOLDER_SEPARATOR + SLICE_2_ANALYZE_FOLDER_PREFIX + d2s(slices_2_analyze[i], slices_2_analyze_string_precision);	
		slices_2_analyze_short_strings[i] 				= d2s(slices_2_analyze[i], slices_2_analyze_string_precision);		
		slices_2_analyze_short_folders[i] 				= FOLDER_SEPARATOR + SLICE_2_ANALYZE_FOLDER_SHORT_PREFIX + d2s(slices_2_analyze[i], slices_2_analyze_string_precision);	
		ROI_analysis_slices_2_analyze_folders[i]		= FOLDER_SEPARATOR + ROI_ANALYSIS_SLICE_2_ANALYZE_FOLDER_PREFIX + d2s(slices_2_analyze[i], slices_2_analyze_string_precision);	
	}
	for(i = 0; i < num_ROI_selection_diameters; i++)								
	{																					
		ROI_selection_diameters[i] 						= 2 * ROI_selection_radii[i];									
		ROI_selection_diameter_strings[i] 				= d2s(ROI_selection_diameters[i], ROI_selection_diameter_string_precision);	
		ROI_selection_diameter_folders[i] 				= FOLDER_SEPARATOR + ROI_SELECTION_DIAMETER_FOLDER_PREFIX + d2s(ROI_selection_diameters[i], ROI_selection_diameter_string_precision);		
	}																								
	for(i = 0; i < ROI_diameters.length; i++)
	{
		ROI_radii[i] 									= ROI_diameters[i] / 2;		
		ROI_profile_radii[i]							= ROI_radii[i] + ROI_profile_radius_beyond_ROI;	
	}			
	//Ap(ROI_selection_radii);
	//Ap(ROI_selection_diameters);
	//exit();
	//reconstructed_image_range_string					= "[" + reconstructed_image_strings[0] + "-" + reconstructed_image_strings[last_iteration_2_analyze] + "]";
	reconstructed_image_range_string					= RECONSTRUCTED_IMAGE_FILE_SHORT_BASENAMES + "[" + iterations_2_analyze_strings[1] + "-" + iterations_2_analyze_strings[last_iteration_2_analyze] + "]";
	iterations_2_analyze_range_string					= "[" + iterations_2_analyze_strings[first_iteration_2_analyze] + "-" + iterations_2_analyze_strings[last_iteration_2_analyze] + "]";
	//***********************************************************************************************************************************************************************************************//
	//******************************************************** Construct commonly used strings for parameter values and files/folders ***************************************************************//
	//***********************************************************************************************************************************************************************************************//			
	num_specs 									= 4;										// # of test parameter properties specified in Specs file
	tolerance									= 0.0000001;								// Tolerance separating min/max values of array used in findMinima/findMaxima
	filterwidth 								= 3;										// Width of filter used in median filtering FBP image
	sobel_x 									= "[-1 0 1\n-2 0 2\n-1 0 1\n]";				// Matrix convolved with image to generate approximate image gradient in x-direction
	sobel_y 									= "[-1 -2 -1\n0 0 0\n1 2 1\n]";				// Matrix convolved with image to generate approximate image gradient in y-direction
	scharr_x 									= "[-3 0 3\n-10 0 10\n-3 0 3\n]";			// Matrix convolved with image to generate approximate image gradient in x-direction
	scharr_y 									= "[-3 -10 -3\n0 0 0\n3 10 3\n]";			// Matrix convolved with image to generate approximate image gradient in y-direction
	gradient_x_kernel							= scharr_x;									// Specify which matrix to convolve with image to generate approximate x-direction derivative
	gradient_y_kernel							= scharr_y;									// Specify which matrix to convolve with image to generate approximate x-direction derivative
	x_magnification 							= 5;										// Factor by which extracted slices are magnified before saving as PNG
	lower_limits_scale 							= 0.99;										// Scale factor to apply to minimum value of curve to define lower axis limit
	upper_limits_scale 							= 1.01;										// Scale factor to apply to maximum value of curve to define upper axis limit
	difference_scale							= 0.1;										// Scale factor to apply to minimum/maximum value of y-axis to improve appearance
	alignment_column 							= 25;
	screen_width								= screenWidth;
	screen_height								= screenHeight;
	x_frame_size								= 480;										// Size of plots (in pixels) in x-direction
	y_frame_size								= 380;										// Size of plots (in pixels) in y-direction
	//x_frame_size								= 1200;										// Size of plots (in pixels) in x-direction
	//y_frame_size								= 600;										// Size of plots (in pixels) in y-direction
	//text_xpos_ratio								= 0.5;									//
	//text_ypos_ratio								= 0.07;									//
	text_xpos_ratio								= 0.45;										//
	text_ypos_ratio								= 0.01;										//
	//text_size									= 40;
	//legend_text_size							= 22;
	//axis_label_text_size						= 34;
	text_size									= 30;
	legend_text_size							= 22;
	axis_label_text_size						= 28;
	data_line_color								= "blue";									// Specify color of primary plot curves
	add_line_color								= "green";									// Specify color of secondary plot curves
	color_rotation								= newArray("green", "blue",  "cyan",  "magenta", "orange", "red", "pink", "yellow", "darkGray", "gray", "lightGray", "black", "white"); 
	add_text_justification						= "center";									//
	linewidth									= 3.5;										//
	plot_parameters 							= newArray(voxel_width, tolerance, lower_limits_scale, upper_limits_scale, difference_scale, x_frame_size, y_frame_size, text_xpos_ratio, text_ypos_ratio, add_line_color, linewidth);
	grayscale_range_min							= 0.0;										// Specify min value of grayscale range, all values at or below are shown as black 
	grayscale_range_max							= 2.0;										// Specify max value of grayscale range, all values at or above are shown as white 
	GIF_frame_rate								= 4;										// Specify animated GIF's frame rate in frames per second (fps)
	animated_GIF_info							= newArray(print_MVP_GIF_paths, close_stack_images, close_MVP_stack_images, GIF_frame_rate );
	AVI_compression_format						= PNG_COMPRESSION;							// Specify image compression format used in constructing AVI  video from image stack
	AVI_frame_rate								= 5;										// Specify AVI video frame rate in frames per second (fps)	
	AVI_info									= newArray(print_MVP_AVI_paths, close_stack_images, close_MVP_stack_images, AVI_frame_rate, AVI_compression_format );	
	INPUT_FILE_LIST 							= newArray();   		
	OUTPUT_FILE_LIST							= newArray();
	COPIED_FILE_LIST							= newArray();
	COPIED_FILE_FROM_LIST						= newArray();
	COPIED_FILE_TO_LIST							= newArray();
	DIRECTORIES_CREATED							= newArray();
	debug_print_counter							= 1;
	//***********************************************************************************************************************************************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	//************************************************************ Set Parameter Names/Values and Construct Paths to Corresponding Data *************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	//---------------------------------------------- Specifications used to identify file containing specifications of parameters of parameter value test -------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	parameter_test_number						= 1;
	parameter_test_info_filename				= PARAMETER_TEST_INFO_BASENAME + d2s(parameter_test_number, 0)  + TXT;
	parameter_test_info 						= file_2_array(RECON_DATA_DIR_D, parameter_test_info_filename, print_input_data_path);
	num_parameters 								= parameter_test_info.length;
	PVs 										= newArray();
	num_PVs 									= newArray(num_parameters);
	parameter_string_prefixes 					= newArray(num_parameters);
	parameter_string_short_prefixes 			= newArray(num_parameters);
	parameter_string_precisions 				= newArray(num_parameters);				
	for(i = 0; i < parameter_test_info.length; i++)
	{
		parameter_info 							= split(parameter_test_info[i]);
		parameter_string_prefixes[i] 			= parameter_info[0];
		parameter_string_short_prefixes[i] 		= parameter_info[1];
		parameter_string_precisions[i] 			= parseInt(parameter_info[2]);
		num_PVs[i] 								= parameter_info.length - 3;
		parameter_elements 						= Array.slice(parameter_info, 3, parameter_info.length);
		PVs 									= Array.concat(PVs, parameter_elements);		
	}
	PV_offsets 									= generate_PV_offsets(num_PVs);
	PV_strings 									= generate_all_PV_strings(PVs, num_PVs, PV_offsets, parameter_string_precisions);
	modulo_values 								= generate_modulo_values(num_PVs);
	total_combinations 							= series_product(num_PVs);
	//***********************************************************************************************************************************************************************************************//
	//************************************************************************************** Parameter value test  *********************************************************************************//
	//***********************************************************************************************************************************************************************************************//	
	//xaxis_param								= num_parameters;
	TTP							= num_parameters;
	TTP_index					= num_parameters - 1;
	TTP_prefix					= parameter_string_prefixes[TTP_index];
	TTP_values 					= extract_PVs(TTP_index, PVs, num_PVs, PV_offsets);		
	TTP_value_strings 			= generate_PV_strings(TTP_values, parameter_string_precisions[TTP_index], false);
	TTP_value_short_strings 	= generate_PV_strings(TTP_values, parameter_string_precisions[TTP_index], true);
	TTP_equals_strings			= PVs_2_parameter_equals_strings(TTP_values, TTP_prefix, parameter_string_precisions[TTP_index]);
	TTP_equals_short_strings	= PVs_2_parameter_equals_short_strings(TTP_values, TTP_prefix, parameter_string_precisions[TTP_index]);
	TTP_min_value				= TTP_values[0];
	TTP_max_value				= TTP_values[TTP_values.length - 1];
	TTP_min_value_string		= TTP_value_short_strings[0];
	TTP_max_value_string		= TTP_value_short_strings[TTP_values.length - 1];
	TTP_range_suffix			=  "["	+ TTP_min_value_string + "-" + TTP_max_value_string + "]";						// e.g. [1-12]
	TTP_range_filenaming 		= parameter_string_prefixes[TTP_index] 	+ 			TTP_range_suffix;					// e.g. L0_0_Nk[1-12]	
	TTP_range_plots 			= parameter_string_prefixes[TTP_index] 	+ " = " + 	TTP_range_suffix;					// e.g. L0_0_Nk = [1-12]		
	num_TTP_values 				= num_PVs[TTP_index];
	num_TTP_tests 				= total_combinations / num_TTP_values;	
	//***********************************************************************************************************************************************************************************************//
	//************************************************************************************** Parameter value test  *********************************************************************************//
	//***********************************************************************************************************************************************************************************************//	
	MVP_parameter_prefix					= "A";																						// Specifying multiplot target parameter using its parameter string prefix
	MVP_parameter_index						= parameter_string_2_index(parameter_string_prefixes, MVP_parameter_prefix);			// Multiplot target parameter index (from 0 - N-1)used to access elements of the parameter values/strings/precisions arrays
	MVP_parameter							= MVP_parameter_index + 1;															// Multiplot target parameter # from 1-N, not it's array index (i.e. from 0 - N-1)	
	MVP_PVs									= extract_PVs(MVP_parameter_index, PVs, num_PVs, PV_offsets);
	MVP_PV_strings 							= generate_PV_strings(MVP_PVs,  parameter_string_precisions[MVP_parameter_index], false);
	MVP_PV_short_strings 					= generate_PV_strings(MVP_PVs,  parameter_string_precisions[MVP_parameter_index], true);
	MVP_parameter_equals_strings			= PVs_2_parameter_equals_strings(MVP_PVs, MVP_parameter_prefix, parameter_string_precisions[MVP_parameter_index]);
	MVP_parameter_equals_short_strings		= PVs_2_parameter_equals_short_strings(MVP_PVs, MVP_parameter_prefix, parameter_string_precisions[MVP_parameter_index]);
	MVP_test_parameter_min_value			= MVP_PVs[0];
	MVP_test_parameter_max_value			= MVP_PVs[MVP_PVs.length - 1];
	MVP_parameter_min_value_string			= MVP_PV_short_strings[0];
	MVP_parameter_max_value_string			= MVP_PV_short_strings[MVP_PVs.length - 1];
	MVP_parameter_range_suffix				=  "["	+ MVP_parameter_min_value_string + "-" + MVP_parameter_max_value_string + "]";										// e.g.[0-1]
	MVP_parameter_range_filenaming 			= parameter_string_prefixes[MVP_parameter_index] + MVP_parameter_range_suffix;		;										// e.g.TV[0-1]
	MVP_parameter_range_plots	 			= parameter_string_prefixes[MVP_parameter_index] + " = " + MVP_parameter_range_suffix;										// e.g. TV = [0-1]	
	MVP_animations_first_iteration			= 1;
	MVP_animations_last_iteration			= 12;
	MVP_animations_image_range_string		= "[" + reconstructed_image_strings[MVP_animations_first_iteration] + "-" + reconstructed_image_strings[MVP_animations_last_iteration] + "]";
	MVP_animations_iteration_range_string	= "[" + iterations_2_analyze_strings[MVP_animations_first_iteration] + "-" + iterations_2_analyze_strings[MVP_animations_last_iteration] + "]";	
	num_MVP_PVs								= num_PVs[MVP_parameter_index];			
	reduced_TTP_index						= TTP_index - 1;
	reduced_modulo_values 					= generate_reduced_modulo_values(num_PVs, modulo_values, MVP_parameter_index);
	reduced_PV_offsets 						= generate_reduced_PV_offsets(num_PVs, PV_offsets, MVP_parameter_index);	
	reduced_total_combinations 				= total_combinations / num_MVP_PVs;
	//***********************************************************************************************************************************************************************************************//
	//********************************************** For each parameter test value combination, determine path/folder of reconstruction results value ***********************************************//
	//***********************************************************************************************************************************************************************************************//
	PVT_identifier 							= generate_combined_PV_range_string(PVs, num_PVs, PV_offsets, parameter_string_prefixes, parameter_string_precisions);
	//PVTs_parent_dir						= TEST_BATCH_DIR;
	//PVT_input_dir							= TEST_BATCH_DIR;
	//PVT_output_dir						= TEST_BATCH_DIR;
	PVTs_input_dir_parent					= TEST_BATCH_DIR;
	PVTs_output_dir_parent					= TEST_BATCH_DIR;	
	////current_PVT_output_dir 				= construct_valid_dir_path(TEST_BATCH_DIR, PVT_identifier);
	//current_PVT_output_dir_parent 			= construct_valid_dir_path(TEST_BATCH_DIR, PVT_identifier);
	//dir_created_successfully				= make_dir_recorded(current_PVT_output_dir_parent, DIRECTORIES_CREATED, print_directories_created);
	////parameter_test_dir 					= construct_valid_dir_path(TEST_BATCH_DIR, PVT_identifier);
	////make_dir_recorded						(parameter_test_dir, DIRECTORIES_CREATED, print_directories_created);
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
	reduced_PVs_lower 							= Array.slice	(PVs, 0, PV_offsets[MVP_parameter_index]					);
	reduced_PVs_upper 							= Array.slice	(PVs,  PV_offsets[MVP_parameter], PVs.length);
	reduced_PVs 								= Array.concat	(reduced_PVs_lower, reduced_PVs_upper									);	
	all_parameter_combination_indices 			= newArray		();
	all_parameter_combinations 					= newArray		();
	all_folder_strings 							= newArray		(total_combinations);
	all_path_strings 							= newArray		(total_combinations);	
	all_reduced_parameter_combination_indices 	= newArray		();	    
	all_reduced_parameter_combinations 			= newArray		();
	all_reduced_folder_strings 					= newArray		(total_combinations);
	all_reduced_path_strings 					= newArray		(total_combinations);
	//exit();	
	for(combination_index = 0; combination_index < total_combinations; combination_index++)
	{
		//*******************************************************************************************************************************************************************************************//
		//***************************** Generate standard parameter value combinations and folders/paths ordered by target test parameter ***********************************************************//
		//*******************************************************************************************************************************************************************************************//
		parameter_combination_indices		 				= generate_parameter_test_combination_indices(TTP_index, combination_index, modulo_values, PV_offsets );
		parameter_combination 								= generate_parameter_test_combination(parameter_combination_indices, PVs);
		all_parameter_combination_indices 					= Array.concat(all_parameter_combination_indices, parameter_combination_indices); 	
		all_parameter_combinations 							= Array.concat(all_parameter_combinations, parameter_combination); 	
		folder_string										= generate_parameter_test_folder(parameter_string_prefixes, parameter_string_precisions, parameter_combination );		
		all_folder_strings[combination_index] 				= folder_string;		
		all_path_strings[combination_index] 				= TEST_BATCH_DIR + all_folder_strings[combination_index];	
		//*******************************************************************************************************************************************************************************************//
		//********************** Generate multiplotting parameter value combinations and folders/paths ordered by multiplotting target parameter ****************************************************//
		//*******************************************************************************************************************************************************************************************//		
		if(combination_index < reduced_total_combinations)
		{
			reduced_parameter_combination_indices 			= generate_parameter_test_combination_indices(TTP_index - 1, combination_index, reduced_modulo_values, reduced_PV_offsets );
			reduced_parameter_combination 					= generate_parameter_test_combination(reduced_parameter_combination_indices, reduced_PVs);			
			all_reduced_parameter_combination_indices		= Array.concat(all_reduced_parameter_combination_indices, reduced_parameter_combination_indices); 
			all_reduced_parameter_combinations 				= Array.concat(all_reduced_parameter_combinations, reduced_parameter_combination); 
			start_index 									= combination_index * num_MVP_PVs;
			for(i = 0; i < num_MVP_PVs; i++)
			{
				folder_string 								= generate_parameter_test_MVP_folder(MVP_parameter_index, reduced_parameter_combination, i, PVs, PV_offsets, parameter_string_prefixes, parameter_string_precisions );							
				all_reduced_folder_strings[start_index + i] = folder_string;
				all_reduced_path_strings[start_index + i] 	= TEST_BATCH_DIR + folder_string;	
			}		
		}				
	} // END for( combination_index = 0; combination_index < total_combinations; combination_index++)
	//exit();
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//	
	ROIs_per_recon 											= num_ROIs_2_analyze * images_per_recon;
	ROIs_per_test 											= ROIs_per_recon * num_TTP_values;
	ROIs_per_MVP_data 										= ROIs_per_test * num_MVP_PVs;
	ROIs_per_test_iteration									= num_TTP_values * num_ROIs_2_analyze;									
	ROI_material_RSP_line_by_target_parameter				= newArray(num_TTP_values);
	before_TVS_index 										= 0;
	after_TVS_index 										= 1;
	TV_step_measurements_per_iteration						= 2;
	TV_step_measurements_per_recon 							= num_recon_iterations * TV_step_measurements_per_iteration;
	TV_step_measurements_per_MVP_curve 						= num_TTP_values * TV_step_measurements_per_iteration;
	TV_step_measurements_per_MVP 							= TV_step_measurements_per_MVP_curve * num_MVP_PVs;
	TV_step_measurements_per_test 							= TV_step_measurements_per_recon * num_TTP_values;					
	TV_measurements_per_recon 								= TV_step_measurements_per_recon 	/ TV_step_measurements_per_iteration;
	TV_measurements_per_MVP_curve 							= TV_step_measurements_per_MVP_curve 	/ TV_step_measurements_per_iteration;
	TV_measurements_per_MVP 								= TV_step_measurements_per_MVP	 	/ TV_step_measurements_per_iteration;
	TV_measurements_per_test 								= TV_step_measurements_per_test 			/ TV_step_measurements_per_iteration;						
	TV_measurement_plots_per_iteration 						= 1;
	TV_diff_measurements_per_recon 							= TV_step_measurements_per_recon 	/ TV_step_measurements_per_iteration;
	TV_diff_measurements_per_MVP_curve 						= TV_step_measurements_per_MVP_curve 	/ TV_step_measurements_per_iteration;
	TV_diff_measurements_per_MVP 							= TV_step_measurements_per_MVP	 	/ TV_step_measurements_per_iteration;
	TV_diff_measurements_per_test 							= TV_step_measurements_per_test 			/ TV_step_measurements_per_iteration;						
	num_input_directories									= lengthOf(all_reduced_path_strings);
	num_input_directories_per_MVP							= num_MVP_PVs * num_TTP_values;
	num_MVP_analyses										= num_input_directories / num_input_directories_per_MVP;
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//
	zero_line_by_target_PVs 								= newArray(num_TTP_values);					
	zero_line_by_iteration									= newArray(ROIs_per_recon);
	zero_line_by_ROI										= newArray(num_ROIs_2_analyze);			
	Array.fill												(zero_line_by_target_PVs, 0);	
	Array.fill												(zero_line_by_iteration, 0);	
	Array.fill												(zero_line_by_ROI, 0);	
	ROI_material_RSP_line_by_target_parameter				= newArray(num_TTP_values);
	ROI_material_RSP_line_no_air							= Array.slice(ROI_material_RSPs, 2, num_ROIs_2_analyze);			
	ROI_material_RSPs_by_iteration							= newArray(ROIs_per_recon);
	RSPs_by_ROI												= newArray(ROIs_per_recon);
	RSPs_by_iteration										= newArray(ROIs_per_recon);
	RSP_errors_by_ROI										= newArray(ROIs_per_recon);
	RSP_errors_by_iteration									= newArray(ROIs_per_recon);
	std_devs_by_ROI											= newArray(ROIs_per_recon);
	std_devs_by_iteration									= newArray(ROIs_per_recon);			
	TV_measurements_by_iteration							= newArray(ROIs_per_recon);
	indices_4_ordering_data 								= generate_ordering_indices(num_recon_iterations, num_ROIs_2_analyze, images_per_recon, num_TTP_values);
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//	
	PVT_RSP_ofname											= RSP_DATA_FILE_BASENAMES 			+ "_" + TTP_range_suffix + TXT;
	PVT_RSP_error_ofname									= RSP_ERROR_DATA_FILE_BASENAMES 	+ "_" + TTP_range_suffix + TXT;
	PVT_std_dev_ofname										= STD_DEV_DATA_FILE_BASENAMES 		+ "_" + TTP_range_suffix + TXT;
	PVT_TV_ofname											= TV_DATA_FILE_BASENAMES 			+ "_" + TTP_range_suffix + TXT;
	PVT_RSP_output_filename2								= RSP_DATA_FILE_BASENAMES 			+ "_" + TTP_range_filenaming + TXT;
	PVT_RSP_error_output_filename2							= RSP_ERROR_DATA_FILE_BASENAMES 	+ "_" + TTP_range_filenaming + TXT;
	PVT_std_dev_output_filename2							= STD_DEV_DATA_FILE_BASENAMES 		+ "_" + TTP_range_filenaming + TXT;
	PVT_TV_output_filename2									= TV_DATA_FILE_BASENAMES 			+ "_" + TTP_range_filenaming + TXT;
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//	
	if											(check_all_paths_existence)
		verify_paths_exist						(all_path_strings, print_missing_paths);		
	if											(log_printing)
	{				
		print_ImageJ_info						();		
		if										(printing_ROI_definitions)
			print_ROI_definitions				();
		if										(printing_reconstructed_image_analysis_info)						
		{
			print_reconstructed_image_info		();
			print_ROI_analysis_info				();
		}
		if										(printing_PVT_info)								
			print_TTP_info						();
		if										(printing_MVP_parameter_info)							
			print_MVP_parameter_info			();
		if										(printing_input_output_filenames)
			print_input_output_filenames		();
	}

	ROI_analysis_targets 						= Array.copy(all_folder_strings);
	print_ROI_analysis_targets					= true;
	//analyze_all_dir_reconstructions			= true;
	//always_perform_analyses
	
	if(analyze_specific_data)
	{
		print_section							("Read list of specific reconstruction data output folders and perform ROI analysis on the corresponding data", PRINT_MAJOR_SECTION);
		specific_data_folders 					= file_2_array(TEST_BATCH_DIR, SPECIFIC_DATA_FOLDERS_FILENAME, PRINT_PATH);	
		ROI_analysis_targets 					= Array.copy(specific_data_folders);
	}
	if(perform_all_missing_analyses)
	{
		print_section							("Performing ROI analysis of all unprocessed reconstructed data sets", PRINT_MAJOR_SECTION);
		recon_data_folders 						= file_2_array(TEST_BATCH_DIR, RECON_FOLDERS_FILENAME, PRINT_PATH);	
		ROI_analysis_targets 					= Array.copy(recon_data_folders);
	}
	if(analyze_all_dir_reconstructions)
	{
		print_section							("Performing ROI analysis of all unprocessed reconstructed data sets in the specified directory: " + TEST_BATCH_DIR, PRINT_MAJOR_SECTION);
		recon_data_folders 						= getDirFolderList(TEST_BATCH_DIR, true);
		ROI_analysis_targets 					= Array.copy(recon_data_folders);
		if(print_ROI_analysis_targets)
			Appsi( "Directories targeted for ROI analysis:", ROI_analysis_targets);
	}
	//exit();
	//if(false)
	if(perform_MVP_analyses)
	{
		print_section							("Perform ROI analysis of ", PRINT_MAJOR_SECTION);
		if(print_ROI_analysis_targets)
			Appsi( "Directories targeted for ROI analysis:", ROI_analysis_targets);
		for(i = 0; i < ROI_analysis_targets.length; i++)
		{
			reconstructed_data_folder 			= ROI_analysis_targets[i];
			print_section						("Performing ROI analysis # " + i + " on: " + reconstructed_data_folder, PRINT_MINOR_SECTION);
			current_analysis_target 			= construct_valid_dir_path(TEST_BATCH_DIR, reconstructed_data_folder );
			recon_data_exists 					= verify_recon_output(TEST_BATCH_DIR, reconstructed_data_folder, reconstructed_image_filenames, ROI_ANALYSIS_TV_IFNAME, PRINT_PATH);
			missing_ROI_analysis_data			= verify_ROI_analysis_output_files(TEST_BATCH_DIR, reconstructed_data_folder, ROI_ANALYSIS_RSP_OFNAME, ROI_ANALYSIS_RSP_ERROR_OFNAME, ROI_ANALYSIS_STD_DEV_OFNAME, ROI_ANALYSIS_TV_IFNAME, ROI_analysis_slices_2_analyze_folders, ROI_selection_diameter_folders, DONT_PRINT_PATH);		
			if(recon_data_exists)
			{
				print("----->Reconstruction data exists...");
				if(missing_ROI_analysis_data)
				{
					runMacro						(ROI_ANALYSIS_MACRO_PATH, current_analysis_target);
					autobreak();
				}
				else
				{
					print("----->ROI analysis was previously performed on this reconstruction data..." );
					if(overwrite_ROI_analyses)
					{
						print("Repeating ROI analysis, overwriting the previous ROI analysis data" );
						runMacro						(ROI_ANALYSIS_MACRO_PATH, current_analysis_target);
						autobreak();
					}
					else
						print("----->ROI analysis overwriting is turned off..." );
				}
			}
		}
		print("ROI analysis: COMPLETE");
		if(exit_after_ROI_analyses)
			endProgram("Exiting after ROI analyses as requested");	
			//eprint("Exiting after ROI analyses as requested");	
	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
//************************* User defined function definitions ***************************************************************************************************************************************//
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//------------------------------------------------------------------------------- Functions currently in development --------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
function listFiles(_dir) 
{
	_list = getFileList(_dir);
	for (_i = 0; _i < _list.length; _i++) 
	{
		if (endsWith( _list[_i], "/") )
			listFiles( "" + _dir +  _list[_i] );
		else
			print( (count++) + ": " + _dir + _list[_i] );
	}
}
function getSubDirList(_parentdir, _print_path, _dirs) 
{
	_sublist = getFileList(_parentdir);
	for (_i = 0; _i < _sublist.length; _i++) 
	{
		if (endsWith( _sublist[_i], "/") )
		{
			_dirs = Array.concat( _dirs, _parentdir + substring(_sublist[_i], 0, lengthOf(_sublist[_i]) - 1) );
			getSubDirList(_parentdir + _sublist[_i], _print_path, _dirs);
		}
	}
	if(_print_path)
		App("getDir_sublist ", _dirs);
	return _dirs;
}
function getDirList(_dir, _print_path) 
{
	_list = getFileList(""+_dir);
	_dirs = newArray();	
	for (_i = 0; _i < _list.length; _i++) 
	{
		if (endsWith( _list[_i], "/") )
		{
			_dirs = Array.concat( _dirs, ""+_dir + substring(_list[_i], 0, lengthOf(_list[_i]) - 1) );
			//getSubDirList(_dir + _list[_i], _print_path, _dirs);
		}
	}
	//if(_print_path)
	//	App("getDirList ", _dirs);
	return _dirs;
}
function getDirFolderList(_dir, _print_path) 
{
	_list = getFileList(""+_dir);
	_dirs = newArray();	
	for (_i = 0; _i < _list.length; _i++) 
	{
		if (endsWith( _list[_i], "/") )
		{
			_dirs = Array.concat( _dirs, substring(_list[_i], 0, lengthOf(_list[_i]) - 1) );
			//getSubDirList(_dir + _list[_i], _print_path, _dirs);
		}
	}
	//if(_print_path)
	//	App("getDirList ", _dirs);
	return _dirs;
}
function getDirsList(_dir) 
{
	_list = getFileList(_dir);
	_dirs = newArray();	
	for (_i = 0; _i < _list.length; _i++) 
	{
		if (endsWith( _list[_i], "/") )
			_dirs = Array.concat( _dirs, _list[_i] );
	}
	return _dirs;
}

function printDirList(_dir) 
{
	_list = getDirList(_dir,true);
	for (_i = 0; _i < _list.length; _i++) 
		print( _i + ": " + _list[_i] );
}
function getDirFileList(_dir) 
{
	_list = getFileList(_dir);
	_files = newArray();	
	for (_i = 0; _i < _list.length; _i++) 
	{
		if (!endsWith( _list[_i], "/") )
			_files = Array.concat( _files, _list[_i] );
	}
	return _files;
}
function printDirFileList(_dir) 
{
	_list = getDirFileList(_dir);
	for (_i = 0; _i < _list.length; _i++) 
		print( _i + ": " + _list[_i] );
}
  
  function listFiles(dir) {
      list = getFileList(dir);
     for (i=0; i<list.length; i++) {
        if (endsWith(list[i], "/"))
           listFiles(""+dir+list[i]);
        else
           print((count++) + ": " + dir + list[i]);
     }
  }
  //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
function cfg_parameter_string_2_values(_cfg_parameter_string, _cfg_parameter_list, _cfg_parameter_strings, _cfg_parameter_decodings, _force_array)
{//simulated_scan 								= cfg_parameter_string_2_values(cfg_parameter_list[0], cfg_parameter_list, cfg_parameter_strings, cfg_parameter_decodings, RETURN_DONT_FORCE_ARRAY);
	for											(__i = 0; __i < _cfg_parameter_list.length; __i++)
		if										( matches(_cfg_parameter_list[__i], _cfg_parameter_string))
			_cfg_parameter_string_index			= __i;			
	_desired_cfg_parameter_string 				= _cfg_parameter_strings[_cfg_parameter_string_index];
	_desired_cfg_parameter_string_elements 		= split(_desired_cfg_parameter_string, ",");
	_num_desired_cfg_parameter_string_elements 	= _desired_cfg_parameter_string_elements.length;
	_desired_cfg_PVs							= newArray(_num_desired_cfg_parameter_string_elements);
	for											(__i = 0; __i < _num_desired_cfg_parameter_string_elements; __i++)
		_desired_cfg_PVs[__i]					= decode_string( _desired_cfg_parameter_string_elements[__i], _cfg_parameter_decodings[_cfg_parameter_string_index]);
	if											( _num_desired_cfg_parameter_string_elements == 1 && !_force_array)
												return _desired_cfg_PVs[0];
	else										return _desired_cfg_PVs;
}
function cfg_parameter_string_decoding(_cfg_parameter_string, _cfg_parameter_list, _cfg_parameter_strings, _cfg_parameter_decoding, _force_array)
{//simulated_scan 								= cfg_parameter_string_decoding(cfg_parameter_list[0], cfg_parameter_list, cfg_parameter_strings, BOOL_DECODING_OP, RETURN_DONT_FORCE_ARRAY);
	for											(__i = 0; __i < _cfg_parameter_list.length; __i++)
		if										( matches(_cfg_parameter_list[__i], _cfg_parameter_string))
			_cfg_parameter_string_index			= __i;			
	//_desired_cfg_parameter_string 				= _cfg_parameter_strings[_cfg_parameter_string_index];
	_desired_cfg_parameter_string_elements 		= split(_cfg_parameter_strings[_cfg_parameter_string_index], ",");
	_num_desired_cfg_parameter_string_elements 	= _desired_cfg_parameter_string_elements.length;
	_desired_cfg_PVs							= newArray(_num_desired_cfg_parameter_string_elements);
	for											(__i = 0; __i < _num_desired_cfg_parameter_string_elements; __i++)
		_desired_cfg_PVs[__i]					= decode_string( _desired_cfg_parameter_string_elements[__i], _cfg_parameter_decoding);
	if											( _num_desired_cfg_parameter_string_elements == 1 && !_force_array )
												return _desired_cfg_PVs[0];
	else										return _desired_cfg_PVs;
}
function parse_analysis_cfg(_cfg_parameter_list, _cfg_parameter_decodings, _print_cfg_definitions_path)
{
	if											(_print_cfg_definitions_path)
		print									("Reading/parsing ROI analysis configurations from:\n\t------->" + ANALYSIS_CFG_INFO_FILE_PATH);
	_cfg_parameter_strings						= file_2_key_value_pairs(GITHUB_MACRO_DIR, ANALYSIS_CFG_INFO_FILENAME, _cfg_parameter_list, DONT_PRINT_PATH);		
	_cfg_parameter_values						= newArray(_cfg_parameter_strings.length);
	for											(__i = 0; __i < _cfg_parameter_values.length; __i++)
		_cfg_parameter_values[__i]				= decode_string( _cfg_parameter_strings[__i], _cfg_parameter_decodings[__i]);
	return 										_cfg_parameter_values;
}
function print_analysis_cfgs(_cfg_parameter_list, _cfg_parameter_string_values, _cfg_parameter_decodings)
{
	for											(__i = 0; __i < _cfg_parameter_string_values.length; __i++)
	{
		if										(_cfg_parameter_decodings[__i] == BOOL_DECODING_OP)
		{
			if									( _cfg_parameter_string_values[__i] == true )
												print(_cfg_parameter_list[__i] + " = (evaluates) true" );
			else								print(_cfg_parameter_list[__i] + " = (evaluates) false" );
		}
		else									print(_cfg_parameter_list[__i] + " = " +  _cfg_parameter_string_values[__i]);
	}
}
function parse_ROI_definitions(_ROI_parameter_list, _ROI_parameter_decodings, _print_ROI_definitions_path)
{	//ROI_parameter_decodings					= newArray(ROI_DEFINITION_STRINGS_DECODING_OP, ROI_DEFINITION_STRINGS_DECODING_OP, ROI_DEFINITION_STRINGS_DECODING_OP, ROI_DEFINITION_STRINGS_DECODING_OP, ROI_DEFINITION_NUMBERS_DECODING_OP, ROI_DEFINITION_NUMBERS_DECODING_OP, ROI_DEFINITION_NUMBERS_DECODING_OP, ROI_DEFINITION_STRINGS_DECODING_OP);		
	//ROI_definitions_parameter_list			= newArray("ROI_material_names", "ROI_labels", "ROI_label_nicknames", "ROI_shapes", "ROI_diameters", "ROI_selection_radii", "ROI_profile_radius_beyond_ROI", "bulk_material" );
	if											(_print_ROI_definitions_path)
		print									("Reading/parsing selected phantom ROI definitions from:\n\t------->" + ROI_DEFINITIONS_FILE_PATH);
	_ROI_parameter_strings						= file_2_key_value_pairs(GITHUB_MACRO_DIR, ROI_DEFINITIONS_FILENAME, _ROI_parameter_list, _print_ROI_definitions_path);		
	_ROI_parameter_values						= newArray(_ROI_parameter_strings.length);
	for											(__i = 0; __i < _ROI_parameter_values.length; __i++)
		_ROI_parameter_values[__i]				= decode_string( _ROI_parameter_strings[__i], _ROI_parameter_decodings[__i]);
	return 										_ROI_parameter_values;
}
function decode_string(_input_string, _decoding_op)
{
	_spaceless_input_string 				= strip_surrounding_spaces(_input_string);
	if										(_decoding_op== FLOAT_DECODING_OP)
											return parseFloat(_spaceless_input_string);
	else if									(_decoding_op == INT_DECODING_OP)
											return parseInt(_spaceless_input_string);
	else if									(_decoding_op == BOOL_DECODING_OP)
	{
		if									( _spaceless_input_string == TRUE_STRING ) 		
											return true;
		else								return false;
	}
	else 									return _spaceless_input_string;
}
function cfg_parameter_string_2_values(_cfg_parameter_string, _cfg_parameter_list, _cfg_parameter_strings, _cfg_parameter_decodings, _force_array)
{//simulated_scan 								= cfg_parameter_string_2_values(cfg_parameter_list[0], cfg_parameter_list, cfg_parameter_strings, cfg_parameter_decodings, RETURN_DONT_FORCE_ARRAY);
	for											(__i = 0; __i < _cfg_parameter_list.length; __i++)
		if										( matches(_cfg_parameter_list[__i], _cfg_parameter_string))
			_cfg_parameter_string_index			= __i;			
	//_desired_cfg_parameter_string 				= _cfg_parameter_strings[_cfg_parameter_string_index];
	_desired_cfg_parameter_string_elements 		= split(_cfg_parameter_strings[_cfg_parameter_string_index], ",");
	_num_desired_cfg_parameter_string_elements 	= _desired_cfg_parameter_string_elements.length;
	_desired_cfg_PVs							= newArray(_num_desired_cfg_parameter_string_elements);
	for											(__i = 0; __i < _num_desired_cfg_parameter_string_elements; __i++)
		_desired_cfg_PVs[__i]					= decode_string( _desired_cfg_parameter_string_elements[__i], _cfg_parameter_decodings[_cfg_parameter_string_index]);
	if											( _num_desired_cfg_parameter_string_elements == 1 && !_force_array)
												return _desired_cfg_PVs[0];
	else										return _desired_cfg_PVs;
}
function 


function cfg_parameter_string_decoding(_cfg_parameter_string, _cfg_parameter_list, _cfg_parameter_strings, _cfg_parameter_decoding, _force_array)
{//simulated_scan 								= cfg_parameter_string_decoding(cfg_parameter_list[0], cfg_parameter_list, cfg_parameter_strings, BOOL_DECODING_OP, RETURN_DONT_FORCE_ARRAY);
	for											(__i = 0; __i < _cfg_parameter_list.length; __i++)
		if										( matches(_cfg_parameter_list[__i], _cfg_parameter_string))
			_cfg_parameter_string_index			= __i;			
	//_desired_cfg_parameter_string 				= _cfg_parameter_strings[_cfg_parameter_string_index];
	_desired_cfg_parameter_string_elements 		= split(_cfg_parameter_strings[_cfg_parameter_string_index], ",");
	_num_desired_cfg_parameter_string_elements 	= _desired_cfg_parameter_string_elements.length;
	_desired_cfg_PVs							= newArray(_num_desired_cfg_parameter_string_elements);
	for											(__i = 0; __i < _num_desired_cfg_parameter_string_elements; __i++)
		_desired_cfg_PVs[__i]					= decode_string( _desired_cfg_parameter_string_elements[__i], _cfg_parameter_decoding);
	if											( _num_desired_cfg_parameter_string_elements == 1 && !_force_array )
												return _desired_cfg_PVs[0];
	else										return _desired_cfg_PVs;
}
function ROI_parameter_string_2_values(_ROI_definitions_parameter_string, _ROI_definitions_parameter_list, _ROI_parameter_strings, _ROI_parameter_decodings, _ROI_PV_parseFloat, _force_array)
{
	for											(__i = 0; __i < _ROI_definitions_parameter_list.length; __i++)
		if										( matches(ROI_definitions_parameter_list[__i], _ROI_definitions_parameter_string))	
			_ROI_parameter_string_index			= __i;			
	//_desired_ROI_parameter_string 			= _ROI_parameter_strings[_ROI_parameter_string_index];
	_desired_ROI_parameter_value_list 			= split(_ROI_parameter_strings[_ROI_parameter_string_index], ",");
	_num_desired_ROI_parameter_values 			= _desired_ROI_parameter_value_list.length;
	_desired_ROI_PVs							= newArray(_num_desired_ROI_parameter_values);
	for											(__i = 0; __i < _num_desired_ROI_parameter_values; __i++)
	{
		__desired_ROI_PVs__						= decode_string(_desired_ROI_parameter_value_list[__i], _ROI_parameter_decodings[_ROI_parameter_string_index]);
		_desired_ROI_PVs[__i]					= __desired_ROI_PVs__; 	
	}
	if											( _num_desired_ROI_parameter_values == 1 && !_force_array)
												return _desired_ROI_PVs[0];
	else										return _desired_ROI_PVs;
}
function ROI_parameter_string_2_values_old(_ROI_definitions_parameter_string, _ROI_definitions_parameter_list, _ROI_parameter_strings, _ROI_parameter_decodings, _ROI_PV_parseFloat, _force_array)
{
	for											(i = 0; i < _ROI_definitions_parameter_list.length; i++)
		if										( matches(ROI_definitions_parameter_list[i], _ROI_definitions_parameter_string))
			_ROI_parameter_string_index			= i;			
	//_desired_ROI_parameter_string 			= _ROI_parameter_strings[_ROI_parameter_string_index];
	_desired_ROI_parameter_string_elements 		= split(_ROI_parameter_strings[_ROI_parameter_string_index], ",");
	_num_desired_ROI_parameter_string_elements 	= _desired_ROI_parameter_string_elements.length;
	_desired_ROI_PVs							= newArray(_num_desired_ROI_parameter_string_elements);
	for											(i = 0; i < _num_desired_ROI_parameter_string_elements; i++)
	{
		_spaceless_PV_string 					= strip_surrounding_spaces(_desired_ROI_parameter_string_elements[i]);
		if										(_ROI_parameter_decodings[_ROI_parameter_string_index] == _ROI_PV_parseFloat)
			_desired_ROI_PVs[i] 				= parseFloat(_spaceless_PV_string);
		else
			_desired_ROI_PVs[i] 				= _spaceless_PV_string;
	}
	if											( _num_desired_ROI_parameter_string_elements == 1 && !_force_array)
												return _desired_ROI_PVs[0];
	else
												return _desired_ROI_PVs;
}
function file_2_key_value_pairs(_dir, _filename, _parameter_list, _print_path)
{
	_file_key_value_pairs						= file_2_array(_dir, _filename, _print_path);
	_num_key_value_pairs						= _file_key_value_pairs.length;
	_ordered_parameter_strings					= newArray(_num_key_value_pairs);
	for											(i = 0; i < _num_key_value_pairs; i++)
	{
		separated_key_value_pair 				= split(_file_key_value_pairs[i], "=");
		key_string 								= separated_key_value_pair[0];
		_spaceless_key_string 					= strip_surrounding_spaces(key_string);
		_PVs_string								= strip_surrounding_spaces(separated_key_value_pair[1]);
		for										(j = 0; j < _parameter_list.length; j++)
			if									(_spaceless_key_string == _parameter_list[j] )
				_ordered_parameter_strings[j] 	= _PVs_string;
	}	
	return _ordered_parameter_strings;	
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//----------------------------------------------------------------------- Basic user defined system task function definitions -----------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
//function Kill					()										{ exit					("-----> Manual exit initiated");																				}
//function eprint					(_print_statement)						{ print					(_print_statement); 										exit		();										}
//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//----------------------------------------------------------------------- Basic user defined system task function definitions -----------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//***************************************************************************************************************************************************************************************************//
//showMessageWithCancel	("Array mismatch at: \n" + _array[i] + NEWLINE_CMD_STRING + _array_2_match[i]);
function Ap						(_array)								{ Array.print			(_array);																											}
function App					(_print_statement, _array)				{ print					("-----> " + _print_statement + PADDED_EQUALS_STRING); 		Ap			(_array);									}
function Appc					(_print_statement, _array)				{ printc				("-----> " + _print_statement + PADDED_EQUALS_STRING); 		printca		(_array);									}
function Appi					(_print_statement, _array)				{ print					(_print_statement + PADDED_EQUALS_STRING); 	for(i = 0; i < _array.length; i++)	printi(TAB_STRING + _array[i], i);	}
function Appsi					(_print_statement, _array)				{ print					(_print_statement + PADDED_EQUALS_STRING); 	for(i = 0; i < _array.length; i++)	printsi(TAB_STRING, _array[i], i);	}
function Aps					(_print_statement, _array)				{ print					(_print_statement + PADDED_EQUALS_STRING); 	for(i = 0; i < _array.length; i++)	print(TAB_STRING + _array[i]);		}
function Apsc					(_print_statement, _array)				{ printc				(_print_statement + PADDED_EQUALS_STRING); 	for(i = 0; i < _array.length; i++)	printc(TAB_STRING + _array[i]);		}
function Appexit				(_print_statement, _array)				{ App					(_print_statement, _array); 								Ap			(_array);									}
function autobreak				()										{ autobreak_bool	 	= file_2_array(GITHUB_MACRO_DIR, AUTO_BREAK_FILENAME, !PRINT_PATH);	exitIf(autobreak_bool[0]);						}
function ceil					(value)									{ return 				conditional_return( (value - round(value) > 0), round(value + 1), round(value) ); 									}
function clearResults			()										{ run					("Clear Results");																									}
function Apc					(_array)								{ Array.print			(_array);																											}
function Appc					(_print_statement, _array)				{ print					("-----> " + _print_statement + PADDED_EQUALS_STRING); 		Ap			(_array);									}
function Apsc					(_print_statement, _array)				{ print					(_print_statement + PADDED_EQUALS_STRING); 	for(i = 0; i < _array.length; i++)	print(TAB_STRING + _array[i]);		}
function askKill				(_message)								{ showMessageWithCancel	(ASK_KILL_DIALOG_TITLE, _message + NEWLINE_CMD_STRING + ASK_KILL_DIALOG_STATEMENT); 								}
function dKill					()										{ dump					(); 														exit		();											}
function errKill				(_err_statement)						{ exit					("ERROR: " + _err_statement);								exit		();											}
function lKill					(_loop_variable, _loop_kill_index)		{ if					(_loop_variable >= _loop_kill_index) 						exit		("-----> Reached loop kill index"); 		}
function Kill					()										{ exit					("-----> Manual exit initiated");																					}
function earlyExit				(_print_statement)						{ print					("Early Exit:" + _print_statement); 						exit		();											}
function endProgram				(_print_statement)						{ print_section			("Execution Complete:" + _print_statement, PRINT_MAJOR_SECTION); exit	();											}
function exitIf					(_exit_condition)						{ if					(_exit_condition)											exit		();											}
function exitSection			(_print_statement)						{ print_section			(_print_statement, PRINT_MAJOR_SECTION);					exit		();											}
function eprint					(_print_statement)						{ print					(_print_statement); 										exit		();											}
function eprintvar				(_print_statement, _variable)			{ _variable_array		= array_from_data(_variable);								Appexit		(_print_statement, _variable_array);		}
function eprintvareq			(_print_statement, _variable)			{ print					(_print_statement + PADDED_EQUALS_STRING + toString(_variable)); 													}
function ifNaN					(_value, _ifNaN_true, _ifNaN_false)		{ return				conditional_return(isNaN(_value), _ifNaN_true, _ifNaN_false);														}
function ifSkipIndex			(_index, _skip_indices)					{ return isMember		(i, _skip_indices_array, RETURN_MATCH_TF);																			}
function IJROI_analysis_config_CSV()									{ IJROI_analysis_config	(IJROI_analysis_measurements, IJROI_analysis_redirect, IJIO_precision_CSV);											}
function IJROI_analysis_config_image()									{ IJROI_analysis_config	(IJROI_analysis_measurements, IJROI_analysis_redirect, IJIO_precision_image);										}
function insert_right_arrow		(_length, _prefix, _suffix, _type)		{ return 				_prefix + right_arrow(_length, _type) + _suffix;																	}
function isArray				(_value)								{ _array				= array_from_data(_value); 	return conditional_return		( (_array.length != 1), true, false);					}
function isArrayType			(_array, _is_array_type)				{ _array_type			= array_type(_array);		return	conditional_return		( (_array_type == _is_array_type), true, false);		}
function isEmptyArray			(_array)								{ return 				isArrayType(_array, IS_EMPTY_ARRAY);																				}
function isNumberArray			(_array)								{ return 				isArrayType(_array, IS_NUMBER_ARRAY);																				}
function isString				(_value)								{ return 				!( isNumber(_value) || isArray(_value) );																			}
function isStringArray			(_array)								{ return 				isArrayType(_array, IS_STRING_ARRAY);																				}
function isMixedArray			(_array)								{ return 				isArrayType(_array, IS_MIXED_ARRAY);																				}
function peq					(_print_statement, _variable)			{ print					(_print_statement + PADDED_EQUALS_STRING + toString(_variable)); 													}
function printc					(_print_statement)						{ if					(PRINT_STATUS == PRINT_SEPVARS())								print		(_print_statement);						}
function printca				(_array)								{ if					(PRINT_STATUS == PRINT_SEPVARS())								Array.print	(_array);								}
function printcas				(_print_statement, _variable)			{ printc				(_print_statement); 										printca		(_array);									}
function printi					(_variable, _index)						{ print					(_index + " : " + TAB_STRING + _variable );																						}
function printsi				(_print_statement, _variable, _index)	{ print					(_print_statement + _index + " : " + TAB_STRING + _variable );																	}
function printn					(_print_statement, _variable)			{ print					(_print_statement +  NEWLINE_CMD_STRING  + _variable );																}
function print_loop_status		(_statement, _loop_num, _section_type)	{ print_section			(_statement + _loop_num, _section_type);																			}
function print_newline			()										{ print					(NEWLINE_CMD_STRING);																								}
function printcvar				(_print_statement, _variable)			{ _variable_array		= array_from_data(_variable);								Appc		(_print_statement, _variable_array);		}
function printvar				(_print_statement, _variable)			{ _variable_array		= array_from_data(_variable);								App			(_print_statement, _variable_array);		}
function printvareq				(_print_statement, _variable)			{ print					(_print_statement + PADDED_EQUALS_STRING + toString(_variable)); 													}
function pt						()										{ print					("=======> Debugging location marker print #" + debug_print_counter++);												}	
function PRINT_ON				()										{ return 				PRINTING_ON;																										}
function PRINT_OFF				()										{ return 				PRINTING_OFF;																										}
function PRINT_GROUPVARS_ONLY	()										{ return 				PRINTING_GROUPS;																									}
function PRINT_SEPVARS_ONLY		()										{ return 				PRINTING_VARS;																										}
function PRINT_GROUPVARS		()										{ return 				(PRINT_STATUS == PRINTING_GROUPS	|| PRINT_STATUS == PRINTING_ON);												}
function PRINT_SEPVARS			()										{ return 				(PRINT_STATUS == PRINTING_SEPVARS 	|| PRINT_STATUS == PRINTING_ON);												}
function sequential_value_array	(_start_index, _end_index)				{ return 				Array.slice(SEQUENTIAL_VALUES_ARRAY, _start_index, _end_index);														}
function string_2_array			(string) 								{ return 				split(string); 																										}
function string_cut_last_N_chars(_string, _N)							{ return 				substring(_string, 0, lengthOf(_string) - _N);																		}
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

function add_prefix_2_strings(strings, common_prefix)
{
	num_strings 			= strings.length;
	number_range_strings	= newArray(num_strings);
	for(i = 0; i < num_strings; i++)
		strings[i]			= common_prefix + strings[i];
	return 					strings;
}
function add_suffix_2_strings(strings, common_suffix)
{
	num_strings 			= strings.length;
	number_range_strings	= newArray(num_strings);
	for(i = 0; i < num_strings; i++)
		strings[i]			+= common_suffix;
	return 					strings;
}
function Ap(arg)
{
	Array.print(arg);
}
function App(statement, array)
{
	print("*******> " + statement + " = ");
	Array.print(array);
}
function array_2_CSV(_rows, _columns, _array, _dir, _filename, _print_path, _overwrite_existing_CSV)
{
	for(_row = 0; _row < _rows; _row++)
		for (_column = 0; _column < _columns; _column++)
			setResult		(_column, _row, _array[_row * _columns + _column]);	
	_CSV_filename 			= construct_valid_file_path(_dir, _filename);		
	if(_print_path)
		print				("------->Writing to CSV at\n" + _CSV_filename);
	if(!File.exists(_CSV_filename) || _overwrite_existing_CSV)						
	{
		saveAs				("Measurements", _CSV_filename);			
		OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, _CSV_filename);					
	}
	run						("Clear Results");
}	
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
function array_2_TXT(path, filename, data_array, print_path, overwrite_existing_TXT)	
{
	TXT_filename 			= construct_valid_file_path(path, filename);		
	if(print_path)
		print				("------->Writing to TXT at:\n" + TXT_filename);
	if(!File.exists(TXT_filename) || overwrite_existing_TXT)
	{
		filehandle 			= File.open(TXT_filename);		
		for (i = 0; i < data_array.length; i++)
			print			(filehandle, data_array[i]);
		File.close			(filehandle);	
		OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, TXT_filename);
	}					
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
function autobreak()
{
	autobreak_boolean 	= file_2_array(GITHUB_MACRO_DIR, AUTO_BREAK_FILENAME, DONT_PRINT_PATH);
	if(autobreak_boolean[0])
		 eprint("autobreak initiated exit");//exit();
}
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
function ceil(value)
{
	if(value - round(value) > 0)
		return round(value + 1);
	else
		return round(value);
}
function close_all_windows(clear_results, recording_on)
{
	run					("Close All");
	if(clear_results)
		run				("Clear Results");
	if(recording_on)
		run				("Record...");
	list 				= getList("window.titles");
	for(i = 0; i < list.length; i++ )
	{
		selectWindow	(list[i]);
		run				("Close");		
	}
}
function close_windows(clear_results, close_all, recording_on)
{
	if(close_all)
		run				("Close All");
	else
		run				("Close");
	if(clear_results)
		run				("Clear Results");
	if(recording_on)
		run				("Record...");
	list 				= getList("window.titles");
	for(i = 0; i < list.length; i++ )
	{
		selectWindow	(list[i]);
		run				("Close");		
	}
}
function construct_image_set_filenames(common_filename_prefix, image_set_filename_endings, image_extension)
{
	num_images					= image_set_filename_endings.length;
	image_set_filenames 		= newArray(num_images);
	for(i = 0; i < num_images; i++)
		image_set_filenames[i] 	= common_filename_prefix + "_" + image_set_filename_endings[i] + image_extension;
		return image_set_filenames;
}
function construct_valid_dir_path(dir, subdir)
{
	while(startsWith(subdir, File.separator))
		subdir = substring(subdir, 1, lengthOf(subdir));
	while(endsWith(dir, File.separator))
		dir = substring(dir, 0, lengthOf(dir) - 1);
	//path 			= dir + File.separator + subdir;
	if(debug_path_printing)
		print("construct_valid_dir_path(" + dir + ", " + subdir + ") ---->" + dir + File.separator + subdir);
	return 			dir + File.separator + subdir;
}
function construct_valid_file_path(dir, filename)
{
	while(startsWith(filename, File.separator))
		filename = substring(filename, 1, lengthOf(filename));
	while(endsWith(dir, File.separator))
		dir = substring(dir, 0, lengthOf(dir) - 1);
	//path 			= dir + File.separator + filename;
	return			dir + File.separator + filename;
}
function copy_distributed_file(_from_dir, _from_filename, _to_dir, _to_filename, _print_to_path)
{
	_from_path = construct_valid_file_path(_from_dir, _from_filename);
	_to_path = construct_valid_file_path(_to_dir, _to_filename);
	File.copy(_from_path, _to_path);
	if(_print_to_path)
		print("File copied to :\n" + _to_path);
	return _to_path;
}
function copy_input_data_file(_input_dir, _ifname, _output_dir, _output_basename, _output_suffix, _file_extension, _copied_from_log, _copied_to_log, _print_paths)
{
	_copied_input_data_file_ofname = _output_basename + "_" + _output_suffix + _file_extension; 
	_copy_input_data_file_from				= construct_valid_file_path(_input_dir, _ifname);
	_copy_input_data_file_to				= construct_valid_file_path(_output_dir, _copied_input_data_file_ofname);		
	if(_print_paths)
	{
		print								("-------> copy_input_data_file_from 	=\n " +  _copy_input_data_file_from);
		print								("-------> copy_input_data_file_to 		=\n " +  _copy_input_data_file_to);
	}
	File.copy								(_copy_input_data_file_from, _copy_input_data_file_to);	
	_copied_from_log						= Array.concat(_copied_from_log, _copy_input_data_file_from);				
	_copied_to_log							= Array.concat(_copied_to_log, _copy_input_data_file_to);				
	return 									_copy_input_data_file_to;
}
function copy_PVT_input_data_files(input_dir, ifname, output_dir, output_basename, MVP_parameter_prefix, MVP_PV_string, TTP_range_filenaming, MVP_parameter_range_filenaming)
{
	copied_input_data_file_ofname = output_basename + "_" + TTP_range_filenaming + "_" + MVP_parameter_range_filenaming + "_" + MVP_parameter_prefix + "=" + MVP_PV_string + ".txt"; 
	copy_input_data_file_from			= construct_valid_file_path(input_dir, ifname);
	copy_input_data_file_to				= construct_valid_file_path(output_dir, copied_input_data_file_ofname);		
	//print("copy_input_data_file_from				= " +  copy_input_data_file_from);
	//print("copy_input_data_file_to 			= " +  copy_input_data_file_to);
	File.copy								(copy_input_data_file_from, copy_input_data_file_to);					
	return copy_input_data_file_to;
}
function count_duplicate_PV_recons(recon_dir, start_duplicate_check)
{
	duplicates = start_duplicate_check;
	if(endsWith(recon_dir, File.separator))
		recon_dir = substring(recon_dir, 0, lengthOf(recon_dir) - 1);
	duplicate_recon_dir_check = recon_dir + "_" + d2s(start_duplicate_check + 1, 0);
	if( File.exists(duplicate_recon_dir_check) )
		duplicates = count_duplicate_PV_recons(recon_dir, start_duplicate_check + 1);
	return duplicates;
}
function csv_2_array(path, filename, column_headings, rows, element_order, print_path)
{
	file 				= construct_valid_file_path(path, filename);			
	if(print_path)
		print			("------->Reading CSV at:\n" + file);
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
function d2s_minimized_precision(value)
{
	i = 0;
	while(true)
	{
		value_string 	= d2s(value, i);
		new_value 		= parseFloat(value_string);
		if(value - new_value == 0)
			return value_string;	
		i++;
	}
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
function extract_PVs(_target_parameter_index, _PVs, _num_PVs, _PV_offsets)
{
	_target_parameter_start_index 			= _PV_offsets[_target_parameter_index];
	_target_parameter_end_index 			= _PV_offsets[_target_parameter_index] + _num_PVs[_target_parameter_index] ;
	_target_PVs 				= Array.slice(_PVs, _target_parameter_start_index, _target_parameter_end_index); 	
	return _target_PVs;
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
function file_2_array(path, filename, print_path)
{
	file_path 		= construct_valid_file_path(path, filename);		
	if(print_path)
		print		("------->Importing array from:\n" + file_path);
	str 			= File.openAsString(file_path); 
	lines 			= split(str,"\n");
	array 			= newArray(lines.length);
	for(i = 0; i < array.length; i++)
		array[i] 	= lines[i];
	INPUT_FILE_LIST	= Array.concat(INPUT_FILE_LIST, file_path);			
	return array;
}
function file_2_float_array(path, filename, print_path)
{
	file_path 		= construct_valid_file_path(path, filename);		
	if(print_path)
		print		("------->Importing array from:\n" + file_path);
	str 			= File.openAsString(file_path); 
	lines 			= split(str,"\n");
	array 			= newArray(lines.length);
	for(i = 0; i < array.length; i++)
		array[i] 	= parseFloat(lines[i]);
	INPUT_FILE_LIST	= Array.concat(INPUT_FILE_LIST, file_path);			
	return array;
}
function find_array_extrema(data_array, tolerance, notify_equality)
{
	extrema 			= newArray(2);
	min_val_indices 	= Array.findMinima(data_array, tolerance);
	max_val_indices 	= Array.findMaxima(data_array, tolerance);
	if(min_val_indices.length == 0)
	{
		if(notify_equality)
			print		("------->All array data values are equal");
		constant_val 	= data_array[0];									
		extrema[0] 		= constant_val;
		extrema[1] 		= constant_val;	
	}
	else
	{							
		extrema[0] 		= data_array[min_val_indices[0]];
		extrema[1] 		= data_array[max_val_indices[0]];	
	}
	return extrema;
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
function folder_2_MVP_string(folder, string_prefixes, MVP_parameter, PVs, num_PVs, PV_offsets, parameter_string_precisions)
{
	MVP_string_ID 		= generate_MVP_string(PVs, PV_offsets, parameter_string_precisions, MVP_parameter);
	current_PVs 	= folder_name_2_PVs (folder, string_prefixes);
	parameter_string 			= "";
	for(parameter = 0; parameter < num_PVs.length - 1; parameter++)
	{	
		if( parameter == MVP_parameter - 1)
			parameter_string 	= parameter_string  + MVP_string_ID + ", ";						
		else
			parameter_string 	= parameter_string  + string_prefixes[parameter] + "=" + current_PVs[parameter] + ", ";
	}	
	parameter_string 			= substring(parameter_string, 0, lengthOf(parameter_string)-2);
	return parameter_string;
}
function folder_2_parameter_string(folder, string_prefixes, string_precisions, last_parameter_2_include)
{
	current_PVs 	= folder_name_2_PVs(folder, string_prefixes);
	parameter_string 			= "";
	for(parameter = 0; parameter <= last_parameter_2_include; parameter++)
	{	
			parameter_string 	= parameter_string  + string_prefixes[parameter] + " = " + current_PVs[parameter] + ", ";
	}	
	parameter_string 			= substring(parameter_string, 0, lengthOf(parameter_string)-2);
	return parameter_string;
}
function folder_name_2_parameter_equals_strings(_folder, _parameter_prefixes, _parameter_string_precisions, _remove_trailing_zeros)
{
	_num_parameters = _parameter_prefixes.length;
	_parameter_equals_strings = newArray(_num_parameters);
	for(j = 0; j < _num_parameters; j++)
	{
		_prefix_start_index = indexOf(_folder, _parameter_prefixes[j]);
		_prefix_end_index = _prefix_start_index + lengthOf(_parameter_prefixes[j]) + 1;
		_PV_end_index = indexOf(_folder, "_", _prefix_end_index);
		if(_PV_end_index == -1) 
			_PV_end_index = lengthOf(_folder);
		_PV_string = substring(_folder, _prefix_end_index, _PV_end_index);
		if(_remove_trailing_zeros)
			_PV_string = remove_trailing_zeros(_PV_string, _parameter_string_precisions[j]);
		_PV_equal_string = _parameter_prefixes[j] + "=" + _PV_string;		
		_parameter_equals_strings[j] =  _PV_equal_string;
	}
	return _parameter_equals_strings;
}
function folder_name_2_PVs(_folder_name, _parameter_string_prefixes)
{
	_num_parameters 		= _parameter_string_prefixes.length;
	_prefix_lengths 		= newArray		(_parameter_string_prefixes.length);
	_value_strings 			= newArray		(_num_parameters);
	for( i = 0; i < _num_parameters - 1; i++)
	{
		_prefix 			= _parameter_string_prefixes[i];
		_prefix_length 		= lengthOf		(_prefix);
		_start_index 		= indexOf		(_folder_name, _prefix );
		_end_index 			= indexOf		(_folder_name, "_", _start_index + _prefix_length + 1);
		_value_strings[i] 	= substring		(_folder_name, _start_index + _prefix_length + 1, _end_index);
	}
	_next_prefix 			= indexOf		(_folder_name, _parameter_string_prefixes[_num_parameters - 1] );
	_start_index 			= indexOf		(_folder_name, "_", _next_prefix + 1);
	_end_index 				= indexOf		(_folder_name, "_", _start_index + 1);
	if(_end_index == -1)
		_end_index = lengthOf(_folder_name);
	_value_strings[i] 		= substring		(_folder_name, _start_index + 1, _end_index );
	return _value_strings;
}
function generate_all_PV_strings(_PVs, _num_PVs, _PV_offsets, _parameter_string_precisions)
{
	_num_parameters 			= _parameter_string_precisions.length;
	_PV_strings	= newArray(_PVs.length);
	index 						= 0;
	for(parameter = 0; parameter < _num_parameters; parameter++)
		for(i = 0; i < _num_PVs[parameter]; i++)
			_PV_strings[index++]	= d2s(_PVs[i + _PV_offsets[parameter]], _parameter_string_precisions[parameter]);
	return _PV_strings;
}
function generate_averaged_data_CSV(_recon_data_dir, base_recon_folder, input_data_subdir, input_data_filename, input_CSV_columns, input_CSV_rows, ROIs_per_recon)
{
	print_section("Generating average quality measures from the ROI analysis CSV files from each reconstruction performed with the current parameters", false);
	all_RSP_data 					= newArray();
	current_test_input_dir 	= construct_valid_dir_path(_recon_data_dir, base_recon_folder);
	while(startsWith(input_data_filename , File.separator))
		input_data_filename	 		= substring(input_data_filename, 1, lengthOf(input_data_filename));
	duplicates 						= count_duplicate_PV_recons(current_test_input_dir, 0);
	avg_RSP_data 					= newArray(ROIs_per_recon * (duplicates + 1) );
	base_folder_data 				= csv_2_array(current_test_input_dir + input_data_subdir, input_data_filename, input_CSV_columns, input_CSV_rows, ROW_MAJOR, false);
	all_RSP_data 					= Array.concat(all_RSP_data, base_folder_data);		
	for(duplicate = 1; duplicate <= duplicates; duplicate++)
	{
		folder 						= base_recon_folder + "_" + d2s(duplicate, 0);
		dir 					= construct_valid_dir_path(_recon_data_dir, folder);
		RSP_data 					= csv_2_array(dir  + input_data_subdir, input_data_filename, input_CSV_columns, input_CSV_rows, ROW_MAJOR, false);
		all_RSP_data 				= Array.concat(all_RSP_data, RSP_data);
	}
	avg_RSP_data 					= newArray(ROIs_per_recon);
	avg_RSP_data_strings 			= newArray(ROIs_per_recon);
	Array.fill(avg_RSP_data, 0);
	for(i = 0; i < ROIs_per_recon; i++)
	{
		for(duplicate = 0; duplicate <= duplicates; duplicate++)
			avg_RSP_data[i] 		+= all_RSP_data[i + duplicate * ROIs_per_recon];
		avg_RSP_data[i] 			/= (duplicates + 1);
	}						
	for(i = 0; i < ROIs_per_recon; i++)
		avg_RSP_data_strings[i] 	= d2s(avg_RSP_data[i], 10);
	_MAKE_TOP_DIR 				= true;
	_print_directories_created 		= true;
	_overwrite_averaged_data_CSV 	= true;
	_print_averaged_data_CSV_path 	= true;
	averaged_data_output_dir 	= construct_valid_dir_path(_recon_data_dir, base_recon_folder + AVERAGED_DATA_FOLDER_SUFFIX + input_data_subdir);
	parents 						= make_dir_parents(_recon_data_dir, averaged_data_output_dir, FOLDER_SEPARATOR, _MAKE_TOP_DIR, _print_directories_created);
	array_2_CSV						(num_ROIs_2_analyze, images_per_recon, avg_RSP_data_strings, averaged_data_output_dir, input_data_filename, _print_averaged_data_CSV_path, _overwrite_averaged_data_CSV);	
	return 							avg_RSP_data_strings;			
}
function generate_averaged_data_TXT(_recon_data_dir, base_recon_folder, input_data_filename, measurements_per_recon)
{
	print_section("Generating average quality measures from the ROI analysis TXT files from each reconstruction performed with the current parameters", false);
	_print_input_data_path 			= true;
	_MAKE_TOP_DIR 				= true;
	_print_directories_created 		= true;
	_overwrite_averaged_data_TXT		= true;
	_print_averaged_data_TXT_path 	= true;
	all_input_data 					= newArray();
	current_test_input_dir 	= construct_valid_dir_path(_recon_data_dir, base_recon_folder);
	while(startsWith(input_data_filename , File.separator))
		input_data_filename	 		= substring(input_data_filename, 1, lengthOf(input_data_filename));
	duplicates 						= count_duplicate_PV_recons(current_test_input_dir, 0);
	print("\nDuplicate reconstructions found = " + duplicates);
	avg_input_data 					= newArray(measurements_per_recon * (duplicates + 1) );
	base_folder_data 				= file_2_array(current_test_input_dir, input_data_filename, _print_input_data_path);
	all_input_data 					= Array.concat(all_input_data, base_folder_data);		
	for(duplicate = 1; duplicate <= duplicates; duplicate++)
	{
		print("Adding duplicate # " + duplicate + " data to averaged data file ");
		folder 						= base_recon_folder + "_" + d2s(duplicate, 0);
		dir 					= construct_valid_dir_path(_recon_data_dir, folder);
		input_data 					= file_2_array(dir, input_data_filename, _print_input_data_path);
		all_input_data 				= Array.concat(all_input_data, input_data);
	}
	Array.print(all_input_data);
	avg_input_data					= newArray(measurements_per_recon);
	//avg_input_data_strings 			= newArray(measurements_per_recon);
	Array.fill(avg_input_data, 0);
	for(i = 0; i < measurements_per_recon; i++)
	{
		//all_input_data[i]				= parseFloat(all_input_data[i]);
		for(duplicate = 0; duplicate <= duplicates; duplicate++)
			avg_input_data[i] 		= avg_input_data[i] + all_input_data[i + duplicate * measurements_per_recon];
		avg_input_data[i] 			/= (duplicates + 1);
		avg_input_data_strings 		= d2s(avg_input_data[i], 10);
	}
	averaged_data_output_dir 	= construct_valid_dir_path(_recon_data_dir, base_recon_folder + AVERAGED_DATA_FOLDER_SUFFIX);
	parents 						= make_dir_parents(_recon_data_dir, averaged_data_output_dir, FOLDER_SEPARATOR, _MAKE_TOP_DIR, _print_directories_created);
	array_2_TXT						(averaged_data_output_dir, input_data_filename, avg_input_data, _print_averaged_data_TXT_path, _overwrite_averaged_data_TXT);	
	print("========>Finished calculating and writing averaged reconstruction data to disk at:\n" + averaged_data_output_dir);
	return 							avg_input_data;			
}
function generate_combined_filename_suffixes(_leading_filename_suffixes, _trailing_filename_suffixes)
{
	_num_leading_filename_suffixes 	= _leading_filename_suffixes.length;
	_num_trailing_filename_suffixes	= _trailing_filename_suffixes.length;
	_combined_filename_suffixes 	= newArray(_num_leading_filename_suffixes * _num_trailing_filename_suffixes);
	for(i = 0; i < _num_leading_filename_suffixes; i++)
		for(j = 0; j < _num_trailing_filename_suffixes; j++)
			_combined_filename_suffixes[i * _num_trailing_filename_suffixes + j] = _leading_filename_suffixes[i] + "_" + _trailing_filename_suffixes[j];
	return _combined_filename_suffixes;
}
function generate_combined_PV_range_filenames(_PVs, _num_PVs, _PV_offsets, _parameter_string_prefixes, _parameter_string_precisions)
{
	_PVT_identifier 			= "";
	_num_parameters 							= _num_PVs.length;
	for(parameter = 0; parameter < _num_parameters; parameter++)
	{
		_range_min_string 						= remove_trailing_zeros(_PVs[_PV_offsets[parameter]], _parameter_string_precisions[parameter]);
		_range_max_string 						= remove_trailing_zeros(_PVs[_PV_offsets[parameter] + _num_PVs[parameter] - 1], _parameter_string_precisions[parameter]);	
		_prefix 								= _parameter_string_prefixes[parameter];
		if(_num_PVs[parameter] == 1 )
			_PVT_identifier 	+= _prefix + "[" + _range_min_string + "]_";
		else
			_PVT_identifier 	+= _prefix + "[" + _range_min_string + "-" + _range_max_string + "]_";			
	}
	//_PVT_identifier 			+= _parameter_string_prefixes[_num_parameters - 1] + _TTP_range_suffix;	
	_PVT_identifier			= substring(_PVT_identifier, 0, lengthOf(_PVT_identifier) - 1);
	return _PVT_identifier;						
}
function generate_combined_PV_range_string(_PVs, _num_PVs, _PV_offsets, _parameter_string_prefixes, _parameter_string_precisions)
{
	_PVT_identifier 			= "";
	_num_parameters 							= _num_PVs.length;
	for(parameter = 0; parameter < _num_parameters; parameter++)
	{
		_range_min_string 						= remove_trailing_zeros(_PVs[_PV_offsets[parameter]], _parameter_string_precisions[parameter]);
		_range_max_string 						= remove_trailing_zeros(_PVs[_PV_offsets[parameter] + _num_PVs[parameter] - 1], _parameter_string_precisions[parameter]);	
		_prefix 								= _parameter_string_prefixes[parameter];
		if(_num_PVs[parameter] == 1 )
			_PVT_identifier 	+= _prefix + "[" + _range_min_string + "]_";
		else
			_PVT_identifier 	+= _prefix + "[" + _range_min_string + "-" + _range_max_string + "]_";			
	}
	//_PVT_identifier 			+= _parameter_string_prefixes[_num_parameters - 1] + _TTP_range_suffix;	
	_PVT_identifier			= substring(_PVT_identifier, 0, lengthOf(_PVT_identifier) - 1);
	return _PVT_identifier;						
}
function generate_current_PVT_MVP_output_dir(_TEST_BATCH_DIR, _MVP_parameter_index, _current_PVT_value_strings, _MVP_suffix_string, _TTP_range_suffix, _parameter_string_prefixes, _parameter_string_precisions)
{
	_current_PVT_MVP_output_dir 		= _TEST_BATCH_DIR;
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _MVP_parameter_index; parameter++)	
		_current_PVT_MVP_output_dir	+= parameter_string_prefixes[parameter] + "_" + _current_PVT_value_strings[parameter] + "_";	
	_current_PVT_MVP_output_dir		+= _MVP_suffix_string + "_";						
	for(parameter = _MVP_parameter_index + 1; parameter < num_parameters - 1; parameter++)	
		_current_PVT_MVP_output_dir 	+= parameter_string_prefixes[parameter] + "_" + _current_PVT_value_strings[parameter] + "_";						
	_current_PVT_MVP_output_dir	+=  parameter_string_prefixes[num_parameters - 1] + _TTP_range_suffix;			
	return _current_PVT_MVP_output_dir;	
}
function generate_current_PVT_PVs_string(_current_PVT_value_strings, _TTP_index, _parameter_string_prefixes)
{
	_num_parameters					= _parameter_string_prefixes.length;		
	_PVs_string 		= "";
	for(parameter = 0; parameter < _num_parameters; parameter++)
		_PVs_string 	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";
	_PVs_string 		= substring(_PVs_string, 0, lengthOf(_plot_title_parameter_string) - 2);										
	return _PVs_string;
}
function generate_legend_entries(common_entry_text, entry_specific_text)
{
	legend_entries			= newArray(lengthOf(entry_specific_text));
	for(i = 0; i < lengthOf(entry_specific_text); i++)
		legend_entries[i]	= common_entry_text + entry_specific_text[i];
	return legend_entries;
}
function generate_missing_input_data(common_dir, current_PVT_folder, RSP_path, RSP_Error_path, Std_Dev_path)
{
	dir 		= construct_valid_dir_path(common_dir, current_PVT_folder);		
	data_verified 		= true;
	if(!File.exists(dir + RSP_path))
	{	
		print			("------->Missing RSP input file:\n" + dir + RSP_path);
		data_verified 	= false;
	}
	if(!File.exists(dir + RSP_Error_path))
	{	
		print			("------->Missing RSP error input file:\n" + dir + RSP_Error_path);
		data_verified 	= false;
	}
	if(!File.exists(dir + Std_Dev_path))
	{	
		print			("------->Missing std dev input file:\n" + dir + Std_Dev_path);
		data_verified 	= false;
	}
	if(!data_verified)
	{
		if(endsWith(dir, File.separator))
			runMacro	(ROI_ANALYSIS_MACRO_PATH, dir);
		else
			runMacro	(ROI_ANALYSIS_MACRO_PATH, dir + FOLDER_SEPARATOR);	
	}			
	return true;					
}		
function generate_missing_test_input_data(common_dir, current_PVT_folders, RSP_path, RSP_Error_path, Std_Dev_path)
{
	for( i = 0; i < current_PVT_folders.length; i++)
	{
		dir 			= construct_valid_dir_path(common_dir, current_PVT_folders[i]);		
		data_verified 		= true;
		print				("------->Path to RSP input file:\n" + dir + RSP_path);
		print				("------->Path to RSP error input file:\n" + dir + RSP_Error_path);
		print				("------->Path to standard deviation input file:\n" + dir + Std_Dev_path);
		if(!File.exists(dir + RSP_path))
		{	
			print			("------->Missing RSP input file:\n" + dir + RSP_path);
			data_verified 	= false;
		}
		if(!File.exists(dir + RSP_Error_path))
		{	
			print			("------->Missing RSP error input file:\n" + dir + RSP_Error_path);
			data_verified 	= false;
		}
		if(!File.exists(dir + Std_Dev_path))
		{	
			print			("------->Missing standard deviation input file:\n" + dir + Std_Dev_path);
			data_verified 	= false;
		}
		if(!data_verified)
		{
			if(endsWith(dir, File.separator))
				runMacro	(ROI_ANALYSIS_MACRO_PATH, dir);
			else
				runMacro	(ROI_ANALYSIS_MACRO_PATH, dir + FOLDER_SEPARATOR);	
		}
	}
	return true;			
}		
function generate_modulo_values(_num_PVs)
{
	_num_parameters				= _num_PVs.length;
	_modulo_values 				= newArray(_num_parameters - 1);	
	Array.fill					(_modulo_values, 1);
	for(i = 0; i < _num_parameters; i++)
		for(j = i + 1; j < _num_parameters; j++)
			_modulo_values[i] 	*= _num_PVs[j];		 
	return _modulo_values;
}
function generate_MVP_parameter_set_string(_MVP_parameter_index, _num_MVP_PVs, _PVs, _PV_offsets, _parameter_string_prefixes, _parameter_string_precisions)
{
	_MVP_suffix_string 		= _parameter_string_prefixes[_MVP_parameter_index] + "[";
	for(i = 0; i < _num_MVP_PVs; i++)
		_MVP_suffix_string 	= _MVP_suffix_string  + d2s(_PVs[_PV_offsets[_MVP_parameter_index] + i], _parameter_string_precisions[_MVP_parameter_index]) + ",";
	_MVP_suffix_string 		= substring(_MVP_suffix_string, 0, lengthOf(_MVP_suffix_string) - 1) + "]";
	return _MVP_suffix_string;
}
function generate_MVP_string(PVs, PV_offsets, parameter_string_precisions, MVP_parameter)
{
	MVP_string_ID 		= parameter_string_prefixes[MVP_parameter_index] + " = [";
	for(i = 0; i < num_MVP_PVs; i++)
		MVP_string_ID 	= MVP_string_ID  + d2s(PVs[PV_offsets[MVP_parameter_index] + i], parameter_string_precisions[MVP_parameter_index]) + ",";
	MVP_string_ID 		= substring(MVP_string_ID, 0, lengthOf(MVP_string_ID) - 1) + "]";
	return MVP_string_ID;
}
function generate_MVP_suffix_string(_MVP_parameter_index, _num_MVP_PVs, _PVs, _PV_offsets, _parameter_string_prefixes, _parameter_string_precisions)
{
	_MVP_suffix_string 		= _parameter_string_prefixes[_MVP_parameter_index] + "[";
	for(i = 0; i < _num_MVP_PVs; i++)
		_MVP_suffix_string 	= _MVP_suffix_string  + d2s(_PVs[_PV_offsets[_MVP_parameter_index] + i], _parameter_string_precisions[_MVP_parameter_index]) + ",";
	_MVP_suffix_string 		= substring(_MVP_suffix_string, 0, lengthOf(_MVP_suffix_string) - 1) + "]";
	return _MVP_suffix_string;
}
function generate_MVP_title_parameter_string(_TTP_range_suffix, _MVP_parameter_index, _current_PVT_value_strings, _MVP_parameter_range_plots, _parameter_string_prefixes )
{
	_MVP_title_parameter_string 		= "";
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _MVP_parameter_index; parameter++)	
		_MVP_title_parameter_string	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";	
	_MVP_title_parameter_string		+= _MVP_parameter_range_plots + ", ";						
	for(parameter = _MVP_parameter_index + 1; parameter < num_parameters - 1; parameter++)	
		_MVP_title_parameter_string 	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";						
	_MVP_title_parameter_string	+=  parameter_string_prefixes[num_parameters - 1] + " = " + _TTP_range_suffix;			
	return _MVP_title_parameter_string;	
}		
function generate_MVP_title_PVs_string(_TTP_range_suffix, _MVP_parameter_index, _current_PVT_value_strings, _MVP_parameter_range_filenaming, _parameter_string_prefixes )
{
	_MVP_title_PVs_string 		= "";
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _MVP_parameter_index; parameter++)	
		_MVP_title_PVs_string	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";	
	_MVP_title_PVs_string		+= _MVP_parameter_range_filenaming + ", ";						
	for(parameter = _MVP_parameter_index + 1; parameter < num_parameters - 1; parameter++)	
		_MVP_title_PVs_string 	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";						
	_MVP_title_PVs_string	+=  parameter_string_prefixes[num_parameters - 1] + " = " + _TTP_range_suffix;			
	return _MVP_title_PVs_string;	
}		
function generate_multivalue_parameter_equals_suffix(_current_test_PV_strings, _parameter_prefixes, _num_PVs, _parameter_precisions, _MVP_parameter_index, _MVP_parameter_range_filenaming)
{
	_suffix = "";
	_num_parameters = _parameter_prefixes.length;
	for(i = 0; i < _num_parameters - 1; i++)
	{
		if(_num_PVs[i] > 1)
		{
			if(i != _MVP_parameter_index)
				_suffix += _parameter_prefixes[i] + "=" + remove_trailing_zeros(_current_test_PV_strings[i], _parameter_precisions[i]) + "_";
			else
				_suffix += _MVP_parameter_range_filenaming + "_";
		}
		
	}
	return substring(_suffix, 0, lengthOf(_suffix) -1);						
}
function generate_multivalue_PVs_short_title_string(_TTP_range_index, _MVP_parameter_index, _current_PVT_value_strings, _parameter_string_prefixes, _num_PVs )
{
	_MVP_title_PVs_string 		= "";
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _num_parameters; parameter++)	
	{
		if(_num_PVs[parameter] > 1 && parameter != _TTP_range_index && parameter != _MVP_parameter_index)
			_MVP_title_PVs_string	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";	
	}
	return _MVP_title_PVs_string;	
}		
function generate_multivalue_PVs_title_string(_TTP_range_suffix, _MVP_parameter_index, _current_PVT_value_strings, _MVP_parameter_range_filenaming, _parameter_string_prefixes, _num_PVs )
{
	_MVP_title_PVs_string 		= "";
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _MVP_parameter_index; parameter++)	
		if(_num_PVs[parameter] > 1)
			_MVP_title_PVs_string	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";	
	_MVP_title_PVs_string		+= _MVP_parameter_range_filenaming + ", ";						
	for(parameter = _MVP_parameter_index + 1; parameter < num_parameters - 1; parameter++)	
		if(_num_PVs[parameter] > 1)
			_MVP_title_PVs_string 	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";						
	_MVP_title_PVs_string	+=  parameter_string_prefixes[num_parameters - 1] + " = " + _TTP_range_suffix;			
	return _MVP_title_PVs_string;	
}		
function generate_ordering_indices(_num_iterations, _num_ROIs_2_analyze, _images_per_recon, _num_TTP_values)
{
	ordering_indices 										= newArray(_num_ROIs_2_analyze * _images_per_recon * _num_TTP_values);
	ordering_indices_position 								= 0;
	for(iteration = 0; iteration <= _num_iterations; iteration++)  
	{
		for(ROI = 0; ROI < _num_ROIs_2_analyze; ROI++)
		{
			for( N = 0; N < _num_TTP_values; N++)
			{
				ordering_index 								= _num_ROIs_2_analyze * _images_per_recon * N + iteration * _num_ROIs_2_analyze + ROI;
				ordering_indices[ordering_indices_position] = ordering_index;
				ordering_indices_position++;
			}
		}
	}
	return ordering_indices;										
}
function generate_parameter_test_combination_indices(_TTP_index, _combination_index, _modulo_values, _PV_offsets )
{	
	j 								= _combination_index;
	_parameter_combination_indices 		= newArray(_TTP_index + 1);
	for(parameter = 0; parameter < _TTP_index; parameter++)
	{
		i = 0;
		while(j - _modulo_values[parameter] >= 0)
		{
			j = j - _modulo_values[parameter];
			i++;
		}
		_parameter_combination_indices[parameter]					= i + _PV_offsets[parameter];
	}		
	_parameter_combination_indices[_TTP_index]	= j + _PV_offsets[_TTP_index];		
	return _parameter_combination_indices;       	
}
function generate_parameter_test_combination(_parameter_combination_indices, _PVs)
{
	_num_parameter_combination_indices 	= _parameter_combination_indices.length;
	_parameter_combination 				= newArray(_num_parameter_combination_indices);
	for(parameter = 0; parameter < _num_parameter_combination_indices; parameter++)
		_parameter_combination[parameter]	= _PVs[_parameter_combination_indices[parameter]];					
	return _parameter_combination;       	
}
function generate_parameter_test_folder(_parameter_string_prefixes, _parameter_string_precisions, _parameter_combination )
{
	_num_parameters					= _parameter_string_prefixes.length;
	_folder_string 					= "";
	for(parameter = 0; parameter < _num_parameters; parameter++)	
		_folder_string 				= _folder_string + "_" + _parameter_string_prefixes[parameter] + "_" + d2s( _parameter_combination[parameter], _parameter_string_precisions[parameter]);	
	_folder_string					= substring(_folder_string, 1);
	return _folder_string;	
}
function generate_parameter_test_MVP_folder(_MVP_parameter_index, _MVP_parameter_combination, _MVP_combination_offset, _PVs, _PV_offsets, _parameter_string_prefixes, _parameter_string_precisions )
{
	_num_parameters					= _parameter_string_prefixes.length;		
	_folder_string 					= "";
	for(parameter = 0; parameter < _MVP_parameter_index; parameter++)	
		_folder_string	= _folder_string + "_" + _parameter_string_prefixes[parameter] + "_" + d2s( _MVP_parameter_combination[parameter], _parameter_string_precisions[parameter]);
	_folder_string		= _folder_string + "_" + _parameter_string_prefixes[parameter] + "_" + d2s( _PVs[_PV_offsets[parameter] + _MVP_combination_offset], _parameter_string_precisions[parameter]);	
	for(parameter = _MVP_parameter_index + 1; parameter < num_parameters; parameter++)	
		_folder_string 	= _folder_string + "_" + _parameter_string_prefixes[parameter] + "_" + d2s( _MVP_parameter_combination[parameter - 1], _parameter_string_precisions[parameter]);
	_folder_string	= substring(_folder_string, 1);				
	return _folder_string;	
}		
function generate_PV_offsets(_num_PVs)
{
	_num_parameters				= _num_PVs.length;
	_PV_offsets 	= newArray(_num_parameters);	
	for(i = 0; i < _num_parameters; i++)
		for(j = 0; j < i; j++)
			_PV_offsets[i] 	+= _num_PVs[j];		 
	return _PV_offsets;
}
function generate_PV_range_suffix_string(_PVs, _parameter_string_precision)
{	
	_TTP_extrema = find_array_extrema(_PVs, tolerance, false);
	_TTP_range_min_string		= d2s( _TTP_extrema[0], _parameter_string_precision);
	_TTP_range_max_string		= d2s( _TTP_extrema[1], _parameter_string_precision);
	_TTP_range_suffix			= "[" + _TTP_range_min_string + "-" + _TTP_range_max_string + "]";		
	return _TTP_range_suffix;
}							
function generate_PV_strings(_PVs, _parameter_string_precision, _minimize_string_length)
{
	_num_parameters 			= _PVs.length;
	_PV_strings	= newArray(_num_parameters);
	for(i = 0; i < _num_parameters; i++)
	{
		_PV_string = d2s(_PVs[i], _parameter_string_precision);
		if(_minimize_string_length)
			_PV_string = remove_trailing_zeros(_PV_string, _parameter_string_precision);
		_PV_strings[i]	= _PV_string;
	}
	return _PV_strings;
}
function generate_PVT_MVP_copy_suffixes(_current_test_PV_strings, _parameter_prefixes, _num_PVs, _parameter_precisions, _MVP_parameter_index, _MVP_parameter_range_filenaming)
{
	_suffix = "";
	_num_parameters = _parameter_prefixes.length;
	for(i = 0; i < _num_parameters - 1; i++)
	{
		if(_num_PVs[i] > 1)
		{
			if(i != _MVP_parameter_index)
				_suffix += _parameter_prefixes[i] + "=" + remove_trailing_zeros(_current_test_PV_strings[i], _parameter_precisions[i]) + "_";
			else
				_suffix += _MVP_parameter_range_filenaming + "_";
		}
		
	}
	return substring(_suffix, 0, lengthOf(_suffix) -1);						
}
function generate_plot_title_parameter_string(_current_PVT_value_strings, _TTP_index, _TTP_range_suffix, _parameter_string_prefixes)
{
	_plot_title_parameter_string 		= "";
	for(parameter = 0; parameter < _TTP_index; parameter++)
		_plot_title_parameter_string 	+= _parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";
	_plot_title_parameter_string 		+= _parameter_string_prefixes[parameter] + " = " + _TTP_range_suffix;										
	return _plot_title_parameter_string;
}					
function generate_reduced_modulo_values(_num_PVs, _modulo_values, _skip_index)
{
	_num_modulo_values 							= _modulo_values.length;
	_modulo_value_divisor						= _num_PVs[_skip_index];
	_reduced_modulo_values 						= newArray(_num_modulo_values - 1);	
	Array.fill									(_reduced_modulo_values, 1);
	for(i = 0; i < _num_modulo_values; i++)
	{
		if(i < _skip_index)
			_reduced_modulo_values[i] 			= _modulo_values[i] / _modulo_value_divisor;
		if(i >= _skip_index)
			if(i < _num_modulo_values)
				_reduced_modulo_values[i - 1] 	= _modulo_values[i];			
	}
	return _reduced_modulo_values;
}
function generate_reduced_PV_offsets(_num_PVs, _PV_offsets, _skip_index)
{
	_num_parameters										= _num_PVs.length;
	_reduced_PV_offsets 					= newArray(_num_parameters - 1);	
	_num_MVP_PVs						= _num_PVs[_skip_index];	
	Array.fill											(_reduced_PV_offsets, 1);
	for(i = 0; i < _num_parameters; i++)
	{
		if(i < _skip_index)	
			_reduced_PV_offsets[i] 		= _PV_offsets[i];
		if(i >= _skip_index + 1)
			_reduced_PV_offsets[i - 1]		= _PV_offsets[i] - _num_MVP_PVs;
	}
	return _reduced_PV_offsets;
}
function identify_missing_input_data(common_dir, current_PVT_folder, RSP_path, RSP_Error_path, Std_Dev_path)
{
	dir 			= construct_valid_dir_path(common_dir, current_PVT_folder);		
	data_verified 		= true;
	if(!File.exists(dir + RSP_path))
	{	
		print			("------->Missing RSP input file:\n" + dir + RSP_path);
		data_verified 	= false;
	}
	if(!File.exists(dir + RSP_Error_path))
	{	
		print			("------->Missing RSP error input file:\n" + dir + RSP_Error_path);
		data_verified 	= false;
	}
	if(!File.exists(dir + Std_Dev_path))
	{	
		print			("------->Missing standard deviation input file:\n" + dir + Std_Dev_path);
		data_verified 	= false;
	}
	return data_verified;			
}	
}																																																																				
function image_set_2_animated_GIF(image_type, dir, filenames, image_names_matching, GIF_filename, GIF_speed, print_image_paths, close_image_set, GIF_2_disk, overwrite_GIF, print_GIF_path, close_stack_after_saving)
{
	stack_dimensions 		= image_set_2_stack(image_type, dir, filenames, image_names_matching, GIF_filename, print_image_paths, close_image_set);
	stack_2_animated_GIF	(GIF_filename, dir, GIF_filename, GIF_speed, GIF_2_disk, overwrite_GIF, print_GIF_path, close_stack_after_saving);
	return stack_dimensions;
}			
function image_set_2_AVI(image_type, dir, filenames, image_names_matching, filename, compression, frame_rate, print_image_paths, close_image_set, AVI_2_disk, overwrite_AVI, print_path, close_stack_after_saving)
{
	stack_dimensions 	= image_set_2_stack(image_type, dir, filenames, image_names_matching, filename, print_image_paths, close_image_set);
	stack_2_AVI			(filename, dir, filename, compression, frame_rate, AVI_2_disk, overwrite_AVI, print_path, close_stack_after_saving);
	return stack_dimensions;
}
function image_set_2_stack(image_type, dir, filenames, image_names_matching, stack_title, print_image_paths, close_image_set)
{
	image_set			= open_image_set(image_type, dir, filenames, print_image_paths);
	stack_dimensions 	= opened_image_set_2_stack(image_names_matching, stack_title, close_image_set);
	if(close_image_set)
		for(i = 0; i < image_set.length; i++)
			close		(image_set[i]);
	return stack_dimensions;
}	
function import_MVP_comparison_data(_TEST_BATCH_DIR, _source_subdir, _source_filename, _file_extension, _CSV_column_headings, _CSV_num_rows)
{
	_path 						= construct_valid_dir_path(_TEST_BATCH_DIR, _source_subdir);
	_file_path 					= construct_valid_file_path(_path, _source_filename);
	if(File.exists(_file_path))
	{	
		print					("------->Reading compared data file = " + _source_filename);
		print					("           from:\n" + _path);
		if(_file_extension == ".txt")
			_compared_data		=  file_2_array(_path, _source_filename, false);
		else if(_file_extension == ".csv")
			_compared_data		=  csv_2_array(_path, _source_filename, _CSV_column_headings, _CSV_num_rows, ROW_MAJOR, false);		
		else
		{
			print				("****ERROR****No procedure defined for specified file type."); 
			_compared_data 		= newArray();
		}
		return _compared_data;
	}
	else
	{
		print					("****ERROR****: Compared data not found at:\n" + _file_path);				
		return newArray();		
	}
}
function import_MVP_comparison_data_CSV(_TEST_BATCH_DIR, _CSV_source_subdir, _CSV_source_filename, _CSV_column_headings, _CSV_num_rows)
{
	_path 								= construct_valid_dir_path(_TEST_BATCH_DIR, _CSV_source_subdir);
	_file_path 							= construct_valid_file_path(_path, _CSV_source_filename);
	if(File.exists(_file_path))
	{	
		print("------->Reading compared data file = " + _CSV_source_filename);
		print("           from:\n" + _path);
		_compared_data					=  csv_2_array(_path, _CSV_source_filename, _CSV_column_headings, _CSV_num_rows, ROW_MAJOR, false);
		return _compared_data;
	}
	else
	{
		print("****ERROR****: Compared data not found at:\n" + _file_path);				
		return newArray();		
	}
}
function import_MVP_comparison_data_TXT(_TEST_BATCH_DIR, _TXT_source_subdir, _TXT_source_filename)
{
	_path 								= construct_valid_dir_path(_TEST_BATCH_DIR, _TXT_source_subdir);
	_file_path 							= construct_valid_file_path(_path, _TXT_source_filename);
	if(File.exists(_file_path))
	{	
		print("------->Reading compared data file = " + _TXT_source_filename);
		print("           from:\n" + _path);		
		_compared_data					=  file_2_array(_path, _TXT_source_filename, false);
		return _compared_data;
	}
	else
	{
		print("****ERROR****: Compared data not found at:\n" + _file_path);				
		return newArray();		
	}
}					
function isMember(_match, _array)
{
	for(i = 0; i < _array.length; i++)							
		if( _array[i] ==  _match)			
			return true;				
	return false;		
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
	if(_profile_direction == X_DIRECTION)
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
	
	if(_profile_direction == X_DIRECTION)
		makeLine				(_profile_1st_edge, _ROI_constant_direction, _profile_2nd_edge, _ROI_constant_direction );	
	else
		makeLine				(_ROI_constant_direction, _profile_1st_edge, _ROI_constant_direction, _profile_2nd_edge );		
	_profile 					= getProfile();
	_profile_elements			= _profile.length;
	getSelectionCoordinates		(_xpoints, _ypoints);
	_selection_length			= _xpoints[1] - _xpoints[0];
	_point_separation			= _selection_length / (_profile_elements - 1);
	_x_axis_coordinates 			= Array.slice(_sequential_values, _profile_1st_edge, _profile_2nd_edge + 1);
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
function make_dir_chain(top_dir, subdir_chain, FOLDER_SEPARATOR, _MAKE_TOP_DIR, _print_directories_created)
{
	path 								= top_dir;
	subdir_chain_folders 			= split(subdir_chain, FOLDER_SEPARATOR);
	new_folder_paths 					= newArray(subdir_chain_folders.length);
	if(_MAKE_TOP_DIR)
	{
		if(_print_directories_created)
			print							("------->Creating top dir:\n" + path );
		dir_created_successfully	= make_dir_recorded(path, DIRECTORIES_CREATED, _print_directories_created);
	}
	for(i = 0; i < subdir_chain_folders.length; i++)
	{
		path 							+= FOLDER_SEPARATOR + subdir_chain_folders[i];
		new_folder_paths[i] 			= path;
		if(_print_directories_created)
			print						("------->Creating dir:\n" + path );
		dir_created_successfully	= make_dir_recorded(path, DIRECTORIES_CREATED, _print_directories_created);
	}
	return new_folder_paths;											
}
function make_dir_parents(top_dir, bottom_dir, FOLDER_SEPARATOR, _MAKE_TOP_DIR, _print_directories_created)
{
	bottom_dir_folders 			= split(bottom_dir, FOLDER_SEPARATOR);
	top_dir_folders 				= split(top_dir, FOLDER_SEPARATOR);
	return_statement					= "------->Top dir through target dir already exist\n";
	if(top_dir_folders.length != bottom_dir_folders.length)
	{
		if(_MAKE_TOP_DIR)
		{
			if(!File.exists(top_dir))
			{
				dir_created_successfully	= make_dir_recorded(top_dir, DIRECTORIES_CREATED, _print_directories_created);		
				return_statement =  "------->Top dir created:\n" + top_dir;	
			}
			else
				return_statement = "";			
		}
		path 								= top_dir;
		return_statement = return_statement + "------->Subdirectories created:\n";
		subdirectories_2_create = Array.slice(bottom_dir_folders, top_dir_folders.length, bottom_dir_folders.length);		
		for(i = 0; i < subdirectories_2_create.length; i++)
		{
			path 							+= FOLDER_SEPARATOR + subdirectories_2_create[i];
			if(!File.exists(path))
				dir_created_successfully	= make_dir_recorded(path, DIRECTORIES_CREATED, _print_directories_created);		
			//else
			//	print("------->Directory already exists");
			return_statement = return_statement + path + "\n";
		}
		return subdirectories_2_create;
	}
	else
		return_statement = return_statement + "--------------->Top dir and target dir are the same\n";
	if(_print_directories_created)
		print(return_statement);
	return return_statement;											
}
function make_dir_recorded(_dir_2_create, _dir_creation_record, _print_dir_path)
{
	if(!File.exists(_dir_2_create))
	{
		if(_print_dir_path)
			print("\n------->Creating dir and adding it to the dir created log:\n" + _dir_2_create);
		File.makeDirectory							(_dir_2_create);
		_dir_creation_record					= Array.concat(_dir_creation_record, _dir_2_create);		
		if(!File.exists(_dir_2_create))
			print("**************ERROR: Directory creation failure*********************\n" + _dir_2_create);
		return false;
	}
	else
		return true;
	//else
	//	print("------->Directory already exists");
	//return File.exists							(dir_2_create);
}
function make_dir_set(_common_parent_dir, _subdir_set, _dir_creation_record, _print_directories_created)
{
	_all_subdirectories_created			= newArray();
	for(i = 0; i < _subdir_set.length; i++)
	{					
		_subdirectories_created 		= make_subdir(_common_parent_dir, _subdir_set[i], _dir_creation_record, _print_directories_created);
		_all_subdirectories_created 	= Array.concat(_all_subdirectories_created, _subdirectories_created);
	}
	return _all_subdirectories_created;
}
function make_subdir(_parent_dir, _subdir, _dir_creation_record, _print_directories_created)
{
	_parent_dir_folders 			= split(_parent_dir, File.separator);
	_subdir_folders 				= split(_subdir, File.separator);
	_dir_2_create 				= _parent_dir;
	_directories_created				= newArray();
	make_dir_recorded(_parent_dir, _dir_creation_record, _print_directories_created);
	for(i = 0; i < _subdir_folders.length; i++)
	{
		_dir_2_create = construct_valid_dir_path(_dir_2_create, _subdir_folders[i]);
		//_dir_2_create	+= _subdir_folders[i];
		make_dir_recorded(_dir_2_create, _dir_creation_record, false);
		_directories_created = Array.concat(_directories_created, _dir_2_create);
	}
	if(_print_directories_created)
	{
		print("-------> Subdirectories created:\n");
		Array.print(_directories_created);
	}
	return _dir_2_create;
}
function material_name_2_RSP(material_name, is_simulated_scan)
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
function modn(value, divisor)
{
	modulo_value 		= value;
	while(modulo_value >= divisor)
		modulo_value 	-= divisor;
	return modulo_value;
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
function open_image(image_type, dir, filename, print_path)
{
	image_path 					= construct_valid_file_path(dir, filename);	
	if(print_image_paths)
		print					("------->Opening image from:\n" + image_path);
	if(image_type == TXT)
		run						("Text Image... ", "open=" + image_path);
	if(image_type == PNG)
		open					(image_path);
	run							("Size...", "width=x_frame_size height=y_frame_size constrain average interpolation=Bilinear");	
	run							("Set Measurements...", "area mean standard min redirect=None decimal=4");		
	INPUT_FILE_LIST				= Array.concat(INPUT_FILE_LIST, image_path);			
	return image_path;
}
function open_image_set(image_type, dir, filenames, print_image_paths)
{
	num_images_2_open 			= filenames.length;
	image_set 				= newArray(num_images_2_open);
	for(i = 0; i < num_images_2_open; i++)
	{
		image_filename 			= filenames[i] + image_type;
		image_set[i] 			= image_filename;
		open_image				(image_type, dir, image_filename, print_image_paths);
	}
	return image_set;
}			
function open_PNG_path(image_path, print_path)
{
	if(print_image_paths)
		print				("------->Opening PNG image from:\n" + image_path);
	open					(image_path);
	run						("Set Measurements...", "area mean standard min redirect=None decimal=4");		
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
function open_reconstructed_image(dir, filename)
{
	file_path 		= construct_valid_file_path(dir, filename);		
	run				("Text Image... ", "open=" + file_path);
	run				("Set Measurements...", "area mean standard min redirect=None decimal=4");	
	INPUT_FILE_LIST	= Array.concat(INPUT_FILE_LIST, file_path);					
}																						
function order_comparison_data(unordered_data, ordering_indices, _num_ROIs_2_analyze, images_per_recon, num_TTP_values)
{
	ordered_data 		= newArray(_num_ROIs_2_analyze * images_per_recon * num_TTP_values);
	ordered_data_index 	= 0;
	for(i = 0; i < ordering_indices.length; i++)
		ordered_data[i] = unordered_data[ordering_indices[i]];
	return ordered_data;										
}
function parameter_indices_2_index(num_PVs_, parameter_indices_)
{
	index 			= 0;
	modulo_value 	= 1;
	for(n = 0; n < num_PVs_.length; n++)
	{
		index 		+= parameter_indices_[n] * modulo_value;
		modulo_value *= num_PVs_[n]; 
	}
	return index;
}
function parameter_string_2_index(_parameter_string_prefixes, _parameter_string) 
{
	_num_parameters = _parameter_string_prefixes.length;
	for(i = 0; i < _num_parameters; i++)
		if( _parameter_string_prefixes[i] == _parameter_string)
			return i;
	return -1;
}
function PVs_2_parameter_equals_short_strings(_PVs, _PV_prefix, _PV_string_precision)
{
	_num_PVs	= _PVs.length;
	_PV_strings = newArray(_num_PVs);
	for(i = 0; i < _num_PVs; i++)
		_PV_strings[i]	= _PV_prefix + "=" + remove_trailing_zeros(d2s(_PVs[i], _PV_string_precision), _PV_string_precision);
	return _PV_strings;
}
function PVs_2_parameter_equals_strings(_PVs, _PV_prefix, _PV_string_precision)
{
	_num_PVs	= _PVs.length;
	_PV_strings = newArray(_num_PVs);
	for(i = 0; i < _num_PVs; i++)
		_PV_strings[i]	= _PV_prefix + "=" + d2s(_PVs[i], _PV_string_precision);
	return _PV_strings;
}
function PVT_folder_name_2_base(_folder_name, _TTP_prefix)
{
	_TTP_prefix_length 		= lengthOf		(_TTP_prefix);
	_start_index 		= indexOf		(_folder_name, _TTP_prefix );
	_end_index 			= _start_index + _TTP_prefix_length;
	_parameter_test_folder_basename 	= substring		(_folder_name, 0, _end_index);
	return _parameter_test_folder_basename;
}
function PVs_2_strings(_PVs, _PV_string_precision)
{
	_num_PVs	= _PVs.length;
	_PV_strings = newArray(_num_PVs);
	for(i = 0; i < _num_PVs; i++)
		_PV_strings[i]	= d2s(_PVs[i], _PV_string_precision);
	return _PV_strings;
}
function path_2_phantom_name(_path, _recon_data_folder)
{
	_folder_names 					= split(_path, File.separator);
	_recon_data_folder_name = substring(_recon_data_folder, 1);
	for(i = 0; i < _folder_names.length; i++)
		if(_folder_names[i] == _recon_data_folder_name)
			return _folder_names[i + 1];
}
function PNG_sequence_2_animations(PNG_sequence_dir, PNG_sequence_paths, group_2_extract, num_groups, group_size, _property_Booleans, _PNG_basename, _PNG_image_Booleans, _animation_filename, _animated_GIF_info, _AVI_info, close_stack_after_saving)
{
	_print_input_PNG_paths			= _PNG_image_Booleans[0];
	_close_stack_images				= _PNG_image_Booleans[1];
	_print_MVP_GIF_paths		= _animated_GIF_info[0];
	_close_MVP_stack_images	= _animated_GIF_info[2];
	_GIF_frame_rate					= _animated_GIF_info[3];
	_print_MVP_AVI_paths		= _AVI_info[0];
	_AVI_frame_rate					= _AVI_info[3];
	_AVI_compression_format			= _AVI_info[4];
	_write_GIF						= _property_Booleans[3];
	_overwrite_GIF					= _property_Booleans[4];
	_write_AVI						= _property_Booleans[5];
	_overwrite_AVI					= _property_Booleans[6];
	PNG_subsequence_paths 			= extract_subsequence_group(PNG_sequence_paths, group_2_extract, num_groups, group_size);	
	open_PNG_paths					(PNG_subsequence_paths, _print_input_PNG_paths);
	opened_image_set_2_stack		(_PNG_basename, _animation_filename, _close_stack_images);											
	stack_2_animated_GIF			(_animation_filename, PNG_sequence_dir, _animation_filename + GIF, _GIF_frame_rate, _write_GIF, _overwrite_GIF, _print_MVP_GIF_paths, DONT_CLOSE_WINDOW);
	stack_2_AVI						(_animation_filename, PNG_sequence_dir, _animation_filename + AVI, _AVI_compression_format, _AVI_frame_rate, _write_AVI, _overwrite_AVI, _print_MVP_AVI_paths, close_stack_after_saving);
	return PNG_subsequence_paths;
}
function PNG_sequence_2_stack(_PNG_sequence_paths, _group_2_extract, _num_groups, _group_size, _property_Booleans, _PNG_basename, _PNG_image_Booleans, _stack_title, _animated_GIF_info, _AVI_info, _close_stack_after_saving)
{
	_print_input_PNG_paths			= _PNG_image_Booleans[0];
	_close_stack_images				= _PNG_image_Booleans[1];
	_print_MVP_GIF_paths		= _animated_GIF_info[0];
	_close_MVP_stack_images	= _animated_GIF_info[2];
	_GIF_frame_rate					= _animated_GIF_info[3];
	_print_MVP_AVI_paths		= _AVI_info[0];
	_AVI_frame_rate					= _AVI_info[3];
	_AVI_compression_format			= _AVI_info[4];
	_write_GIF						= _property_Booleans[3];
	_overwrite_GIF					= _property_Booleans[4];
	_write_AVI						= _property_Booleans[5];
	_overwrite_AVI					= _property_Booleans[6];
	_PNG_subsequence_paths 			= extract_subsequence_group(_PNG_sequence_paths, _group_2_extract, _num_groups, _group_size);	
	open_PNG_paths					(_PNG_subsequence_paths, _print_input_PNG_paths);
	opened_image_set_2_stack		(_PNG_basename, _stack_title, true);											
	//opened_image_set_2_stack		(_PNG_basename, _stack_title, _close_stack_images);											
	return _PNG_subsequence_paths;
}
function prefixes_2_filenames(common_basename, filename_prefixes)
{
	num_prefixes		= filename_prefixes.length;
	filenames			= newArray(num_prefixes);
	for(i = 0; i < num_prefixes; i++)
		filenames[i]	= filename_prefixes[i] + common_basename;
	return 				filenames;
}
function print_aligned_key_value_pairs(key, value, aligned_at_column)
{
	key_string_length = lengthOf(key);
	value_string_length = lengthOf(value);
	padding_spaces		= aligned_at_column - key_string_length;
	padding_string		= "";
	for(i = 0; i < padding_spaces; i++)
		padding_string += "-";
	print(key + padding_string + " = " + value);	
}
function print_by_iteration_data()
{
	print("-------> RSPs_by_iteration  		="	); 	Array.print(RSPs_by_iteration);
	print("-------> RSP_errors_by_iteration	="	); 	Array.print(RSP_errors_by_iteration);
	print("-------> std_devs_by_iteration  	="	); 	Array.print(std_devs_by_iteration);
}
function print_by_ROI_data()
{
	print("-------> RSPs_by_ROI  		="	); 	Array.print(RSPs_by_ROI);
	print("-------> RSP_errors_by_ROI  	="	); 	Array.print(RSP_errors_by_ROI);
	print("-------> std_devs_by_ROI  	="	); 	Array.print(std_devs_by_ROI);
}		
function print_compared_data_subdir_info()
{
	print_section("Printing compared data subdir info", PRINT_MAJOR_SECTION													);
	print("-------> MVP_compared_data_subdir 						=\n " 	+ MVP_compared_data_subdir				);	
	print("-------> MVP_compared_RSP_data_subdir 					=\n " 	+ MVP_compared_RSP_data_subdir			);		
	print("-------> MVP_compared_RSP_error_data_subdir 				=\n " 	+ MVP_compared_RSP_error_data_subdir	);	
	print("-------> MVP_compared_std_dev_data_subdir 				=\n " 	+ MVP_compared_std_dev_data_subdir		);	
	print("-------> MVP_compared_TV_data_subdir 					=\n " 	+ MVP_compared_TV_data_subdir			);		
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
	asterisk_heading_suffix 			+= "";
	asterisk_heading_separator 			= asterisk_heading_prefix + section_heading + asterisk_heading_suffix;
	dash_heading_prefix 				+= " ";
	dash_heading_suffix 				+= "";
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
}
function print_current_PVT_info()
{
	print_section("Printing current parameter value test info", PRINT_MAJOR_SECTION											);
	print("-------> current_test_start_folder 								=\n " 	+ current_test_start_folder							);				
	print("-------> current_test_end_folder 						 		=\n " 	+ current_test_end_folder							);				
	print("-------> current_test_folder_basename							=\n " 	+ current_test_folder_basename						);
	print("-------> current_test_folders									: 	" 														);	Array.print(current_test_folders);			
	print("-------> current_test_PV_strings 		 			: 	" 														);	Array.print(current_test_PV_strings);		
	print("-------> current_test_PVs_string			 		=\n " 	+ current_test_PVs_string				);				
	print("-------> current_test_plot_title_PVs_string  		=\n " 	+ current_test_plot_title_PVs_string	);						
	print("-------> current_test_parameter_equals_strings  					: 	"														);	Array.print(current_test_parameter_equals_strings);					
	print("-------> current_test_parameter_equals_short_strings  			: 	"														);	Array.print(current_test_parameter_equals_short_strings);									
	print("-------> current_test_file_suffix  								=\n " 	+ current_test_file_suffix							);									
}
function print_current_PVT_MVP_info()
{
	print_section("Printing current parameter value test multiplot info...", PRINT_MAJOR_SECTION									);
	print("-------> current_test_MVP_start_folder 			 		=\n " 	+ current_test_MVP_start_folder					);	
	print("-------> current_test_MVP_end_folder 			 			=\n " 	+ current_test_MVP_end_folder						);				
	print("-------> current_test_MVP_folders					 		= 	" 															);	Array.print(current_test_MVP_folders);
	print("-------> current_test_MVP_value_strings 		 			= 	" 															);	Array.print(current_test_MVP_value_strings);	
	print("-------> current_test_MVP_title_PVs_string	=\n " 	+ current_test_MVP_title_PVs_string	);								
	print("-------> current_test_MVP_PVs_string  		=\n " 	+ current_test_MVP_PVs_string		);						
	print("-------> current_test_MVP_parameter_equals_strings 		: 	" 															);	Array.print(current_test_MVP_parameter_equals_strings);	
	print("-------> current_test_MVP_parameter_equals_short_strings 	: 	" 															);	Array.print(current_test_MVP_parameter_equals_short_strings);	
	print("-------> current_test_MVP_file_suffix  					=\n " 	+ current_test_MVP_file_suffix					);									
}
function print_current_PVT_parent_dir_info()
{	
	print_section("Printing current parameter test input/output directories, paths, and filenames", true																					);
	print		("------->\n PVT_identifier												=\n" 	+ PVT_identifier												); 					
	print		("------->\n PVTs_input_dir_parent 									=\n" 	+ PVTs_input_dir_parent									);
	print		("------->\n PVTs_output_dir_parent 									=\n"	+ PVTs_output_dir_parent									);
	print		("------->\n current_PVT_output_dir_parent 							=\n"	+ current_PVT_output_dir_parent							);	
	print		("------->\n current_PVT_parent_folder 									=\n"	+ current_PVT_parent_folder									);	
	print		("------->\n current_PVT_parent_dir 									=\n"	+ current_PVT_parent_dir									);	
	print		("------->\n current_PVT_plot_parent_folder 								=\n"	+ current_PVT_plot_parent_folder								);	
	print		("------->\n current_PVT_plot_parent_dir 							=\n"	+ current_PVT_plot_parent_dir							);	
	print		("------->\n current_PVT_MVP_parent_folder 							=\n"	+ current_PVT_MVP_parent_folder							);	
	print		("------->\n current_PVT_MVP_parent_dir 						=\n"	+ current_PVT_MVP_parent_dir						);	
					
	print		("------->\n current_PVT_output_dir_path 							=\n"	+ current_PVT_output_dir_path							);	
	print		("------->\n current_PVT_subdir 										=\n"	+ current_PVT_subdir										);	
						
	print		("------->\n current_PVT_TV_analysis_subdir 							=\n"	+ current_PVT_TV_analysis_subdir							);	
	print		("------->\n current_PVT_TV_analysis_PV_subdir 			=\n"	+ current_PVT_TV_analysis_PV_subdir			);	
	print		("------->\n current_PVT_ROI_analysis_subdir 						=\n"	+ current_PVT_ROI_analysis_subdir						);	
	print		("------->\n current_PVT_ROI_analysis_short_subdir 					=\n"	+ current_PVT_ROI_analysis_short_subdir					);	
	print		("------->\n current_PVT_ROI_analysis_PV_subdir 		=\n"	+ current_PVT_ROI_analysis_PV_subdir		);	
	print		("------->\n current_PVT_ROI_analysis_PV_short_subdir	=\n"	+ current_PVT_ROI_analysis_PV_short_subdir	);	
								
	print		("------->\n current_PVT_TV_analysis_path  								=\n"	+ current_PVT_TV_analysis_path									);	
	print		("------->\n current_PVT_TV_analysis_PV_path  				=\n"	+ current_PVT_TV_analysis_PV_path					);	
	print		("------->\n current_PVT_ROI_analysis_path  								=\n"	+ current_PVT_ROI_analysis_path								);	
	print		("------->\n current_PVT_ROI_analysis_PV_path  				=\n"	+ current_PVT_ROI_analysis_PV_path				);	
						
	print		("------->\n current_PVT_plot_ROI_analysis_path  							=\n"	+ current_PVT_plot_ROI_analysis_path							);	
	print		("------->\n current_PVT_plot_TV_analysis_path  							=\n"	+ current_PVT_plot_TV_analysis_path							);	
						
	print		("------->\n current_PVT_MVP_ROI_analysis_path  						=\n"	+ current_PVT_MVP_ROI_analysis_path						);	
	print		("------->\n current_PVT_MVP_ROI_analysis_PV_path  		=\n"	+ current_PVT_MVP_ROI_analysis_PV_path		);	
	print		("------->\n current_PVT_MVP_TV_analysis_path 						=\n"	+ current_PVT_MVP_TV_analysis_path						);	
	print		("------->\n current_PVT_MVP_TV_analysis_PV_path 		=\n"	+ current_PVT_MVP_TV_analysis_PV_path		);												
}
function print_ImageJ_info()
{
	print_section("Printing ImageJ info", PRINT_MAJOR_SECTION);
	print("-------> IMAGEJ_PLUGINS_DIR =\n ", IMAGEJ_PLUGINS_DIR);
	print("-------> IMAGEJ_MACRO_DIR =\n ", IMAGEJ_MACRO_DIR);
	print("-------> IMAGEJ_LAUNCH_DIR =\n ", IMAGEJ_LAUNCH_DIR);
	print("-------> IMAGEJ_PREVIOUS_MACRO =\n ", IMAGEJ_PREVIOUS_MACRO);
	print("-------> GITHUB_MACRO_DIR =\n ", GITHUB_MACRO_DIR);
	print("-------> RECON_DATA_DIR_C =\n ", RECON_DATA_DIR_C);
	print("-------> RECON_DATA_DIR_D =\n ", RECON_DATA_DIR_D);
	print("-------> ROI_ANALYSIS_MACRO_FILENAME =\n ", ROI_ANALYSIS_MACRO_FILENAME);
	print("-------> ROI_ANALYSIS_MACRO_PATH =\n ", ROI_ANALYSIS_MACRO_PATH);
	print("-------> MULTIPLOTTING_MACRO_FILENAME =\n ", MULTIPLOTTING_MACRO_FILENAME);
	print("-------> MULTIPLOTTING_MACRO_PATH =\n ", MULTIPLOTTING_MACRO_PATH);
	print("-------> TEST_RESULT_COMPARISON_MACRO_FILENAME =\n ", TEST_RESULT_COMPARISON_MACRO_FILENAME);
	print("-------> TEST_RESULT_COMPARISON_MACRO_PATH =\n ", TEST_RESULT_COMPARISON_MACRO_PATH);
	print("-------> AUTO_BREAK_FILENAME =\n ", AUTO_BREAK_FILENAME);
	print("-------> AUTO_BREAK_PATH =\n ", AUTO_BREAK_PATH);		
}
function print_MVP_parameter_info()
{			
	print_section("Printing parameter test multiplot info", PRINT_MAJOR_SECTION								);
	print		("-------> MVP_parameter_index 					=\n " 	+ MVP_parameter_index				);
	print		("-------> MVP_parameter	 						=\n " 	+ MVP_parameter					);
	print		("-------> MVP_parameter_prefix 					=\n " 	+ MVP_parameter_prefix			);
	print		("-------> MVP_PVs 					: 	" 											);	Array.print	(MVP_PVs);
	print		("-------> MVP_PV_strings 			: 	" 											);	Array.print	(MVP_PV_strings);
	print		("-------> MVP_PV_short_strings 		: 	" 											);	Array.print	(MVP_PV_short_strings);
	print		("-------> MVP_parameter_equals_strings 			: 	" 											);	Array.print	(MVP_parameter_equals_strings);	
	print		("-------> MVP_parameter_equals_short_strings 	: 	" 											);	Array.print	(MVP_parameter_equals_short_strings);	
	print		("-------> MVP_test_parameter_min_value	 		=\n " 	+ MVP_test_parameter_min_value	);
	print		("-------> MVP_test_parameter_max_value	 		=\n " 	+ MVP_test_parameter_max_value	);
	print		("-------> MVP_parameter_min_value_string	 		=\n " 	+ MVP_parameter_min_value_string	);
	print		("-------> MVP_parameter_max_value_string	 		=\n " 	+ MVP_parameter_max_value_string	);		
	print		("-------> MVP_parameter_range_suffix	 			=\n " 	+ MVP_parameter_range_suffix		);
	print		("-------> MVP_parameter_range_filenaming	 		=\n " 	+ MVP_parameter_range_filenaming	);
	print		("-------> MVP_parameter_range_plots	 			=\n " 	+ MVP_parameter_range_plots		);
	print		("-------> num_MVP_PVs 				=\n " 	+ num_MVP_PVs		);
	print		("-------> reduced_PVs_lower 				: 	" 											);	Array.print	(reduced_PVs_lower);
	print		("-------> reduced_PVs_upper 				: 	" 											);	Array.print	(reduced_PVs_upper);
	print		("-------> reduced_PVs 					: 	" 											);	Array.print	(reduced_PVs);
	print		("-------> reduced_PV_offsets 				: 	"											);	Array.print	(reduced_PV_offsets);
	print		("-------> reduced_modulo_values     					: 	"											);	Array.print	(reduced_modulo_values);
	print		("-------> reduced_TTP_index 			=\n " 	+ reduced_TTP_index	);	
	print		("-------> reduced_total_combinations 					=\n " 	+ reduced_total_combinations			);
	print		("-------> all_reduced_parameter_combination_indices	: 	"											);	Array.print	(all_reduced_parameter_combination_indices);
	print		("-------> all_reduced_parameter_combinations 			: 	"											);	Array.print	(all_reduced_parameter_combinations);
	print		("-------> all_reduced_folder_strings 					: 	"											);	Array.print	(all_reduced_folder_strings);
	print		("-------> all_reduced_path_strings   					: 	"											);	Array.print	(all_reduced_path_strings);				
}
function print_input_output_filenames()
{
	print_section("Printing input/output filenames of ROI analysis, parameter value test comparisons, and parameter value test comparison multiplots", PRINT_MAJOR_SECTION);
	print		("\n*ROI analysis input/output filenames----------------------------> "															);	
	print		("-------> ROI_ANALYSIS_TV_IFNAME 							=\n " 	+ ROI_ANALYSIS_TV_IFNAME					);									// 
	print		("-------> ROI_ANALYSIS_RSP_OFNAME 						=\n " 	+ ROI_ANALYSIS_RSP_OFNAME					);									// 
	print		("-------> ROI_ANALYSIS_RSP_ERROR_OFNAME 					=\n " 	+ ROI_ANALYSIS_RSP_ERROR_OFNAME			);									// 
	print		("-------> ROI_ANALYSIS_STD_DEV_OFNAME 					=\n " 	+ ROI_ANALYSIS_STD_DEV_OFNAME				);									// 
	print		("-------> ROI_ANALYSIS_TV_OFNAME 							=\n " 	+ ROI_ANALYSIS_TV_OFNAME					);									// 
	
	print		("\n*Parameter value test input/output filenames--------------------> "															);	
	print		("-------> PVT_RSP_output_filename2 				=\n " 	+ PVT_RSP_output_filename2			);									// 
	print		("-------> PVT_RSP_error_output_filename2 			=\n " 	+ PVT_RSP_error_output_filename2	);									// 
	print		("-------> PVT_std_dev_output_filename2 			=\n " 	+ PVT_std_dev_output_filename2		);									// 
	print		("-------> PVT_TV_output_filename2 					=\n " 	+ PVT_TV_output_filename2			);									// 
}
function print_test_parameter_file_info()
{	
	print_section("Printing parameter value test info...", PRINT_MAJOR_SECTION											);
	print		("-------> parameter_test_number							=\n" 	+ parameter_test_number							);
	print		("-------> parameter_test_info_filename						=\n" 	+ parameter_test_info_filename					);
	print		("-------> num_TTP_tests					=\n"	+ num_TTP_tests				);
	print		("-------> num_parameters									=\n"	+ num_parameters								);	
	print		("-------> PVs									: "														);	Array.print	(PVs);
	print		("-------> num_PVs								: "														);	Array.print	(num_PVs);
	print		("-------> PV_offsets 							: "														);	Array.print	(PV_offsets);
	print		("-------> parameter_string_prefixes						: "														);	Array.print	(parameter_string_prefixes);
	print		("-------> parameter_string_short_prefixes					: "														);	Array.print	(parameter_string_short_prefixes);		
	print		("-------> parameter_string_precisions						: "														);	Array.print	(parameter_string_precisions);
	print		("-------> modulo_values 									: "														);	Array.print	(modulo_values);
	
}
function print_TTP_info()
{	
	print_section("Printing parameter value test info...", PRINT_MAJOR_SECTION											);
	print		("-------> TTP							=\n" 	+ TTP							);	
	print		("-------> TTP_index						=\n" 	+ TTP_index					);	
	print		("-------> TTP_prefix						=\n" 	+ TTP_prefix					);	
	print		("-------> TTP_values 					: "														);	Array.print(TTP_values);	
	print		("-------> TTP_value_strings 				: "														);	Array.print(TTP_value_strings);
	print		("-------> TTP_value_short_strings 		: "														);	Array.print(TTP_value_short_strings);
	print		("-------> TTP_equals_strings 			: "														);	Array.print(TTP_equals_strings);	
	print		("-------> TTP_equals_short_strings 		: "														);	Array.print(TTP_equals_short_strings);	
	print		("-------> TTP_min_value					=\n" 	+ TTP_min_value				);		
	print		("-------> TTP_max_value					=\n" 	+ TTP_max_value				);		
	print		("-------> TTP_min_value_string			=\n" 	+ TTP_min_value_string		);		
	print		("-------> TTP_max_value_string			=\n" 	+ TTP_max_value_string		);			
	print		("-------> TTP_range_suffix				=\n" 	+ TTP_range_suffix			);		
	print		("-------> TTP_range_filenaming			=\n" 	+ TTP_range_filenaming		);		
	print		("-------> TTP_range_plots				=\n" 	+ TTP_range_plots				);		
	print		("-------> num_TTP_values 				=\n"	+ num_TTP_values				);
	print		("-------> total_combinations 								=\n" 	+ total_combinations							);
	print		("-------> all_parameter_combination_indices				: "														);	Array.print	(all_parameter_combination_indices);
	print		("-------> all_parameter_combinations						: "														);	Array.print	(all_parameter_combinations);
	print		("-------> all_folder_strings								: "														);	Array.print	(all_folder_strings);
	print		("-------> all_path_strings									: "														);	Array.print	(all_path_strings);
	}
function print_reconstructed_image_info()
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
	print		("-------> images_per_recon					=\n " 	+ images_per_recon						);
	print		("-------> reconstructed_image_strings					: "														);	Array.print	(reconstructed_image_strings);
	print		("-------> reconstructed_image_folders					: "														);	Array.print	(reconstructed_image_folders);
}
function print_ROI_analysis_info()
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
function print_ROI_definitions()
{
	print_section("Printing ROI definitions and info", PRINT_MAJOR_SECTION				);
	print	("-------> PHANTOM_BASENAME					= " 	+ PHANTOM_BASENAME					);
	print	("-------> ROI_DEFINITIONS_FILENAME			= " 	+ ROI_DEFINITIONS_FILENAME			);
	print	("-------> ROI_DEFINITIONS_FILE_PATH		= " 	+ ROI_DEFINITIONS_FILE_PATH			);
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
function prompt_4_image_set(dir, image_type, stack_suffix, dialog_position_x, dialog_position_y, dialog_character_width)
{		
	dir_folder 			= File.getName(dir_path);
	default_image_basename		= "x_";
	Dialog.create				("Specify reconstructed image set to open");
	Dialog.addString			("Basename common to images in set", default_image_basename); 
	Dialog.addNumber			("Specify 1st image #", 0, 0, dialog_character_width, ""); 
	Dialog.addNumber			("Specify 2nd image #", 12, 0, dialog_character_width, ""); 
	Dialog.addChoice			("Combine image set into image stack", newArray(TRUE, FALSE), TRUE);
	Dialog.setLocation			(dialog_position_x, dialog_position_y);
	Dialog.show					();
	_image_basename 				= Dialog.getString();
	first_image_number 			= Dialog.getNumber();
	second_image_number 		= Dialog.getNumber();
	do_image_set_2_stack	 	= Dialog.getChoice();
	filenames					= number_range_2_filenames(_image_basename, "", first_image_number, second_image_number, 0);
	image_set					= open_image_set(image_type, dir, filenames, TRUE);
	stack_name					= _image_basename + stack_suffix;
	if(do_image_set_2_stack == TRUE)
		opened_image_set_2_stack(_image_basename, stack_name, "false");
	return 						stack_name;
}
function pt()
{
	print("=======>Debugging location marker print #" + debug_print_counter++);
}	
function query_image_dimensions(dir_path, initial_iterate_filename)
{
	file_path 			= construct_valid_file_path(dir_path, initial_iterate_filename);		
	run					("Text Image... ", "open=" + file_path);
	getDimensions		(image_columns, image_height, image_channels, image_layers, image_frames);
	image_rows 			= image_columns;
	image_slices 		= image_height / image_rows;
	image_dimensions 	= newArray(image_columns, image_rows, image_slices, image_height, image_channels, image_layers, image_frames);
	run					("Close");	
	return image_dimensions;
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
function read_ROI_definitions(_path, _recon_data_folder, _ROI_definition_file_dir, _ROI_definitions_filename_suffix, _ROI_PV_parseFloat, _print_path)
{
	_phantom_name 								= path_2_phantom_name(_path, _recon_data_folder);
	_ROI_definition_filename					= _phantom_name_folder + _ROI_definitions_filename_suffix;
	_ROI_definition_file_key_value_pairs		= file_2_array(_ROI_definition_file_dir, _ROI_definition_filename, _print_path);
	_num_ROI_key_value_pairs					= _ROI_definition_file_key_value_pairs.length;
	_ROI_definition_file_key_values				= newArray(_num_ROI_key_value_pairs);
	_ROI_parameter_keys 						= newArray(_num_ROI_key_value_pairs);
	_bulk_material_decoding_op					= "none";//	= epoxy
	_ROI_profile_radius_beyond_ROI_decoding_op 	= "parseFloat";//	= 8														
	_ROI_selection_radii_decoding_op			= "parseFloat"; //	= 3.5, 4, 6
	_ROI_shapes_decoding_op						= "none";// = CIRCULAR_ROI, CIRCULAR_ROI, CIRCULAR_ROI, CIRCULAR_ROI, CIRCULAR_ROI, CIRCULAR_ROI, CIRCULAR_ROI, CIRCULAR_ROI
	_ROI_material_names_decoding_op				= "none"; //= air, air, PMP, LDPE,	polystyrene, acrylic, delrin, teflon
	_ROI_labels_decoding_op						= "none"; //= Air(bottom), Air(top), PMP, LDPE, Polystyrene, Acrylic, Delrin, Teflon
	_ROI_diameters_decoding_op					= "parseFloat";	//= 12.2, 12.2, 12.2, 12.2, 12.2, 12.2, 12.2, 12.2
	_ROI_parameter_decoding_ops					= newArray(_bulk_material_decoding_op, _ROI_profile_radius_beyond_ROI_decoding_op, _ROI_selection_radii_decoding_op, _ROI_shapes_decoding_op, _ROI_material_names_decoding_op, _ROI_labels_decoding_op, _ROI_diameters_decoding_op);	
	//ROI_definition_numbers_decoding_op			= "parseFloat";	
	//ROI_definition_strings_decoding_op			= "none";		
	_all_ROI_PVs 					= newArray();
	for(i = 0; i < num_ROI_key_value_pairs; i++)
	{
		_ROI_key_value_pair_separation_index	= indexOf(_ROI_definition_file_key_value_pairs[i], "=");
		_ROI_values_string						= substring(_ROI_definition_file_key_value_pairs[i], _ROI_key_value_pair_separation_index + 1);
		_ROI_parameter_key 						= substring(_ROI_definition_file_key_value_pairs[i], 0, _ROI_key_value_pair_separation_index);
		_spaceless_key_string 					= strip_surrounding_spaces(_ROI_parameter_key);
		_ROI_parameter_keys[i] 					= _spaceless_key_string;
		_ROI_PVs					= split(_ROI_values_string, ",");
		_num_ROI_PVs 				= _ROI_PVs.length;
		for(j = 0; j < _num_ROI_PVs; j++)
		{
			_spaceless_value_string 			= strip_surrounding_spaces(_ROI_PVs[j]);
			_ROI_PVs[j] 			= _spaceless_value_string;
			if(_ROI_parameter_decoding_ops[i] == _ROI_PV_parseFloat)
				_ROI_PVs[j] 		= parseFloat(_spaceless_value_string);
		}
		_all_ROI_PVs 				= Array.concat(_all_ROI_PVs, _num_ROI_PVs, _ROI_PVs);
	}
	return _all_ROI_PVs;	
}
function remove_N_trailing_characters(_string, _N)
{
	return substring(_string, 0, lengthOf(_string) - _N);	
}
function remove_trailing_zeros(value_string, max_precision)
{
	min_precision 			= 0;
	value 					= parseFloat(value_string);
	for(i = 0; i < max_precision; i++)
	{
		new_value_string 	= d2s(value, i);
		new_value 			= parseFloat(new_value_string);
		if(value - new_value == 0)
			return new_value_string;
	}
	return value_string;
}
function remove_trailing_zeros_set(value_strings, max_precisions)
{
	_num_strings			= value_strings.length;
	_new_strings			= newArray(_num_strings);
	for(i = 0; i < _num_strings; i++)
	{
		new_value_string 	= remove_trailing_zeros(value_strings[i], max_precisions[i]);
		_new_strings[i]		= new_value_string;
	}
	return _new_strings;
}
function results_table_2_CSV(dir, filename, overwrite_existing, print_path, clear_results)
{
	filepath 			= construct_valid_file_path(dir, filename);	
	if(print_path)
		print			("------->Writing contents of results table to CSV at:\n" + filepath);
	if(!File.exists(filepath) || overwrite_existing)
	{
		saveAs			("Measurements", filepath);	
		OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, filepath);			
	}
	if(clear_results)
		run				("Clear Results");	
}
function ROI_material_names_2_RSPs(_ROI_material_names, _is_simulated_scan)
{
	_num_ROIs_2_analyze 		= _ROI_material_names.length;
	_ROI_material_RSPs 			= newArray(_num_ROIs_2_analyze);
	for(ROI = 0; ROI < _num_ROIs_2_analyze; ROI++)
		_ROI_material_RSPs[ROI] 	= material_name_2_RSP(_ROI_material_names[ROI], _is_simulated_scan);
	return _ROI_material_RSPs;
}
function save_AVI(dir, filename, compression, frame_rate, overwrite_existing, print_path, close_stack_after_saving)
{
	path 					= construct_valid_file_path(dir, filename);	
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
function save_GIF(dir, filename, overwrite_existing, print_path, _close_stack_after_saving)
{
	path 		= construct_valid_file_path(dir, filename);	
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
function save_PNG(dir, filename, overwrite_existing, close_image, print_path)
{
	PNG_filename 			= construct_valid_file_path(dir, filename);		
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
function series_product(series)
{
	product 		= 1;
	series_length 	= series.length;
	for(i = 0; i < series_length; i++)
		product 	*= series[i];
	return product;
}
function series_partial_product(series, start_index, end_index)
{
	partial_product 	= 1;
	series_length 		= series.length;
	for(i = start_index; i <= end_index; i++)
		partial_product	*= series[i];
	return partial_product;
}
function series_sum(series)
{
	sum 			= 0;
	series_length 	= series.length;
	for(i = 0; i < series_length; i++)
		sum 		+= series[i];
	return sum;
}
function series_partial_sum(series, start_index, end_index)
{
	partial_sum 	= 0;
	series_length 	= series.length;
	for(i = start_index; i <= end_index; i++)
		partial_sum	+= series[i];
	return partial_sum;
}
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
		_legend_text 		+= "\n" + _legend_entries[i];
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
function set_ROI_y_coordinates(slice, rows_per_slice, y_offsets)
{
	y_upper_LHS 			= (slice - 1) * rows_per_slice;			// y-coordinate of upper left corner of slice to be analyzed
	y_coordinates 			= Array.copy(y_offsets);
	for (i = 0; i < y_offsets.length; i++)
		y_coordinates[i] 	+= y_upper_LHS;
	return y_coordinates;
}
function slice_2_PNG(dir, filename, slice, flip_horizontally, flip_vertically, min, max, overwrite_existing, window_title, close_image )
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
	save_PNG			(dir, filename, overwrite_existing, close_image, false);				
}
function stack_2_animated_GIF(_stack_title, _GIF_dir, _GIF_filename, _GIF_speed, _GIF_2_disk, _overwrite_GIF, _print_GIF_path, _close_stack_after_saving)
{
	selectImage		(_stack_title);
	run				("Animation Options...", "speed=" + _GIF_speed);
	if(_GIF_2_disk)
		save_GIF	(_GIF_dir, _GIF_filename, _overwrite_GIF, _print_GIF_path, _close_stack_after_saving);
	
}
function stack_2_AVI(stack_title, dir, filename, compression, frame_rate, AVI_2_disk, overwrite_AVI, print_path, close_stack_after_saving)
{
	selectImage		(stack_title);
	if(AVI_2_disk)
		save_AVI	(dir, filename, compression, frame_rate, overwrite_AVI, print_path, close_stack_after_saving);
}
function string_2_array(string) { return split(string); }
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
//function string_array_concatenation(_string_array, _front_concatenation_string, _back_concatenation_string)
//{
//	_num_array_strings = _string_array.length;
//	_concatenated_string_array = newArray(_num_array_strings);
//	for(i = 0; i < _num_array_strings; i++)
//		_concatenated_string_array[i] = _front_concatenation_string + _string_array[i] + _back_concatenation_string;
//  	return _concatenated_string_array;
//}
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
		starts_with_space 		= startsWith(spaceless_string, " ") || startsWith(spaceless_string, "\n") || startsWith(spaceless_string, "\t");
		if(starts_with_space)
			spaceless_string 	= substring(spaceless_string, 1);
	} 
	while (starts_with_space);
	do 
	{
		string_length			= lengthOf(spaceless_string); 
		ends_with_space 		= endsWith(spaceless_string, " ") || endsWith(spaceless_string, "\n") || endsWith(spaceless_string, "\t");
		if(ends_with_space)
			spaceless_string 	= substring(spaceless_string, 0, string_length - 1);
	} 
	while (ends_with_space);	
	return spaceless_string;
}
function subdir_array_concatenation(_subdir_array, _front_concatenation_subdir, _back_concatenation_subdir)
{
	_num_array_subdirectories = _subdir_array.length;
	_concatenated_subdir_array = newArray(_num_array_subdirectories);
	for(i = 0; i < _num_array_subdirectories; i++)
	{
		if(lengthOf(_front_concatenation_subdir) > 0)
		{	
			_concatenated_subdir = construct_valid_dir_path(_front_concatenation_subdir, _subdir_array[i]);
			//print				("_concatenated_subdir =" + _concatenated_subdir);		
			if(lengthOf(_back_concatenation_subdir) > 0)						
			{	
				_concatenated_subdir = construct_valid_dir_path(_concatenated_subdir, _back_concatenation_subdir);
				//print				("_concatenated_subdir =" + _concatenated_subdir);	
			}
		}							
		else
		{
			if(lengthOf(_back_concatenation_subdir) > 0)						
			{	
				_concatenated_subdir = construct_valid_dir_path(_subdir_array[i], _back_concatenation_subdir);
				//print				("_concatenated_subdir2 =" + _concatenated_subdir);	
			}
			else
			{
				_concatenated_subdir = _subdir_array[i];
				//print				("_concatenated_subdir2 =" + _concatenated_subdir);			
			}
		}		
		_concatenated_subdir_array[i]	= 		_concatenated_subdir;			
	}
	return _concatenated_subdir_array;
}
function suffixes_2_filenames(common_basename, filename_suffixes)
{
	num_suffixes		= filename_suffixes.length;
	filenames			= newArray(num_suffixes);
	for(i = 0; i < num_suffixes; i++)
		filenames[i]	= common_basename + filename_suffixes[i];
	return 				filenames;
}
function elementwise_abs(_array)
{
	for(j = 0; j < _array.length; j++)						
		_array[j] = abs(_array[j]);
	return _array;
}
function verify_distributed_files(_paths)
{
	_num_files = _paths.length;
	if(_num_files == 0)
		return false;
	for(i = 0; i < _num_files; i++)
	{
		//file_path = construct_valid_file_path(directories[i], filenames[i]);
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
		file_path = construct_valid_file_path(directories[i], filenames[i]);
		if(!File.exists(file_path))
			return false;
	}
	return true;
}
function verify_file_set(common_dir, common_basename, filename_suffixes, file_extension)
{
	num_files = filename_suffixes.length;
	file_set_validated = true;
	for(i = 0; i < num_files; i++)
	{
		file_path = construct_valid_file_path(common_dir, common_basename + filename_suffixes[i] + file_extension);
		if(!File.exists(file_path))
			return false;
	}
	return true;
}
function verify_input_data(_common_dir, _current_PVT_folders, _current_analysis_RSP_input_data_filenames, _current_analysis_RSP_error_input_data_filenames, _current_analysis_std_dev_input_data_filenames, _current_analysis_TV_input_data_filenames)
{
	for( i = 0; i < _current_PVT_folders.length; i++)
	{
		dir 	= _common_dir + _current_PVT_folders[i];
		print		("------->Verifying RSP input data file exists at:\n" + dir + _current_analysis_RSP_input_data_filenames);
		print		("------->Verifying RSP error input data file exists at:\n" + dir + _current_analysis_RSP_error_input_data_filenames);
		print		("------->Verifying standard deviation input data file exists at:\n" + dir + _current_analysis_std_dev_input_data_filenames);
		print		("------->Verifying total variation (TV) input data file exists at:\n" + dir + _current_analysis_TV_input_data_filenames);
		if(!File.exists(dir + _current_analysis_RSP_input_data_filenames))
			return false;
		if(!File.exists(dir + _current_analysis_RSP_error_input_data_filenames));
			return false;
		if(!File.exists(dir + _current_analysis_std_dev_input_data_filenames));
			return false;
		if(!File.exists(dir + _current_analysis_TV_input_data_filenames));
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
function verify_recon_output(_recon_data_dir, _recon_output_dir, _reconstructed_image_filenames, _TV_input_data_filename, _print_path)
{
	_recon_output_dir_path = construct_valid_dir_path(_recon_data_dir, _recon_output_dir);		
	if(_print_path)
		print				("-------> Verifying reconstruction output data exists for:\n" + _recon_output_dir_path				);		
	else
		print				("-------> Verifying reconstruction output data exists...");		
	data_verified 			= true;
	_num_iterations			= _reconstructed_image_filenames.length;
	for(iteration = 0; iteration < _num_iterations; iteration++)
	{
		check_image_path 	= _recon_output_dir_path + File.separator + _reconstructed_image_filenames[iteration];
		if(!File.exists(check_image_path))
		{
			print			("ERROR: reconstructed image does not exist:\n" + check_image_path);
			data_verified 	= false;
			missing_data	= Array.concat(missing_data, check_image_path);
			return false;
		}			
	}
	check_TV_path			= _recon_output_dir_path + File.separator + _TV_input_data_filename;
	if(!File.exists(check_TV_path))
	{
		print				("ERROR: TV measurement file does not exist:\n" + check_TV_path);
		data_verified 		= false;
		missing_data		= Array.concat(missing_data, check_TV_path);
		return false;
	}
	if(data_verified)
		print		("=======> RECON OUTPUT DATA VERIFIED\n");
	else
		print		("=======> RECON OUTPUT DATA NOT FOUND\n");
	
	return data_verified;			
}
function verify_recon_output_set(_recon_data_dir, _recon_output_dir, _reconstructed_image_filenames, _TV_input_data_filename)
{
	_recon_output_dir_path = construct_valid_dir_path(_recon_data_dir, _recon_output_dir);		
	print				("-------> Verifying reconstruction output data exists for:\n" + _current_PVT_folder				);		
	//_recon_output_data_
	data_verified 			= true;
	_num_iterations			= _reconstructed_image_filenames.length;
	for(iteration = 0; iteration < _num_iterations; iteration++)
	{
		check_image_path 	= _recon_output_dir_path + File.separator + _reconstructed_image_filenames[iteration];
		if(!File.exists(check_image_path))
		{
			print			("ERROR: one or more reconstructed images do not exist:\n" + check_image_path);
			data_verified 	= false;
			missing_data	= Array.concat(missing_data, check_image_path);
		}			
	}
	check_TV_path			= _recon_output_dir_path + File.separator + _TV_input_data_filename;
	if(!File.exists(check_TV_path))
	{
		print				("ERROR: TV measurement file does not exist:\n" + check_TV_path);
		data_verified 		= false;
		missing_data		= Array.concat(missing_data, check_TV_path);
	}
	if(data_verified)
		print		("=======> RECON OUTPUT DATA VERIFIED\n" + _current_PVT_folder);
	else
		print		("=======> RECON OUTPUT DATA NOT FOUND\n" + _current_PVT_folder);
	return data_verified;			
}
function verify_ROI_analysis_output_files(_common_dir, _current_PVT_folder, _ROI_analysis_RSP_ofname, _ROI_analysis_RSP_error_ofname, _ROI_analysis_std_dev_ofname, _ROI_analysis_TV_ifname, _slices_2_analyze_folders, _ROI_selection_diameter_folders, _print_path)
{
	_missing_data 		= false;
	if(_print_path)
		print				("-------> Verifying ROI analysis has been performed on the reconstruction data at:\n" + _current_PVT_folder				);		
	else
		print				("-------> Verifying ROI analysis has been performed on the reconstruction data");		
	for(_ROI_selection_diameter_index = 0; _ROI_selection_diameter_index < _ROI_selection_diameter_folders.length; _ROI_selection_diameter_index++)
	{
		for(_slice_2_analyze_index = 0; _slice_2_analyze_index < _slices_2_analyze_folders.length; _slice_2_analyze_index++)
		{
			_slice_2_analyze_folder 			= _slices_2_analyze_folders[_slice_2_analyze_index];
			_ROI_selection_diameter_folder 		= _ROI_selection_diameter_folders[_ROI_selection_diameter_index];					
			_current_analysis_subdir		= _slice_2_analyze_folder + _ROI_selection_diameter_folder;					
			_current_ROI_analysis_subdir	= _slice_2_analyze_folder + _ROI_selection_diameter_folder;					
			_current_TV_analysis_subdir	= "";					
				
			_current_analysis_ROI_analysis_RSP_ofname			= _current_ROI_analysis_subdir 	+ File.separator 	+ _ROI_analysis_RSP_ofname;
			_current_analysis_ROI_analysis_RSP_error_ofname	= _current_ROI_analysis_subdir 	+ File.separator 	+ _ROI_analysis_RSP_error_ofname;
			_current_analysis_ROI_analysis_std_dev_ofname		= _current_ROI_analysis_subdir 	+ File.separator 	+ _ROI_analysis_std_dev_ofname;
			_current_analysis_ROI_analysis_TV_ifname			= _current_TV_analysis_subdir 	+ File.separator	+ _ROI_analysis_TV_ifname;				
			
			_source_folder		= construct_valid_dir_path(_common_dir, _current_PVT_folder				);
			_RSP_file_path		= construct_valid_file_path(_source_folder, _current_analysis_ROI_analysis_RSP_ofname			);
			_RSP_error_file_path= construct_valid_file_path(_source_folder, _current_analysis_ROI_analysis_RSP_error_ofname	);
			_std_dev_file_path	= construct_valid_file_path(_source_folder, _current_analysis_ROI_analysis_std_dev_ofname		);
			_TV_file_path		= construct_valid_file_path(_source_folder, _current_analysis_ROI_analysis_TV_ifname			);

			//print("RSP file path = " + _RSP_file_path);
			//print("RSP error file path = " + _RSP_error_file_path);
			//print("RSP std dev file path = " + _std_dev_file_path);
			//print("TV file path = " + _TV_file_path);
			if(!File.exists(_RSP_file_path))
				_missing_data = true;
			if(!File.exists(_RSP_error_file_path))
				_missing_data = true;
			if(!File.exists(_std_dev_file_path))
				_missing_data = true;
			if(!File.exists(_TV_file_path))
				_missing_data = true;				
		}
	}
	if(_missing_data)
		print		("=======> ROI analysis data missing for:\n" + _current_PVT_folder);
	else
		print		("=======> ROI ANALYSIS HAS BEEN COMPLETED\n" + _current_PVT_folder);
	return _missing_data;						
}
function verify_ROI_analysis_output_file_set(_common_dir, _current_PVT_folders, _current_analysis_RSP_input_data_filenames, _current_analysis_RSP_error_input_data_filenames, _current_analysis_std_dev_input_data_filenames, _current_analysis_TV_input_data_filenames)
{
	missing_data_directories = newArray();
	print_section		("------->Verifying ROI analysis output data files exist for specified set of reconstructions:\n", PRINT_MAJOR_SECTION);
	for( i = 0; i < _current_PVT_folders.length; i++)
	{
		missing_data = false;
		dir 	= _common_dir + _current_PVT_folders[i];
		if(!File.exists(dir + _current_analysis_RSP_input_data_filenames))
			missing_data = true;
		if(!File.exists(dir + _current_analysis_RSP_error_input_data_filenames))
			missing_data = true;
		if(!File.exists(dir + _current_analysis_std_dev_input_data_filenames))
			missing_data = true;
		if(!File.exists(dir + _current_analysis_TV_input_data_filenames))
			missing_data = true;
		if(missing_data)
			missing_data_directories = Array.concat(missing_data_directories, dir);		
	}
	if(missing_data_directories.length > 0)
	{
		print		("=======> ROI analysis data missing for:\n", PRINT_MINOR_SECTION);
		for(i=0; i < missing_data_directories.length; i++)
			print("-------> " + missing_data_directories[i]);
	}
	return missing_data_directories;						
}

