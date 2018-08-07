//PRINT_STATUS										= true;
//C:\Users\Blake\Documents\GitHub\pCT-collaboration\pCT_Tools\ImageJ
macro "merge_data"
{
	//***************************************************************************************************************************************************************************************************//
	//************* Execution control Booleans and general parameter value test and multiplot behavior Booleans ************************************************************************************************************************************//
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
//	CLOSE_PNG										= true;
//	DONT_CLOSE_PNG									= false;
	CLEAR_RESULTS_TABLE								= true;
	DONT_CLEAR_RESULTS_TABLE						= false;		
	MAKE_TOP_DIR									= true;
	DONT_MAKE_TOP_DIR								= false;
	MAKE_TOP_DIRECTORY								= true;
	DONT_MAKE_TOP_DIRECTORY							= false;
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	ALL_BOOL 										= false;
	NONE_BOOL 										= true;
	AND_LOGIC 										= true;
	OR_LOGIC 										= false;
	EXPLICIT_BOOL									= true;
	DEPENDENT_BOOL									= false;
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	RETURN_STRING									= true;
	RETURN_ARRAY									= false;
	FORCE_VALUE_2_ARRAY								= true;
	DONT_FORCE_VALUE_2_ARRAY						= false;
	ARRAY_FILL_CYCLIC								= true;
	ARRAY_FILL_DUPLICATE							= false;
	RETURN_MATCH_INDEX								= true;
	RETURN_MATCH_TF									= false;
	RETURN_FORCE_ARRAY								= true;
	RETURN_DONT_FORCE_ARRAY							= false;
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//	PRINT_MAJOR_SECTION								= true;
//	PRINT_MINOR_SECTION								= false;	
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
	STD_LINE_PROFILE								= false;
	GRADIENT_LINE_PROFILE							= true;
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
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************ CSV file merging Booleans ************************************************************************************//
	//***************************************************************************************************************************************************************************************************//			
	PROMPT_TEST_BATCH_DIR							= true;
	//PROMPT_TEST_BATCH_DIR_CONTROLLED							= true;
	SIMULATED_SCAN 														= false;
	EXPERIMENTAL_SCAN 													= !SIMULATED_SCAN;
	//log_printing														= true;			
	exporting_log														= false;		
	debug_path_printing													= false;
	printing_ROI_definitions											= true;		
	printing_reconstructed_image_analysis_info							= true;
	printing_PVT_info													= true;
	printing_multiplot_parameter_info									= true;	
	print_ROI_definitions_path											= false;		
	print_directories_created											= false;	
	print_input_data_path												= true;
	print_input_CSV_path												= false;
	print_input_TXT_path												= false;
	print_input_PNG_paths												= false;
	print_output_CSV_path												= true;
	print_output_TXT_path												= true;
	print_output_PNG_paths												= false;
	PRINT_ANALYSIS_CFG_PATH										= true;
	PRINT_ROI_DEFINITIONS_PATH									= true;		
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	LOG_PRINTING												= true;			
	EXPORTING_LOG												= false;		
	DEBUG_PATH_PRINTING											= false;
	PRINTING_ROI_DEFINITIONS									= true;		
	PRINTING_RECONSTRUCTED_IMAGE_ANALYSIS_INFO					= true;
	PRINTING_PVT_INFO											= true;
	PRINTING_PARAMETER_VALUE_TEST_INFO							= PRINTING_PVT_INFO;
	PRINTING_MULTIPLOT_PARAMETER_INFO							= true;	
	PRINT_DIRECTORIES_CREATED									= false;	
	PRINT_SLICE_OPS												= false;		
	PRINT_CURRENT_ITERATION										= true;		
	PRINT_TASK_PROGRESS											= true;		
	PRINT_INPUT_DATA_PATH										= true;
	PRINT_INPUT_CSV_PATH										= false;
	PRINT_INPUT_TXT_PATH										= false;
	PRINT_INPUT_PNG_PATHS										= false;
	PRINT_OUTPUT_CSV_PATH										= true;
	PRINT_OUTPUT_TXT_PATH										= true;
	PRINT_OUTPUT_PNG_PATHS										= false;
	PRINT_COPIED_FILE_PATHS										= false;
	CLOSE_SAVED_PNG_IMAGE										= true;
	CLOSE_INPUT_PNG_IMAGES										= true;
	CLOSE_OUTPUT_PNG_IMAGES										= true;
	SPECIFY_MVP_PARAMETER_PREFIX								= true;
	SPECIFY_MVP_PARAMETER_NUMBER								= true && !SPECIFY_MVP_PARAMETER_PREFIX;
	SPECIFY_MVP_PARAMETER_INDEX									= true && !SPECIFY_MVP_PARAMETER_PREFIX && !SPECIFY_MVP_PARAMETER_NUMBER;
	WRITE_FOLDER_STRINGS 										= false;
	WRITE_PATH_STRINGS 											= false;		
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	ROI_DEBUGGING 												= false;
	PRINT_ROI_EXTRACTION 										= false || ROI_DEBUGGING;
	PRINT_ROI_SLICES 											= true && PRINT_ROI_EXTRACTION;
	PRINT_ROI_COORDINATES 										= true && PRINT_ROI_EXTRACTION;
	PRINT_ROI_PARAMETERS 										= true && PRINT_ROI_EXTRACTION;
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************ CSV file merging Booleans ************************************************************************************//
	//***************************************************************************************************************************************************************************************************//			
	perform_data_merging												= true;	
	//merge_ROI_analysis_CSVs												= true;
	merge_ROI_analysis_CSVs 											= true;
	merge_ROI_analysis_RSP_CSVs											= true;
	merge_ROI_analysis_RSP_Error_CSVs									= true;
	merge_ROI_analysis_Std_Dev_CSVs										= true;
	merge_TV_CSVs														= true;
	//merge_multiplot_CSVs												= true;
	merge_multiplot_CSVs 								= true;
	merge_multiplot_RSP_CSVs											= true && merge_multiplot_CSVs;
	merge_multiplot_RSP_Error_CSVs										= true && merge_multiplot_CSVs;
	merge_multiplot_Std_Dev_CSVs										= true && merge_multiplot_CSVs;
	merge_multiplot_TV_CSVs												= true && merge_multiplot_CSVs;
	write_merged_data 									= true;
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
	overwrite_merged_data 												= true;
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
	overwrite_merged_multiplot_data 									= true;
	overwrite_merged_multiplot_CSV_data 								= true;// && overwrite_merged_multiplot_data;
	overwrite_merged_multiplot_TXT_data 								= true && overwrite_merged_multiplot_data;
	overwrite_merged_multiplot_RSP_CSV_data 							= true && overwrite_merged_multiplot_CSV_data;
	overwrite_merged_multiplot_RSP_Error_CSV_data 						= true && overwrite_merged_multiplot_CSV_data;
	overwrite_merged_multiplot_Std_Dev_CSV_data 						= true && overwrite_merged_multiplot_CSV_data;
	overwrite_merged_multiplot_TV_CSV_data 								= true && overwrite_merged_multiplot_CSV_data;
	overwrite_merged_multiplot_RSP_TXT_data 							= true && overwrite_merged_multiplot_TXT_data;
	overwrite_merged_multiplot_RSP_Error_TXT_data 						= true && overwrite_merged_multiplot_TXT_data;
	overwrite_merged_multiplot_Std_Dev_TXT_data 						= true && overwrite_merged_multiplot_TXT_data;
	overwrite_merged_multiplot_TV_TXT_data 								= true && overwrite_merged_multiplot_TXT_data;
	merge_PVT_CSVs														= true;
	merge_PVT_RSP_CSVs													= true && merge_PVT_CSVs;
	merge_PVT_RSP_Error_CSVs											= true && merge_PVT_CSVs;
	merge_PVT_Std_Dev_CSVs												= true && merge_PVT_CSVs;
	merge_PVT_TV_CSVs													= true && merge_PVT_CSVs;
	//write_PVT_CSVs														= true;
	write_PVT_CSVs														= true;
	write_PVT_RSP_CSVs													= true && write_PVT_CSVs;
	write_PVT_RSP_Error_CSVs											= true && write_PVT_CSVs;
	write_PVT_Std_Dev_CSVs												= true && write_PVT_CSVs;
	write_PVT_TV_CSVs													= true && write_PVT_CSVs;
	overwrite_PVT_CSVs													= true;
	overwrite_PVT_RSP_CSVs												= true && overwrite_PVT_CSVs;
	overwrite_PVT_RSP_Error_CSVs										= true && overwrite_PVT_CSVs;
	overwrite_PVT_Std_Dev_CSVs											= true && overwrite_PVT_CSVs;
	overwrite_PVT_TV_CSVs												= true && overwrite_PVT_CSVs;
	merge_PVT_TXTs														= true;
	merge_PVT_RSP_TXTs													= true && merge_PVT_TXTs;
	merge_PVT_RSP_Error_TXTs											= true && merge_PVT_TXTs;
	merge_PVT_Std_Dev_TXTs												= true && merge_PVT_TXTs;
	merge_PVT_TV_TXTs													= true && merge_PVT_TXTs;
	//write_PVT_TXTs														= true;
	write_PVT_TXTs														= true;
	write_PVT_RSP_TXTs													= true && write_PVT_TXTs;
	write_PVT_RSP_Error_TXTs											= true && write_PVT_TXTs;
	write_PVT_Std_Dev_TXTs												= true && write_PVT_TXTs;
	write_PVT_TV_TXTs													= true && write_PVT_TXTs;
	overwrite_PVT_TXTs													= true;
	overwrite_PVT_RSP_TXTs												= true && overwrite_PVT_TXTs;
	overwrite_PVT_RSP_Error_TXTs										= true && overwrite_PVT_TXTs;
	overwrite_PVT_Std_Dev_TXTs											= true && overwrite_PVT_TXTs;
	overwrite_PVT_TV_TXTs												= true && overwrite_PVT_TXTs;
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************ Define Boolean constants *************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	RETURN_ERROR_CODE								= -1;
	BOOL_CONVERSION									= -1;
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	PRINTING_ON										= 0;
	PRINTING_OFF									= 1;	
	PRINTING_GROUPS									= 2;	
	PRINTING_VARS									= 3;	
	PRINT_MAJOR_SECTION								= 0;
	PRINT_MINOR_SECTION								= 1;	
	PRINT_STAR_SEP									= 2;
	PRINT_DASH_SEP									= 3;	
	PRINT_SLASH_SEP									= 4;
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
	RETURN_ALL										= 2;
	RETURN_COUNT									= 3; 
	RETURN_PER_SLICE								= 4;
	RETURN_INDICES									= 5;
	RETURN_ELEMENTS									= 6;
	RETURN_MINMAX									= 7;
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
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	RETURN_XCOORDINATES								= 0;
	RETURN_YCOORDINATES								= 1;
	RETURN_COORDINATE_PAIRS							= 2;
	RETURN_COORDINATE_PAIR_STRING					= 3;
	RETURN_XPARAMETERS								= 0;
	RETURN_YPARAMETERS								= 1;
	RETURN_PARAMETERS								= 2;
	RETURN_PARAMETERS_STRING						= 3;
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	ROI_MATERIAL_NAMES_LINENUM						= 0;
	ROI_LABELS_LINENUM								= 1;
	ROI_LABEL_NICKNAMES_LINENUM						= 2;
	ROI_TYPES_LINENUM								= 3;
	ROI_DIAMETERS_LINENUM							= 4;
	XPARAMS_LINENUM									= 5;
	YPARAMS_OFFSETS_LINENUM							= 6;
	ROI_SLICES_LINENUM								= 7;
	ROI_SELECTION_RADII_LINENUM						= 8;
	ROI_PROFILE_RADIUS_LINENUM						= 9;
	BULK_MATERIAL_LINENUM							= 10;
	SLICES_ZERO_INDEXED								= 0;
	SLICES_NUM_INDEXED								= 1;
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	RECTANGLE 										= 0;
	OVAL 											= 1;
	POLYGON 										= 2;
	FREEHAND 										= 3;
	TRACED 											= 4;
	STRAIGHT_LINE 									= 5;
	SEGMENTED_LINE 									= 6;
	FREEHAND_LINE 									= 7;
	ANGLE 											= 8;
	COMPOSITE 										= 9;
	POINT 											= 10;
	MULTIPOINT 										= 11;
	ROUNDRECT 										= 12;
	ROTRECT 										= 13;
	CIRCLE 											= 14;
	ELLIPSE 										= 15;
	WAND 											= 16;
	BRUSH 											= 17;
	ARROW 											= 18;
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************ Define numeric constants *************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	PRINT_STATUS									= PRINT_ON();
	LOOP_LOWER_BOUND								= 0;
	LOOP_UPPER_BOUND								= 1;
	DASHES_PER_CHAR 								= 1.3;										// Average width of a character in terms of the width of a dash character 
	NUM_TAB_SPACES 									= 8;
	MIN_SUM_ARROW_LENGTH							= 3;
	TOLERANCE										= 0.0000001;								// Tolerance separating min/max values of array used in findMinima/findMaxima
	FLOAT_ARRAY_2_FILE_PRECISION					= 6;										// Precision to use for writing TV reduction values to CSV files
	ITERATIONS_STRING_PRECISION 					= 0;										// # of digits after decimal point to use in conversion of iteration # to string 	
	SLICES_STRING_PRECISION 						= 0;										// # of digits after decimal point to use in conversion of iteration # to string 	
	ROI_SELECTION_DIAMETER_STRING_PRECISION			= 0;										// # of digits after decimal point to use in conversion of an ROI selection diameter value to string	
	//***************************************************************************************************************************************************************************************************//
	//************************************** Parameters whose values rarely change, effectively constants ***********************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	tolerance						= 0.0000001;									// Tolerance separating min/max values of array used in findMinima/findMaxima
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************ Define array constants *************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	EMPTY_ARRAY 									= newArray();								// Passed to set_plot_extrema when no additional lines are plotted
	//SEQUENTIAL_VALUES_ARRAY						= Array.getSequence(maxOf(x_columns, x_rows));							// Long sequential values array which other sequence arrays can be sliced from	
	//SEQUENTIAL_VALUES_ARRAY						= Array.getSequence(1000);							// Long sequential values array which other sequence arrays can be sliced from	
	SEQUENTIAL_VALUES_ARRAY							= Array.getSequence(100);					// Long sequential values array which other sequence arrays can be sliced from	
//	POWERS_OF_2										= newArray(0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512);
	POWERS_OF_2										= array_powers_of_2(5);
	MISSING_COLUMN_RESULTS 							= newArray("null", NaN);
//	sobel_x 						= "[-1 0 1\n-2 0 2\n-1 0 1\n]";					// Matrix convolved with image to generate approximate image gradient in x-direction
//	sobel_y 						= "[-1 -2 -1\n0 0 0\n1 2 1\n]";					// Matrix convolved with image to generate approximate image gradient in y-direction
//	scharr_x 						= "[-3 0 3\n-10 0 10\n-3 0 3\n]";				// Matrix convolved with image to generate approximate image gradient in x-direction
//	scharr_y 						= "[-3 -10 -3\n0 0 0\n3 10 3\n]";				// Matrix convolved with image to generate approximate image gradient in y-direction
//	gradient_x_kernel				= scharr_x;										// Specify which matrix to convolve with image to generate approximate x-direction derivative
//	gradient_y_kernel				= scharr_y;										// Specify which matrix to convolve with image to generate approximate x-direction derivative
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************* Define string constants *************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	EMPTY_STRING 									= "";										// String constant: empty string
	SPACE_STRING 									= " ";										// String constant: space character string
	UNDERSCORE_STRING 								= "_";										// String constant: underscore character string
	COMMA_STRING 									= ",";										// String constant: comma character string
	DECIMAL_STRING 									= ".";										// String constant: decimal character string
	//PERIOD_STRING 									= ".";										// String constant: period character string
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
	//----------------------------------------------------------------
	ROI_PARAMETER_SEP								= ",";	
	ROI_PARAMETER_PAIR_SEP							= "+";	
	ROI_PARAMETER_GROUP_SEP							= ";";	
	//----------------------------------------------------------------
	FOLDER_SEPARATOR								= File.separator;
	CFG 											= ".cfg";
	TXT 											= ".txt";
	CSV 											= ".csv";
	PNG 											= ".png";
	IJM 											= ".ijm";
	//----------------------------------------------------------------
	TRUE											= "true";
	FALSE											= "false";
	TRUE_STRING										= "true";
	FALSE_STRING									= "false";
	BOOL_TRUE_STRING								= "True";
	BOOL_FALSE_STRING								= "False";
	ROIDEF_NUMBER									= "parseFloat";	
	ROIDEF_STRING									= "none";	
	FLOAT_DECODING_OP								= "parseFloat";	
	INT_DECODING_OP									= "parseInt";	
	STRING_DECODING_OP								= "none";	
	BOOL_DECODING_OP								= "parseBool";	
	MEAN_MEAS_FLAG 									= "mean";	
	MEDIAN_MEAS_FLAG 								= "median";	
	MODE_MEAS_FLAG 									= "modal";	
	MINMAX_MEAS_FLAG 								= "min";	
	STDDEV_MEAS_FLAG 								= "standard";	
	CENTROID_MEAS_FLAG 								= "centroid";	
	COM_MEAS_FLAG 									= "center";	
	BOUNDING_MEAS_FLAG 								= "bounding";	
	INT_DENSITY_MEAS_FLAG 							= "integrated";	
	PERIMETER_MEAS_FLAG 							= "perimeter";	
	AREA_MEAS_FLAG 									= "area";	
	LABEL_MEAS_FLAG 								= "display add";	
	COLUMN_SUM_ROW_LABEL 							= "Sum";	
	TV_BEFORE_TVS_LABEL 							= "TV: Before TVS";	
	TV_AFTER_TVS_LABEL 								= "TV: After TVS";
	TV_REDUCTION_LABEL 								= "TVS TV Reduction";
	TV_TABLE_TITLES									= newArray(TV_BEFORE_TVS_LABEL, TV_AFTER_TVS_LABEL, TV_REDUCTION_LABEL);
	OTVS_row_header									= "OTVS";
	MONTH_NAMES 									= newArray("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
	DAY_NAMES 										= newArray("Sun", "Mon","Tue","Wed","Thu","Fri","Sat");
	ASK_KILL_DIALOG_TITLE							= "Continue or cancel execution?";
	ASK_KILL_DIALOG_STATEMENT						= "Select 'OK' to continue or 'Cancel' to halt execution";
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	CFG_PARAMETER_DECODINGS							= newArray(BOOL_DECODING_OP,  INT_DECODING_OP, 	 INT_DECODING_OP, INT_DECODING_OP, FLOAT_DECODING_OP, FLOAT_DECODING_OP, FLOAT_DECODING_OP, FLOAT_DECODING_OP, BOOL_DECODING_OP, 	BOOL_DECODING_OP,  INT_DECODING_OP, 		INT_DECODING_OP, 			INT_DECODING_OP				);		
	CFG_PARAMETER_LIST								= newArray("simulated_scan", "x_columns", 		"x_rows", 		 "x_slices", 	  "voxel_width", "voxel_height", 	"voxel_thickness", "voxels_per_mm",   "flip_horizontally",  "flip_vertically", "num_recon_iterations",  "first_iteration_2_analyze", "last_iteration_2_analyze" );
	ROI_MEAS_FLAGS									= newArray(AREA_MEAS_FLAG, MEAN_MEAS_FLAG, STDDEV_MEAS_FLAG, MODE_MEAS_FLAG, MINMAX_MEAS_FLAG, CENTROID_MEAS_FLAG, COM_MEAS_FLAG, PERIMETER_MEAS_FLAG, BOUNDING_MEAS_FLAG, INT_DENSITY_MEAS_FLAG, MEDIAN_MEAS_FLAG, LABEL_MEAS_FLAG );
	ROI_PARAMETER_DECODINGS							= newArray(STRING_DECODING_OP,    STRING_DECODING_OP,  STRING_DECODING_OP,    STRING_DECODING_OP,  FLOAT_DECODING_OP,  FLOAT_DECODING_OP,  FLOAT_DECODING_OP,  INT_DECODING_OP, FLOAT_DECODING_OP,     FLOAT_DECODING_OP,               STRING_DECODING_OP);		
	ROI_DEFINITIONS_PARAMETER_LIST					= newArray("ROI_material_names", "ROI_labels",        "ROI_label_nicknames", "ROI_shapes",        "ROI_diameters",    "ROI_xparams",         "ROI_yparams", "ROI_slices",    "ROI_selection_radii", "ROI_profile_radius_beyond_ROI", "bulk_material" );
	ROI_SELECTION_SHAPES							= newArray("rectangle", "oval", "polygon", "freehand", "traced", "straight_line", "segmented_line", "freehand_line", "angle",  "composite", "point", "multipoint", "roundrect", "rotrect", "circle", "ellipse", "wand", "brush", "arrow" );
	ROI_SELECTION_SHAPE_IDS							= newArray(RECTANGLE, 	 OVAL,	 POLYGON, 	FREEHAND, 	TRACED,   STRAIGHT_LINE,   SEGMENTED_LINE, 	 FREEHAND_LINE,   ANGLE, 	COMPOSITE, 	 POINT,   MULTIPOINT, ROUNDRECT, ROTRECT, CIRCLE, ELLIPSE, WAND, BRUSH, ARROW	);
	MAKE_SELECTION_TYPE_SPECIFIERS					= newArray(RECTANGLE, 	 OVAL,	 POLYGON, 	FREEHAND, 	TRACED,   STRAIGHT_LINE,   SEGMENTED_LINE, 	 FREEHAND_LINE,   ANGLE, 	COMPOSITE, 	 POINT				);
	MATERIAL_NAMES									= newArray("air", 	"PMP", 	"LDPE", "epoxy", "polystyrene", "PMMA", "acrylic", 	"delrin", "teflon", "soft tissue", 				  "brain tissue", 				  "spinal disk", 									"trabecular bone", 											"cortical bone", 									"dentin", 	"enamel"		);
	MATERIAL_ALIASES								= newArray("empty", 						 "poly",         		"acryl",    "del",    "tef", 	"soft",        "softTissue",  "brain",        "brainTissue",  "spinal", 		"spinalDisk", 	"disk", 		"trabecular",    	"trabecularBone", 	"trabec",			"cortical", 	 "corticalBone",  "cort",    		"den", 	  	"enam"			);
	MATERIAL_ALIAS_NAMES							= newArray("air", 							 "polystyrene", 		"acrylic", 	"delrin", "teflon", "soft tissue", "soft tissue", "brain tissue", "brain tissue", "spinal disk", 	"spinal disk", 	"spinal disk", 	"trabecular bone", 	"trabecular bone",	"trabecular bone", 	"cortical bone", "cortical bone", "cortical bone", 	"dentin", 	"enamel"		);
	MATERIAL_ALIAS_LUT								= Array.concat(MATERIAL_NAMES, MATERIAL_ALIASES		);
	MATERIAL_NAME_LUT								= Array.concat(MATERIAL_NAMES, MATERIAL_ALIAS_NAMES	);
	MATERIAL_NAMES_LCASE							= all_2_lowercase(MATERIAL_NAMES	);
	MATERIAL_ALIAS_LUT_LCASE						= all_2_lowercase(MATERIAL_ALIAS_LUT);
	MATERIAL_NAME_LUT_LCASE							= all_2_lowercase(MATERIAL_NAME_LUT	);
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	IJIO_READ_CSV									= 6;
	IJIO_WRITE_CSV									= 6;
	IJIO_READ_IMAGE									= 6;
	IJIO_WRITE_IMAGE								= 6;
	IJIO_PRECISION_CSV								= 6;
	IJIO_PRECISION_IMAGE							= 6;
	IJIO_RESULTSTABLE_EXTENSION 					= CSV;
	IJIO_RESULTSTABLE_OPTIONS 						= "copy_column copy_row save_column save_row";
	IJIO_JPEG_QUALITY 								= 85;
	IJIO_TRANSPARENT_INDEX 							= -1;
	//IJROI_ANALYSIS_MEASUREMENTS 					= "area mean standard min max display add";
	//IJROI_ANALYSIS_MEASUREMENTS 					= "area mean standard modal min centroid center perimeter bounding integrated median display add";
	IJROI_ANALYSIS_MEASUREMENTS 					= setMeasurementsFlags(ROI_MEAS_FLAGS);
	IJROI_ANALYSIS_REDIRECT 						= "None";	//"x_6.txt";
	IJROI_ANALYSIS_CSV_PRECISION 					= IJIO_PRECISION_CSV;
	IJROI_ANALYSIS_IMAGE_PRECISION 					= IJIO_PRECISION_IMAGE;
//	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	SLASH_SECTION_SEPARATOR 						= "///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////";
	ASTERISK_SECTION_SEPARATOR 						= "//*******************************************************************************************************************************************************************************************";
	DASH_SECTION_SEPARATOR 							= "//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------";
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
 	PCT_RECON_DIR									= "C:\\Users\\Blake\\Documents\\GitHub\\Baylor_ICTHUS\\pCT_Reconstruction\\";
 	GITHUB_MACRO_DIRECTORY_BAYLOR_ICTHUS			= "C:\\Users\\Blake\\Documents\\GitHub\\Baylor_ICTHUS\\pCT_Reconstruction\\Tools\\ImageJ\\";
 	GITHUB_MACRO_DIRECTORY_PCT_COLLABORATION		= "C:\\Users\\Blake\\Documents\\GitHub\\pCT-collaboration\\pCT_Tools\\ImageJ\\";
 	GITHUB_MACRO_DIR								= GITHUB_MACRO_DIRECTORY_PCT_COLLABORATION;
 	RECON_DATA_DIR_C								= "C:\\Users\\Blake\\Documents\\Education\\Research\\pCT\\pCT_data\\reconstruction_data";
	RECON_DATA_DIR_D								= "D:\\pCT\\pCT_data\\reconstruction_data";

	// ImageJ macro & execution parameters/settings/configurations/logging file info
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
	//PHANTOM_BASENAME								= "CTP404_Sensitom";
	//PHANTOM_BASENAME								= "CTP404_Sensitom_4M";
	PHANTOM_BASENAME								= "HN715_PedHead_0";
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
	CURRENT_RECON_DATA_DRIVE						= DRIVE_D;
	CURRENT_RECON_DATA_TYPE							= EXPERIMENTAL_DATA;
	
	if(CURRENT_RECON_DATA_DRIVE == DRIVE_C)					RECON_DATA_DIR 	= RECON_DATA_DIR_C;
	else if(CURRENT_RECON_DATA_DRIVE == DRIVE_D)			RECON_DATA_DIR 	= RECON_DATA_DIR_D;
	if(CURRENT_RECON_DATA_TYPE == SIMULATED_DATA) 			TEST_BATCH_DIR 	= RECON_DATA_DIR + PHANTOM_NAME_FOLDER + SIMULATED_DATA_FOLDER + RUN_DATE_FOLDER + RUN_NUMBER_FOLDER + OUTPUT_FOLDER + PREPROCESS_DATE_FOLDER + FOLDER_SEPARATOR;
	//else if(CURRENT_RECON_DATA_TYPE == EXPERIMENTAL_DATA)	TEST_BATCH_DIR 	= RECON_DATA_DIR + PHANTOM_NAME_FOLDER + EXPERIMENTAL_DATA_FOLDER + RUN_DATE_FOLDER + RUN_NUMBER_FOLDER + OUTPUT_FOLDER + PREPROCESS_DATE_FOLDER + FOLDER_SEPARATOR;		
	else if(CURRENT_RECON_DATA_TYPE == EXPERIMENTAL_DATA)	TEST_BATCH_DIR 	= RECON_DATA_DIR + PHANTOM_NAME_FOLDER + EXPERIMENTAL_DATA_FOLDER + FOLDER_SEPARATOR;		
	
	//D:\pCT\pCT_data\reconstruction_data\CTP404_Sensitom\Experimental\B_25600\B_25600_L_0.000100_TV_1_A_0.750000_L0_0_Nk_4
	//TEST_BATCH_DIR 								= File.getParent(DIRECTORY_PATH);
	TEST_BATCH_DIR 									= RECON_DATA_DIR + PHANTOM_NAME_FOLDER + EXPERIMENTAL_DATA_FOLDER + FOLDER_SEPARATOR + "B_25600" + FOLDER_SEPARATOR;		
	//PROMPT_TEST_BATCH_DIR=true;
	//if(PROMPT_TEST_BATCH_DIR)
	//	TEST_BATCH_DIR 								= getDirectory("Choose a Directory");
	////TEST_BATCH_DIR = "D:\\pCT\\pCT_data\\reconstruction_data\\CTP404_Sensitom\\Experimental\\B_25600";
	
	// ImageJ macro & execution parameters/settings/configurations/logging file info
 	GITHUB_MACRO_CONFIGS_FOLDER						= "AnalysisConfigs";
 	GITHUB_MACRO_CONFIGS_SUBDIR						= GITHUB_MACRO_DIR + FOLDER_SEPARATOR + GITHUB_MACRO_CONFIGS_FOLDER;
	MATERIAL_RSP_DEFS_FILENAME 						= "material_RSP_defs" + TXT;
	MATERIAL_RSP_DEFS_PATH 							= GITHUB_MACRO_CONFIGS_SUBDIR + FOLDER_SEPARATOR + MATERIAL_RSP_DEFS_FILENAME;
	ROI_DEFINITIONS_FILENAME_SUFFIX					= "_ROIs" + TXT;	
	ROI_DEFINITIONS_FILENAME						= PHANTOM_BASENAME + ROI_DEFINITIONS_FILENAME_SUFFIX;
	ROI_DEFINITIONS_FILE_PATH						= GITHUB_MACRO_CONFIGS_SUBDIR + FOLDER_SEPARATOR + ROI_DEFINITIONS_FILENAME;
	AUTO_BREAK_FILENAME 							= "autobreak" + TXT;
	AUTO_BREAK_PATH 								= GITHUB_MACRO_CONFIGS_SUBDIR + FOLDER_SEPARATOR + AUTO_BREAK_FILENAME;
	ANALYSIS_CFG_INFO_FILENAME						= "analysis.cfg";
	ANALYSIS_CFG_INFO_FILE_PATH						= GITHUB_MACRO_CONFIGS_SUBDIR + FOLDER_SEPARATOR + ANALYSIS_CFG_INFO_FILENAME;
	PARAMETER_TEST_INFO_BASENAME					= "Test_Parameters_";
	AVERAGING_FOLDERS_FILENAME 						= "averaging_folders" + TXT;
	COMPARED_FOLDERS_FILENAME 						= "compared_folders" + TXT;	
	MULTIPLOT_FOLDERS_FILENAME 						= "multiplot_folders" + TXT;
	RECON_FOLDERS_FILENAME 							= "reconstruction_folders" + TXT;
	SPECIFIC_DATA_FOLDERS_FILENAME 					= "ROI_analysis_folders" + TXT;
	ANALYSIS_LOG_FNAME 								= "AnalysisLog.nfo";
	// ImageJ macro & execution parameters/settings/configurations/logging file info
	OTVS_dir_suffix									= "_OTVS";
		
// Input/Output dir/subdir names/prefixes 
	RECONSTRUCTED_IMAGE_FOLDER_PREFIX 				= "x";
	RECONSTRUCTED_IMAGE_FILE_BASENAMES 				= "x_";
	RECONSTRUCTED_IMAGE_FILE_SHORT_BASENAMES 		= "x";
	INITIAL_ITERATE_FILENAME 						= RECONSTRUCTED_IMAGE_FILE_BASENAMES + "0" + TXT;	
	ROI_SELECTIONS_IMAGE_FILE_BASENAMES				= RECONSTRUCTED_IMAGE_FILE_BASENAMES;
	ROI_SELECTIONS_IMAGE_FILE_SUFFIXES				= "ROIs" + PNG;
	COMPARED_DATA_FOLDER_SUFFIX						= "_compared";
	AVERAGED_DATA_FOLDER_SUFFIX						= "_avg";
	ITERATION_2_ANALYZE_FOLDER_PREFIX 				= "Iteration_";
	ROI_ANALYSIS_SLICE_2_ANALYZE_FOLDER_PREFIX 		= "Slice_";
	SLICE_2_ANALYZE_FOLDER_PREFIX 					= "Slice_";
	SLICE_2_ANALYZE_FOLDER_SHORT_PREFIX 			= "s";
	ROI_SELECTION_DIAMETER_FOLDER_PREFIX 			= "d";

	// Input/output info and data basenames/filenames
	//PROFILE_CSV_BASENAME 							= "Line_Profiles";
	//PROFILE0_CSV_BASENAME 							= "Line_Profiles_x_0";
	//PROFILE_DATA_FILE_BASENAMES 					= "Line_Profile";
	//REGIONS_DATA_FILE_BASENAMES						= "Region_Statistics";
	//GRADIENT_CSV_BASENAME 							= "Gradients";
	//GRADIENT_DATA_FILE_BASENAMES 					= "Gradient";	

	RSP_DATA_FILE_BASENAMES							= "RSP";
	RSP_ERROR_DATA_FILE_BASENAMES					= "RSP_Error";
	STD_DEV_DATA_FILE_BASENAMES						= "Std_Dev";
	TV_DATA_FILE_BASENAMES							= "TV";
	TV_MEASUREMENTS_BASENAME						= "TV_measurements";
//	TV_STEP_DATA_FILE_BASENAMES						= "TV_step";
//	TV_diff_DATA_FILE_BASENAMES						= "TV_diff";	
	
	RSP_DATA_FILE_BASE_NICKNAMES					= "RSP";
	RSP_ERROR_DATA_FILE_BASE_NICKNAMES				= "RSPe";
	STD_DEV_DATA_FILE_BASE_NICKNAMES				= "SD";
	TV_DATA_FILE_BASE_NICKNAMES						= "TV";
	TV_MEASUREMENTS_BASE_NICKNAME					= "TV";
//	TV_STEP_DATA_FILE_BASE_NICKNAMES				= "TVs";
//	TV_diff_DATA_FILE_BASE_NICKNAMES				= "TVd";	
	
	RSP_OUTPUT_BASENAMES							= "RSP";
	RSP_ERROR_OUTPUT_BASENAMES						= "RSP_Error";
	STD_DEV_OUTPUT_BASENAMES						= "Std_Dev";
	TV_OUTPUT_BASENAMES								= "TV";
//	TV_STEP_OUTPUT_BASENAMES						= "TV_step";
//	TV_diff_OUTPUT_BASENAMES						= "TV_diff";	
	
	RSP_OUTPUT_SHORT_BASENAMES						= "RSP";
	RSP_ERROR_OUTPUT_SHORT_BASENAMES				= "RSPe";
	STD_DEV_OUTPUT_SHORT_BASENAMES					= "SD";
	TV_OUTPUT_SHORT_BASENAMES						= "TV";
//	TV_STEP_OUTPUT_SHORT_BASENAMES					= "TVs";
//	TV_diff_OUTPUT_SHORT_BASENAMES					= "TVd";	
	
	ROI_ANALYSIS_TV_IFNAME							= TV_MEASUREMENTS_BASENAME 		+ TXT;	
	ROI_ANALYSIS_RSP_OFNAME							= RSP_DATA_FILE_BASENAMES 		+ CSV;
	ROI_ANALYSIS_RSP_ERROR_OFNAME					= RSP_ERROR_DATA_FILE_BASENAMES	+ CSV;
	ROI_ANALYSIS_STD_DEV_OFNAME						= STD_DEV_DATA_FILE_BASENAMES  	+ CSV;
	ROI_ANALYSIS_TV_OFNAME							= TV_DATA_FILE_BASENAMES		+ TXT;
//	ROI_ANALYSIS_PROFILE_OFNAME						= PROFILE_CSV_BASENAME			+ CSV;
//	ROI_ANALYSIS_PROFILE0_OFNAME					= PROFILE0_CSV_BASENAME			+ CSV;
	PVT_RSP_BASENAME								= "PVT_RSP_data";
	PVT_RSP_ERROR_BASENAME							= "PVT_RSPe_data";
	PVT_STD_DEV_BASENAME							= "PVT_SD_data";
	PVT_TV_BASENAME									= "PVT_TV_data";	
	//***********************************************************************************************************************************************************************************************//
	//***************************************************************************** Set reconstruction data directory/file info *********************************************************************//
	//***********************************************************************************************************************************************************************************************//
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***************************************************************************************************************************************************************************************************//
	//************************* Close all windows and clear results table *******************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function print_execution_control()
{
	print_sep("PRINT_DASH_SEP");
	App("macroargs = ", macroargs); 
	print("TEST_BATCH_DIR = " + TEST_BATCH_DIR); 
	print("multiplot_parameter_prefix = " + multiplot_parameter_prefix); 
	print("DONT_KILL_LOOP = " + DONT_KILL_LOOP);
	print("DEBUG_LOOP_KILL_INDEX = " + DEBUG_LOOP_KILL_INDEX); 
	print("KILL_LOOP_INDEX = " + KILL_LOOP_INDEX); 	
}
	PRINT_STATUS									= PRINT_ON();
	macroargs									= process_macro_args();
	multiplot_parameter_prefix					= "A";
	internal_macro_caller 						= macroargs[0];
	if( lengthOf(macroargs) >= 2 )
		multiplot_parameter_prefix				= macroargs[1];
	if( lengthOf(macroargs) >= 3 )
		TEST_BATCH_DIR							= macroargs[2];
	else if(PROMPT_TEST_BATCH_DIR)
		TEST_BATCH_DIR 							= getDirectory("Choose a Directory");
	print(TEST_BATCH_DIR);
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
	//exit();
	print_ImageJ_info								();
	print_execution_control();
	//exit();
	//***********************************************************************************************************************************************************************************************//
	//****************************************************** Parse the externally specified ROI analysis configurations from analysis.cfg file ******************************************************//
	//***********************************************************************************************************************************************************************************************//
	//print_section								("Reading ROI analysis configuration file", PRINT_MINOR_SECTION);
	cfg_parameter_values 						= parse_analysis_cfg(CFG_PARAMETER_LIST, CFG_PARAMETER_DECODINGS, PRINT_ANALYSIS_CFG_PATH);
	SIMULATED_SCAN 								= cfg_parameter_values[0];
	x_columns 									= cfg_parameter_values[1];
	x_rows  									= cfg_parameter_values[2];				
	x_slices 									= cfg_parameter_values[3];				
	voxel_width 								= cfg_parameter_values[4];
	voxel_height 								= cfg_parameter_values[5];
	voxel_thickness 							= cfg_parameter_values[6];
	voxels_per_mm 								= cfg_parameter_values[7];
	flip_horizontally 							= cfg_parameter_values[8];
	flip_vertically 							= cfg_parameter_values[9];
	num_recon_iterations 						= cfg_parameter_values[10];
	first_iteration_2_analyze 					= cfg_parameter_values[11];
	last_iteration_2_analyze 					= cfg_parameter_values[12];
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	x_height									= x_slices * x_rows; 	
	x_dimensions 								= newArray(x_columns, x_rows, x_slices, x_height);
	voxel_dimensions							= newArray(voxel_width, voxel_height, voxel_thickness);
	//image_properties							= newArray(x_magnification, flip_horizontally, flip_vertically, grayscale_range_min, grayscale_range_max);
	images_per_reconstruction 					= num_recon_iterations + 1;					// 	
	last_iteration_2_analyze					= last_iteration_image_existing(TEST_BATCH_DIR, last_iteration_2_analyze);
	iterations_2_analyze						= sequential_value_array(first_iteration_2_analyze, last_iteration_2_analyze + 1);
	num_iterations_2_analyze					= iterations_2_analyze.length;															// # of iterations of feasibility seeking image results to analyze
	recon_iterations_2_analyze					= sequential_value_array(1, last_iteration_2_analyze + 1);
	recon_iterations_2_analyze_strings 			= getStringSequence(1, recon_iterations_2_analyze.length, ITERATIONS_STRING_PRECISION);
	cfg_parameter_values[12]					= last_iteration_2_analyze;
//	plot_parameters 							= newArray(voxel_width, tolerance, lower_limits_scale, upper_limits_scale, difference_scale, x_frame_size, y_frame_size, text_xpos_ratio, text_ypos_ratio, add_line_color, linewidth);
//	plot_parameters 							= newArray(voxel_width,  0.0000001, 0.95, 1.05, 0.1, 780, 380, 0.45, 0.01, "green", 3.5);
	print_analysis_cfgs							(CFG_PARAMETER_LIST, cfg_parameter_values, CFG_PARAMETER_DECODINGS);
	//***********************************************************************************************************************************************************************************************//
	//************************************************** Import ROI definitions for current phantom and set corresponding internal variables/arrays *************************************************//
	//***********************************************************************************************************************************************************************************************//
//	print_section								("Reading ROI definitions configuration file", PRINT_MINOR_SECTION);
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	ROI_parameter_strings						= file_2_decoded_key_value_pairs(GITHUB_MACRO_CONFIGS_SUBDIR, ROI_DEFINITIONS_FILENAME, ROI_DEFINITIONS_PARAMETER_LIST, ROI_PARAMETER_DECODINGS, FLOAT_DECODING_OP, PRINT_ROI_DEFINITIONS_PATH);		
	ROI_material_names 							= ROI_parameter_string_2_values(ROI_MATERIAL_NAMES_LINENUM, 	ROI_parameter_strings, 	ROI_PARAMETER_DECODINGS, FLOAT_DECODING_OP, FORCE_VALUE_2_ARRAY			);	
	ROI_labels 									= ROI_parameter_string_2_values(ROI_LABELS_LINENUM, 			ROI_parameter_strings,  ROI_PARAMETER_DECODINGS, FLOAT_DECODING_OP, FORCE_VALUE_2_ARRAY			);
	ROI_label_nicknames 						= ROI_parameter_string_2_values(ROI_LABEL_NICKNAMES_LINENUM, 	ROI_parameter_strings, 	ROI_PARAMETER_DECODINGS, FLOAT_DECODING_OP, FORCE_VALUE_2_ARRAY			);					//bulk_material = bulk_material[0];
	ROI_types 									= ROI_parameter_string_2_values(ROI_TYPES_LINENUM, 				ROI_parameter_strings, 	ROI_PARAMETER_DECODINGS, FLOAT_DECODING_OP, FORCE_VALUE_2_ARRAY			);	
	ROI_diameters 								= ROI_parameter_string_2_values(ROI_DIAMETERS_LINENUM, 			ROI_parameter_strings, 	ROI_PARAMETER_DECODINGS, FLOAT_DECODING_OP, FORCE_VALUE_2_ARRAY			);
	//ROI_xparams_string 							= ROI_parameter_strings[XPARAMS_LINENUM];
	//ROI_yparams_string 							= ROI_parameter_strings[YPARAMS_OFFSETS_LINENUM];
	ROI_slices_string 							= ROI_parameter_strings[ROI_SLICES_LINENUM];
	ROI_selection_radii 						= ROI_parameter_string_2_values(ROI_SELECTION_RADII_LINENUM, 	ROI_parameter_strings, 	ROI_PARAMETER_DECODINGS, FLOAT_DECODING_OP, FORCE_VALUE_2_ARRAY		 	);
	ROI_profile_radius_beyond_ROI		 		= ROI_parameter_string_2_values(ROI_PROFILE_RADIUS_LINENUM, 	ROI_parameter_strings, 	ROI_PARAMETER_DECODINGS, FLOAT_DECODING_OP, DONT_FORCE_VALUE_2_ARRAY	);	//ROI_profile_radius_beyond_ROI = ROI_profile_radius_beyond_ROI[0];
	bulk_material 								= ROI_parameter_string_2_values(BULK_MATERIAL_LINENUM, 			ROI_parameter_strings, 	ROI_PARAMETER_DECODINGS, FLOAT_DECODING_OP, DONT_FORCE_VALUE_2_ARRAY	);					//bulk_material = bulk_material[0];
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//	print_section								("ROI configurations processing", PRINT_MINOR_SECTION);
//	bulk_material_RSP 							= material_RSP_LUT(bulk_material, SIMULATED_SCAN);
//	ROI_material_RSPs 							= ROI_material_names_2_RSPs(ROI_material_names, SIMULATED_SCAN);
	num_ROIs_2_analyze 							= ROI_material_names.length; //ROI_types						// # of material ROIs in phantom
	ROI_parameters_string 						= parse_ROI_xyparameter_lines(ROI_parameter_strings, XPARAMS_LINENUM, YPARAMS_OFFSETS_LINENUM, ROI_PARAMETER_DECODINGS, RETURN_STRING, PRINT_ROI_EXTRACTION);
	ROIs_per_image			 					= parse_ROI_slice_list(ROI_slices_string, RETURN_COUNT, PRINT_ROI_SLICES);
	ROIs_per_reconstruction 					= ROIs_per_image * images_per_reconstruction;
 	ROIs_per_slice			 					= parse_ROI_slice_list(ROI_slices_string, RETURN_PER_SLICE, PRINT_ROI_SLICES);
 	slices_2_analyze 							= parse_ROI_slice_list(ROI_slices_string, RETURN_ALL, 		PRINT_ROI_SLICES);
	first_slice_2_analyze						= parse_ROI_slice_list(ROI_slices_string, RETURN_MIN, 		PRINT_ROI_SLICES);
	last_slice_2_analyze						= parse_ROI_slice_list(ROI_slices_string, RETURN_MAX, 		PRINT_ROI_SLICES);
	num_slices_2_analyze						= slices_2_analyze.length;
	//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	ROI_radii 									= newArray(ROI_diameters.length);			// radii of circular selections used to analyze phantom ROIs
	ROI_profile_radii 							= newArray(ROI_diameters.length);			// Set distance to extend profile line left/right from material insert ROI centers
	ROI_std_selection_radii 					= newArray(3.5, 4.0, 6.0);					// radii of circular selections used to analyze phantom ROIs
	//ROI_selection_radii 						= Array.slice(ROI_std_selection_radii,0,1);	// radii of circular selections used to analyze phantom ROIs
	ROI_selection_diameters 					= newArray(ROI_selection_radii.length);		// diameters of circular selections used to analyze phantom ROIs	
	num_ROI_selection_diameters					= ROI_selection_diameters.length;			// diameters of circular selections used to analyze phantom ROIs 
	print_ROI_definitions						();
	//exit();
	//***********************************************************************************************************************************************************************************************//
	//************************************************************ Construct commonly used strings for parameter values and files/folders ***********************************************************//
	//***********************************************************************************************************************************************************************************************//	
	reconstructed_image_strings 					= string_array_concatenation(iterations_2_analyze, ITERATIONS_STRING_PRECISION, 							RECONSTRUCTED_IMAGE_FILE_BASENAMES, 		EMPTY_STRING);
	reconstructed_image_folders 					= string_array_concatenation(iterations_2_analyze, ITERATIONS_STRING_PRECISION, 		FOLDER_SEPARATOR +	RECONSTRUCTED_IMAGE_FILE_BASENAMES, 		EMPTY_STRING);
	reconstructed_image_short_strings 				= string_array_concatenation(iterations_2_analyze, ITERATIONS_STRING_PRECISION, 							RECONSTRUCTED_IMAGE_FILE_SHORT_BASENAMES, 	EMPTY_STRING);
	reconstructed_image_short_folders 				= string_array_concatenation(iterations_2_analyze, ITERATIONS_STRING_PRECISION, 		FOLDER_SEPARATOR +	RECONSTRUCTED_IMAGE_FILE_SHORT_BASENAMES,	EMPTY_STRING);
	reconstructed_image_filenames 					= string_array_concatenation(iterations_2_analyze, ITERATIONS_STRING_PRECISION, 							RECONSTRUCTED_IMAGE_FILE_BASENAMES, 		TXT			);
	reconstructed_image_range_string				= generate_parameter_value_range_string(RECONSTRUCTED_IMAGE_FILE_SHORT_BASENAMES, recon_iterations_2_analyze_strings, ITERATIONS_STRING_PRECISION, REMOVE_TRAILING_ZEROS, STRING_DONT_ADD_SPACES, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE);
	iterations_2_analyze_strings 					= string_array_concatenation(iterations_2_analyze, ITERATIONS_STRING_PRECISION, 		EMPTY_STRING, 													EMPTY_STRING);
	iterations_2_analyze_folders 					= string_array_concatenation(iterations_2_analyze, ITERATIONS_STRING_PRECISION, 		FOLDER_SEPARATOR +	ITERATION_2_ANALYZE_FOLDER_PREFIX, 			EMPTY_STRING);
	iterations_2_analyze_range_string				= generate_parameter_value_range_string(EMPTY_STRING, iterations_2_analyze_strings, ITERATIONS_STRING_PRECISION, REMOVE_TRAILING_ZEROS, STRING_DONT_ADD_SPACES, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE);
	slices_2_analyze_strings 						= string_array_concatenation(slices_2_analyze, SLICES_STRING_PRECISION, 				EMPTY_STRING, 													EMPTY_STRING);
	slices_2_analyze_folders 						= string_array_concatenation(slices_2_analyze, SLICES_STRING_PRECISION, 				FOLDER_SEPARATOR + 	SLICE_2_ANALYZE_FOLDER_PREFIX, 				EMPTY_STRING);
	slices_2_analyze_short_strings 					= string_array_concatenation(slices_2_analyze, SLICES_STRING_PRECISION, 				EMPTY_STRING, 													EMPTY_STRING);
	slices_2_analyze_short_folders 					= string_array_concatenation(slices_2_analyze, SLICES_STRING_PRECISION, 				FOLDER_SEPARATOR + 	SLICE_2_ANALYZE_FOLDER_SHORT_PREFIX, 		EMPTY_STRING);
	ROI_analysis_slices_2_analyze_folders 			= string_array_concatenation(slices_2_analyze, SLICES_STRING_PRECISION, 				FOLDER_SEPARATOR + 	SLICE_2_ANALYZE_FOLDER_PREFIX, 				EMPTY_STRING);
	ROI_selection_diameters 						= array_apply_op(ROI_selection_radii, 2, MULTIPLICATION, DONT_SWITCH_OPERANDS);
	ROI_selection_diameter_strings 					= string_array_concatenation(ROI_selection_diameters, ROI_SELECTION_DIAMETER_STRING_PRECISION,	EMPTY_STRING, 													EMPTY_STRING);
	ROI_selection_diameter_folders 					= string_array_concatenation(ROI_selection_diameters, ROI_SELECTION_DIAMETER_STRING_PRECISION, FOLDER_SEPARATOR + ROI_SELECTION_DIAMETER_FOLDER_PREFIX, 		EMPTY_STRING);
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
	parameter_test_number							= 1;	// NTVS testing -> Experimental CTP404 = 8, HN715 = 1
	parameter_test_info_filename					= PARAMETER_TEST_INFO_BASENAME + d2s(parameter_test_number, 0)  + TXT;
	parameter_test_info 							= file_2_array(GITHUB_MACRO_CONFIGS_SUBDIR, parameter_test_info_filename, print_input_data_path);
	num_parameters 									= parameter_test_info.length;
	parameter_values 								= newArray();
	num_parameter_values 							= newArray(num_parameters);
	parameter_string_prefixes 						= newArray(num_parameters);
	parameter_string_short_prefixes 				= newArray(num_parameters);
	parameter_string_precisions 					= newArray(num_parameters);				
	parameter_string_max_precisions 				= newArray();				
	parameter_string_min_precisions 				= newArray();				
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
	multiplot_parameter_index					= isMember(multiplot_parameter_prefix, 	parameter_string_prefixes, RETURN_MATCH_INDEX	);
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
	PVTs_input_directory_parent					= TEST_BATCH_DIR;
	PVTs_output_directory_parent				= TEST_BATCH_DIR;	
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
	num_TV_tables								= TV_TABLE_TITLES.length;
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
	TV_multiplot_table_titles 					= table_grid_row_array_duplication( TV_TABLE_TITLES, num_TV_multiplot_tables);	
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//	
	ROI_compared_table_rows						= num_TTP_values + 1;
	ROI_compared_table_row_headers 				= Array.concat(ROI_table_row_headers, OTVS_row_header); 				
	ROI_compared_table_dimensions				= newArray(ROI_table_first_column, 	ROI_table_columns, 	ROI_compared_table_rows, 		ROI_table_column_separation, ROI_table_row_separation, column_labels_row_separation);					
	TV_compared_table_rows						= num_TTP_values + 1;
	TV_compared_table_row_headers 				= Array.concat(ROI_table_row_headers, OTVS_row_header); 			
	TV_compared_table_dimensions				= newArray(TV_table_first_column, 	TV_table_columns, 	TV_compared_table_rows, 		TV_table_column_separation, TV_table_row_separation, column_labels_row_separation);	
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//	
	PVT_RSP_output_filename						= RSP_DATA_FILE_BASENAMES 		+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;
	PVT_RSP_Error_output_filename				= RSP_ERROR_DATA_FILE_BASENAMES + UNDERSCORE_STRING + TTP_range_filenaming + TXT;
	PVT_Std_Dev_output_filename					= STD_DEV_DATA_FILE_BASENAMES 	+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;
	PVT_TV_output_filename						= TV_DATA_FILE_BASENAMES 		+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;
	
	multiplot_RSP_output_basename				= RSP_DATA_FILE_BASENAMES		+ UNDERSCORE_STRING + TTP_range_filenaming + UNDERSCORE_STRING;
	multiplot_RSP_Error_output_basename			= RSP_ERROR_DATA_FILE_BASENAMES	+ UNDERSCORE_STRING + TTP_range_filenaming + UNDERSCORE_STRING;
	multiplot_Std_Dev_output_basename			= STD_DEV_DATA_FILE_BASENAMES	+ UNDERSCORE_STRING + TTP_range_filenaming + UNDERSCORE_STRING;
	multiplot_TV_output_basename				= TV_DATA_FILE_BASENAMES		+ UNDERSCORE_STRING + TTP_range_filenaming + UNDERSCORE_STRING;

	PVT_RSP_TXT_FILENAME						= PVT_RSP_BASENAME 			+ TXT;
	PVT_RSP_ERROR_TXT_FILENAME					= PVT_RSP_ERROR_BASENAME 	+ TXT;
	PVT_STD_DEV_TXT_FILENAME					= PVT_STD_DEV_BASENAME 		+ TXT;
	PVT_TV_TXT_FILENAME							= PVT_TV_BASENAME 			+ TXT;
	PVT_RSP_CSV_FILENAME						= PVT_RSP_BASENAME 			+ CSV;
	PVT_RSP_ERROR_CSV_FILENAME					= PVT_RSP_ERROR_BASENAME 	+ CSV;
	PVT_STD_DEV_CSV_FILENAME					= PVT_STD_DEV_BASENAME 		+ CSV;
	PVT_TV_CSV_FILENAME							= PVT_TV_BASENAME 			+ CSV;
	
	print_input_output_filenames				();
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***********************************************************************************************************************************************************************************************//
	//*********************************************************************** Apply execution settings/options/configurations ***********************************************************************//
	//***********************************************************************************************************************************************************************************************//	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////							
	//IJROI_analysis_config_CSV					(); //IJROI_analysis_config_image(); //IJIO_configOptions(IJIO_CONFIG_OPTIONS_ON); //IJIO_CONFIG_OPTIONS_OFF
	PRINT_STATUS									= PRINT_ON(); //PRINT_OFF(); PRINT_GROUPVARS_ONLY(); PRINT_SEPVARS_ONLY();
	PRINTING_STATUS									= PRINTING_ON;
	num_input_data_sets 							= 0;
	num_loops 										= 0;
	debug_print_counter								= 1;
	IJIO_configOptions								(IJIO_CONFIG_OPTIONS_ON);
	//exit();
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
				// Determine ROI information for ONLY the ROIs that are defined to be analyzed in the current slice
				//print_sep														(PRINT_DASH_SEP);
				num_slice_ROIs													= ROIs_per_slice[slice_2_analyze_index];
				slice_ROI_labels 												= parse_ROIs_per_slice(ROI_slices_string, slices_2_analyze[slice_2_analyze_index], ROI_labels, RETURN_ELEMENTS, PRINT_ROI_SLICES);		
				//slice_ROI_indices												= parse_ROIs_per_slice(ROI_slices_string, slices_2_analyze[slice_2_analyze_index], ROI_labels, RETURN_INDICES, PRINT_ROI_SLICES);
				//slice_ROI_indices 											= parse_ROIs_per_slice(ROI_slices_string, slices_2_analyze[slice_2_analyze_index], ROI_labels, RETURN_ELEMENTS, PRINT_ROI_SLICES);
				//slice_ROI_parameters 											= parse_ROIs_per_slice(ROI_slices_string, slices_2_analyze[slice_2_analyze_index], ROI_labels, RETURN_ELEMENTS, PRINT_ROI_SLICES);
				//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				num_ROIs_2_analyze												= num_slice_ROIs;
				ROI_labels														= slice_ROI_labels;
				//num_ROI_tables													= num_ROIs_2_analyze;
				//num_ROI_multiplot_tables										= num_multiplot_parameter_values * num_ROI_tables;
				//ROI_table_grid_columns											= num_ROI_tables;//2;//
				//ROI_table_total_columns											= tables_total_columns(first_column, ROI_table_grid_columns, ROI_table_columns, ROI_table_column_separation);
				//ROI_table_titles 												= Array.copy(ROI_labels); 
				//ROI_table_title_dimensions										= newArray(title_start_column, 		title_start_row, 	title_row_separation, 	ROI_table_total_columns);
				//ROI_multiplot_table_grid_columns								= num_ROI_tables;//2;//
				//ROI_multiplot_table_total_columns								= tables_total_columns(first_column, ROI_multiplot_table_grid_columns, ROI_table_columns, ROI_table_column_separation);						
				//ROI_multiplot_table_title_dimensions							= newArray(title_start_column, 		title_start_row, 	title_row_separation, 	ROI_multiplot_table_total_columns);
				//ROI_multiplot_table_titles 										= table_grid_row_array_duplication( ROI_labels, num_ROI_multiplot_tables);
				//*******************************************************************************************************************************************************************************//
				//************************* User defined function definitions *******************************************************************************************************************//
				//*******************************************************************************************************************************************************************************//
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
				current_analysis_shortest_subdirectory								= SLICE_2_ANALYZE_FOLDER_SHORT_PREFIX + slice_2_analyze_short_string + "-" + ROI_SELECTION_DIAMETER_FOLDER_PREFIX + ROI_selection_diameter_string;					
				
				current_analysis_ROI_analysis_RSP_output_filename					= current_analysis_subdirectory 	+ FOLDER_SEPARATOR + ROI_ANALYSIS_RSP_OFNAME;
				current_analysis_ROI_analysis_RSP_Error_output_filename				= current_analysis_subdirectory 	+ FOLDER_SEPARATOR + ROI_ANALYSIS_RSP_ERROR_OFNAME;
				current_analysis_ROI_analysis_Std_Dev_output_filename				= current_analysis_subdirectory 	+ FOLDER_SEPARATOR + ROI_ANALYSIS_STD_DEV_OFNAME;
				
				current_analysis_PVT_RSP_output_filename							= current_analysis_subdirectory 	+ FOLDER_SEPARATOR + PVT_RSP_output_filename;
				current_analysis_PVT_RSP_Error_output_filename						= current_analysis_subdirectory 	+ FOLDER_SEPARATOR + PVT_RSP_Error_output_filename;
				current_analysis_PVT_Std_Dev_output_filename						= current_analysis_subdirectory 	+ FOLDER_SEPARATOR + PVT_Std_Dev_output_filename;
				//exit();			
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				//***************************************************************************************************************************************************************************************//
				//******** Generate plots of RSP vs. target test parameter values with individual curves for each multiplot target parameter value ***************************************//
				//***************************************************************************************************************************************************************************************//	
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////																	
				all_RSP_multiplot_data 												= newArray(); all_RSP_Error_multiplot_data	= newArray(); all_Std_Dev_multiplot_data = newArray(); all_TV_multiplot_data = newArray();
				MERGED_MULTIPLOT_RSP_TXT_FILE_PATH_LIST 							= newArray();	MERGED_MULTIPLOT_RSP_TXT_FILENAME_LIST 			= newArray();
				MERGED_MULTIPLOT_RSP_ERROR_TXT_FILE_PATH_LIST 						= newArray();	MERGED_MULTIPLOT_RSP_ERROR_TXT_FILENAME_LIST 	= newArray();
				MERGED_MULTIPLOT_STD_DEV_TXT_FILE_PATH_LIST 						= newArray();	MERGED_MULTIPLOT_STD_DEV_TXT_FILENAME_LIST 		= newArray();
				MERGED_MULTIPLOT_TV_TXT_FILE_PATH_LIST 								= newArray();	MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST 			= newArray();
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
					//--------------------------------------------------------------------------------------------------------------------------------//
					current_test_folder_basename									= modify_parameter_values_string(current_test_start_folder, parameter_string_prefixes, REMOVE_VALUE_STRINGS, TTP_index, UNDERSCORE_STRING, UNDERSCORE_STRING, EMPTY_STRING, EMPTY_STRING, STRING_DONT_ADD_SPACES);
					//current_test_folder_basename									= remove_folder_parameter(current_test_start_folder, TTP_prefix, REMOVE_PARAMETER_VALUE_ONLY, UNDERSCORE_STRING);
					current_test_folder_split_strings									= split_parameter_value_string(current_test_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_SPLIT_STRINGS);
					//--------------------------------------------------------------------------------------------------------------------------------//
					current_test_parameter_value_strings 							= folder_2_parameter_value_strings(current_test_start_folder, parameter_string_prefixes, EMPTY_STRING, STRING_DONT_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS);
					//current_test_parameter_value_strings							= split_parameter_value_string(current_test_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_SPLIT_VALUES);
					//--------------------------------------------------------------------------------------------------------------------------------//
					current_test_parameter_value_short_strings 						= minimize_string_precision(current_test_parameter_value_strings, parameter_string_precisions, RETURN_STRINGS, RETURN_DONT_FORCE_ARRAY);
					//current_test_parameter_values_string 							= generate_parameter_values_string(current_test_parameter_value_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_OFF, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, TTP_index, EMPTY_ARRAY), 
					current_test_parameter_values_string 							= folder_2_parameter_values_string(current_test_start_folder, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_OFF, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, TTP_index, EMPTY_ARRAY);					
					//current_test_parameter_values_string 							= merge_strings_2_string(current_test_parameter_padded_equals_strings, TTP_index, COMMA_STRING + SPACE_STRING),
					//current_test_parameter_values_string 							= generate_parameter_values_string(current_test_parameter_value_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_OFF, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, TTP_index, EMPTY_ARRAY), 
					current_test_plot_title_parameter_values_string 				= generate_parameter_values_string(current_test_parameter_value_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_OFF, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, EMPTY_ARRAY, TTP_index);					
					current_test_plot_title_other_parameter_values_string	 		= generate_parameter_values_string(current_test_parameter_value_short_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_ON, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, test_parameter_indices, EMPTY_ARRAY);					
					current_test_parameter_equals_strings 							= folder_2_parameter_value_strings(current_test_start_folder, parameter_string_prefixes, EQUALS_STRING, STRING_DONT_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS);
					//current_test_parameter_equals_strings							= split_parameter_value_string(current_test_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_EQUALS_STRINGS);
					//current_test_parameter_equals_strings							= split_parameter_value_string(current_test_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_SPLIT_VALUES);
					current_test_parameter_padded_equals_strings					= split_parameter_value_string(current_test_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_PADDED_EQUALS_STRINGS);
					current_test_parameter_equals_short_strings 					= folder_2_parameter_value_strings(current_test_start_folder, parameter_string_prefixes, EQUALS_STRING, STRING_DONT_ADD_SPACES, REMOVE_TRAILING_ZEROS);
					//current_test_parameter_equals_short_strings						= split_parameter_value_string(current_test_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_EQUALS_SHORT_STRINGS);
					current_test_file_suffix 										= generate_parameter_values_string(current_test_parameter_value_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, UNDERSCORE_STRING, EQUALS_STRING, STRING_DONT_ADD_SPACES, REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_ON, ARRAY_VALUES_RANGE_TYPE_BRACKETED, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, TTP_index, multiplot_parameter_index);					
					
					current_test_multiplot_start_folder 							= all_reduced_folder_strings[i];			
					current_test_multiplot_folders									= Array.slice(all_reduced_folder_strings, current_test_multiplot_start_folder_index, current_test_multiplot_start_folder_index + num_multiplot_parameter_values);					
					current_test_multiplot_start_folder_index						+= num_TTP_values * num_multiplot_parameter_values;
					current_test_multiplot_end_folder 								= all_reduced_folder_strings[current_test_multiplot_start_folder_index - 1];			
					//current_test_multiplot_folder_basename							= modify_parameter_values_string(current_test_multiplot_start_folder, parameter_string_prefixes, REMOVE_VALUE_STRINGS, TTP_index, UNDERSCORE_STRING, UNDERSCORE_STRING, EMPTY_STRING, EMPTY_STRING, STRING_DONT_ADD_SPACES);
					current_test_multiplot_folder_basename							= remove_folder_parameter(current_test_multiplot_start_folder, TTP_prefix, REMOVE_PARAMETER_VALUE_ONLY, UNDERSCORE_STRING);
					
					current_test_multiplot_value_strings							= split_parameter_value_string(current_test_multiplot_start_folder, parameter_string_prefixes, UNDERSCORE_STRING, UNDERSCORE_STRING, RETURN_SPLIT_VALUES);
					current_test_multiplot_value_strings 							= folder_2_parameter_value_strings(current_test_multiplot_start_folder, parameter_string_prefixes, EMPTY_STRING, STRING_DONT_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS);
					current_test_multiplot_value_short_strings					 	= minimize_string_precision(current_test_multiplot_value_strings, parameter_string_precisions, RETURN_STRINGS, RETURN_DONT_FORCE_ARRAY);
					current_test_multiplot_parameter_values_string	 				= folder_2_parameter_values_string(current_test_multiplot_start_folder, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, DONT_REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_OFF, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, TTP_index, EMPTY_ARRAY);					
					current_test_multiplot_title_parameter_values_string 			= generate_parameter_values_string(current_test_multiplot_value_short_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, COMMA_STRING, EQUALS_STRING, STRING_ADD_SPACES, REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_ON, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, EMPTY_ARRAY, test_parameter_indices);					
							
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
					// INPUT: 	TEST_BATCH_DIR//current_test_folders[i]//current_analysis_subdirectory//ROI_ANALYSIS_RSP_ERROR_OFNAME 
					//		  	= D://...//B_3200_..._L0_Nk_#//Slice_10//d7//RSP_Error.csv
					// OUTPUT: 	TEST_BATCH_DIR//PVT_output_data_parent_directory//current_analysis_subdirectory//merged_RSP_Error_CSV_filename  
					merged_RSP_CSV_filename								= RSP_DATA_FILE_BASENAMES 			+ UNDERSCORE_STRING + TTP_range_filenaming + CSV;
					merged_RSP_Error_CSV_filename						= RSP_ERROR_DATA_FILE_BASENAMES 	+ UNDERSCORE_STRING + TTP_range_filenaming + CSV;
					merged_Std_Dev_CSV_filename							= STD_DEV_DATA_FILE_BASENAMES 		+ UNDERSCORE_STRING + TTP_range_filenaming + CSV;
					merged_TV_CSV_filename								= TV_DATA_FILE_BASENAMES 			+ UNDERSCORE_STRING + TTP_range_filenaming + CSV;
					merged_RSP_TXT_filename								= RSP_DATA_FILE_BASENAMES 			+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;
					merged_RSP_Error_TXT_filename						= RSP_ERROR_DATA_FILE_BASENAMES 	+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;
					merged_Std_Dev_TXT_filename							= STD_DEV_DATA_FILE_BASENAMES 		+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;
					merged_TV_TXT_filename								= TV_DATA_FILE_BASENAMES 			+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;

					merge_multiplot_ROI_analysis_CSV_folder				= output_multiplot_data_parent_directory 		+ FOLDER_SEPARATOR + current_analysis_subdirectory;
					merge_multiplot_PVT_ROI_analysis_CSV_folder			= PVT_output_multiplot_data_parent_directory 	+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;
					File.makeDirectory(merge_multiplot_ROI_analysis_CSV_folder);
					File.makeDirectory(merge_multiplot_PVT_ROI_analysis_CSV_folder);
					
					merge_multiplot_file_suffix 						= generate_parameter_values_string(current_test_multiplot_value_short_strings, parameter_string_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, UNDERSCORE_STRING, EQUALS_STRING, STRING_DONT_ADD_SPACES, REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_ON, ARRAY_VALUES_RANGE_TYPE_EQUALS, ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE, test_parameter_indices, EMPTY_ARRAY);					
					merge_multiplot_CSV_file_suffix						= UNDERSCORE_STRING 					+ merge_multiplot_file_suffix	 	+ UNDERSCORE_STRING + TTP_range_filenaming + CSV;
					merge_multiplot_TXT_file_suffix						= UNDERSCORE_STRING 					+ merge_multiplot_file_suffix 		+ UNDERSCORE_STRING + TTP_range_filenaming + TXT;
					merge_multiplot_RSP_CSV_short_filename				= RSP_DATA_FILE_BASE_NICKNAMES 			+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_RSP_TXT_short_filename				= RSP_DATA_FILE_BASE_NICKNAMES 			+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_RSP_Error_CSV_short_filename		= RSP_ERROR_DATA_FILE_BASE_NICKNAMES 	+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_RSP_Error_TXT_short_filename		= RSP_ERROR_DATA_FILE_BASE_NICKNAMES	+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_Std_Dev_CSV_short_filename			= STD_DEV_DATA_FILE_BASE_NICKNAMES 		+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_Std_Dev_TXT_short_filename			= STD_DEV_DATA_FILE_BASE_NICKNAMES 		+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_TV_CSV_short_filename				= TV_DATA_FILE_BASE_NICKNAMES 			+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_TV_TXT_short_filename				= TV_DATA_FILE_BASE_NICKNAMES 			+ merge_multiplot_TXT_file_suffix;

					MERGED_RSP_TXT_FILE_PATH_LIST 						= newArray(); MERGED_RSP_ERROR_TXT_FILE_PATH_LIST 		= newArray(); MERGED_STD_DEV_TXT_FILE_PATH_LIST 	= newArray(); MERGED_TV_TXT_FILE_PATH_LIST 		= newArray(); 
					MERGED_PVT_RSP_TXT_FILENAME_LIST 					= newArray(); MERGED_PVT_RSP_ERROR_TXT_FILENAME_LIST 	= newArray(); MERGED_PVT_STD_DEV_TXT_FILENAME_LIST 	= newArray(); MERGED_PVT_TV_TXT_FILENAME_LIST 	= newArray();
					DEBUG_LOOP_KILL_INDEX								= 23;
					if(merge_ROI_analysis_CSVs)
					{
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						print_section							("Merging the CSV files from the ROI analyses for each target test parameter value", true);
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
							merged_PVT_RSP_CSV_filename					= RSP_DATA_FILE_BASE_NICKNAMES 			+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + CSV;
							merged_PVT_RSP_Error_CSV_filename			= RSP_ERROR_DATA_FILE_BASE_NICKNAMES 	+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + CSV;
							merged_PVT_Std_Dev_CSV_filename				= STD_DEV_DATA_FILE_BASE_NICKNAMES 		+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + CSV;
							merged_PVT_TV_CSV_filename					= TV_DATA_FILE_BASE_NICKNAMES 			+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + CSV;
							merged_PVT_RSP_TXT_filename					= RSP_DATA_FILE_BASE_NICKNAMES 			+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + TXT;
							merged_PVT_RSP_Error_TXT_filename			= RSP_ERROR_DATA_FILE_BASE_NICKNAMES 	+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + TXT;
							merged_PVT_Std_Dev_TXT_filename				= STD_DEV_DATA_FILE_BASE_NICKNAMES 		+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + TXT;
							merged_PVT_TV_TXT_filename					= TV_DATA_FILE_BASE_NICKNAMES 			+ UNDERSCORE_STRING + merged_PVT_parameter_values_string + UNDERSCORE_STRING + TTP_range_filenaming + TXT;
							merged_PVT_ROI_analysis_CSV_folder			= PVT_output_data_parent_directory 		+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;
							
							merged_CSV_folder							= TEST_BATCH_DIR 	+ merge_ROI_analysis_folders_basename + TTP_range_suffix;
							merged_ROI_analysis_CSV_folder				= merged_CSV_folder + current_analysis_subdirectory;
							merged_RSP_CSV_path							= merged_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + merged_RSP_CSV_filename;										 			
							merged_RSP_Error_CSV_path					= merged_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + merged_RSP_Error_CSV_filename;										 			
							merged_Std_Dev_CSV_path						= merged_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + merged_Std_Dev_CSV_filename;										 			
							merged_TV_CSV_path							= merged_CSV_folder 				+ FOLDER_SEPARATOR + merged_TV_CSV_filename;										 			
							merged_RSP_TXT_path							= merged_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + merged_RSP_TXT_filename;										 			
							merged_RSP_Error_TXT_path					= merged_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + merged_RSP_Error_TXT_filename;										 			
							merged_Std_Dev_TXT_path						= merged_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + merged_Std_Dev_TXT_filename;										 			
							merged_TV_TXT_path							= merged_CSV_folder 				+ FOLDER_SEPARATOR + merged_TV_TXT_filename;										 			
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							print_merged_output_file_info				();	 
				    		make_merged_CSV_directories					();
				    		append_2_log								(merged_CSV_folder);
							append_2_log								(PVT_output_data_parent_directory);
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							merged_RSP_data 							= newArray();	merged_RSP_Error_data 		= newArray();	merged_Std_Dev_data 		= newArray();						
							merged_TV_data 								= newArray();	merged_before_TVS_TV_data 	= newArray();	merged_after_TVS_TV_data 	= newArray();	merged_TV_reduction_data 	= newArray();	merged_concat_TV_data 	= newArray();						
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							print_sep									(PRINT_DASH_SEP);
							//exit();
							for											(N = 0; N < num_TTP_values; N++)
							{
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								import_CSV_folder						= TEST_BATCH_DIR 					+  merge_ROI_analysis_folders_basename + UNDERSCORE_STRING + d2s(N + 1, 0);
								import_ROI_analysis_CSV_folder			= import_CSV_folder 				+ current_analysis_subdirectory;
								import_RSP_CSV_path						= import_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + ROI_ANALYSIS_RSP_OFNAME;
								import_RSP_Error_CSV_path				= import_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + ROI_ANALYSIS_RSP_ERROR_OFNAME;
								import_Std_Dev_CSV_path					= import_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + ROI_ANALYSIS_STD_DEV_OFNAME;
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								copied_RSP_CSV_filename					= RSP_DATA_FILE_BASENAMES 		+  UNDERSCORE_STRING + parameter_string_prefixes[TTP_index] + UNDERSCORE_STRING + d2s(N + 1, 0) + CSV;
								copied_RSP_Error_CSV_filename			= RSP_ERROR_DATA_FILE_BASENAMES	+  UNDERSCORE_STRING + parameter_string_prefixes[TTP_index] + UNDERSCORE_STRING + d2s(N + 1, 0) + CSV;
								copied_Std_Dev_CSV_filename				= STD_DEV_DATA_FILE_BASENAMES  	+  UNDERSCORE_STRING + parameter_string_prefixes[TTP_index] + UNDERSCORE_STRING + d2s(N + 1, 0) + CSV;
								copy_distributed_file					(import_ROI_analysis_CSV_folder, 	ROI_ANALYSIS_RSP_OFNAME, 		merged_ROI_analysis_CSV_folder, 			copied_RSP_CSV_filename, 					print_input_CSV_path);
								copy_distributed_file					(import_ROI_analysis_CSV_folder, 	ROI_ANALYSIS_RSP_ERROR_OFNAME, merged_ROI_analysis_CSV_folder, 	copied_RSP_Error_CSV_filename, 				print_input_CSV_path);
								copy_distributed_file					(import_ROI_analysis_CSV_folder, 	ROI_ANALYSIS_STD_DEV_OFNAME, 	merged_ROI_analysis_CSV_folder, 		copied_Std_Dev_CSV_filename, 				print_input_CSV_path);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								RSP_data 								= csv_2_array(import_ROI_analysis_CSV_folder, 	ROI_ANALYSIS_RSP_OFNAME, 		iterations_2_analyze_strings, num_ROIs_2_analyze, ROW_MAJOR, 	true);
								RSP_error_data 							= csv_2_array(import_ROI_analysis_CSV_folder, 	ROI_ANALYSIS_RSP_ERROR_OFNAME, 	iterations_2_analyze_strings, num_ROIs_2_analyze, ROW_MAJOR, 	true);
								Std_Dev_data 							= csv_2_array(import_ROI_analysis_CSV_folder, 	ROI_ANALYSIS_STD_DEV_OFNAME, 	iterations_2_analyze_strings, num_ROIs_2_analyze, ROW_MAJOR, 	true);
								TV_data 								= file_2_float_array(import_CSV_folder, 		ROI_ANALYSIS_TV_IFNAME, 																		print_input_TXT_path);
								merged_RSP_data 						= Array.concat(merged_RSP_data, 				RSP_data);																							
								merged_RSP_Error_data 					= Array.concat(merged_RSP_Error_data, 			RSP_error_data);																							
								merged_Std_Dev_data 					= Array.concat(merged_Std_Dev_data, 			Std_Dev_data);		
								merged_TV_data 							= Array.concat(merged_TV_data, 					TV_data);		
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
							merged_concat_TV_data						= Array.concat(merged_concat_TV_data, merged_before_TVS_TV_data);
							merged_concat_TV_data						= Array.concat(merged_concat_TV_data, merged_after_TVS_TV_data);
							merged_concat_TV_data						= Array.concat(merged_concat_TV_data, merged_TV_reduction_data);
							//num_ROIs_2_analyze						= num_slice_ROIs;
							//ROI_labels								= slice_ROI_labels;
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
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							ROI_table_grid_titles 						= array_from_data(multiplot_parameter_values_string); 
							ROI_table_grid_labels 						= Array.concat(ROI_table_grid_titles, ROI_table_titles, ROI_table_column_headers, ROI_table_row_headers);
							ROI_table_grid_labels_lengths				= Array.concat((ROI_table_grid_titles.length), (ROI_table_titles.length),(ROI_table_column_headers.length),(ROI_table_row_headers.length));
							ROI_table_grid_label_indices 				= series_ops(ROI_table_grid_labels_lengths, SERIES_SUMMATION, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							TV_table_grid_titles 						= array_from_data(multiplot_parameter_values_string); 
							TV_table_grid_labels 						= Array.concat(TV_table_grid_titles, TV_TABLE_TITLES, TV_table_column_headers, TV_table_row_headers);
							TV_table_grid_labels_lengths				= Array.concat((TV_table_grid_titles.length), (TV_TABLE_TITLES.length),(TV_table_column_headers.length),(TV_table_row_headers.length));
							TV_table_grid_label_indices 				= series_ops(TV_table_grid_labels_lengths, SERIES_SUMMATION, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							print_loop_status							(merge_ROI_analysis_section_statement, current_multiplot_analysis_number + 1, PRINT_MAJOR_SECTION);						//"Reading ROI analysis..."
							print_loop_status							(merged_ROI_analysis_2_disk_section_statement, multiplot, PRINT_MINOR_SECTION);										//"Reading ROI analysis..."
							//------------------------------------------ Merge RSP CSV Data Files --------------------------------------------------------------------------------------------------------//
							clearResults								();
							IJROI_analysis_config_CSV					();
							IJIO_configOptions							(IJIO_CONFIG_OPTIONS_OFF);
							//App("merged_RSP_data_by_ROI",				merged_RSP_data_by_ROI);
							//App("merged_RSP_Error_data_by_ROI",			merged_RSP_Error_data_by_ROI);
							//App("merged_Std_Dev_data_by_ROI",			merged_Std_Dev_data_by_ROI);
							//App("merged_concat_TV_data",				merged_concat_TV_data);
							//exit();
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							if											(merge_ROI_analysis_RSP_CSVs)
							{	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								current_row								= table_grid_fill_all(ROI_table_grid_labels, ROI_table_grid_label_indices, ROI_table_grid_columns, ROI_table_title_dimensions, ROI_table_dimensions, merged_RSP_data_by_ROI, ROW_ORDER);
								//current_row								= table_add_Excel_code(0,  current_row + 2, ROI_table_total_columns, "34/2");
								//exit();
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								results_table_2_CSV_if					(merged_ROI_analysis_CSV_folder, 		merged_RSP_CSV_filename, 							true, true, 	true, false);//print_output_CSV_path
								//results_table_2_CSV_if					(merge_multiplot_PVT_ROI_analysis_CSV_folder, 	merged_PVT_RSP_CSV_filename, 						write_merged_RSP_CSV_data, overwrite_merged_RSP_CSV_data, 	true, false);
								results_table_2_CSV_if					(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_RSP_CSV_filename, 						write_merged_RSP_CSV_data, overwrite_merged_RSP_CSV_data, 	true, false);
								float_array_2_TXT_if					(merged_ROI_analysis_CSV_folder, 		merged_RSP_TXT_filename, merged_RSP_data_by_ROI, 	write_merged_RSP_TXT_data, overwrite_merged_RSP_TXT_data, 	true		);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
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
								results_table_2_CSV_if					(merged_ROI_analysis_CSV_folder, 			merged_RSP_Error_CSV_filename, 									write_merged_RSP_Error_CSV_data, overwrite_merged_RSP_Error_CSV_data, 	print_output_CSV_path, false);
								//results_table_2_CSV_if					(merge_multiplot_PVT_ROI_analysis_CSV_folder, 	merged_PVT_RSP_Error_CSV_filename, 								write_merged_RSP_Error_CSV_data, overwrite_merged_RSP_Error_CSV_data, 	print_output_CSV_path, false);
								results_table_2_CSV_if					(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_RSP_Error_CSV_filename, 								write_merged_RSP_Error_CSV_data, overwrite_merged_RSP_Error_CSV_data, 	print_output_CSV_path, false);
								float_array_2_TXT_if					(merged_ROI_analysis_CSV_folder, 			merged_RSP_Error_TXT_filename, merged_RSP_Error_data_by_ROI,	write_merged_RSP_Error_TXT_data, overwrite_merged_RSP_Error_TXT_data, 			print_output_TXT_path		);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
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
								results_table_2_CSV_if					(merged_ROI_analysis_CSV_folder, 			merged_Std_Dev_CSV_filename, 								write_merged_Std_Dev_CSV_data, overwrite_merged_Std_Dev_CSV_data, 	print_output_CSV_path, false);
								//results_table_2_CSV_if					(merge_multiplot_PVT_ROI_analysis_CSV_folder, 	merged_PVT_Std_Dev_CSV_filename, 							write_merged_Std_Dev_CSV_data, overwrite_merged_Std_Dev_CSV_data, 	print_output_CSV_path, false);
								results_table_2_CSV_if					(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_Std_Dev_CSV_filename, 							write_merged_Std_Dev_CSV_data, overwrite_merged_Std_Dev_CSV_data, 	print_output_CSV_path, false);
								float_array_2_TXT_if					(merged_ROI_analysis_CSV_folder, 			merged_Std_Dev_TXT_filename, merged_Std_Dev_data_by_ROI, 	write_merged_Std_Dev_TXT_data, overwrite_merged_Std_Dev_TXT_data, 		print_output_TXT_path		);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
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
								results_table_2_CSV_if					(merged_CSV_folder, 	merged_TV_CSV_filename, 						write_merged_TV_CSV_data, overwrite_merged_TV_CSV_data, print_output_CSV_path, false	);
								results_table_2_CSV_if					(PVT_output_data_parent_directory, merged_PVT_TV_CSV_filename, 					write_merged_TV_CSV_data, overwrite_merged_TV_CSV_data, print_output_CSV_path, false	);
								float_array_2_TXT_if					(merged_CSV_folder, 	merged_TV_TXT_filename, merged_concat_TV_data, 	write_merged_TV_TXT_data, overwrite_merged_TV_TXT_data, print_output_TXT_path			);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								MERGED_TV_TXT_FILE_PATH_LIST			= Array.concat(MERGED_TV_TXT_FILE_PATH_LIST, 	merged_TV_TXT_path);
								MERGED_PVT_TV_TXT_FILENAME_LIST			= Array.concat(MERGED_PVT_TV_TXT_FILENAME_LIST, merged_PVT_TV_TXT_filename);
							}
							lKill(num_loops, ROI_ANALYSIS_KILL_INDEX);
							//exit();
						}//for(multiplot = 0; multiplot < num_multiplot_parameter_values; multiplot++)			
						print_loop_status								(merge_ROI_analysis_data_completed_statement, multiplot_parameter_prefix, PRINT_MINOR_SECTION);										//"Reading ROI analysis..."
					}// END: if(merge_ROI_analysis_CSVs)
					//exit();
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
//*************************************************** Merge the CSV files for each multiplot parameter value and target test parameter value ********************************************************//
//***************************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
					if													(merge_multiplot_CSVs)
					{	//ROI_table_grid_columns						= 2;//num_ROI_tables;//
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
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
						print_merge_multiplot_output_file_info			();
						make_merge_multiplot_CSV_directories			();
						append_2_log									(output_multiplot_data_parent_directory);
						append_2_log									(PVT_output_multiplot_data_parent_directory);
						//exit();
						//******************************************* REMOVE TV[0-1] from filenames since files are written to TV[0-1] subdirectory
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						print_loop_status								(merge_multiplot_section_statement, 		current_multiplot_analysis_number + 1, 	PRINT_MAJOR_SECTION);	//"Reading ROI analysis..."
						print_loop_status								(merged_multiplot_2_disk_section_statement, multiplot_parameter_prefix, 			PRINT_MINOR_SECTION);											//"Reading ROI analysis..."
						if												(merge_multiplot_RSP_CSVs)
						{// merge_multiplot_ROI_analysis_CSV_folder, merge_multiplot_PVT_ROI_analysis_CSV_folder, merge_multiplot_RSP_CSV_short_filename, merge_multiplot_RSP_TXT_short_filename, merge_multiplot_RSP_data, write_merged_multiplot_RSP_CSV_data, write_merged_multiplot_RSP_TXT_data, overwrite_merged_RSP_CSV_data, overwrite_merged_RSP_TXT_data, print_output_CSV_path, print_output_TXT_path, false  
							merge_multiplot_RSP_data					= table_grid_fill_all_imported(RSP_multiplot_table_grid_labels, RSP_multiplot_table_grid_label_indices, ROI_multiplot_table_grid_columns, ROI_multiplot_table_title_dimensions, ROI_table_dimensions, MERGED_RSP_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
							results_table_2_CSV_if						(merge_multiplot_ROI_analysis_CSV_folder, 		merge_multiplot_RSP_CSV_short_filename, 							write_merged_multiplot_RSP_CSV_data, overwrite_merged_multiplot_RSP_CSV_data, 		print_output_CSV_path, false);
							merged_multiplot_RSP_csv_file_path = results_table_2_CSV_if						(merge_multiplot_PVT_ROI_analysis_CSV_folder, 	merge_multiplot_RSP_CSV_short_filename, 							write_merged_multiplot_RSP_CSV_data, overwrite_merged_multiplot_RSP_CSV_data, 		print_output_CSV_path, false);
							float_array_2_TXT_if						(merge_multiplot_ROI_analysis_CSV_folder, 		merge_multiplot_RSP_TXT_short_filename, merge_multiplot_RSP_data, 	write_merged_multiplot_RSP_TXT_data, overwrite_merged_multiplot_RSP_TXT_data, 		print_output_TXT_path		);
							merged_multiplot_RSP_txt_file_path = float_array_2_TXT_if						(merge_multiplot_PVT_ROI_analysis_CSV_folder, 	merge_multiplot_RSP_TXT_short_filename, merge_multiplot_RSP_data, 	write_merged_multiplot_RSP_TXT_data, overwrite_merged_multiplot_RSP_TXT_data, 		print_output_TXT_path		);
							MERGED_MULTIPLOT_RSP_TXT_FILE_PATH_LIST 		= Array.concat(MERGED_MULTIPLOT_RSP_TXT_FILE_PATH_LIST, 	merged_multiplot_RSP_txt_file_path); 
							MERGED_MULTIPLOT_RSP_TXT_FILENAME_LIST 		= Array.concat(MERGED_MULTIPLOT_RSP_TXT_FILENAME_LIST, 	merge_multiplot_RSP_TXT_short_filename);
						}
						lKill											(num_loops, ROI_ANALYSIS_KILL_INDEX);
						//exit();
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						if												(merge_multiplot_RSP_Error_CSVs)
						{
							merge_multiplot_RSP_Error_data				= table_grid_fill_all_imported(RSP_Error_multiplot_table_grid_labels, RSP_Error_multiplot_table_grid_label_indices, ROI_multiplot_table_grid_columns, ROI_multiplot_table_title_dimensions, ROI_table_dimensions, MERGED_RSP_ERROR_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
							results_table_2_CSV_if						(merge_multiplot_ROI_analysis_CSV_folder, 		merge_multiplot_RSP_Error_CSV_short_filename, 									write_merged_multiplot_RSP_Error_CSV_data, overwrite_merged_multiplot_RSP_Error_CSV_data, 	print_output_CSV_path, false	);
							merged_multiplot_RSPe_csv_file_path = results_table_2_CSV_if						(merge_multiplot_PVT_ROI_analysis_CSV_folder, 	merge_multiplot_RSP_Error_CSV_short_filename, 									write_merged_multiplot_RSP_Error_CSV_data, overwrite_merged_multiplot_RSP_Error_CSV_data, 	print_output_CSV_path, false	);
							float_array_2_TXT_if						(merge_multiplot_ROI_analysis_CSV_folder, 		merge_multiplot_RSP_Error_TXT_short_filename, merge_multiplot_RSP_Error_data, 	write_merged_multiplot_RSP_Error_TXT_data, overwrite_merged_multiplot_RSP_Error_TXT_data, 	print_output_TXT_path			);
							merged_multiplot_RSPe_txt_file_path = float_array_2_TXT_if						(merge_multiplot_PVT_ROI_analysis_CSV_folder, 	merge_multiplot_RSP_Error_TXT_short_filename, merge_multiplot_RSP_Error_data, 	write_merged_multiplot_RSP_Error_TXT_data, overwrite_merged_multiplot_RSP_Error_TXT_data, 	print_output_TXT_path			);
							MERGED_MULTIPLOT_RSP_ERROR_TXT_FILE_PATH_LIST 		= Array.concat(MERGED_MULTIPLOT_RSP_ERROR_TXT_FILE_PATH_LIST, 	merged_multiplot_RSPe_txt_file_path); 
							MERGED_MULTIPLOT_RSP_ERROR_TXT_FILENAME_LIST 		= Array.concat(MERGED_MULTIPLOT_RSP_ERROR_TXT_FILENAME_LIST, 	merge_multiplot_RSP_Error_TXT_short_filename);
						}
						lKill											(num_loops, ROI_ANALYSIS_KILL_INDEX);
						//exit();
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						if												(merge_multiplot_Std_Dev_CSVs)
						{
							merge_multiplot_Std_Dev_data				= table_grid_fill_all_imported(Std_Dev_multiplot_table_grid_labels, Std_Dev_multiplot_table_grid_label_indices, ROI_multiplot_table_grid_columns, ROI_multiplot_table_title_dimensions, ROI_table_dimensions, MERGED_STD_DEV_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
							results_table_2_CSV_if						(merge_multiplot_ROI_analysis_CSV_folder, 		merge_multiplot_Std_Dev_CSV_short_filename, 								write_merged_multiplot_Std_Dev_CSV_data, overwrite_merged_multiplot_Std_Dev_CSV_data, 	print_output_CSV_path, false);
							merged_multiplot_sd_csv_file_path = results_table_2_CSV_if						(merge_multiplot_PVT_ROI_analysis_CSV_folder, 	merge_multiplot_Std_Dev_CSV_short_filename, 								write_merged_multiplot_Std_Dev_CSV_data, overwrite_merged_multiplot_Std_Dev_CSV_data, 	print_output_CSV_path, false);
							float_array_2_TXT_if						(merge_multiplot_ROI_analysis_CSV_folder,		merge_multiplot_Std_Dev_TXT_short_filename, merge_multiplot_Std_Dev_data, 	write_merged_multiplot_Std_Dev_TXT_data, overwrite_merged_multiplot_Std_Dev_TXT_data, 	print_output_TXT_path		);
							merged_multiplot_sd_txt_file_path = float_array_2_TXT_if						(merge_multiplot_PVT_ROI_analysis_CSV_folder,	merge_multiplot_Std_Dev_TXT_short_filename, merge_multiplot_Std_Dev_data, 	write_merged_multiplot_Std_Dev_TXT_data, overwrite_merged_multiplot_Std_Dev_TXT_data, 	print_output_TXT_path		);
							MERGED_MULTIPLOT_STD_DEV_TXT_FILE_PATH_LIST 		= Array.concat(MERGED_MULTIPLOT_STD_DEV_TXT_FILE_PATH_LIST, 	merged_multiplot_sd_txt_file_path); 
							MERGED_MULTIPLOT_STD_DEV_TXT_FILENAME_LIST 		= Array.concat(MERGED_MULTIPLOT_STD_DEV_TXT_FILENAME_LIST, 	merge_multiplot_Std_Dev_TXT_short_filename);
						}
						lKill											(num_loops, ROI_ANALYSIS_KILL_INDEX);
						//exit();
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						if												(merge_multiplot_TV_CSVs)
						{
							merge_multiplot_TV_data						= table_grid_fill_all_imported(TV_multiplot_table_grid_labels, TV_multiplot_table_grid_label_indices, TV_multiplot_table_grid_columns, TV_multiplot_table_title_dimensions, TV_table_dimensions, MERGED_TV_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
							results_table_2_CSV_if										(output_multiplot_data_parent_directory, 						merge_multiplot_TV_CSV_short_filename, 								write_merged_multiplot_TV_CSV_data, overwrite_merged_multiplot_TV_CSV_data, print_output_CSV_path, false);
							merged_multiplot_tv_csv_file_path = results_table_2_CSV_if	(PVT_output_multiplot_data_parent_directory, 					merge_multiplot_TV_CSV_short_filename, 								write_merged_multiplot_TV_CSV_data, overwrite_merged_multiplot_TV_CSV_data, print_output_CSV_path, false);
							float_array_2_TXT_if										(output_multiplot_data_parent_directory, 						merge_multiplot_TV_TXT_short_filename, merge_multiplot_TV_data, 	write_merged_multiplot_TV_TXT_data, overwrite_merged_multiplot_TV_TXT_data,	print_output_TXT_path		);					
							merged_multiplot_tv_txt_file_path = float_array_2_TXT_if	(PVT_output_multiplot_data_parent_directory, 					merge_multiplot_TV_TXT_short_filename, merge_multiplot_TV_data, 	write_merged_multiplot_TV_TXT_data, overwrite_merged_multiplot_TV_TXT_data,	print_output_TXT_path		);					
							MERGED_MULTIPLOT_TV_TXT_FILE_PATH_LIST 		= Array.concat(MERGED_MULTIPLOT_TV_TXT_FILE_PATH_LIST, 	merged_multiplot_tv_txt_file_path); 
							MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST 		= Array.concat(MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST, 	merge_multiplot_TV_TXT_short_filename);
						}	
						lKill											(num_loops, ROI_ANALYSIS_KILL_INDEX);			
						print_loop_status								(merge_multiplot_data_completed_statement, multiplot_parameter_prefix, PRINT_MINOR_SECTION);					//"Reading ROI analysis..."
					}
					lKill												(num_loops, KILL_LOOP_INDEX);
					//lKill												(num_loops, 0);
				}// END for( i = 0; i < lengthOf(all_reduced_path_strings); i+=num_input_directories_per_multiplot)	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
//********************************************* Merge the multiplot + target test parameter value CSV files for each value of secondary parameter value *********************************************//
//***************************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
				//merge_ROI_analysis_CSVs = false;
				//merge_multiplot_CSVs = false;
				//write_PVT_RSP_CSVs
				PVT_ROI_data_subdirectory					= PVT_output_multiplot_data_parent_directory 	+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;
				PVT_TV_data_subdirectory					= PVT_output_multiplot_data_parent_directory;
				// OTVS_dir_suffix
				//ROI_compared_table_rows			= num_TTP_values + 1;
				//ROI_compared_table_row_headers 	= Array.concat(ROI_table_row_headers, OTVS_row_header); 				
				//ROI_compared_table_dimensions		= newArray(ROI_table_first_column, ROI_table_columns, ROI_compared_table_rows, ROI_table_column_separation, ROI_table_row_separation, column_labels_row_separation);					
				//TV_compared_table_rows			= num_TTP_values + 1;
				//TV_compared_table_row_headers 	= Array.concat(ROI_table_row_headers, OTVS_row_header); 			
				//TV_compared_table_dimensions		= newArray(TV_table_first_column, TV_table_columns, TV_compared_table_rows, TV_table_column_separation, TV_table_row_separation, column_labels_row_separation);	
				if											(merge_PVT_RSP_CSVs)
				{
					PVT_RSP_data 							= newArray();
					RSP_PVT_table_grid_titles 				= array_inner_concatenate(MERGED_MULTIPLOT_RSP_TXT_FILENAME_LIST, multiplot_parameter_equals_short_strings, true);				
					RSP_PVT_table_grid_labels 				= Array.concat(		 RSP_PVT_table_grid_titles, 		 ROI_multiplot_table_titles, 		  ROI_table_column_headers, 			 ROI_table_row_headers			);
					RSP_PVT_table_grid_labels_lengths		= Array.concat(		(RSP_PVT_table_grid_titles.length), (ROI_multiplot_table_titles.length), (ROI_table_column_headers.length), 	(ROI_table_row_headers.length)	);
					RSP_PVT_table_grid_label_indices 		= series_ops(		 RSP_PVT_table_grid_labels_lengths, SERIES_SUMMATION, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
					PVT_RSP_data							= table_grid_fill_all_imported	(RSP_PVT_table_grid_labels, RSP_PVT_table_grid_label_indices, ROI_multiplot_table_grid_columns, ROI_multiplot_table_title_dimensions, ROI_table_dimensions, MERGED_MULTIPLOT_RSP_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
					merged_multiplot_rsp_csv_file_path 		= results_table_2_CSV_if		(PVT_ROI_data_subdirectory, PVT_RSP_CSV_FILENAME, 					write_PVT_RSP_CSVs, overwrite_PVT_RSP_CSVs, print_output_CSV_path, DONT_CLEAR_RESULTS_TABLE);
					merged_multiplot_rsp_txt_file_path 		= float_array_2_TXT_if			(PVT_ROI_data_subdirectory, PVT_RSP_TXT_FILENAME, PVT_RSP_data, 	write_PVT_RSP_TXTs, overwrite_PVT_RSP_TXTs,	print_output_TXT_path		);					
				}	
				//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				if											(merge_PVT_RSP_Error_CSVs)
				{
					PVT_RSP_Error_data 						= newArray();
					RSP_Error_PVT_table_grid_titles 		= array_inner_concatenate(MERGED_MULTIPLOT_RSP_ERROR_TXT_FILENAME_LIST, multiplot_parameter_equals_short_strings, true);				
					RSP_Error_PVT_table_grid_labels 		= Array.concat(		 RSP_Error_PVT_table_grid_titles, 		  		 ROI_multiplot_table_titles, 		  ROI_table_column_headers, 			 ROI_table_row_headers			);
					RSP_Error_PVT_table_grid_labels_lengths	= Array.concat(		(RSP_Error_PVT_table_grid_titles.length), 		(ROI_multiplot_table_titles.length), (ROI_table_column_headers.length), 	(ROI_table_row_headers.length)	);
					RSP_Error_PVT_table_grid_label_indices 	= series_ops(		 RSP_Error_PVT_table_grid_labels_lengths, 		SERIES_SUMMATION, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
					PVT_RSP_Error_data						= table_grid_fill_all_imported	(RSP_Error_PVT_table_grid_labels, 	RSP_Error_PVT_table_grid_label_indices, ROI_multiplot_table_grid_columns, ROI_multiplot_table_title_dimensions, ROI_table_dimensions, MERGED_MULTIPLOT_RSP_ERROR_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
					merged_multiplot_rspe_csv_file_path 	= results_table_2_CSV_if		(PVT_ROI_data_subdirectory, 		PVT_RSP_ERROR_CSV_FILENAME, 						write_PVT_RSP_Error_CSVs, overwrite_PVT_RSP_Error_CSVs, print_output_CSV_path, DONT_CLEAR_RESULTS_TABLE);
					merged_multiplot_rspe_txt_file_path 	= float_array_2_TXT_if			(PVT_ROI_data_subdirectory, 		PVT_RSP_ERROR_TXT_FILENAME, PVT_RSP_Error_data, 	write_PVT_RSP_Error_TXTs, overwrite_PVT_RSP_Error_TXTs,	print_output_TXT_path		);					
				}	
				//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				if											(merge_PVT_Std_Dev_CSVs)
				{
					PVT_Std_Dev_data 						= newArray();
					Std_Dev_PVT_table_grid_titles 			= array_inner_concatenate(MERGED_MULTIPLOT_STD_DEV_TXT_FILENAME_LIST, multiplot_parameter_equals_short_strings, true);				
					Std_Dev_PVT_table_grid_labels 			= Array.concat(		 Std_Dev_PVT_table_grid_titles, 		  		 ROI_multiplot_table_titles, 		  ROI_table_column_headers, 			 ROI_table_row_headers			);
					Std_Dev_PVT_table_grid_labels_lengths	= Array.concat(		(Std_Dev_PVT_table_grid_titles.length), 		(ROI_multiplot_table_titles.length), (ROI_table_column_headers.length), 	(ROI_table_row_headers.length)	);
					Std_Dev_PVT_table_grid_label_indices 	= series_ops(		 Std_Dev_PVT_table_grid_labels_lengths, 		SERIES_SUMMATION, SERIES_OP_UP_TO_INDEX, EMPTY_ARRAY);
					PVT_Std_Dev_data						= table_grid_fill_all_imported	(Std_Dev_PVT_table_grid_labels, 	Std_Dev_PVT_table_grid_label_indices, ROI_multiplot_table_grid_columns, ROI_multiplot_table_title_dimensions, ROI_table_dimensions, MERGED_MULTIPLOT_STD_DEV_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
					merged_multiplot_sd_csv_file_path 		= results_table_2_CSV_if		(PVT_ROI_data_subdirectory, 		PVT_STD_DEV_CSV_FILENAME, 						write_PVT_TV_CSVs, overwrite_PVT_TV_CSVs, 	print_output_CSV_path, DONT_CLEAR_RESULTS_TABLE);
					merged_multiplot_sd_txt_file_path 		= float_array_2_TXT_if			(PVT_ROI_data_subdirectory, 		PVT_STD_DEV_TXT_FILENAME, PVT_Std_Dev_data, 	write_PVT_TV_TXTs, overwrite_PVT_TV_TXTs,	print_output_TXT_path		);					
				}	
				//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				//if											(false)
				if											(merge_PVT_TV_CSVs)
				{
					PVT_TV_data 							= newArray();
					TV_PVT_table_grid_titles 				= array_inner_concatenate(MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST, multiplot_parameter_equals_short_strings, true);				
					TV_PVT_table_grid_labels 				= Array.concat(		 TV_PVT_table_grid_titles, 		  			 TV_multiplot_table_titles, 		 TV_table_column_headers, 			 		 TV_table_row_headers			);
					TV_PVT_table_grid_labels_lengths		= Array.concat(		(TV_PVT_table_grid_titles.length), 			(TV_multiplot_table_titles.length), (TV_table_column_headers.length), 			(TV_table_row_headers.length)	);
					TV_PVT_table_grid_label_indices 		= series_ops(		 TV_PVT_table_grid_labels_lengths, 			SERIES_SUMMATION, 					SERIES_OP_UP_TO_INDEX, 																																				EMPTY_ARRAY				);
					PVT_TV_data								= table_grid_fill_all_imported	(TV_PVT_table_grid_labels, 		TV_PVT_table_grid_label_indices, 	TV_multiplot_table_grid_columns, 			TV_multiplot_table_title_dimensions, TV_table_dimensions, MERGED_MULTIPLOT_TV_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER				);
					merged_multiplot_tv_csv_file_path 		= results_table_2_CSV_if		(PVT_TV_data_subdirectory, 		PVT_TV_CSV_FILENAME, 				write_PVT_TV_CSVs, overwrite_PVT_TV_CSVs, 	print_output_CSV_path, 																									DONT_CLEAR_RESULTS_TABLE);
					merged_multiplot_tv_txt_file_path 		= float_array_2_TXT_if			(PVT_TV_data_subdirectory, 		PVT_TV_TXT_FILENAME, PVT_TV_data, 	write_PVT_TV_TXTs, overwrite_PVT_TV_TXTs,	print_output_TXT_path		);					
				}	
				//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				//exit();
				//lKill												(num_loops, 0);
				//lKill											(num_loops, ROI_ANALYSIS_KILL_INDEX);			
				print_loop_status								(merge_multiplot_data_completed_statement, multiplot_parameter_prefix, PRINT_MINOR_SECTION);					//"Reading ROI analysis..."	
				//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
				//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//				
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
function autobreak				()										{ autobreak_bool	 	= file_2_array(GITHUB_MACRO_CONFIGS_SUBDIR, AUTO_BREAK_FILENAME, !PRINT_PATH);	exitIf(autobreak_bool[0]);				}
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
function IJROI_analysis_config_CSV()									{ IJROI_analysis_config	(IJROI_ANALYSIS_MEASUREMENTS, IJROI_ANALYSIS_REDIRECT, IJIO_PRECISION_CSV);										}
function IJROI_analysis_config_image()									{ IJROI_analysis_config	(IJROI_ANALYSIS_MEASUREMENTS, IJROI_ANALYSIS_REDIRECT, IJIO_PRECISION_IMAGE);									}
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
function print_sep				(_type) 								{ print_section			(EMPTY_STRING, _type); 																							}
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

function IJIO_config(_IJIO_JPEG_QUALITY, _IJIO_TRANSPARENT_INDEX, _IJIO_RESULTSTABLE_EXTENSION, _IJIO_RESULTSTABLE_OPTIONS)
{
	_IJIO_jpeg_quality_string				= "jpeg="	+ _IJIO_JPEG_QUALITY 			+ SPACE_STRING;
	_IJIO_transparent_index_string			= "gif=" 	+ _IJIO_TRANSPARENT_INDEX 		+ SPACE_STRING;
	_IJIO_ResultsTable_extension_string		= "file=" + _IJIO_RESULTSTABLE_EXTENSION 	+ SPACE_STRING;
	_IJIO_ResultsTable_options_string		= _IJIO_RESULTSTABLE_OPTIONS;
	run										("Input/Output...", _IJIO_jpeg_quality_string + _IJIO_transparent_index_string + _IJIO_ResultsTable_extension_string + _IJIO_ResultsTable_options_string);
	//run									("Input/Output...", "jpeg = " + _IJIO_JPEG_QUALITY + " gif = " + _IJIO_TRANSPARENT_INDEX + " file = " + _IJIO_RESULTSTABLE_EXTENSION + SPACE_STRING + _IJIO_RESULTSTABLE_OPTIONS);
}
function IJROI_analysis_config(_IJROI_ANALYSIS_MEASUREMENTS, _IJROI_ANALYSIS_REDIRECT, _IJROI_analysis_precision)
{
	_IJROI_analysis_measurements_string		= _IJROI_ANALYSIS_MEASUREMENTS 					+ SPACE_STRING;
	_IJROI_analysis_redirect_string			= "redirect=" + _IJROI_ANALYSIS_REDIRECT 		+ SPACE_STRING;
	_IJROI_analysis_precision_string		= "decimal=" 	+ _IJROI_analysis_precision;
	run										("Set Measurements...", _IJROI_analysis_measurements_string + _IJROI_analysis_redirect_string + _IJROI_analysis_precision_string);
	//run									("Set Measurements...", "area mean standard min max redirect = None decimal=" + IJIO_PRECISION_CSV);
}
function IJIO_configOptions(_options_ON)
{
	if(_options_ON)
		IJIO_config(IJIO_JPEG_QUALITY, IJIO_TRANSPARENT_INDEX, IJIO_RESULTSTABLE_EXTENSION, IJIO_RESULTSTABLE_OPTIONS);
	else
		IJIO_config(IJIO_JPEG_QUALITY, IJIO_TRANSPARENT_INDEX, IJIO_RESULTSTABLE_EXTENSION, EMPTY_STRING);
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
function process_macro_args()
{		
	_macro_arg 				= getArgument();
	_macroargs				= newArray();
	if						(_macro_arg == EMPTY_STRING )	
	{
		_macroargs			= Array.concat(_macroargs, INTERNAL_MACRO_CALLER);
		return 				_macroargs;
	}
	else
	{
		_macroargs			=split(_macro_arg,"-");
		_macroargs			= Array.concat(EXTERNAL_MACRO_CALLER,_macroargs);
	}
	return 					_macroargs;
}
function macro_caller_config(_internal_kill_loop_index, _dont_kill_loop)
{
	_NO_KILL_LOOP_INDEX				= 99999999999;
	if								(internal_macro_caller)
	{
		KILL_LOOP_INDEX				= _internal_kill_loop_index;
		//close_all_windows			(true, true);
		close_all_windows_except	(true, true, "Log");
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
	_TXT_filename 			= extend_path(_path, _filename);		
	if(_write_ON)
	{
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
	return						_TXT_filename;				
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
//merge_multiplot_ROI_analysis_CSV_folder				= output_multiplot_data_parent_directory 		+ FOLDER_SEPARATOR + current_analysis_subdirectory;
//merge_multiplot_PVT_ROI_analysis_CSV_folder			= PVT_output_multiplot_data_parent_directory 	+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;
function make_merged_CSV_directories()
{
	File.makeDirectory				(merged_CSV_folder																																									);
	File.makeDirectory				(PVT_output_data_parent_directory																																								);
	make_directory_parents			(PVT_output_data_parent_directory, 		merged_PVT_ROI_analysis_CSV_folder, 		FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merged_PVT_ROI_analysis_CSV_folder, 	PVT_output_data_parent_directory, 						FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merged_CSV_folder, 					merged_ROI_analysis_CSV_folder, 			FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
}
function make_merge_multiplot_CSV_directories()
{
	File.makeDirectory				(PVT_output_multiplot_data_parent_directory																													);
	File.makeDirectory				(output_multiplot_data_parent_directory																														);
	make_directory_parents			(PVT_output_multiplot_data_parent_directory, 	merge_multiplot_PVT_ROI_analysis_CSV_folder, 	FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR,  (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(output_multiplot_data_parent_directory, 		merge_multiplot_ROI_analysis_CSV_folder, 		FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR,  (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
	make_directory_parents			(merged_CSV_folder, 							merged_ROI_analysis_CSV_folder, 				FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR,  (PRINT_DIRECTORIES_CREATED	&& PRINT_STATUS == PRINTING_ON)	);
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
	_filepath 				= extend_path(_directory, _filename);	
	if							(_write_ON)
	{
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
	return 						_filepath;
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
function verify_reconstruction_output(_RECON_DATA_DIR, _reconstruction_output_directory, _reconstructed_image_filenames, _TV_input_data_filename, _print_path)
{
	_reconstruction_output_directory_path = extend_path(_RECON_DATA_DIR, _reconstruction_output_directory);		
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
function verify_ROI_analysis_output_files(_common_directory, _PVT_data_folder, _ROI_ANALYSIS_RSP_OFNAME, _ROI_ANALYSIS_RSP_ERROR_OFNAME, _ROI_ANALYSIS_STD_DEV_OFNAME, _ROI_ANALYSIS_TV_IFNAME, _slices_2_analyze_folders, _ROI_selection_diameter_folders, _print_path)
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
			_current_analysis_subdirectory	= _slice_2_analyze_folder + _ROI_selection_diameter_folder;					
				
			_current_analysis_ROI_analysis_RSP_output_filename			= _current_analysis_subdirectory 	+ File.separator 	+ _ROI_ANALYSIS_RSP_OFNAME;
			_current_analysis_ROI_analysis_RSP_Error_output_filename	= _current_analysis_subdirectory 	+ File.separator 	+ _ROI_ANALYSIS_RSP_ERROR_OFNAME;
			_current_analysis_ROI_analysis_Std_Dev_output_filename		= _current_analysis_subdirectory 	+ File.separator 	+ _ROI_ANALYSIS_STD_DEV_OFNAME;
			
			_source_folder		= extend_path(_common_directory, _PVT_data_folder				);
			_RSP_file_path		= extend_path(_source_folder, _current_analysis_ROI_analysis_RSP_output_filename			);
			_RSP_Error_file_path= extend_path(_source_folder, _current_analysis_ROI_analysis_RSP_Error_output_filename	);
			_Std_Dev_file_path	= extend_path(_source_folder, _current_analysis_ROI_analysis_Std_Dev_output_filename		);
			_TV_file_path		= extend_path(_source_folder, _ROI_ANALYSIS_TV_IFNAME			);

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
function array_inner_concatenate(_base_array, _appended_array, _print_result)
{
	_index 							= 0;
	_result_array					= newArray(_base_array.length * _appended_array.length);
	for								( _i = 0; _i < lengthOf(_base_array); _i++)	
	{	
		_base 						= _base_array[_i];
		for							( _j = 0; _j < lengthOf(_appended_array); _j++)	
		{
			_result_array[_index] 	= _base + ": " + _appended_array[_j];
			_index					++;
		}
	}
	if(_print_result)
		App("Inner concatenated array = ", _result_array);
	return 							_result_array;
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
	for(_i = 0; _i < _dashes_2_append; _i++)
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
		_current_row					= table_add_empty_rows( _total_grid_columns, _current_row + 1, _table_rowskip + _column_labels_row_separation );
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
	_num_parameters						= _table_grid_titles.length;
	_grid_rows_per_parameter 			= _table_grid_rows / _num_parameters;
	_parameter_grid_row_counter			= _grid_rows_per_parameter;
	_parameter_number					= 0;
	_conditional_rowskip				= 0;
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	for(_table_grid_row = 0; _table_grid_row < _table_grid_rows; _table_grid_row++)
	{
		if(_parameter_grid_row_counter >= _grid_rows_per_parameter)
		{
			_parameter_grid_row_counter = 0;
			_conditional_rowskip		= 1;
			_tables_start_row			= table_add_empty_rows( _num_columns, _tables_start_row, 1);//***************************
			setResult					(_start_column-1, _tables_start_row, _table_grid_titles[_parameter_number]);	//*****************************
			_parameter_number++;
		}
		_tables_start_row 				= table_grid_add_row(_tables_start_row + _conditional_rowskip, _start_column, _table_colskip, _table_rowskip, _table_titles, _column_headers, _row_headers, _column_labels_row_separation, _data, _num_columns, _num_rows, _table_grid_columns, _table_grid_row, _data_order);
		//_tables_start_row 			= table_grid_add_rowB(_tables_start_row, _start_column, _table_colskip, _table_rowskip, _table_grid_titles[_table_num], _table_titles, _column_headers, _row_headers, _column_labels_row_separation, _data, _num_columns, _num_rows, _table_grid_columns, _table_grid_row, _data_order);
		_conditional_rowskip			= 0;
		_parameter_grid_row_counter		++;
	}
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
		print_section			("Input/output directories and filenames created during execution",	true											);
		print					("Total # of reconstruction data sets = " 							+ num_input_directories							);
		print					("Reconstruction data sets used = " 								+ num_input_data_sets							);
		print					("Total # of loops executed = " 									+ num_loops										);
		print					("Total # of multiplot analyses performed = " 						+ num_multiplot_analyses						);
		App						(" MERGED_RSP_ERROR_TXT_FILE_PATH_LIST:				\n------->", 	MERGED_PVT_RSP_ERROR_TXT_FILENAME_LIST			); 						
		App						(" MERGED_RSP_TXT_FILE_PATH_LIST:					\n------->", 	MERGED_RSP_TXT_FILE_PATH_LIST					); 						
		App						(" MERGED_STD_DEV_TXT_FILE_PATH_LIST:				\n------->", 	MERGED_STD_DEV_TXT_FILE_PATH_LIST				); 						
		App						(" MERGED_TV_TXT_FILE_PATH_LIST:					\n------->", 	MERGED_TV_TXT_FILE_PATH_LIST					); 						
		App						(" MERGED_PVT_RSP_ERROR_TXT_FILENAME_LIST:			\n------->", 	MERGED_PVT_RSP_ERROR_TXT_FILENAME_LIST			); 						
		App						(" MERGED_PVT_RSP_TXT_FILENAME_LIST:				\n------->", 	MERGED_PVT_RSP_TXT_FILENAME_LIST				); 						
		App						(" MERGED_PVT_STD_DEV_TXT_FILENAME_LIST:			\n------->", 	MERGED_PVT_STD_DEV_TXT_FILENAME_LIST			); 						
		App						(" MERGED_PVT_TV_TXT_FILENAME_LIST:					\n------->", 	MERGED_PVT_TV_TXT_FILENAME_LIST					); 						
		App						(" MERGED_MULTIPLOT_RSP_TXT_FILENAME_LIST:			\n------->", 	MERGED_MULTIPLOT_RSP_TXT_FILENAME_LIST			); 						
		App						(" MERGED_MULTIPLOT_RSP_TXT_FILE_PATH_LIST:			\n------->", 	MERGED_MULTIPLOT_RSP_TXT_FILE_PATH_LIST			); 						
		App						(" MERGED_MULTIPLOT_RSP_ERROR_TXT_FILENAME_LIST:	\n------->", 	MERGED_MULTIPLOT_RSP_ERROR_TXT_FILENAME_LIST	); 						
		App						(" MERGED_MULTIPLOT_RSP_ERROR_TXT_FILE_PATH_LIST:	\n------->", 	MERGED_MULTIPLOT_RSP_ERROR_TXT_FILE_PATH_LIST	); 						
		App						(" MERGED_MULTIPLOT_STD_DEV_TXT_FILENAME_LIST:		\n------->", 	MERGED_MULTIPLOT_STD_DEV_TXT_FILENAME_LIST		); 						
		App						(" MERGED_MULTIPLOT_STD_DEV_TXT_FILE_PATH_LIST:		\n------->", 	MERGED_MULTIPLOT_STD_DEV_TXT_FILE_PATH_LIST		); 						
		App						(" MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST:			\n------->", 	MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST			); 						
		App						(" MERGED_MULTIPLOT_TV_TXT_FILE_PATH_LIST:			\n------->", 	MERGED_MULTIPLOT_TV_TXT_FILE_PATH_LIST			); 						
	}
}
function print_ImageJ_info()
{
	if(PRINT_GROUPVARS())
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
		print("-------> AUTO_BREAK_FILENAME =\n ", AUTO_BREAK_FILENAME);
		print("-------> AUTO_BREAK_PATH =\n ", AUTO_BREAK_PATH);						
		print("-------> ROI_ANALYSIS_MACRO_PATH =\n ", ROI_ANALYSIS_MACRO_PATH);
		print("-------> MULTIPLOTTING_MACRO_FILENAME =\n ", MULTIPLOTTING_MACRO_FILENAME);
		print("-------> MULTIPLOTTING_MACRO_PATH =\n ", MULTIPLOTTING_MACRO_PATH);
		print("-------> TEST_RESULT_COMPARISON_MACRO_FILENAME =\n ", TEST_RESULT_COMPARISON_MACRO_FILENAME);
		print("-------> TEST_RESULT_COMPARISON_MACRO_PATH =\n ", TEST_RESULT_COMPARISON_MACRO_PATH);
	}
}
function print_input_output_filenames()
{
	if(PRINT_GROUPVARS())
	{
		print_section("Printing input/output filenames of ROI analysis, parameter value test comparisons, and parameter value test comparison multiplots", PRINT_MAJOR_SECTION);
		print		("\n*ROI analysis input/output filenames----------------------------> "															);	
		print		("-------> ROI_ANALYSIS_TV_IFNAME 							=\n " 	+ ROI_ANALYSIS_TV_IFNAME					);									// 
		print		("-------> ROI_ANALYSIS_RSP_OFNAME 						=\n " 	+ ROI_ANALYSIS_RSP_OFNAME					);									// 
		print		("-------> ROI_ANALYSIS_RSP_ERROR_OFNAME 					=\n " 	+ ROI_ANALYSIS_RSP_ERROR_OFNAME			);									// 
		print		("-------> ROI_ANALYSIS_STD_DEV_OFNAME 					=\n " 	+ ROI_ANALYSIS_STD_DEV_OFNAME				);									// 
		print		("-------> ROI_ANALYSIS_TV_OFNAME 							=\n " 	+ ROI_ANALYSIS_TV_OFNAME					);									// 
		
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
		print_section("CSV data merging output folders/filenames:", false						);
		print("PVT_output_data_parent_directory = 	\n" 	+ PVT_output_data_parent_directory	);
		print("merged_CSV_folder = 					\n" 	+ merged_CSV_folder					);
		print("merged_ROI_analysis_CSV_folder = 	\n" 	+ merged_ROI_analysis_CSV_folder	);
		print("merged_TV_CSV_filename = 			\n" 	+ merged_TV_CSV_filename			);
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
	}
}
function print_merge_multiplot_output_file_info()
{
	if(PRINT_GROUPVARS())
	{
		print_section("Multiplot data merging output folders/filenames:", false										);
		print("output_multiplot_data_parent_directory = 						\n" 	+ output_multiplot_data_parent_directory						);
		print("merge_multiplot_ROI_analysis_CSV_folder = 					\n" 	+ merge_multiplot_ROI_analysis_CSV_folder					);
		print("merge_multiplot_ROI_analysis_CSV_folder = 				\n" 	+ merge_multiplot_ROI_analysis_CSV_folder				);
		print("merge_multiplot_ROI_analysis_CSV_folder = 				\n" 	+ merge_multiplot_ROI_analysis_CSV_folder				);
		print("output_multiplot_data_parent_directory = 						\n"	 	+ output_multiplot_data_parent_directory						);
		//print("merge_multiplot_TV_CSV_filename = 					\n" 	+ merge_multiplot_TV_CSV_filename					);
		print("PVT_output_multiplot_data_parent_directory = 					\n" 	+ PVT_output_multiplot_data_parent_directory					);
		print("merge_multiplot_PVT_ROI_analysis_CSV_folder = 				\n" 	+ merge_multiplot_PVT_ROI_analysis_CSV_folder				);
		print("merge_multiplot_PVT_ROI_analysis_CSV_folder =			\n" 	+ merge_multiplot_PVT_ROI_analysis_CSV_folder			);
		print("merge_multiplot_PVT_ROI_analysis_CSV_folder = 			\n" 	+ merge_multiplot_PVT_ROI_analysis_CSV_folder			);
		print("PVT_output_multiplot_data_parent_directory = 					\n" 	+ PVT_output_multiplot_data_parent_directory					);
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
		print		("-------> ITERATIONS_STRING_PRECISION		=\n " 	+ ITERATIONS_STRING_PRECISION			);
		print		("-------> iterations_2_analyze_strings					: "														);	Array.print	(iterations_2_analyze_strings);
		print		("-------> iterations_2_analyze_folders					: "														);	Array.print	(iterations_2_analyze_folders);
		print		("-------> SLICES_STRING_PRECISION			=\n " 	+ SLICES_STRING_PRECISION				);
		print		("-------> slices_2_analyze_strings						: "														);	Array.print	(slices_2_analyze_strings);
		print		("-------> slices_2_analyze_folders						: "														);	Array.print	(slices_2_analyze_folders);
		print		("-------> ROI_SELECTION_DIAMETER_STRING_PRECISION		=\n " 	+ ROI_SELECTION_DIAMETER_STRING_PRECISION		);
		print		("-------> ROI_selection_diameter_strings				: "														);	Array.print	(ROI_selection_diameter_strings);
		print		("-------> ROI_selection_diameter_folders				: "														);	Array.print	(ROI_selection_diameter_folders);					
	}
}
function print_ROI_definitions()
{
	if(PRINT_GROUPVARS())
	{
		print_section("Printing ROI definitions and info", PRINT_MAJOR_SECTION				);
		print	("-------> PHANTOM_BASENAME					= " 	+ PHANTOM_BASENAME					);
		print	("-------> ROI_DEFINITIONS_FILENAME			= " 	+ ROI_DEFINITIONS_FILENAME			);
		print	("-------> ROI_DEFINITIONS_FILE_PATH		= " 	+ ROI_DEFINITIONS_FILE_PATH			);
		print	("-------> ROI_material_names 				= "											); 	Array.print(ROI_material_names);	
		//print	("-------> ROI_material_RSPs 				= "											); 	Array.print(ROI_material_RSPs);	
		print	("-------> ROI_labels 						= "											); 	Array.print(ROI_labels);	
		print	("-------> ROI_label_nicknames 				= "											); 	Array.print(ROI_label_nicknames);	
		print	("-------> ROI_types 						= "											); 	Array.print(ROI_types);	
		print	("-------> ROI_diameters 					= "											); 	Array.print(ROI_diameters);	
		print	("-------> ROI_selection_radii 				= "											); 	Array.print(ROI_selection_radii);	
		print	("-------> ROI_profile_radius_beyond_ROI	= " 	+ ROI_profile_radius_beyond_ROI		);
		print	("-------> bulk_material 					= " 	+ bulk_material						);
		//print	("-------> bulk_material_RSP 				= " 	+ bulk_material_RSP					);				
		print	("-------> num_ROIs_2_analyze 				= " 	+ num_ROIs_2_analyze				);
		print	("-------> ROIs_per_image 				= " 	+ ROIs_per_image				);
		print	("-------> ROIs_per_reconstruction 				= " 	+ ROIs_per_reconstruction				);
		print	("-------> ROIs_per_slice 				= "											); 	Array.print(ROIs_per_slice);	
		print	("-------> slices_2_analyze 				= "											); 	Array.print(slices_2_analyze);	
		print	("-------> first_slice_2_analyze 				= " 	+ first_slice_2_analyze				);
		print	("-------> last_slice_2_analyze 				= " 	+ last_slice_2_analyze				);
		print	("-------> num_slices_2_analyze 				= " 	+ num_slices_2_analyze				);
	}
}		
function print_section(section_heading, _section_type)
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
	if(_section_type == PRINT_MAJOR_SECTION)
	{
		print							(slash_section_separator);
		print							(asterisk_section_separator);
		print							(asterisk_heading_separator);
		print							(asterisk_section_separator);
		print							(slash_section_separator);
	}
	else if(_section_type == PRINT_MINOR_SECTION)
	{
		print							(dash_section_separator);
		print							(dash_heading_separator);
		print							(dash_section_separator);			
	}
	else if(_section_type == PRINT_STAR_SEP)
		print							(asterisk_section_separator);
	else if(_section_type == PRINT_DASH_SEP)
		print							(dash_section_separator);
	else if(_section_type == PRINT_SLASH_SEP)
		print							(slash_section_separator);
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
function path_2_phantom_name(path, RECON_DATA_FOLDER)
{
	folder_names 					= split(path, File.separator);
	reconstruction_data_folder_name = substring(RECON_DATA_FOLDER, 1);
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
//function verify_ROI_analysis_output_files(_common_directory, _PVT_data_folder, _ROI_ANALYSIS_RSP_OFNAME, _ROI_ANALYSIS_RSP_ERROR_OFNAME, _ROI_ANALYSIS_STD_DEV_OFNAME, _ROI_ANALYSIS_TV_IFNAME, _slices_2_analyze_folders, _ROI_selection_diameter_folders, _print_path)
//function ROI_material_name_2_RSP(material_name, is_simulated_scan)
//function ROI_material_names_2_RSPs(_ROI_material_names, _is_simulated_scan)
//function generate_parameter_test_multiplot_folder(_multiplot_parameter_index, _multiplot_parameter_combination, _multiplot_combination_offset, _parameter_values, _parameter_value_offsets, _parameter_string_prefixes, _parameter_string_precisions )
//function generate_parameter_test_multiplot_folder2(_multiplot_parameter_index, _multiplot_parameter_combination, _multiplot_parameter_value, _parameter_string_prefixes, _parameter_string_precisions )
// Write function to return data array min/max individually or together in array via control options. i.e., RETURN_MIN, RETURN_MAX, RETURN_MINMAX
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//********************************************************************* Functions to look at modifying/combining/removing later *********************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//function file_2_key_value_pairs(_ROI_definitions_directory, _ROI_DEFINITIONS_FILENAME, _PHANTOM_BASENAME, _ROI_definitions_parameter_list, _ROI_parameter_decodings, _ROI_parameter_value_parseFloat, _print_ROI_definitions_path)
//{
//	_ROI_definition_file_key_value_pairs		= file_2_array(_ROI_definitions_directory, _ROI_DEFINITIONS_FILENAME, _print_ROI_definitions_path);
//	_num_ROI_key_value_pairs					= _ROI_definition_file_key_value_pairs.length;
//	_ordered_ROI_parameter_strings				= newArray(_num_ROI_key_value_pairs);
//	for(i = 0; i < _num_ROI_key_value_pairs; i++)
//	{
//		separated_key_value_pair 				= split(_ROI_definition_file_key_value_pairs[i], "=");
//		key_string 								= separated_key_value_pair[0];
//		_spaceless_key_string 					= strip_surrounding_spaces(key_string);
//		_ROI_parameter_values_string			= strip_surrounding_spaces(separated_key_value_pair[1]);
//		for(j = 0; j < _ROI_definitions_parameter_list.length; j++)
//			if(_spaceless_key_string == _ROI_definitions_parameter_list[j] )
//				_ordered_ROI_parameter_strings[j] = _ROI_parameter_values_string;
//	}	
//	return _ordered_ROI_parameter_strings;	
//}
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
function parse_analysis_cfg(_CFG_PARAMETER_LIST, _CFG_PARAMETER_DECODINGS, _print_cfg_definitions_path)
{
	if											(_print_cfg_definitions_path)
		print									("Reading/parsing ROI analysis configurations from:\n\t------->" + ANALYSIS_CFG_INFO_FILE_PATH);
	_cfg_parameter_strings						= file_2_key_value_pairs(GITHUB_MACRO_CONFIGS_SUBDIR, ANALYSIS_CFG_INFO_FILENAME, _CFG_PARAMETER_LIST, DONT_PRINT_PATH);		
	_cfg_parameter_values						= newArray(_cfg_parameter_strings.length);
	for											(__i = 0; __i < _cfg_parameter_values.length; __i++)
		_cfg_parameter_values[__i]				= decode_string( _cfg_parameter_strings[__i], _CFG_PARAMETER_DECODINGS[__i]);
	return 										_cfg_parameter_values;
}
function print_analysis_cfgs(_CFG_PARAMETER_LIST, _cfg_parameter_string_values, _CFG_PARAMETER_DECODINGS)
{
	for											(__i = 0; __i < _cfg_parameter_string_values.length; __i++)
	{
		if										(_CFG_PARAMETER_DECODINGS[__i] == BOOL_DECODING_OP)
		{
			if									( _cfg_parameter_string_values[__i] == true )
												print(_CFG_PARAMETER_LIST[__i] + " = (evaluates) true" );
			else								print(_CFG_PARAMETER_LIST[__i] + " = (evaluates) false" );
		}
		else									print(_CFG_PARAMETER_LIST[__i] + " = " +  _cfg_parameter_string_values[__i]);
	}
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
function file_2_decoded_key_value_pairs(_ROI_definitions_directory, _ROI_DEFINITIONS_FILENAME,  _ROI_definitions_parameter_list, _ROI_parameter_decodings, _ROI_parameter_value_parseFloat, _printing_ROI_definitions)
{
	_ROI_definition_file_key_value_pairs		= file_2_array(_ROI_definitions_directory, _ROI_DEFINITIONS_FILENAME, _printing_ROI_definitions);
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
//function ROI_material_names_2_RSPs(_ROI_material_names, _is_simulated_scan)
//{
//	_num_ROIs_2_analyze 		= _ROI_material_names.length;
//	_ROI_material_RSPs 			= newArray(_num_ROIs_2_analyze);
//	for(ROI = 0; ROI < _num_ROIs_2_analyze; ROI++)
//		_ROI_material_RSPs[ROI] 	= ROI_material_name_2_RSP(_ROI_material_names[ROI], _is_simulated_scan);
//	return _ROI_material_RSPs;
//}
function ROI_material_names_2_RSPs(_ROI_material_names, _is_simulated_scan)
{
	_num_ROIs_2_analyze 		= _ROI_material_names.length;
	_ROI_material_RSPs 			= newArray(_num_ROIs_2_analyze);
	for(_ROI = 0; _ROI < _num_ROIs_2_analyze; _ROI++)
		_ROI_material_RSPs[_ROI] 	= material_RSP_LUT(_ROI_material_names[_ROI], _is_simulated_scan);
//		_ROI_material_RSPs[_ROI] 	= ROI_material_name_2_RSP(_ROI_material_names[_ROI], _is_simulated_scan);
	return _ROI_material_RSPs;
}
function setMeasurementsFlags(_ROI_MEAS_FLAGS)
{
	_measurementsFlagsString			= _ROI_MEAS_FLAGS[0];
	for									( _i = 1; _i < _ROI_MEAS_FLAGS.length; _i++)
		_measurementsFlagsString 		= _measurementsFlagsString + SPACE_STRING + _ROI_MEAS_FLAGS[_i];
	return 								_measurementsFlagsString;
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
//function string_array_concatenation(_string_array, _front_concatenation_string, _back_concatenation_string)
//{
//	_num_array_strings = _string_array.length;
//	_concatenated_string_array = newArray(_num_array_strings);
//	for(i = 0; i < _num_array_strings; i++)
//		_concatenated_string_array[i] = _front_concatenation_string + _string_array[i] + _back_concatenation_string;
//	return _concatenated_string_array;
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
function generate_parameter_value_range_string(_parameter_prefix, _parameter_values, _parameter_string_precision, _minimize_string_precision, _add_spaces, _value_range_form, _single_value_action)
{	
	//print("gege");
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
function all_2_lowercase(_string_array)
{
	_lowercase_strings = newArray(_string_array.length);
	for(_i = 0; _i < _string_array.length; _i++)
		_lowercase_strings[_i] = toLowerCase(_string_array[_i]);
	return _lowercase_strings;
}
function all_2_uppercase(_string_array)
{
	_uppercase_strings = newArray(_string_array.length);
	for(_i = 0; _i < _string_array.length; _i++)
		_uppercase_strings[_i] = toUpperCase(_string_array[_i]);
	return _uppercase_strings;
}
function array_maxval(_array)
{
	maxval				=_array[0];
	for					(_i = 1; _i < _array.length; _i++)
		if				( _array[_i] > maxval )
			maxval 		= _array[_i];
	return 				maxval;
}
function array_minval(_array)
{
	minval				=_array[0];
	for					(_i = 1; _i < _array.length; _i++)
		if				( _array[_i] < minval )
			minval 		= _array[_i];
	return 				minval;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//********************************************************************* Functions to look at modifying/combining/removing later *********************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function material_name_LUT(_material_name)
{
	_num_material_aliases			= MATERIAL_ALIAS_LUT.length;
	_material_name_lcase			= toLowerCase(_material_name);
	for(_alias = 0; _alias < _num_material_aliases; _alias++)
		if(_material_name_lcase == MATERIAL_ALIAS_LUT_LCASE[_alias])
			return MATERIAL_NAME_LUT_LCASE[_alias];
}
function last_iteration_image_existing(_directory_path, _num_recon_iterations)
{
	existing_images								= 0;
	for											(_iteration_check = 0; _iteration_check <= _num_recon_iterations; _iteration_check++)
	{
		_full_path 								= construct_valid_file_path(_directory_path, RECONSTRUCTED_IMAGE_FILE_BASENAMES + d2s(_iteration_check, ITERATIONS_STRING_PRECISION) + TXT);
		if										( !File.exists(_full_path) )
		{
			if									( existing_images > 0 )		
				return 							_iteration_check - 1;
			else
				return 							_num_recon_iterations;
		}
		else
			existing_images++;
	}
	return 										_num_recon_iterations;
}
function slice_ycoordinates(_yoffsets, _slice, _rows, _slice_indexing) // _slice_indexing = SLICES_ZERO_INDEXED / SLICES_NUM_INDEXED
{
	_ycoordinates			= newArray(_yoffsets.length);
	_yshift					= (_slice - _slice_indexing) * _rows;
	for						(_i = 0; _i < _yoffsets.length; _i++)
	{
		_ycoordinates[_i]	= _yshift + _yoffsets[_i];
	}
	return 					_ycoordinates;
}
function ROI_type_LUT(_ROI_type)
{
	_num_ROI_types			= ROI_SELECTION_SHAPES.length;
	_ROI_type_lcase			= toLowerCase(_ROI_type);
	for						(_type = 0; _type < _num_ROI_types; _type++)
		if					(_ROI_type_lcase == ROI_SELECTION_SHAPES[_type])
			return 			_type;
}
function ROI_parameters_2_xyparameters(_ROI_parameters, _return_specifier)
{
	_num_ROI_parameters							= _ROI_parameters.length;
	_ROI_xparameters							= newArray( floor(_num_ROI_parameters / 2) ); 
	_ROI_yparameters							= newArray( floor(_num_ROI_parameters / 2) ); 
	for											(_i = 0; _i < _num_ROI_parameters; _i++)
	{
		if										(_i % 2 == 0)
			_ROI_xparameters[floor(_i / 2)] 	= _ROI_parameters[_i];
		else
			_ROI_yparameters[floor(_i / 2)] 	= _ROI_parameters[_i];
	}
	if											( _return_specifier == RETURN_XPARAMETERS )
		return 									_ROI_xparameters;
	else if										( _return_specifier == RETURN_YPARAMETERS )
		return 									_ROI_yparameters;
}
function ROI_xyparameters_2_parameters(_ROI_xparameters, _ROI_yparameters)
{
	_num_ROI_xyparameters						= _ROI_xparameters.length;
	_ROI_parameters								= newArray( 2 * _num_ROI_xyparameters ); 
	for											(_i = 0; _i < _num_ROI_xyparameters; _i++)
	{
		_ROI_parameters[2*_i] 					= _ROI_xparameters[_i];
		_ROI_parameters[2*_i + 1] 				= _ROI_yparameters[_i];
	}
	return 										_ROI_parameters;
}
function parse_ROI_parameter_line(_ROI_positions_string, _ROI_index, _ROI_decoding, _force_array, _print_extraction)
{
	_ROI_positions_groups 						= split(_ROI_positions_string, ROI_PARAMETER_GROUP_SEP);
	_ROI_positions_group						= _ROI_positions_groups[_ROI_index];
	_ROI_positions_raw						 	= split(_ROI_positions_group, ROI_PARAMETER_SEP);
	_num_ROI_positions						 	= _ROI_positions_raw.length;
	_ROI_positions								= newArray(_num_ROI_positions);
	for											(_ROI_position = 0; _ROI_position < _num_ROI_positions; _ROI_position++)
	{
		_spaceless_ROI_position 				= strip_surrounding_spaces(_ROI_positions_raw[_ROI_position]);
		if										(_ROI_decoding == FLOAT_DECODING_OP)
			_decoded_ROI_position 				= parseFloat(_spaceless_ROI_position);
		else if									(_ROI_decoding == INT_DECODING_OP)
			_decoded_ROI_position 				= parseInt(_spaceless_ROI_position);
		else
			_decoded_ROI_position 				= _spaceless_ROI_position;
		_ROI_positions[_ROI_position]			= _decoded_ROI_position;
	}
	if											(_print_extraction)
	{
		print									("_num_ROI_positions = ", _num_ROI_positions);
		App										("_ROI_positions", _ROI_positions);
	}
	if											( _ROI_positions.length == 1 && !_force_array)
		return 									_ROI_positions[0];
	else
		return 									_ROI_positions;
}
function parse_ROI_xyparameter_lines(_ROI_definitions_file_lines, _ROI_xcoordinates_linenum, _ROI_ycoordinates_linenum, _ROI_PARAMETER_DECODINGS, _return_string, _print_extraction )
{//ROI_coordinates = parse_ROI_xyparameter_lines(ROI_parameter_strings, 5, 6, ROI_PARAMETER_DECODINGS, FORCE_VALUE_2_ARRAY);
	_ROI_xcoordinates_string 					= _ROI_definitions_file_lines[_ROI_xcoordinates_linenum];
	_ROI_ycoordinates_string 					= _ROI_definitions_file_lines[_ROI_ycoordinates_linenum];
	_ROI_xcoordinates_groups 					= split(_ROI_xcoordinates_string, ROI_PARAMETER_GROUP_SEP);
	_ROI_ycoordinates_groups 					= split(_ROI_ycoordinates_string, ROI_PARAMETER_GROUP_SEP);
	_num_ROI_xcoordinates_groups 				= _ROI_xcoordinates_groups.length;
	_num_ROI_ycoordinates_groups 				= _ROI_ycoordinates_groups.length;
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	if											( _num_ROI_xcoordinates_groups != _num_ROI_ycoordinates_groups)
		errKill									("Mismatch in number of x/y coordinate groups (i.e. ';' separators)");
	if											( endsWith(_ROI_xcoordinates_string, ROI_PARAMETER_GROUP_SEP) || startsWith(_ROI_xcoordinates_string, ROI_PARAMETER_GROUP_SEP) )
		errKill									("First/last ROI x-coordinate group (i.e. ';' separated x-coordinate list) is empty");
	if											( endsWith(_ROI_ycoordinates_string, ROI_PARAMETER_GROUP_SEP) || startsWith(_ROI_ycoordinates_string, ROI_PARAMETER_GROUP_SEP) )
		errKill									("First/last ROI y-coordinate group (i.e. ';' separated y-coordinate list) is empty");
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	_num_ROI_coordinates_groups 				= _num_ROI_xcoordinates_groups;
	_coordinates_per_ROI						= newArray(_num_ROI_coordinates_groups);
	_ROI_coordinates							= newArray();
	_ROI_coordinates_string						= "";
	for											(_ROI_group = 0; _ROI_group < _num_ROI_coordinates_groups; _ROI_group++)
	{
		_ROI_group_xcoordinates					= split(_ROI_xcoordinates_groups[_ROI_group], ROI_PARAMETER_SEP);
		_ROI_group_ycoordinates					= split(_ROI_ycoordinates_groups[_ROI_group], ROI_PARAMETER_SEP);
		_num_ROI_group_xcoordinates				= _ROI_group_xcoordinates.length;
		_num_ROI_group_ycoordinates				= _ROI_group_ycoordinates.length;
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
		if										( _num_ROI_group_xcoordinates != _num_ROI_group_ycoordinates)
			errKill								("Mismatch in number of x/y coordinate definitions");
		if										( (_num_ROI_group_xcoordinates == 0) || (_num_ROI_group_ycoordinates == 0) )
			errKill								("x or y coordinate group is empty");
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
		_num_ROI_group_coordinates				= _num_ROI_group_xcoordinates;
		_coordinates_per_ROI[_ROI_group]		= _num_ROI_group_coordinates;
		for										(_ROI_group_coordinate = 0; _ROI_group_coordinate < _num_ROI_group_coordinates; _ROI_group_coordinate++)
		{
			_spaceless_ROI_group_xcoordinate 	= strip_surrounding_spaces(_ROI_group_xcoordinates[_ROI_group_coordinate]);
			_spaceless_ROI_group_ycoordinate 	= strip_surrounding_spaces(_ROI_group_ycoordinates[_ROI_group_coordinate]);
			//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
			if									(_ROI_PARAMETER_DECODINGS[_ROI_xcoordinates_linenum] == FLOAT_DECODING_OP)
				_decoded_ROI_group_xcoordinate 	= parseFloat(_spaceless_ROI_group_xcoordinate);
			else if								(_ROI_PARAMETER_DECODINGS[_ROI_xcoordinates_linenum] == INT_DECODING_OP)
				_decoded_ROI_group_xcoordinate 	= parseInt(_spaceless_ROI_group_xcoordinate);
			else
				_decoded_ROI_group_xcoordinate 	= _spaceless_ROI_group_xcoordinate;
			//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
			if									(_ROI_PARAMETER_DECODINGS[_ROI_ycoordinates_linenum] == FLOAT_DECODING_OP)
				_decoded_ROI_group_ycoordinate 	= parseFloat(_spaceless_ROI_group_ycoordinate);
			else if								(_ROI_PARAMETER_DECODINGS[_ROI_ycoordinates_linenum] == INT_DECODING_OP)
				_decoded_ROI_group_ycoordinate 	= parseInt(_spaceless_ROI_group_ycoordinate);
			else
				_decoded_ROI_group_ycoordinate 	= _spaceless_ROI_group_ycoordinate;
			//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
			_ROI_coordinates					= Array.concat(_ROI_coordinates, _decoded_ROI_group_xcoordinate);
			_ROI_coordinates					= Array.concat(_ROI_coordinates, _decoded_ROI_group_ycoordinate);
			_ROI_coordinates_string				= _ROI_coordinates_string + toString(_decoded_ROI_group_xcoordinate) + ROI_PARAMETER_SEP + toString(_decoded_ROI_group_ycoordinate) + ROI_PARAMETER_PAIR_SEP; //d2s(n, decimalPlaces)
		}
		_ROI_coordinates_string					= substring(_ROI_coordinates_string, 0, lengthOf(_ROI_coordinates_string) - 1)  + ROI_PARAMETER_GROUP_SEP;
	}
	_ROI_coordinates_string						= substring(_ROI_coordinates_string, 0, lengthOf(_ROI_coordinates_string) - 1);
	if											(_print_extraction)
	{
		App										("_ROI_coordinates", _ROI_coordinates);
		App										("_coordinates_per_ROI", _coordinates_per_ROI);
		print									("_ROI_coordinates_string = ", _ROI_coordinates_string);
	}
	if											( _return_string )
		return 									_ROI_coordinates_string;
	else
		return 									_ROI_coordinates;
}
function parse_ROI_slices(_ROI_slices_string, _ROI_index, _print_slices)
{
	_ROI_slices_groups 						= split(_ROI_slices_string, ROI_PARAMETER_GROUP_SEP);
	_ROI_slices_group						= _ROI_slices_groups[_ROI_index];
	_ROI_slices_raw						 	= split(_ROI_slices_group, ROI_PARAMETER_SEP);
	_num_ROI_slices						 	= _ROI_slices_raw.length;
	_ROI_slices								= newArray(_num_ROI_slices);
	for										(_ROI_slice = 0; _ROI_slice < _num_ROI_slices; _ROI_slice++)
	{
		_spaceless_ROI_slice 				= strip_surrounding_spaces(_ROI_slices_raw[_ROI_slice]);
		_ROI_slices[_ROI_slice]				= parseInt(_spaceless_ROI_slice);
	}
	if(_print_slices)
	{
		print								("_num_ROI_slices = ", _num_ROI_slices);
		App									("_ROI_slices", _ROI_slices);
	}
	return 									_ROI_slices;
}
function parse_ROIs_per_slice(_ROI_slices_string, _slice, _array_desired, _return_specifier, _print_slices)
{
	
	_slice_ROI_indices						= newArray();
	_slice_ROI_parameters					= newArray();
	_j										= 0;
	for										(_i = 0; _i < _array_desired.length; _i++)
	{
		_ROI_slices							= parse_ROI_slices(_ROI_slices_string, _i, _print_slices);
		if									( isMember(_slice, _ROI_slices, RETURN_MATCH_TF ) )
		{
			_slice_ROI_indices				= Array.concat(_slice_ROI_indices, _i); 
			_slice_ROI_parameters			= Array.concat(_slice_ROI_parameters, _array_desired[_i]); 
		}
	}
	if										(_return_specifier == RETURN_INDICES)
		_return_info 						= _slice_ROI_indices;
	else if									(_return_specifier == RETURN_ELEMENTS)
		_return_info 						= _slice_ROI_parameters;
	if										(_print_slices)
		App									("_return_info", _return_info);
	return 									_return_info;
}
function parse_ROI_slice_list(_ROI_slices_string, _return_specifier, _print_slices)
{
	_ROI_slices_string						= replace(_ROI_slices_string, ROI_PARAMETER_GROUP_SEP, ROI_PARAMETER_SEP);
	_ROI_slices_raw						 	= split(_ROI_slices_string, ROI_PARAMETER_SEP);
	_num_ROI_slices						 	= _ROI_slices_raw.length;
	_ROI_slices								= newArray(_num_ROI_slices);
	for										(_ROI_slice = 0; _ROI_slice < _num_ROI_slices; _ROI_slice++)
	{
		_spaceless_ROI_slice 				= strip_surrounding_spaces(_ROI_slices_raw[_ROI_slice]);
		_ROI_slices[_ROI_slice]				= parseInt(_spaceless_ROI_slice);
	}
	_ROI_max_slice							= array_maxval(_ROI_slices);
	_ROI_min_slice							= array_minval(_ROI_slices);
	_unique_ROI_slices						= newArray();
	for										(_ROI_slice = _ROI_min_slice; _ROI_slice <= _ROI_max_slice; _ROI_slice++)
		if									( isMember(_ROI_slice, _ROI_slices, RETURN_MATCH_TF ) )
			_unique_ROI_slices				= Array.concat(_unique_ROI_slices, _ROI_slice);

	_ROIs_per_slice						 	= newArray(_unique_ROI_slices.length);	
	for										(_ROI_slice = 0; _ROI_slice < _unique_ROI_slices.length; _ROI_slice++)
	{
		_unique_ROI_slice					= _unique_ROI_slices[_ROI_slice];
		for									(_i = 0; _i < _ROI_slices.length; _i++)
			if								( _ROI_slices[_i] == _unique_ROI_slice )
											_ROIs_per_slice[_ROI_slice]++;
	}
	if										(_print_slices)
		App									("_unique_ROI_slices", _unique_ROI_slices);
	if										(_return_specifier == RETURN_MIN)
		return 								_ROI_min_slice;
	else if									(_return_specifier == RETURN_MAX)
		return 								_ROI_max_slice;
	else if									(_return_specifier == RETURN_ALL)
		return 								_unique_ROI_slices;
	else if									(_return_specifier == RETURN_COUNT)
		return 								_num_ROI_slices;
	else if									(_return_specifier == RETURN_PER_SLICE)
		return 								_ROIs_per_slice;
	else
		return 								_unique_ROI_slices;
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
function parse_ROI_parameters_string(_ROI_coordinates_string, _ROI_index, _return_specifier, _print_extraction )
{//parse_ROI_parameters_string(_ROI_coordinates_string, _ROI_index, _ROI_PARAMETER_DECODINGS, _return_string )
	_ROI_coordinates_groups 					= split(_ROI_coordinates_string, ROI_PARAMETER_GROUP_SEP); 
	_num_ROI_coordinates_groups 				= _ROI_coordinates_groups.length;
	_ROI_coordinates_group 						= _ROI_coordinates_groups[_ROI_index];
	_ROI_coordinate_pairs 						= split(_ROI_coordinates_group, ROI_PARAMETER_PAIR_SEP);
	_num_ROI_coordinate_pairs 					= _ROI_coordinate_pairs.length;
	_ROI_xcoordinates							= newArray(_num_ROI_coordinate_pairs);
	_ROI_ycoordinates							= newArray(_num_ROI_coordinate_pairs);
	_ROI_coordinates							= newArray(2*_num_ROI_coordinate_pairs);
	_ROI_coordinate_pair_string					= "";
	for											(_ROI_point = 0; _ROI_point < _num_ROI_coordinate_pairs; _ROI_point++)
	{
		_ROI_coordinate_pair 					= split(_ROI_coordinate_pairs[_ROI_point], ROI_PARAMETER_SEP);
		_ROI_xcoordinate_raw					= _ROI_coordinate_pair[0];
		_ROI_ycoordinate_raw					= _ROI_coordinate_pair[1];
		_spaceless_ROI_xcoordinate 				= strip_surrounding_spaces(_ROI_xcoordinate_raw);
		_spaceless_ROI_ycoordinate 				= strip_surrounding_spaces(_ROI_ycoordinate_raw);
		_decoded_ROI_xcoordinate 				= parseFloat(_spaceless_ROI_xcoordinate);
		_decoded_ROI_ycoordinate 				= parseFloat(_spaceless_ROI_ycoordinate);
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
		_ROI_xcoordinates[_ROI_point]			= _decoded_ROI_xcoordinate;
		_ROI_ycoordinates[_ROI_point]			= _decoded_ROI_ycoordinate;
		_ROI_coordinates[2*_ROI_point]			= _decoded_ROI_xcoordinate;
		_ROI_coordinates[2*_ROI_point + 1]		= _decoded_ROI_ycoordinate;
		_ROI_coordinate_pair_string				= _ROI_coordinate_pair_string + toString(_decoded_ROI_xcoordinate) + ROI_PARAMETER_SEP + toString(_decoded_ROI_ycoordinate) + ROI_PARAMETER_PAIR_SEP; //d2s(n, decimalPlaces)
	}
	_ROI_coordinate_pair_string					= substring(_ROI_coordinate_pair_string, 0, lengthOf(_ROI_coordinate_pair_string) - 1);
	if(_print_extraction)
	{
		print									("_ROI_coordinate_pair_string = ", _ROI_coordinate_pair_string);
		print									("_num_ROI_coordinate_pairs = ", _num_ROI_coordinate_pairs);
		App										("_ROI_xcoordinates", _ROI_xcoordinates);
		App										("_ROI_ycoordinates", _ROI_ycoordinates);
		App										("_ROI_coordinates", _ROI_coordinates);
	}
	if											( _return_specifier == RETURN_XCOORDINATES )
		return 									_ROI_xcoordinates;
	else if										( _return_specifier == RETURN_YCOORDINATES )
		return 									_ROI_ycoordinates;
	else if										( _return_specifier == RETURN_COORDINATE_PAIRS )
		return 									_ROI_coordinates;
	else if										( _return_specifier == RETURN_COORDINATE_PAIR_STRING )
		return 									_ROI_coordinate_pair_string;
	else
		return 									_ROI_coordinates;
}
function construct_valid_file_path(directory, filename)
{
	while(startsWith(filename, File.separator))
		filename = substring(filename, 1, lengthOf(filename));
	while(endsWith(directory, File.separator))
		directory = substring(directory, 0, lengthOf(directory) - 1);
	//path 			= directory + File.separator + filename;
	return			directory + File.separator + filename;
}
