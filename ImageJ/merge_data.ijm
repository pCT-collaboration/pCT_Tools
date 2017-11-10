//C:\Users\Blake\Documents\GitHub\pCT-collaboration\pCT_Tools\ImageJ
macro "merge_data"
{
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***************************************************************************************************************************************************************************************************//
	//************************* Close all windows and clear results table *******************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	internal_macro_caller			= macro_caller();
	//multiplot_parameter_prefix 		= macro_caller_variable("TV");
	multiplot_parameter_prefix 		= macro_caller_variable("L");
	//multiplot_parameter_prefix 		= macro_caller_variable("A");
	DONT_KILL_LOOP					= true;
	//DONT_KILL_LOOP					= false;
	KILL_LOOP_INDEX					= macro_caller_config(0, DONT_KILL_LOOP);
	_list 							= getList("window.titles");
	//eprintvar						("_list", _list);
	setBatchMode					(true);	
	//setBatchMode					(false);
	print_section_separator			("Generating multi-curve plots vs target test parameter for a user specified parameter, with each plot having individual curves for each value of this parameter, then writing the plot data and resulting images to disk as PNG", true);
	//***************************************************************************************************************************************************************************************************//
	//************* Execution control Booleans and general parameter value test and multiplot behavior Booleans ************************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	simulated_scan 														= true;
	experimental_scan 													= !simulated_scan;
	log_printing														= true;			
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
	INTERNAL_MACRO_CALLER							= true;
	EXTERNAL_MACRO_CALLER							= false;
	IJIO_CONFIG_OPTIONS_ON							= true;
	IJIO_CONFIG_OPTIONS_OFF							= false;
	ALL_BOOL 										= false;
	NONE_BOOL 										= true;
	COLUMN_ORDER									= true;
	ROW_ORDER										= false;
	COLUMN_MAJOR									= true;
	ROW_MAJOR										= false;
	CLOSE_PNG										= true;
	DONT_CLOSE_PNG									= false;
	SHORTEN_STRINGS									= true;
	DONT_SHORTEN_STRINGS							= false;	
	PRINT_PATH										= true;
	DONT_PRINT_PATH									= false;	
	PRINTING_ON										= true;
	PRINTING_OFF									= false;	
	PRINT_MAJOR_SECTION								= true;
	PRINT_MINOR_SECTION								= false;	
	CLOSE_WINDOW									= true;
	DONT_CLOSE_WINDOW								= false;	
	MAKE_TOP_DIR									= true;
	DONT_MAKE_TOP_DIR								= false;
	PRINT_DIRECTORIES_CREATED						= true;
	DONT_PRINT_DIRECTORIES_CREATED					= false;
	MULTIVALUE_ONLY_ON								= true;
	MULTIVALUE_ONLY_OFF								= false;
	REMOVE_TRAILING_ZEROS							= true;
	DONT_REMOVE_TRAILING_ZEROS						= false;
	make_top_directory								= true;
	dont_make_top_directory							= false;
	SINGLE_VALUE_RANGE_OMIT_PARAMETER				= 0;										// Parameter value range string construction for non-multivalue parameter: <label>[#]
	SINGLE_VALUE_RANGE_BRACKET_VALUE				= 1;										// Parameter value range string construction for non-multivalue parameter: <label>=#
	SINGLE_VALUE_RANGE_EQUALS_VALUE					= 2;										// Parameter value range string construction for non-multivalue parameter: omit <label> & value info string
	debug_print_counter								= 1;
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
	TRUE											= "true";
	FALSE											= "false";
	add_operation									= "add";
	multiply_operation								= "multiply";
	x_direction										= "x";
	y_direction										= "y";	 					
	circular_ROI									= "circle";
	square_ROI										= "square";		
	no_compression									= "None";
	JPEG_compression								= "JPEG";
	PNG_compression									= "PNG";
	ROI_definition_numbers_decoding_op				= "parseFloat";	
	ROI_definition_strings_decoding_op				= "none";	
	MONTH_NAMES 									= newArray("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
	DAY_NAMES 										= newArray("Sun", "Mon","Tue","Wed","Thu","Fri","Sat");
	EMPTY_STRING 									= "";										// String constant: empty string
	SPACE_STRING 									= " ";										// String constant: space character string
	UNDERSCORE_STRING 								= "_";										// String constant: underscore character string
	COMMA_STRING 									= ",";										// String constant: comma character string
	EQUALS_STRING 									= "=";										// String constant: equals character string
	DASH_STRING 									= "-";										// String constant: dash character string
	RIGHT_CARAT_STRING 								= ">";										// String constant: right carat character string
	LEFT_BRACKET_STRING 							= "[";										// String constant: right carat character string
	RIGHT_BRACKET_STRING 							= "]";										// String constant: right carat character string
	//***********************************************************************************************************************************************************************************************//
	//***************************************************************************** Set reconstruction data directory/file info *********************************************************************//
	//***********************************************************************************************************************************************************************************************//
	ImageJ_plugins_directory						= getDirectory("plugins");
	ImageJ_macro_directory							= getDirectory("macros");
	ImageJ_program_directory						= getDirectory("imagej") ;
	ImageJ_launch_directory							= getDirectory("startup");
	ImageJ_previous_macro							= getInfo("macro.filepath");
	github_macro_directory							= "C:\\Users\\Blake\\Documents\\GitHub\\Baylor_ICTHUS\\pCT_Reconstruction\\Tools\\ImageJ";
 	//github_macro_directory						= "C:\\Users\\Blake\\Documents\\GitHub\\pCT-collaboration\\pCT_Tools\\ImageJ";
 	reconstruction_data_directory_C					= "C:\\Users\\Blake\\Documents\\Education\\Research\\pCT\\pCT_data\\reconstruction_data";
	reconstruction_data_directory_D					= "D:\\pCT\\pCT_data\\reconstruction_data";
	ROI_analysis_macro_filename 					= "ROI_Analysis.ijm";
	multiplotting_macro_filename 					= "Multiplotting.ijm";
	test_result_comparison_macro_filename 			= "Test_Result_Comparison.ijm";
	ROI_analysis_macro_path 						= github_macro_directory + FOLDER_SEPARATOR + ROI_analysis_macro_filename;
	multiplotting_macro_path 						= github_macro_directory + FOLDER_SEPARATOR + multiplotting_macro_filename;
	test_result_comparison_macro_path 				= github_macro_directory + FOLDER_SEPARATOR + test_result_comparison_macro_filename;
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
	current_reconstruction_data_type				= simulated_data;
	
	if(current_reconstruction_data_drive == drive_C)				reconstruction_data_directory 	= reconstruction_data_directory_C;
	else if(current_reconstruction_data_drive == drive_D)			reconstruction_data_directory 	= reconstruction_data_directory_D;
	if(current_reconstruction_data_type == simulated_data) 			test_batch_directory 			= reconstruction_data_directory + phantom_name_folder + simulated_data_folder + run_date_folder + run_number_folder + output_folder + preprocess_date_folder + FOLDER_SEPARATOR;
	else if(current_reconstruction_data_type == experimental_data)	test_batch_directory 			= reconstruction_data_directory + phantom_name_folder + experimental_data_folder + run_date_folder + run_number_folder + output_folder + preprocess_date_folder + FOLDER_SEPARATOR;		

	// Image/data filename and directory prefixes, file extensions, and results table column headings

	ROI_material_RSP_column_label 					= "Predicted RSP";
	RSP_error_column_label 							= "% Error";
	mean_column_label 								= "Mean";	
	COLUMN_SUM_ROW_LABEL 							= "Sum";	
	TV_before_TVS_label 							= "TV: Before TVS";	
	TV_after_TVS_label 								= "TV: After TVS";
	TV_reduction_label 								= "TVS TV Reduction";
	TV_table_titles									= newArray(TV_before_TVS_label, TV_after_TVS_label, TV_reduction_label);
		
	// Input/Output directory/subdirectory names/prefixes 
	reconstructed_image_folder_prefix 				= "x";
	iteration_2_analyze_folder_prefix 				= "Iteration_";
	ROI_analysis_slice_2_analyze_folder_prefix 		= "Slice_";
	slice_2_analyze_folder_prefix 					= "Slice_";
	slice_2_analyze_folder_short_prefix 			= "s";
	ROI_selection_diameter_folder_prefix 			= "d";
	compared_data_folder_suffix						= "_compared";
	averaged_data_folder_suffix						= "_avg";

	// Input/output info and data basenames/filenames
	ROI_definitions_filename_suffix					= "_ROIs" + TXT;	
	ROI_definitions_filename						= phantom_basename + ROI_definitions_filename_suffix;
	ROI_definitions_file_path						= github_macro_directory + FOLDER_SEPARATOR + ROI_definitions_filename;
	reconstructed_image_file_basenames 				= "x_";
	reconstructed_image_file_short_basenames 		= "x";
	initial_iterate_filename 						= reconstructed_image_file_basenames + "0" + TXT;	
	auto_break_filename 							= "autobreak.txt";
	auto_break_path 								= ImageJ_macro_directory + auto_break_filename;
	parameter_test_info_basename					= "Test_Parameters_";
	specific_data_folders_filename 					= "ROI_analysis_folders.txt";
	reconstruction_folders_filename 				= "reconstruction_folders.txt";
	averaging_folders_filename 						= "averaging_folders.txt";
	multiplot_folders_filename 						= "multiplot_folders.txt";
	compared_folders_filename 						= "compared_folders.txt";	
	ANALYSIS_LOG_FNAME 								= "AnalysisLog.nfo";
	initial_iterate_filename 						= reconstructed_image_file_basenames + "0" + TXT;	
	profile_CSV_basename 							= "Line_Profiles";
	profile_data_file_basenames 					= "Line_Profile";
	regions_data_file_basenames						= "Region_Statistics";
	gradient_CSV_basename 							= "Gradients";
	gradient_data_file_basenames 					= "Gradient";	
	RSP_data_file_basenames							= "RSP";
	RSP_error_data_file_basenames					= "RSP_Error";
	RSP_Error_data_file_basenames					= "RSP_Error";
	Std_Dev_data_file_basenames						= "Std_Dev";
	TV_data_file_basenames							= "TV";
	TV_measurements_basename						= "TV_measurements";
	TV_step_data_file_basenames						= "TV_step";
	TV_difference_data_file_basenames				= "TV_difference";	
	
	RSP_data_file_base_nicknames					= "RSP";
	RSP_error_data_file_base_nicknames				= "RSPe";
	RSP_Error_data_file_base_nicknames				= "RSPe";
	Std_Dev_data_file_base_nicknames				= "SD";
	TV_data_file_base_nicknames						= "TV";
	TV_measurements_base_nickname					= "TV";
	TV_step_data_file_base_nicknames				= "TVs";
	TV_difference_data_file_base_nicknames			= "TVd";	
	
	RSP_output_basenames							= "RSP";
	RSP_error_output_basenames						= "RSP_Error";
	Std_Dev_output_basenames						= "Std_Dev";
	TV_output_basenames								= "TV";
	TV_step_output_basenames						= "TV_step";
	TV_difference_output_basenames					= "TV_difference";	
	
	RSP_output_short_basenames						= "RSP";
	RSP_error_output_short_basenames				= "RSPe";
	Std_Dev_output_short_basenames					= "SD";
	TV_output_short_basenames						= "TV";
	TV_step_output_short_basenames					= "TVs";
	TV_difference_output_short_basenames			= "TVd";	
	
	ROI_analysis_RSP_output_basename 				= "RSP";
	ROI_analysis_RSP_Error_output_basename 			= "RSP_Error";
	ROI_analysis_Std_Dev_output_basename 			= "Std_Dev";
	ROI_analysis_TV_output_basename 				= "TV_measurements";
	PVT_RSP_output_basename 						= "RSP";
	PVT_RSP_Error_output_basename 					= "RSP_error";
	PVT_Std_Dev_output_basename 					= "Std_Dev";
	PVT_TV_output_basename 							= "TV_measurements";
	//***********************************************************************************************************************************************************************************************//
	//************************************************** Import ROI definitions for current phantom and set corresponding internal variables/arrays *************************************************//
	//***********************************************************************************************************************************************************************************************//
	ROI_parameter_decodings							= newArray(ROI_definition_strings_decoding_op, ROI_definition_strings_decoding_op, ROI_definition_strings_decoding_op, ROI_definition_strings_decoding_op, ROI_definition_numbers_decoding_op, ROI_definition_numbers_decoding_op, ROI_definition_numbers_decoding_op, ROI_definition_strings_decoding_op);		
	ROI_definitions_parameter_list					= newArray("ROI_material_names", "ROI_labels", "ROI_label_nicknames", "ROI_shapes", "ROI_diameters", "ROI_selection_radii", "ROI_profile_radius_beyond_ROI", "bulk_material" );
	ROI_parameter_strings							= file_2_key_value_pairs(github_macro_directory, ROI_definitions_filename, phantom_basename, 	ROI_definitions_parameter_list, ROI_parameter_decodings, ROI_definition_numbers_decoding_op, print_ROI_definitions_path);		
	ROI_material_names 								= ROI_parameter_string_2_values(ROI_definitions_parameter_list[0],  ROI_definitions_parameter_list, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_definition_numbers_decoding_op);	
	ROI_labels 										= ROI_parameter_string_2_values(ROI_definitions_parameter_list[1], 	ROI_definitions_parameter_list, ROI_parameter_strings,  	ROI_parameter_decodings, ROI_definition_numbers_decoding_op);
	ROI_label_nicknames 							= ROI_parameter_string_2_values(ROI_definitions_parameter_list[2], 	ROI_definitions_parameter_list, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_definition_numbers_decoding_op);					//bulk_material = bulk_material[0];
	ROI_shapes 										= ROI_parameter_string_2_values(ROI_definitions_parameter_list[3], 	ROI_definitions_parameter_list, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_definition_numbers_decoding_op);	
	ROI_diameters 									= ROI_parameter_string_2_values(ROI_definitions_parameter_list[4],	ROI_definitions_parameter_list, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_definition_numbers_decoding_op);
	ROI_selection_radii 							= ROI_parameter_string_2_values(ROI_definitions_parameter_list[5], 	ROI_definitions_parameter_list, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_definition_numbers_decoding_op);
	ROI_profile_radius_beyond_ROI	 				= ROI_parameter_string_2_values(ROI_definitions_parameter_list[6],	ROI_definitions_parameter_list, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_definition_numbers_decoding_op);	//ROI_profile_radius_beyond_ROI = ROI_profile_radius_beyond_ROI[0];
	bulk_material 									= ROI_parameter_string_2_values(ROI_definitions_parameter_list[7], 	ROI_definitions_parameter_list, ROI_parameter_strings, 	ROI_parameter_decodings, ROI_definition_numbers_decoding_op);					//bulk_material = bulk_material[0];
	bulk_material_RSP 								= material_name_2_RSP(bulk_material, simulated_scan);
	ROI_material_RSPs 								= ROI_material_names_2_RSPs(ROI_material_names, simulated_scan);
	num_ROIs_2_analyze 								= ROI_material_names.length; 						// # of material ROI ROIs in phantom
	//***********************************************************************************************************************************************************************************************//
	//************************************************************************************** Parameter value arrays *********************************************************************************//
	//***********************************************************************************************************************************************************************************************//
	DASHES_PER_CHAR 									= 1.3;										// Average width of a character in terms of the width of a dash character 
	EMPTY_ARRAY 										= newArray();								// Passed to set_plot_extrema when no additional lines are plotted
	OVAL_SELECTION										= "oval";
	CENTERED_SELECTION									= "centered";
	IOprecision_CSV										= 6;
	IOprecision_image									= 5;
	IJIO_ResultsTable_extension 						= ".csv";
	IJIO_ResultsTable_options 							= "copy_column copy_row save_column save_row";
	IJIO_jpeg_quality 									= 85;
	IJIO_transparent_index 								= -1;
	IJROI_analysis_measurements 						= "area mean standard min max ";
	IJROI_analysis_redirect 							= "None";
	IJROI_analysis_CSV_precision 						= IOprecision_CSV;
	IJROI_analysis_image_precision 						= IOprecision_image;
	IJROI_analysis_shape 								= OVAL_SELECTION;
	MIN_SUM_ARROW_LENGTH								= 3;
	SEQUENTIAL_VALUES_ARRAY								= Array.getSequence(100);					// Long sequential values array which other sequence arrays can be sliced from	
	num_specs 											= 4;										// # of test parameter properties specified in Specs file
	voxel_width 										= 1;										// 
	voxel_height										= 1;
	voxel_thickness										= 2.5;	
	voxel_dimensions									= newArray(voxel_width, voxel_height, voxel_thickness);
	voxels_per_mm										= 1;			
	flip_horizontally									= false;									// Specify if correct orientation of reconstructed images requires flipping horizontally
	flip_vertically										= true;										// Specify if correct orientation of reconstructed images requires flipping vertically
	num_recon_iterations 								= 12;										// # of iterations of feasibility seeking performed in reconstruction
	images_per_reconstruction 							= num_recon_iterations + 1;					// 	
	first_iteration_2_analyze							= 0;
	last_iteration_2_analyze							= 12;
	iterations_2_analyze								= Array.slice(SEQUENTIAL_VALUES_ARRAY, first_iteration_2_analyze, last_iteration_2_analyze + 1);
	num_iterations_2_analyze							= iterations_2_analyze.length;				// # of iterations of feasibility seeking image results to analyze
	iterations_2_analyze_string_precision 				= 0;										// # of digits after decimal point to use in conversion of iteration # to string 	
	//iterations_2_analyze_strings 						= getStringSequence(0, recon_iterations_2_analyze.length, 0);
	recon_iterations_2_analyze							= Array.slice(SEQUENTIAL_VALUES_ARRAY, 1, last_iteration_2_analyze + 1);
	recon_iterations_2_analyze_strings 					= getStringSequence(1, recon_iterations_2_analyze.length, 0);
	//first_slice_2_analyze 							= x_slices/2;								// first slice analyzed by pCT_Analysis macro
	//last_slice_2_analyze 								= x_slices/2;								// last slice analyzed by pCT_Analysis macro		
	first_slice_2_analyze								= 10;
	last_slice_2_analyze								= 10;
	slices_2_analyze									= Array.slice(SEQUENTIAL_VALUES_ARRAY, first_slice_2_analyze, last_slice_2_analyze + 1);
	num_slices_2_analyze								= slices_2_analyze.length;					// 
	slices_2_analyze_string_precision 					= 0;										// # of digits after decimal point to use in conversion of slice # to string 	
	ROI_radii 											= newArray(ROI_diameters.length);			// radii of circular selections used to analyze phantom ROIs
	ROI_profile_radii 									= newArray(ROI_diameters.length);			// Set distance to extend profile line left/right from material insert ROI centers
	ROI_std_selection_radii 							= newArray(3.5, 4.0, 6.0);					// radii of circular selections used to analyze phantom ROIs
	ROI_selection_radii 								= Array.slice(ROI_std_selection_radii,0,1);	// radii of circular selections used to analyze phantom ROIs
	ROI_selection_diameters 							= newArray(ROI_selection_radii.length);		// diameters of circular selections used to analyze phantom ROIs	
	ROI_selection_diameter_string_precision				= 0;										// # of digits after decimal point to use in conversion of an ROI selection diameter value to string	
	num_ROI_selection_diameters							= ROI_selection_diameters.length;			// diameters of circular selections used to analyze phantom ROIs 
	FLOAT_ARRAY_2_FILE_PRECISION						= 6;										// Precision to use for writing TV reduction values to CSV files
	TV_reduction_string_precision						= 6;										// Precision to use for writing TV reduction values to CSV files
	//merge_ROI_analysis_section_statement				= "Merging ROI analysis data for each target test parameter value ", PRINT_MAJOR_SECTION);
	merge_ROI_analysis_data_read_section_statement		= "Reading ROI analysis data from CSV files for each target test parameter value for multiplot parameter value = ";
	merge_ROI_analysis_section_statement				= "Merging ROI analysis data for each value of the target test parameter";
	merged_ROI_analysis_2_disk_section_statement		= "Writing merged ROI analysis data to CSV/TXT files for multiplot parameter value = ";
	merge_ROI_analysis_data_read_section_statement		= "Reading merged ROI analysis data from TXT files for each value of multiplot parameter = ";
	merge_multiplot_section_statement					= "Merging the merged ROI analysis data for each multiplot parameter value";
	merged_multiplot_2_disk_section_statement			= "Writing merged ROI analysis multiplot data to CSV/TXT files";
	merge_ROI_analysis_data_completed_statement			= "Finished merging ROI analysis data";
	merge_multiplot_data_completed_statement			= "Finished merging ROI analysis data for each value of multiplot parameter = ";
	merge_multiplot_data_completed_statement			= "Finished merging ROI analysis data for each value of multiplot parameter = ";
	merge_data_completed_statement						= "FINISHED MERGING DATA";
	PRINT_MAJOR_SECTION									= true;
	PRINT_MINOR_SECTION									= false;	
	//"Performing multiplot analysis # " + current_multiplot_analysis_number + " of " + num_multiplot_analyses, true);
	//"Reading input CSV files from the ROI analyses for each target test parameter value for: multiplot = " + multiplot, false);
	//merged_ROI_analysis_2_disk_section_statement = "Writing merged CSV files from the ROI analyses for each target test parameter value for: multiplot = " + multiplot, false);
	//"Finished merging data for multiplot parameter" + multiplot_parameter_prefix, true);
	//print_loop_status									(merge_ROI_analysis_data_read_section_statement, multiplot, PRINT_MINOR_SECTION);
	//print_loop_status									(merge_ROI_analysis_data_read_section_statement, multiplot_parameter_prefix, PRINT_MINOR_SECTION);
	//print_loop_status									(merged_ROI_analysis_2_disk_section_statement, multiplot, _section_type);
	//print_loop_status									(merged_multiplot_2_disk_section_statement, multiplot, _section_type);
	//print_loop_status									(merge_multiplot_data_completed_statement, multiplot_parameter_prefix, PRINT_MINOR_SECTION);
	//-------> current_test_multiplot_title_parameter_values_string	=
	//***********************************************************************************************************************************************************************************************//
	//************************************************************ Construct commonly used strings for parameter values and files/folders ***********************************************************//
	//***********************************************************************************************************************************************************************************************//	
	reconstructed_image_strings 						= newArray(images_per_reconstruction);		
	reconstructed_image_short_strings 					= newArray(images_per_reconstruction);		
	reconstructed_image_folders 						= newArray(images_per_reconstruction);		
	reconstructed_image_short_folders 					= newArray(images_per_reconstruction);		
	reconstructed_image_filenames 						= newArray(images_per_reconstruction);		
	iterations_2_analyze_strings 						= newArray(images_per_reconstruction);		
	iterations_2_analyze_folders 						= newArray(images_per_reconstruction);		
	slices_2_analyze_strings 							= newArray(num_slices_2_analyze);						
	slices_2_analyze_folders 							= newArray(num_slices_2_analyze);						
	ROI_analysis_slices_2_analyze_folders 				= newArray(num_slices_2_analyze);						
	slices_2_analyze_short_strings 						= newArray(num_slices_2_analyze);						
	slices_2_analyze_short_folders 						= newArray(num_slices_2_analyze);						
	ROI_selection_diameter_strings 						= newArray(num_ROI_selection_diameters);				
	ROI_selection_diameter_folders 						= newArray(num_ROI_selection_diameters);
	for(i = 0; i <= num_recon_iterations; i++)	
	{							
		reconstructed_image_strings[i] 					= reconstructed_image_file_basenames + d2s(i, iterations_2_analyze_string_precision);		
		reconstructed_image_folders[i] 					= FOLDER_SEPARATOR +  reconstructed_image_file_basenames + d2s(i, iterations_2_analyze_string_precision);	
		reconstructed_image_short_strings[i] 			= reconstructed_image_file_short_basenames + d2s(i, iterations_2_analyze_string_precision);		
		reconstructed_image_short_folders[i] 			= FOLDER_SEPARATOR +  reconstructed_image_file_short_basenames + d2s(i, iterations_2_analyze_string_precision);	
		reconstructed_image_filenames[i] 				= reconstructed_image_file_basenames + d2s(i, iterations_2_analyze_string_precision) + TXT;		
		iterations_2_analyze_strings[i] 				= d2s(i, iterations_2_analyze_string_precision);		
		iterations_2_analyze_folders[i] 				= FOLDER_SEPARATOR + iteration_2_analyze_folder_prefix + d2s(i, iterations_2_analyze_string_precision);	
	}	
	for(i = 0; i < num_slices_2_analyze; i++)	
	{							
		slices_2_analyze_strings[i] 					= d2s(slices_2_analyze[i], slices_2_analyze_string_precision);		
		slices_2_analyze_folders[i] 					= FOLDER_SEPARATOR + slice_2_analyze_folder_prefix + d2s(slices_2_analyze[i], slices_2_analyze_string_precision);	
		slices_2_analyze_short_strings[i] 				= d2s(slices_2_analyze[i], slices_2_analyze_string_precision);		
		slices_2_analyze_short_folders[i] 				= FOLDER_SEPARATOR + slice_2_analyze_folder_short_prefix + d2s(slices_2_analyze[i], slices_2_analyze_string_precision);	
		ROI_analysis_slices_2_analyze_folders[i]		= FOLDER_SEPARATOR + ROI_analysis_slice_2_analyze_folder_prefix + d2s(slices_2_analyze[i], slices_2_analyze_string_precision);	
	}
	for(i = 0; i < num_ROI_selection_diameters; i++)								
	{																					
		ROI_selection_diameters[i] 						= 2 * ROI_selection_radii[i];									
		ROI_selection_diameter_strings[i] 				= d2s(ROI_selection_diameters[i], ROI_selection_diameter_string_precision);	
		ROI_selection_diameter_folders[i] 				= FOLDER_SEPARATOR + ROI_selection_diameter_folder_prefix + d2s(ROI_selection_diameters[i], ROI_selection_diameter_string_precision);		
	}																								
	for(i = 0; i < ROI_diameters.length; i++)
	{
		ROI_radii[i] 									= ROI_diameters[i] / 2;		
		ROI_profile_radii[i]							= ROI_radii[i] + ROI_profile_radius_beyond_ROI;	
	}			
	//reconstructed_image_range_string					= LEFT_BRACKET_STRING + reconstructed_image_strings[0] + "-" + reconstructed_image_strings[last_iteration_2_analyze] + RIGHT_BRACKET_STRING;
	reconstructed_image_range_string					= reconstructed_image_file_short_basenames + LEFT_BRACKET_STRING + iterations_2_analyze_strings[1] + "-" + iterations_2_analyze_strings[last_iteration_2_analyze] + RIGHT_BRACKET_STRING;
	iterations_2_analyze_range_string					= LEFT_BRACKET_STRING + iterations_2_analyze_strings[first_iteration_2_analyze] + "-" + iterations_2_analyze_strings[last_iteration_2_analyze] + RIGHT_BRACKET_STRING;
	//***********************************************************************************************************************************************************************************************//
	//******************************************************** Construct commonly used strings for parameter values and files/folders ***************************************************************//
	//***********************************************************************************************************************************************************************************************//			
	TOLERANCE									= 0.0000001;								// Tolerance separating min/max values of array used in findMinima/findMaxima
	INPUT_FILE_LIST 							= newArray();   		
	OUTPUT_FILE_LIST							= newArray();
	COPIED_FILE_LIST							= newArray();
	COPIED_FILE_FROM_LIST						= newArray();
	COPIED_FILE_TO_LIST							= newArray();
	DIRECTORIES_CREATED							= newArray();
	//***********************************************************************************************************************************************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	//************************************************************ Set Parameter Names/Values and Construct Paths to Corresponding Data *************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	//---------------------------------------------- Specifications used to identify file containing specifications of parameters of parameter value test -------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	parameter_test_number						= 5;
	parameter_test_info_filename				= parameter_test_info_basename + d2s(parameter_test_number, 0)  + TXT;
	parameter_test_info 						= file_2_array(test_batch_directory, parameter_test_info_filename, print_input_data_path);
	num_parameters 								= parameter_test_info.length;
	parameter_values 							= newArray();
	num_parameter_values 						= newArray(num_parameters);
	parameter_string_prefixes 					= newArray(num_parameters);
	parameter_string_short_prefixes 			= newArray(num_parameters);
	parameter_string_precisions 				= newArray(num_parameters);				
	for(i = 0; i < parameter_test_info.length; i++)
	{
		parameter_info 							= split(parameter_test_info[i]);
		parameter_string_prefixes[i] 			= parameter_info[0];
		parameter_string_short_prefixes[i] 		= parameter_info[1];
		parameter_string_precisions[i] 			= parseInt(parameter_info[2]);
		num_parameter_values[i] 				= parameter_info.length - 3;
		parameter_elements 						= Array.slice(parameter_info, 3, parameter_info.length);
		parameter_values 						= Array.concat(parameter_values, parameter_elements);		
	}
	parameter_value_offsets 					= generate_parameter_value_offsets(num_parameter_values);
	parameter_value_strings 					= generate_all_parameter_value_strings(parameter_values, num_parameter_values, parameter_value_offsets, parameter_string_precisions);
	modulo_values 								= generate_modulo_values(num_parameter_values);
	total_combinations 							= series_product(num_parameter_values);
	//***********************************************************************************************************************************************************************************************//
	//************************************************************************************** Parameter value test  *********************************************************************************//
	//***********************************************************************************************************************************************************************************************//	
	//xaxis_param								= num_parameters;
	target_test_parameter						= num_parameters;
	TTP_index									= num_parameters - 1;
	TTP_prefix									= parameter_string_prefixes[TTP_index];
	TTP_values 									= extract_parameter_values(TTP_index, parameter_values, num_parameter_values, parameter_value_offsets);		
	TTP_value_strings 							= generate_parameter_value_strings(TTP_values, parameter_string_precisions[TTP_index], false);
	TTP_value_short_strings 					= generate_parameter_value_strings(TTP_values, parameter_string_precisions[TTP_index], true);
	TTP_equals_strings							= parameter_values_2_parameter_equals_strings(TTP_values, TTP_prefix, parameter_string_precisions[TTP_index]);
	TTP_equals_short_strings					= parameter_values_2_parameter_equals_short_strings(TTP_values, TTP_prefix, parameter_string_precisions[TTP_index]);
	TTP_min_value								= TTP_values[0];
	TTP_max_value								= TTP_values[TTP_values.length - 1];
	TTP_min_value_string						= TTP_value_short_strings[0];
	TTP_max_value_string						= TTP_value_short_strings[TTP_values.length - 1];
	TTP_range_suffix							=  LEFT_BRACKET_STRING	+ TTP_min_value_string + "-" + TTP_max_value_string + RIGHT_BRACKET_STRING;						// e.g. [1-12]
	TTP_range_filenaming 						= parameter_string_prefixes[TTP_index] 	+ 			TTP_range_suffix;					// e.g. L0_0_Nk[1-12]	
	TTP_range_plots 							= parameter_string_prefixes[TTP_index] 	+ " = " + 	TTP_range_suffix;					// e.g. L0_0_Nk = [1-12]		
	num_TTP_values 								= num_parameter_values[TTP_index];
	num_TTP_tests 								= total_combinations / num_TTP_values;	
	//***********************************************************************************************************************************************************************************************//
	//************************************************************************************** Parameter value test  *********************************************************************************//
	//***********************************************************************************************************************************************************************************************//	
	multiplot_parameter_index					= parameter_string_2_index(parameter_string_prefixes, multiplot_parameter_prefix);			// Multiplot target parameter index (from 0 - N-1)used to access elements of the parameter values/strings/precisions arrays
	multiplot_parameter							= multiplot_parameter_index + 1;															// Multiplot target parameter # from 1-N, not it's array index (i.e. from 0 - N-1)	
	multiplot_parameter_values					= extract_parameter_values(multiplot_parameter_index, parameter_values, num_parameter_values, parameter_value_offsets);
	multiplot_parameter_value_strings 			= generate_parameter_value_strings(multiplot_parameter_values,  parameter_string_precisions[multiplot_parameter_index], false);
	multiplot_parameter_value_short_strings 	= generate_parameter_value_strings(multiplot_parameter_values,  parameter_string_precisions[multiplot_parameter_index], true);
	multiplot_parameter_equals_strings			= parameter_values_2_parameter_equals_strings(multiplot_parameter_values, multiplot_parameter_prefix, parameter_string_precisions[multiplot_parameter_index]);
	multiplot_parameter_equals_short_strings	= parameter_values_2_parameter_equals_short_strings(multiplot_parameter_values, multiplot_parameter_prefix, parameter_string_precisions[multiplot_parameter_index]);
	multiplot_test_parameter_min_value			= multiplot_parameter_values[0];
	multiplot_test_parameter_max_value			= multiplot_parameter_values[multiplot_parameter_values.length - 1];
	multiplot_parameter_min_value_string		= multiplot_parameter_value_short_strings[0];
	multiplot_parameter_max_value_string		= multiplot_parameter_value_short_strings[multiplot_parameter_values.length - 1];
	multiplot_parameter_range_suffix			=  LEFT_BRACKET_STRING	+ multiplot_parameter_min_value_string + DASH_STRING + multiplot_parameter_max_value_string + RIGHT_BRACKET_STRING;										// e.g.[0-1]
	multiplot_parameter_range_filenaming 		= parameter_string_prefixes[multiplot_parameter_index] + multiplot_parameter_range_suffix;		;										// e.g.TV[0-1]
	multiplot_parameter_range_plots	 			= parameter_string_prefixes[multiplot_parameter_index] + " = " + multiplot_parameter_range_suffix;										// e.g. TV = [0-1]	
	num_multiplot_parameter_values				= num_parameter_values[multiplot_parameter_index];			
	reduced_TTP_index							= TTP_index - 1;
	reduced_modulo_values 						= generate_reduced_modulo_values(num_parameter_values, modulo_values, multiplot_parameter_index);
	reduced_parameter_value_offsets 			= generate_reduced_parameter_value_offsets(num_parameter_values, parameter_value_offsets, multiplot_parameter_index);	
	reduced_total_combinations 					= total_combinations / num_multiplot_parameter_values;
	//***********************************************************************************************************************************************************************************************//
	//********************************************** For each parameter test value combination, determine path/folder of reconstruction results value ***********************************************//
	//***********************************************************************************************************************************************************************************************//
	all_parameter_indices						= Array.slice(SEQUENTIAL_VALUES_ARRAY, 0, TTP_index + 1);
	test_parameter_indices						= newArray(TTP_index, multiplot_parameter_index);
	no_multiplot_parameter_indices				= array_remove_indices(all_parameter_indices, multiplot_parameter_index);
	no_TTP_parameter_indices					= array_remove_indices(all_parameter_indices, TTP_index);
	no_multiplot_TTP_parameter_indices			= array_remove_indices(all_parameter_indices, test_parameter_indices);
	PVT_identifier 								= generate_combined_parameter_value_range_string(parameter_values, num_parameter_values, parameter_value_offsets, parameter_string_prefixes, parameter_string_precisions);
	//parameter_value_tests_parent_directory	= test_batch_directory;
	//PVT_input_directory						= test_batch_directory;
	//PVT_output_directory						= test_batch_directory;
	parameter_value_tests_input_directory_parent	= test_batch_directory;
	parameter_value_tests_output_directory_parent	= test_batch_directory;	
	//current_PVT_output_directory 				= construct_valid_directory_path(test_batch_directory, PVT_identifier);
	current_PVT_output_directory_parent 		= construct_valid_directory_path(test_batch_directory, PVT_identifier);
	directory_created_successfully				= make_directory_recorded(current_PVT_output_directory_parent, DIRECTORIES_CREATED, print_directories_created);
	//parameter_test_directory 					= construct_valid_directory_path(test_batch_directory, PVT_identifier);
	//make_directory_recorded					(parameter_test_directory, DIRECTORIES_CREATED, print_directories_created);
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
	reduced_parameter_values_lower 				= Array.slice	(parameter_values, 0, parameter_value_offsets[multiplot_parameter_index]					);
	reduced_parameter_values_upper 				= Array.slice	(parameter_values,  parameter_value_offsets[multiplot_parameter], parameter_values.length);
	reduced_parameter_values 					= Array.concat	(reduced_parameter_values_lower, reduced_parameter_values_upper									);	
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
		parameter_combination_indices		 				= generate_parameter_test_combination_indices(TTP_index, combination_index, modulo_values, parameter_value_offsets );
		parameter_combination 								= generate_parameter_test_combination(parameter_combination_indices, parameter_values);
		all_parameter_combination_indices 					= Array.concat(all_parameter_combination_indices, parameter_combination_indices); 	
		all_parameter_combinations 							= Array.concat(all_parameter_combinations, parameter_combination); 	
		folder_string										= generate_parameter_test_folder(parameter_string_prefixes, parameter_string_precisions, parameter_combination );		
		all_folder_strings[combination_index] 				= folder_string;		
		all_path_strings[combination_index] 				= test_batch_directory + all_folder_strings[combination_index];	
		//*******************************************************************************************************************************************************************************************//
		//********************** Generate multiplotting parameter value combinations and folders/paths ordered by multiplotting target parameter ****************************************************//
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
				
				//folder_string 								= generate_parameter_test_multiplot_folder2(multiplot_parameter_index, reduced_parameter_combination, multiplot_parameter_values[i], parameter_string_prefixes, parameter_string_precisions );							
				//print("folder_string = \n" + folder_string);
				folder_string 								= generate_parameter_test_multiplot_folder(multiplot_parameter_index, reduced_parameter_combination, i, parameter_values, parameter_value_offsets, parameter_string_prefixes, parameter_string_precisions );							
				//print("folder_string = \n" + folder_string);
				all_reduced_folder_strings[start_index + i] = folder_string;
				all_reduced_path_strings[start_index + i] 	= test_batch_directory + folder_string;	
			}		
		}				
	} // END for( combination_index = 0; combination_index < total_combinations; combination_index++)
	//exit();
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//	
	ROIs_per_reconstruction 								= num_ROIs_2_analyze * images_per_reconstruction;
	ROIs_per_test 											= ROIs_per_reconstruction * num_TTP_values;
	ROIs_per_multiplot_data 								= ROIs_per_test * num_multiplot_parameter_values;
	ROIs_per_test_iteration									= num_TTP_values * num_ROIs_2_analyze;									
	ROI_material_RSP_line_by_target_parameter				= newArray(num_TTP_values);
	before_TVS_index 										= 0;
	after_TVS_index 										= 1;
	TV_step_measurements_per_iteration						= 2;
	TV_step_measurements_per_reconstruction 				= num_recon_iterations * TV_step_measurements_per_iteration;
	TV_step_measurements_per_multiplot_curve 				= num_TTP_values * TV_step_measurements_per_iteration;
	TV_step_measurements_per_multiplot 						= TV_step_measurements_per_multiplot_curve * num_multiplot_parameter_values;
	TV_step_measurements_per_test 							= TV_step_measurements_per_reconstruction * num_TTP_values;					
	TV_measurements_per_reconstruction 						= TV_step_measurements_per_reconstruction 	/ TV_step_measurements_per_iteration;
	TV_measurements_per_multiplot_curve 					= TV_step_measurements_per_multiplot_curve 	/ TV_step_measurements_per_iteration;
	TV_measurements_per_multiplot 							= TV_step_measurements_per_multiplot	 	/ TV_step_measurements_per_iteration;
	TV_measurements_per_test 								= TV_step_measurements_per_test 			/ TV_step_measurements_per_iteration;						
	TV_measurement_plots_per_iteration 						= 1;
	TV_difference_measurements_per_reconstruction 			= TV_step_measurements_per_reconstruction 	/ TV_step_measurements_per_iteration;
	TV_difference_measurements_per_multiplot_curve 			= TV_step_measurements_per_multiplot_curve 	/ TV_step_measurements_per_iteration;
	TV_difference_measurements_per_multiplot 				= TV_step_measurements_per_multiplot	 	/ TV_step_measurements_per_iteration;
	TV_difference_measurements_per_test 					= TV_step_measurements_per_test 			/ TV_step_measurements_per_iteration;						
	num_input_directories									= lengthOf(all_reduced_path_strings);
	num_input_directories_per_multiplot						= num_multiplot_parameter_values * num_TTP_values;
	num_multiplot_analyses									= num_input_directories / num_input_directories_per_multiplot;
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//
	zero_line_by_target_parameter_values 					= newArray(num_TTP_values);					
	zero_line_by_iteration									= newArray(ROIs_per_reconstruction);
	zero_line_by_ROI										= newArray(num_ROIs_2_analyze);			
	Array.fill												(zero_line_by_target_parameter_values, 0);	
	Array.fill												(zero_line_by_iteration, 0);	
	Array.fill												(zero_line_by_ROI, 0);	
	ROI_material_RSP_line_by_target_parameter				= newArray(num_TTP_values);
	ROI_material_RSP_line_no_air							= Array.slice(ROI_material_RSPs, 2, num_ROIs_2_analyze);			
	ROI_material_RSPs_by_iteration							= newArray(ROIs_per_reconstruction);
	RSPs_by_ROI												= newArray(ROIs_per_reconstruction);
	RSPs_by_iteration										= newArray(ROIs_per_reconstruction);
	RSP_errors_by_ROI										= newArray(ROIs_per_reconstruction);
	RSP_errors_by_iteration									= newArray(ROIs_per_reconstruction);
	Std_Devs_by_ROI											= newArray(ROIs_per_reconstruction);
	Std_Devs_by_iteration									= newArray(ROIs_per_reconstruction);			
	TV_measurements_by_iteration							= newArray(ROIs_per_reconstruction);
	indices_4_ordering_data 								= generate_ordering_indices(num_recon_iterations, num_ROIs_2_analyze, images_per_reconstruction, num_TTP_values);
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//
	title_start_row		 						= 0;
	title_start_column		 					= 0;
	title_row_separation 						= 2;
	column_labels_row_separation			 	= 1;
	table_row_separation 						= 2;
	first_column 								= 1;
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
	//TV_multiplot_table_total_columns			= first_column + TV_multiplot_table_grid_columns * (TV_table_columns + TV_table_column_separation + 1) - TV_table_column_separation - 1;							
	TV_multiplot_table_total_columns			= tables_total_columns(TV_table_first_column, TV_multiplot_table_grid_columns, TV_table_columns, TV_table_column_separation);
	TV_multiplot_table_title_dimensions			= newArray(title_start_column, 		title_start_row, 	title_row_separation, 	TV_multiplot_table_total_columns);
	TV_multiplot_table_titles 					= table_grid_row_array_duplication( TV_table_titles, num_TV_multiplot_tables);	
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//	
	ROI_analysis_TV_input_filename				= TV_measurements_basename 		+ TXT;	
	ROI_analysis_RSP_output_filename			= RSP_data_file_basenames 		+ CSV;
	ROI_analysis_RSP_Error_output_filename		= RSP_error_data_file_basenames	+ CSV;
	ROI_analysis_Std_Dev_output_filename		= Std_Dev_data_file_basenames  	+ CSV;
	ROI_analysis_TV_output_filename				= TV_data_file_basenames		+ TXT;
	
	PVT_RSP_output_filename						= RSP_data_file_basenames 		+ "_" + TTP_range_filenaming + TXT;
	PVT_RSP_Error_output_filename				= RSP_error_data_file_basenames + "_" + TTP_range_filenaming + TXT;
	PVT_Std_Dev_output_filename					= Std_Dev_data_file_basenames 	+ "_" + TTP_range_filenaming + TXT;
	PVT_TV_output_filename						= TV_data_file_basenames 		+ "_" + TTP_range_filenaming + TXT;
	
	multiplot_RSP_output_basename				= RSP_data_file_basenames		+ "_" + TTP_range_filenaming + "_";
	multiplot_RSP_Error_output_basename			= RSP_error_data_file_basenames	+ "_" + TTP_range_filenaming + "_";
	multiplot_Std_Dev_output_basename			= Std_Dev_data_file_basenames	+ "_" + TTP_range_filenaming + "_";
	multiplot_TV_output_basename				= TV_data_file_basenames		+ "_" + TTP_range_filenaming + "_";
	CSV_OUT_LIST								= newArray();
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***********************************************************************************************************************************************************************************************//
	//*********************************************************************** Apply execution settings/options/configurations ***********************************************************************//
	//***********************************************************************************************************************************************************************************************//	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////							
	//IJROIanalysis_config_CSV();
	//IJROIanalysis_config_image();
	//IJIO_configOptions(IJIO_CONFIG_OPTIONS_ON);
	//IJIO_configOptions(IJIO_CONFIG_OPTIONS_OFF);
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***********************************************************************************************************************************************************************************************//
	//************************************************************* Perform comparison of analysis of individual reconstruction results *************************************************************//
	//***********************************************************************************************************************************************************************************************//	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////							
	num_input_data_sets = 0;
	num_loops = 0;
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
				all_RSP_multiplot_data 					= newArray();
				all_RSP_Error_multiplot_data 			= newArray();				
				all_Std_Dev_multiplot_data 				= newArray();
				all_TV_multiplot_data 					= newArray();
				//*******************************************************************************************************************************************************************************//
				//************************* User defined function definitions *******************************************************************************************************************//
				//*******************************************************************************************************************************************************************************//
				//for( reduced_path_index = 0; reduced_path_index < lengthOf(all_reduced_path_strings); reduced_path_index += num_multiplot_parameter_values * num_TTP_values)
				for( i = 0; i < num_input_directories; i += num_input_directories_per_multiplot)
				{					
					current_multiplot_analysis_number										= i / num_input_directories_per_multiplot;
					print_section_separator													("Performing multiplot analysis # " + current_multiplot_analysis_number + " of " + num_multiplot_analyses, true);
					current_test_start_folder 												= all_folder_strings[current_test_start_folder_index];					
					current_test_folders													= Array.slice(all_folder_strings, current_test_start_folder_index, current_test_start_folder_index + num_TTP_values);					
					current_test_folder_basename_end_index 									= lastIndexOf(current_test_start_folder, "_");
					current_test_start_folder_index											+= num_TTP_values;
					current_test_end_folder 												= all_folder_strings[current_test_start_folder_index - 1];
					current_test_folder_basename											= PVT_folder_name_2_base(current_test_start_folder, TTP_prefix);
					current_test_parameter_value_strings 									= folder_name_2_parameter_values(current_test_start_folder, parameter_string_prefixes);
					current_test_parameter_values_string									= folder_2_parameter_string(current_test_start_folder, parameter_string_prefixes, parameter_string_precisions, TTP_index - 1);					
					current_test_plot_title_parameter_values_string 						= generate_plot_title_parameter_string(current_test_parameter_value_strings, TTP_index, TTP_range_suffix, parameter_string_prefixes);
					current_test_parameter_equals_strings 									= folder_name_2_parameter_equals_strings(current_test_start_folder, parameter_string_prefixes, parameter_string_precisions, DONT_SHORTEN_STRINGS);
					current_test_parameter_equals_short_strings 							= folder_name_2_parameter_equals_strings(current_test_start_folder, parameter_string_prefixes, parameter_string_precisions, SHORTEN_STRINGS);
					current_test_file_suffix 												= generate_PVT_multiplot_copy_suffixes(current_test_parameter_value_strings, parameter_string_prefixes, num_parameter_values, parameter_string_precisions, multiplot_parameter_index, multiplot_parameter_range_filenaming, true);

					current_test_multiplot_start_folder 									= all_reduced_folder_strings[i];			
					current_test_multiplot_folders											= Array.slice(all_reduced_folder_strings, current_test_multiplot_start_folder_index, current_test_multiplot_start_folder_index + num_multiplot_parameter_values);					
					current_test_multiplot_start_folder_index								+= num_TTP_values * num_multiplot_parameter_values;
					current_test_multiplot_end_folder 										= all_reduced_folder_strings[current_test_multiplot_start_folder_index - 1];			
					current_test_multiplot_folder_basename									= PVT_folder_name_2_base(current_test_multiplot_start_folder, TTP_prefix);
					current_test_multiplot_value_strings 									= folder_name_2_parameter_values(current_test_multiplot_start_folder, parameter_string_prefixes);
					current_test_multiplot_value_short_strings 								= remove_trailing_zeros_set(current_test_multiplot_value_strings, parameter_string_precisions);
					
					current_test_multiplot_parameter_values_string							= folder_2_parameter_string(current_test_multiplot_start_folder, parameter_string_prefixes, parameter_string_precisions, TTP_index - 1);					
					current_test_multiplot_title_parameter_values_string 					= generate_multivalue_parameter_values_title_string(TTP_range_suffix, multiplot_parameter_index, current_test_multiplot_value_short_strings, multiplot_parameter_range_plots, parameter_string_prefixes, num_parameter_values );
					current_test_multiplot_title_other_parameter_values_string 				= generate_multivalue_parameter_values_short_title_string(TTP_index, multiplot_parameter_index, current_test_multiplot_value_short_strings, parameter_string_prefixes, num_parameter_values );
					current_test_multiplot_parameter_equals_strings 						= folder_name_2_parameter_equals_strings(current_test_multiplot_start_folder, parameter_string_prefixes, parameter_string_precisions, DONT_SHORTEN_STRINGS);
					current_test_multiplot_parameter_equals_short_strings 					= folder_name_2_parameter_equals_strings(current_test_multiplot_start_folder, parameter_string_prefixes, parameter_string_precisions, SHORTEN_STRINGS);
					current_test_multiplot_file_suffix 										= generate_multivalue_parameter_equals_suffix(current_test_multiplot_value_strings, parameter_string_short_prefixes, num_parameter_values, parameter_string_precisions, multiplot_parameter_index, multiplot_parameter_range_filenaming);
					current_test_multiplot_parameter_equals_short_string 					= current_test_multiplot_parameter_equals_short_strings[multiplot_parameter_index];
					current_test_multiplot_parameter_equals_short_string_folder 			= FOLDER_SEPARATOR + current_test_multiplot_parameter_equals_short_string;
					/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////				
					//---------------------------------------------- Output directories -----------------------------------------------//
					/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////				
					//current_PVT_parent_directory 											= construct_valid_directory_path(test_batch_directory, PVT_identifier);
					current_PVT_parent_directory											= make_subdirectory	(test_batch_directory, PVT_identifier, DIRECTORIES_CREATED, PRINTING_OFF);//print_directories_created);
					current_PVT_output_directory_path 										= make_subdirectory	(current_PVT_parent_directory, multiplot_parameter_range_filenaming, DIRECTORIES_CREATED, print_directories_created);
					current_PVT_multiplot_parent_directory									= generate_current_PVT_multiplot_output_directory(parameter_value_tests_output_directory_parent, multiplot_parameter_index, current_test_multiplot_value_strings, multiplot_parameter_range_filenaming, TTP_range_suffix, parameter_string_prefixes, parameter_string_precisions);
					current_PVT_parent_folder 												= File.getName(current_PVT_parent_directory);
					current_PVT_multiplot_parent_folder 									= File.getName(current_PVT_multiplot_parent_directory);
					
					make_subdirectory	(parameter_value_tests_output_directory_parent, current_PVT_multiplot_parent_folder,	DIRECTORIES_CREATED, PRINTING_OFF);//print_directories_created);									
					make_subdirectory	(parameter_value_tests_output_directory_parent, current_PVT_parent_folder,				DIRECTORIES_CREATED, PRINTING_OFF);//print_directories_created);
					make_subdirectory	(parameter_value_tests_output_directory_parent, current_PVT_multiplot_parent_folder,	DIRECTORIES_CREATED, PRINTING_OFF);//print_directories_created);					
					
					print_current_PVT_info									();
					print_current_PVT_multiplot_info						();
					//exit();				
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************//
//********************************************************* Merge ROI Analysis CSV Files from Each Target Test Parameter Value **********************************************************//
//***************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////																	
					// INPUT: 	test_batch_directory//current_test_folders[i]//current_ROI_analysis_subdirectory//ROI_analysis_RSP_Error_output_filename 
					//		  	= D://...//B_3200_..._L0_Nk_#//Slice_10//d7//RSP_Error.csv
					// OUTPUT: 	test_batch_directory//current_PVT_output_directory_parent//current_ROI_analysis_subdirectory//merged_RSP_Error_CSV_filename  
					merged_RSP_CSV_filename								= RSP_data_file_basenames 			+ "_" + TTP_range_filenaming + CSV;
					merged_RSP_Error_CSV_filename						= RSP_error_data_file_basenames 	+ "_" + TTP_range_filenaming + CSV;
					merged_Std_Dev_CSV_filename							= Std_Dev_data_file_basenames 		+ "_" + TTP_range_filenaming + CSV;
					merged_TV_CSV_filename								= TV_data_file_basenames 			+ "_" + TTP_range_filenaming + CSV;
					merged_RSP_TXT_filename								= RSP_data_file_basenames 			+ "_" + TTP_range_filenaming + TXT;
					merged_RSP_Error_TXT_filename						= RSP_error_data_file_basenames 	+ "_" + TTP_range_filenaming + TXT;
					merged_Std_Dev_TXT_filename							= Std_Dev_data_file_basenames 		+ "_" + TTP_range_filenaming + TXT;
					merged_TV_TXT_filename								= TV_data_file_basenames 			+ "_" + TTP_range_filenaming + TXT;

					merge_multiplot_CSV_folder							= current_PVT_multiplot_parent_directory;
					merge_multiplot_RSP_CSV_folder						= merge_multiplot_CSV_folder 		+ FOLDER_SEPARATOR + current_analysis_subdirectory;
					merge_multiplot_RSP_Error_CSV_folder				= merge_multiplot_CSV_folder 		+ FOLDER_SEPARATOR + current_analysis_subdirectory;
					merge_multiplot_Std_Dev_CSV_folder					= merge_multiplot_CSV_folder 		+ FOLDER_SEPARATOR + current_analysis_subdirectory;
					//merge_multiplot_RSP_CSV_folder					= merge_multiplot_CSV_folder 		+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;
					//merge_multiplot_RSP_Error_CSV_folder				= merge_multiplot_CSV_folder 		+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;
					//merge_multiplot_Std_Dev_CSV_folder				= merge_multiplot_CSV_folder 		+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;
					merge_multiplot_TV_CSV_folder						= merge_multiplot_CSV_folder;
					merge_multiplot_PVT_CSV_folder						= current_PVT_output_directory_path;
					merge_multiplot_PVT_RSP_CSV_folder					= merge_multiplot_PVT_CSV_folder 	+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;;
					merge_multiplot_PVT_RSP_Error_CSV_folder			= merge_multiplot_PVT_CSV_folder 	+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;;
					merge_multiplot_PVT_Std_Dev_CSV_folder				= merge_multiplot_PVT_CSV_folder 	+ FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;;
					merge_multiplot_PVT_TV_CSV_folder					= merge_multiplot_PVT_CSV_folder;
					
					merge_multiplot_file_suffix 						= generate_PVT_multiplot_copy_suffixes(current_test_parameter_value_strings, parameter_string_prefixes, num_parameter_values, parameter_string_precisions, multiplot_parameter_index, multiplot_parameter_range_filenaming, false);
					merge_multiplot_CSV_file_suffix						= "_" + merge_multiplot_file_suffix + "_" 	+ TTP_range_filenaming + CSV;
					merge_multiplot_TXT_file_suffix						= "_" + merge_multiplot_file_suffix + "_" 	+ TTP_range_filenaming + TXT;
					merge_multiplot_CSV_filename						= TV_data_file_basenames 				+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_TXT_filename						= TV_data_file_basenames 				+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_RSP_CSV_filename					= RSP_data_file_basenames 				+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_RSP_TXT_filename					= RSP_data_file_basenames 				+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_RSP_CSV_short_filename				= RSP_data_file_base_nicknames 			+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_RSP_TXT_short_filename				= RSP_data_file_base_nicknames 			+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_RSP_Error_CSV_filename				= RSP_Error_data_file_basenames 		+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_RSP_Error_TXT_filename				= RSP_Error_data_file_basenames 		+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_RSP_Error_CSV_short_filename		= RSP_Error_data_file_base_nicknames 	+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_RSP_Error_TXT_short_filename		= RSP_Error_data_file_base_nicknames	+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_Std_Dev_CSV_filename				= Std_Dev_data_file_basenames 			+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_Std_Dev_TXT_filename				= Std_Dev_data_file_basenames 			+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_Std_Dev_CSV_short_filename			= Std_Dev_data_file_base_nicknames 		+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_Std_Dev_TXT_short_filename			= Std_Dev_data_file_base_nicknames 		+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_TV_CSV_filename						= TV_data_file_basenames 				+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_TV_TXT_filename						= TV_data_file_basenames 				+ merge_multiplot_TXT_file_suffix;
					merge_multiplot_TV_CSV_short_filename				= TV_data_file_base_nicknames 			+ merge_multiplot_CSV_file_suffix;
					merge_multiplot_TV_TXT_short_filename				= TV_data_file_base_nicknames 			+ merge_multiplot_TXT_file_suffix;
					MERGED_RSP_FILE_PATH_LIST							= newArray();
					MERGED_RSP_CSV_FILE_PATH_LIST						= newArray();
					MERGED_RSP_TXT_FILE_PATH_LIST						= newArray();
					MERGED_RSP_CSV_FOLDER_LIST							= newArray();
					MERGED_RSP_CSV_FILENAME_LIST						= newArray();
					MERGED_RSP_TXT_FILENAME_LIST						= newArray();
					MERGED_RSP_ERROR_FILE_PATH_LIST						= newArray();
					MERGED_RSP_ERROR_CSV_FILE_PATH_LIST					= newArray();
					MERGED_RSP_ERROR_TXT_FILE_PATH_LIST					= newArray();
					MERGED_RSP_ERROR_CSV_FOLDER_LIST					= newArray();
					MERGED_RSP_ERROR_CSV_FILENAME_LIST					= newArray();
					MERGED_RSP_ERROR_TXT_FILENAME_LIST					= newArray();
					MERGED_STD_DEV_FILE_PATH_LIST						= newArray();
				    MERGED_STD_DEV_CSV_FILE_PATH_LIST					= newArray();
				    MERGED_STD_DEV_TXT_FILE_PATH_LIST					= newArray();
				    MERGED_STD_DEV_CSV_FOLDER_LIST						= newArray();
					MERGED_STD_DEV_CSV_FILENAME_LIST					= newArray();
					MERGED_STD_DEV_TXT_FILENAME_LIST					= newArray();
					MERGED_TV_FILE_PATH_LIST							= newArray();
				    MERGED_TV_CSV_FILE_PATH_LIST						= newArray();
				    MERGED_TV_TXT_FILE_PATH_LIST						= newArray();
				    MERGED_TV_CSV_FOLDER_LIST							= newArray();
				    MERGED_TV_CSV_FILENAME_LIST							= newArray();
				    MERGED_TV_TXT_FILENAME_LIST							= newArray();
				    						    			
					MERGED_PVT_RSP_ERROR_FILE_PATH_LIST					= newArray();
				    MERGED_PVT_RSP_ERROR_CSV_FOLDER_LIST				= newArray();
				    MERGED_PVT_RSP_ERROR_CSV_FILENAME_LIST				= newArray();
				    MERGED_PVT_RSP_ERROR_TXT_FILENAME_LIST				= newArray();
				   	MERGED_PVT_STD_DEV_FILE_PATH_LIST					= newArray();
				    MERGED_PVT_STD_DEV_CSV_FOLDER_LIST					= newArray();
				    MERGED_PVT_STD_DEV_CSV_FILENAME_LIST				= newArray();
				    MERGED_PVT_STD_DEV_TXT_FILENAME_LIST				= newArray();
				   	MERGED_PVT_RSP_FILE_PATH_LIST						= newArray();
				    MERGED_PVT_RSP_CSV_FOLDER_LIST						= newArray();
				    MERGED_PVT_RSP_CSV_FILENAME_LIST					= newArray();
				    MERGED_PVT_RSP_TXT_FILENAME_LIST					= newArray();
				   	MERGED_PVT_TV_FILE_PATH_LIST						= newArray();
				    MERGED_PVT_TV_CSV_FOLDER_LIST						= newArray();
				    MERGED_PVT_TV_CSV_FILENAME_LIST						= newArray();
				    MERGED_PVT_TV_TXT_FILENAME_LIST						= newArray();
				    
				    MERGED_MULTIPLOT_RSP_ERROR_CSV_FILE_PATH_LIST		= newArray();
				    MERGED_MULTIPLOT_RSP_ERROR_TXT_FILE_PATH_LIST		= newArray();
				    MERGED_MULTIPLOT_RSP_ERROR_FOLDER_LIST				= newArray();
				    MERGED_MULTIPLOT_RSP_ERROR_CSV_FILENAME_LIST		= newArray();
				    MERGED_MULTIPLOT_RSP_ERROR_TXT_FILENAME_LIST		= newArray();
				    MERGED_MULTIPLOT_STD_DEV_CSV_FILE_PATH_LIST			= newArray();
				    MERGED_MULTIPLOT_STD_DEV_TXT_FILE_PATH_LIST			= newArray();
				    MERGED_MULTIPLOT_STD_DEV_FOLDER_LIST				= newArray();
				    MERGED_MULTIPLOT_STD_DEV_CSV_FILENAME_LIST			= newArray();
				    MERGED_MULTIPLOT_STD_DEV_TXT_FILENAME_LIST			= newArray();
				    MERGED_MULTIPLOT_RSP_CSV_FILE_PATH_LIST				= newArray();
				    MERGED_MULTIPLOT_RSP_TXT_FILE_PATH_LIST				= newArray();
				    MERGED_MULTIPLOT_RSP_FOLDER_LIST					= newArray();
				    MERGED_MULTIPLOT_RSP_CSV_FILENAME_LIST				= newArray();
				    MERGED_MULTIPLOT_RSP_TXT_FILENAME_LIST				= newArray();
				    MERGED_MULTIPLOT_TV_CSV_FILE_PATH_LIST				= newArray();
				    MERGED_MULTIPLOT_TV_TXT_FILE_PATH_LIST				= newArray();
				    MERGED_MULTIPLOT_TV_FOLDER_LIST						= newArray();
				    MERGED_MULTIPLOT_TV_CSV_FILENAME_LIST				= newArray();
				    MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST				= newArray();
					if(merge_ROI_analysis_CSVs)
					{
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						print_section_separator							("Merging the CSV files from the ROI analyses for each target test parameter value", true);
						merged_multiplot_RSP_data_by_ROI 				= newArray();
						merged_multiplot_RSP_Error_data_by_ROI 			= newArray();
						merged_multiplot_Std_Dev_data_by_ROI 			= newArray();
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						for(multiplot = 0; multiplot < num_multiplot_parameter_values; multiplot++)		
						//for(multiplot = 0; multiplot < 1; multiplot++)
						{ 
							print_section_separator						("Reading input CSV files from the ROI analyses for each target test parameter value for: multiplot = " + multiplot, false);
							multiplot_parameter_values_string			= folder_2_parameter_string(current_test_multiplot_folders[multiplot], parameter_string_prefixes, parameter_string_precisions, TTP_index - 1);					
							current_test_multiplot_folder_basename		= PVT_folder_name_2_base(current_test_multiplot_folders[multiplot], TTP_prefix);
							//SINGLE_VALUE_RANGE_OMIT_PARAMETER
							//SINGLE_VALUE_RANGE_BRACKET_VALUE	
							//SINGLE_VALUE_RANGE_EQUALS_VALUE
							merged_PVT_parameter_value_strings			= Array.slice(current_test_multiplot_value_strings, 0, TTP_index);
							merged_PVT_parameter_values_string 			= generate_parameter_values_string(merged_PVT_parameter_value_strings, parameter_string_short_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, EQUALS_STRING, REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_ON, SINGLE_VALUE_RANGE_BRACKET_VALUE, EMPTY_ARRAY);
							//merged_PVT_parameter_values_string 		= generate_merged_parameter_equals_suffix(current_test_multiplot_value_strings, parameter_string_short_prefixes, num_parameter_values, parameter_string_precisions, multiplot_parameter_index, multiplot_parameter_values[multiplot]);
							eprintvar("merged_PVT_parameter_values_string", merged_PVT_parameter_values_string);
							merged_PVT_RSP_CSV_filename					= RSP_output_short_basenames 		+ "_" + merged_PVT_parameter_values_string + "_" + TTP_range_filenaming + CSV;
							merged_PVT_RSP_Error_CSV_filename			= RSP_error_output_short_basenames 	+ "_" + merged_PVT_parameter_values_string + "_" + TTP_range_filenaming + CSV;
							merged_PVT_Std_Dev_CSV_filename				= Std_Dev_output_short_basenames 	+ "_" + merged_PVT_parameter_values_string + "_" + TTP_range_filenaming + CSV;
							merged_PVT_TV_CSV_filename					= TV_output_short_basenames 		+ "_" + merged_PVT_parameter_values_string + "_" + TTP_range_filenaming + CSV;
							merged_PVT_RSP_TXT_filename					= RSP_output_short_basenames 		+ "_" + merged_PVT_parameter_values_string + "_" + TTP_range_filenaming + TXT;
							merged_PVT_RSP_Error_TXT_filename			= RSP_error_output_short_basenames 	+ "_" + merged_PVT_parameter_values_string + "_" + TTP_range_filenaming + TXT;
							merged_PVT_Std_Dev_TXT_filename				= Std_Dev_output_short_basenames 	+ "_" + merged_PVT_parameter_values_string + "_" + TTP_range_filenaming + TXT;
							merged_PVT_TV_TXT_filename					= TV_output_short_basenames 		+ "_" + merged_PVT_parameter_values_string + "_" + TTP_range_filenaming + TXT;
							merged_PVT_CSV_folder						= current_PVT_output_directory_parent;
							merged_PVT_ROI_analysis_CSV_folder			= current_PVT_output_directory_parent + FOLDER_SEPARATOR + current_analysis_shortest_subdirectory;
							merged_PVT_RSP_CSV_folder					= merged_PVT_ROI_analysis_CSV_folder;
							merged_PVT_RSP_Error_CSV_folder				= merged_PVT_ROI_analysis_CSV_folder;
							merged_PVT_Std_Dev_CSV_folder				= merged_PVT_ROI_analysis_CSV_folder;
							merged_PVT_TV_CSV_folder					= merged_PVT_CSV_folder;
							merged_PVT_RSP_CSV_path						= merged_PVT_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + merged_PVT_RSP_CSV_filename;
							merged_PVT_RSP_Error_CSV_path				= merged_PVT_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + merged_PVT_RSP_Error_CSV_filename;
							merged_PVT_Std_Dev_CSV_path					= merged_PVT_ROI_analysis_CSV_folder 	+ FOLDER_SEPARATOR + merged_PVT_Std_Dev_CSV_filename;
							merged_PVT_TV_CSV_path						= merged_PVT_CSV_folder 				+ FOLDER_SEPARATOR + merged_PVT_TV_CSV_filename;
							
							merged_CSV_folder							= test_batch_directory + current_test_multiplot_folder_basename + TTP_range_suffix;
							merged_RSP_CSV_folder						= merged_CSV_folder + current_ROI_analysis_subdirectory;
							merged_RSP_Error_CSV_folder					= merged_CSV_folder + current_ROI_analysis_subdirectory;
							merged_Std_Dev_CSV_folder					= merged_CSV_folder + current_ROI_analysis_subdirectory;							
							merged_TV_CSV_folder						= merged_CSV_folder;
							merged_RSP_CSV_path							= merged_RSP_CSV_folder 		+ FOLDER_SEPARATOR + merged_RSP_CSV_filename;										 			
							merged_RSP_Error_CSV_path					= merged_RSP_Error_CSV_folder 	+ FOLDER_SEPARATOR + merged_RSP_Error_CSV_filename;										 			
							merged_Std_Dev_CSV_path						= merged_Std_Dev_CSV_folder 	+ FOLDER_SEPARATOR + merged_Std_Dev_CSV_filename;										 			
							merged_TV_CSV_path							= merged_TV_CSV_folder 			+ FOLDER_SEPARATOR + merged_TV_CSV_filename;										 			
							merged_RSP_TXT_path							= merged_RSP_CSV_folder 		+ FOLDER_SEPARATOR + merged_RSP_TXT_filename;										 			
							merged_RSP_Error_TXT_path					= merged_RSP_Error_CSV_folder 	+ FOLDER_SEPARATOR + merged_RSP_Error_TXT_filename;										 			
							merged_Std_Dev_TXT_path						= merged_Std_Dev_CSV_folder 	+ FOLDER_SEPARATOR + merged_Std_Dev_TXT_filename;										 			
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							merged_TV_TXT_path							= merged_TV_CSV_folder 			+ FOLDER_SEPARATOR + merged_TV_TXT_filename;										 			
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
								import_CSV_folder						= test_batch_directory +  current_test_multiplot_folder_basename + "_" + d2s(N + 1, 0);
								import_RSP_CSV_folder					= import_CSV_folder + current_ROI_analysis_subdirectory;
								import_RSP_Error_CSV_folder				= import_CSV_folder + current_ROI_analysis_subdirectory;
								import_Std_Dev_CSV_folder				= import_CSV_folder + current_ROI_analysis_subdirectory;
								import_TV_CSV_folder					= import_CSV_folder;
								import_RSP_CSV_path						= import_RSP_CSV_folder 		+ FOLDER_SEPARATOR + ROI_analysis_RSP_output_filename;
								import_RSP_Error_CSV_path				= import_RSP_Error_CSV_folder 	+ FOLDER_SEPARATOR + ROI_analysis_RSP_Error_output_filename;
								import_Std_Dev_CSV_path					= import_Std_Dev_CSV_folder 	+ FOLDER_SEPARATOR + ROI_analysis_Std_Dev_output_filename;
								import_TV_CSV_path						= import_TV_CSV_folder 			+ FOLDER_SEPARATOR + ROI_analysis_TV_input_filename;								
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								ROI_analysis_RSP_copied_input_filename			= RSP_data_file_basenames 		+  "_" + parameter_string_prefixes[TTP_index] + "_" + d2s(N + 1, 0) + CSV;
								ROI_analysis_RSP_Error_copied_input_filename	= RSP_error_data_file_basenames	+  "_" + parameter_string_prefixes[TTP_index] + "_" + d2s(N + 1, 0) + CSV;
								ROI_analysis_Std_Dev_copied_input_filename		= Std_Dev_data_file_basenames  	+  "_" + parameter_string_prefixes[TTP_index] + "_" + d2s(N + 1, 0) + CSV;
								ROI_analysis_TV_copied_input_filename			= TV_data_file_basenames		+  "_" + parameter_string_prefixes[TTP_index] + "_" + d2s(N + 1, 0) + CSV;
								copy_distributed_file					(import_RSP_CSV_folder, 		ROI_analysis_RSP_output_filename, 		merged_RSP_CSV_folder, 			ROI_analysis_RSP_copied_input_filename, 		print_input_CSV_path);
								copy_distributed_file					(import_RSP_Error_CSV_folder, 	ROI_analysis_RSP_Error_output_filename, merged_RSP_Error_CSV_folder, 	ROI_analysis_RSP_Error_copied_input_filename, print_input_CSV_path);
								copy_distributed_file					(import_Std_Dev_CSV_folder, 	ROI_analysis_Std_Dev_output_filename, 	merged_Std_Dev_CSV_folder, 		ROI_analysis_Std_Dev_copied_input_filename, 	print_input_CSV_path);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								RSP_data 								= csv_2_array(import_RSP_CSV_folder, 		ROI_analysis_RSP_output_filename, 		iterations_2_analyze_strings, num_ROIs_2_analyze, ROW_MAJOR, print_input_CSV_path);
								RSP_error_data 							= csv_2_array(import_RSP_Error_CSV_folder, 	ROI_analysis_RSP_Error_output_filename, iterations_2_analyze_strings, num_ROIs_2_analyze, ROW_MAJOR, print_input_CSV_path);
								Std_Dev_data 							= csv_2_array(import_Std_Dev_CSV_folder, 	ROI_analysis_Std_Dev_output_filename, 	iterations_2_analyze_strings, num_ROIs_2_analyze, ROW_MAJOR, print_input_CSV_path);
								TV_data 								= file_2_float_array(import_TV_CSV_folder, 	ROI_analysis_TV_input_filename, print_input_TXT_path);
								merged_RSP_data 						= Array.concat(merged_RSP_data, 		RSP_data);																							
								merged_RSP_Error_data 					= Array.concat(merged_RSP_Error_data, 	RSP_error_data);																							
								merged_Std_Dev_data 					= Array.concat(merged_Std_Dev_data, 	Std_Dev_data);		
								merged_TV_data 							= Array.concat(merged_TV_data, 			TV_data);		
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								before_TVS_TV_data 						= newArray();						
								after_TVS_TV_data 						= newArray();						
								TV_reduction_data 						= newArray();						
								for										(iteration = 0; iteration < num_recon_iterations; iteration++)
								{		
									TV_index							= iteration * TV_step_measurements_per_iteration;
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
							//ROI_table_grid_titles 					= array_from_data(current_test_multiplot_parameter_values_string); 
							ROI_table_grid_titles 						= array_from_data(multiplot_parameter_values_string); 
							ROI_table_grid_labels 						= Array.concat(ROI_table_grid_titles, ROI_table_titles, ROI_table_column_headers, ROI_table_row_headers);
							ROI_table_grid_labels_lengths				= Array.concat((ROI_table_grid_titles.length), (ROI_table_titles.length),(ROI_table_column_headers.length),(ROI_table_row_headers.length));
							ROI_table_grid_label_indices 				= generate_parameter_value_offsets(ROI_table_grid_labels_lengths);
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							//TV_table_grid_titles 						= array_from_data(current_test_multiplot_parameter_values_string); 
							TV_table_grid_titles 						= array_from_data(multiplot_parameter_values_string); 
							TV_table_grid_labels 						= Array.concat(TV_table_grid_titles, TV_table_titles, TV_table_column_headers, TV_table_row_headers);
							TV_table_grid_labels_lengths				= Array.concat((TV_table_grid_titles.length), (TV_table_titles.length),(TV_table_column_headers.length),(TV_table_row_headers.length));
							TV_table_grid_label_indices 				= generate_parameter_value_offsets(TV_table_grid_labels_lengths);
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							print_section_separator						("Writing merged CSV files from the ROI analyses for each target test parameter value for: multiplot = " + multiplot, false);
							//------------------------------------------ Merge RSP CSV Data Files --------------------------------------------------------------------------------------------------------//
							clearResults								();
							IJROIanalysis_config_CSV();
							IJIO_configOptions							(IJIO_CONFIG_OPTIONS_OFF);
							//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
							if											(merge_ROI_analysis_RSP_CSVs)
							{
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								table_grid_fill_all						(ROI_table_grid_labels, ROI_table_grid_label_indices, ROI_table_grid_columns, ROI_table_title_dimensions, ROI_table_dimensions, merged_RSP_data_by_ROI, ROW_ORDER);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								results_table_2_CSV_if					(merged_RSP_CSV_folder, 				merged_RSP_CSV_filename, 							write_merged_RSP_CSV_data, overwrite_merged_RSP_CSV_data, 	print_output_CSV_path, false);
								results_table_2_CSV_if					(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_RSP_CSV_filename, 						write_merged_RSP_CSV_data, overwrite_merged_RSP_CSV_data, 	print_output_CSV_path, false);
								float_array_2_TXT_if					(merged_RSP_CSV_folder, 				merged_RSP_TXT_filename, merged_RSP_data_by_ROI, 	write_merged_RSP_TXT_data, overwrite_merged_RSP_TXT_data, 	print_output_TXT_path		);
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
								MERGED_RSP_CSV_FOLDER_LIST				= Array.concat(MERGED_RSP_CSV_FOLDER_LIST, 			merged_RSP_CSV_folder);
								MERGED_RSP_TXT_FILENAME_LIST			= Array.concat(MERGED_RSP_TXT_FILENAME_LIST, 		merged_RSP_TXT_filename);
								MERGED_RSP_TXT_FILE_PATH_LIST			= Array.concat(MERGED_RSP_TXT_FILE_PATH_LIST, 		merged_RSP_TXT_path);
								MERGED_PVT_RSP_TXT_FILENAME_LIST		= Array.concat(MERGED_PVT_RSP_TXT_FILENAME_LIST, 	merged_PVT_RSP_TXT_filename);
							}
							//exit();
							//------------------------------------------ Repeat for the RSP Error CSV Data Files -----------------------------------------------------------------------------------------//
							if											(merge_ROI_analysis_RSP_Error_CSVs)
							{
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
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
							//exit();
							//------------------------------------------ Repeat for the Standard Deviation CSV Data Files --------------------------------------------------------------------------------//
							if											(merge_ROI_analysis_Std_Dev_CSVs)
							{
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
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
							//exit();
							//------------------------------------------ Create TV CSV Data Files from TV TXT files --------------------------------------------------------------------------------------//
							if											(merge_TV_CSVs)
							{	
								//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
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
							//exit();
						}	
					}// END: if(merge_ROI_analysis_CSVs)
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
//*************************************************** Merge the CSV files for each multiplot parameter value and target test parameter value ********************************************************//
//***************************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
					print_section_separator							("Merging the CSV files for each multiplot parameter value and target test parameter value", true);
					if												(merge_multiplot_CSVs)
					{					
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						merge_multiplot_RSP_Error_data 				= newArray();
						merge_multiplot_Std_Dev_data 				= newArray();
						merge_multiplot_RSP_data 					= newArray();
						merge_multiplot_TV_data 					= newArray();
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						ROI_multiplot_table_grid_titles 			= array_from_data(MERGED_PVT_RSP_ERROR_TXT_FILENAME_LIST); 
						ROI_multiplot_table_grid_labels 			= Array.concat(	 ROI_multiplot_table_grid_titles, 			 ROI_multiplot_table_titles, 			 ROI_table_column_headers, 				 ROI_table_row_headers			);
						ROI_multiplot_table_grid_labels_lengths		= Array.concat(	(ROI_multiplot_table_grid_titles.length), 	(ROI_multiplot_table_titles.length),	(ROI_table_column_headers.length),		(ROI_table_row_headers.length)	);
						ROI_multiplot_table_grid_label_indices 		= generate_parameter_value_offsets(ROI_multiplot_table_grid_labels_lengths);
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						TV_multiplot_table_grid_titles 				= array_from_data(MERGED_PVT_TV_TXT_FILENAME_LIST); 
						TV_multiplot_table_grid_labels 				= Array.concat(		 TV_multiplot_table_grid_titles, 		  TV_multiplot_table_titles, 		  TV_table_column_headers, 			 TV_table_row_headers			);
						TV_multiplot_table_grid_labels_lengths		= Array.concat(		(TV_multiplot_table_grid_titles.length), (TV_multiplot_table_titles.length), (TV_table_column_headers.length), 	(TV_table_row_headers.length)	);
						TV_multiplot_table_grid_label_indices 		= generate_parameter_value_offsets(TV_multiplot_table_grid_labels_lengths);
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						//write_merged_multiplot_Std_Dev_CSV_data, overwrite_merged_Std_Dev_CSV_data, merge_multiplot_PVT_CSV_folder, merge_multiplot_Std_Dev_CSV_short_filename, print_output_CSV_path
						//write_merged_multiplot_Std_Dev_TXT_data, overwrite_merged_Std_Dev_TXT_data, merge_multiplot_PVT_CSV_folder, merge_multiplot_Std_Dev_TXT_short_filename, print_output_TXT_path, 
						print_merge_multiplot_output_file_info		();
						make_merge_multiplot_CSV_directories		();
						append_2_log								(merge_multiplot_CSV_folder);
						append_2_log								(merge_multiplot_PVT_CSV_folder);
						//exit();
						//******************************************* REMOVE TV[0-1] from filenames since files are written to TV[0-1] subdirectory
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						if											(merge_multiplot_RSP_CSVs)
						{// merge_multiplot_RSP_CSV_folder, merge_multiplot_PVT_RSP_CSV_folder, merge_multiplot_RSP_CSV_short_filename, merge_multiplot_RSP_TXT_short_filename, merge_multiplot_RSP_data, write_merged_multiplot_RSP_CSV_data, write_merged_multiplot_RSP_TXT_data, overwrite_merged_RSP_CSV_data, overwrite_merged_RSP_TXT_data, print_output_CSV_path, print_output_TXT_path, false  
							merge_multiplot_RSP_data				= table_grid_fill_all_imported(ROI_multiplot_table_grid_labels, ROI_multiplot_table_grid_label_indices, ROI_multiplot_table_grid_columns, ROI_multiplot_table_title_dimensions, ROI_table_dimensions, MERGED_RSP_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
							results_table_2_CSV_if					(merge_multiplot_RSP_CSV_folder, 		merge_multiplot_RSP_CSV_short_filename, 							write_merged_multiplot_RSP_CSV_data, overwrite_merged_RSP_CSV_data, 		print_output_CSV_path, false);
							results_table_2_CSV_if					(merge_multiplot_PVT_RSP_CSV_folder, 	merge_multiplot_RSP_CSV_short_filename, 							write_merged_multiplot_RSP_CSV_data, overwrite_merged_RSP_CSV_data, 		print_output_CSV_path, false);
							float_array_2_TXT_if					(merge_multiplot_RSP_CSV_folder, 		merge_multiplot_RSP_TXT_short_filename, merge_multiplot_RSP_data, 	write_merged_multiplot_RSP_TXT_data, overwrite_merged_RSP_TXT_data, 		print_output_TXT_path		);
							float_array_2_TXT_if					(merge_multiplot_PVT_RSP_CSV_folder, 	merge_multiplot_RSP_TXT_short_filename, merge_multiplot_RSP_data, 	write_merged_multiplot_RSP_TXT_data, overwrite_merged_RSP_TXT_data, 		print_output_TXT_path		);
						}
						//exit();
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						if											(merge_multiplot_RSP_Error_CSVs)
						{
							merge_multiplot_RSP_Error_data			= table_grid_fill_all_imported(ROI_multiplot_table_grid_labels, ROI_multiplot_table_grid_label_indices, ROI_multiplot_table_grid_columns, ROI_multiplot_table_title_dimensions, ROI_table_dimensions, MERGED_RSP_ERROR_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
							results_table_2_CSV_if					(merge_multiplot_RSP_Error_CSV_folder, 		merge_multiplot_RSP_Error_CSV_short_filename, 									write_merged_multiplot_RSP_Error_CSV_data, overwrite_merged_RSP_Error_CSV_data, 	print_output_CSV_path, false	);
							results_table_2_CSV_if					(merge_multiplot_PVT_RSP_Error_CSV_folder, 	merge_multiplot_RSP_Error_CSV_short_filename, 									write_merged_multiplot_RSP_Error_CSV_data, overwrite_merged_RSP_Error_CSV_data, 	print_output_CSV_path, false	);
							float_array_2_TXT_if					(merge_multiplot_RSP_Error_CSV_folder, 		merge_multiplot_RSP_Error_TXT_short_filename, merge_multiplot_RSP_Error_data, 	write_merged_multiplot_RSP_Error_TXT_data, overwrite_merged_RSP_Error_TXT_data, 	print_output_TXT_path			);
							float_array_2_TXT_if					(merge_multiplot_PVT_RSP_Error_CSV_folder, 	merge_multiplot_RSP_Error_TXT_short_filename, merge_multiplot_RSP_Error_data, 	write_merged_multiplot_RSP_Error_TXT_data, overwrite_merged_RSP_Error_TXT_data, 	print_output_TXT_path			);
						}
						//exit();
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						if											(merge_multiplot_Std_Dev_CSVs)
						{
							merge_multiplot_Std_Dev_data			= table_grid_fill_all_imported(ROI_multiplot_table_grid_labels, ROI_multiplot_table_grid_label_indices, ROI_multiplot_table_grid_columns, ROI_multiplot_table_title_dimensions, ROI_table_dimensions, MERGED_STD_DEV_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
							results_table_2_CSV_if					(merge_multiplot_Std_Dev_CSV_folder, 		merge_multiplot_Std_Dev_CSV_short_filename, 								write_merged_multiplot_Std_Dev_CSV_data, overwrite_merged_Std_Dev_CSV_data, 	print_output_CSV_path, false);
							results_table_2_CSV_if					(merge_multiplot_PVT_Std_Dev_CSV_folder, 	merge_multiplot_Std_Dev_CSV_short_filename, 								write_merged_multiplot_Std_Dev_CSV_data, overwrite_merged_Std_Dev_CSV_data, 	print_output_CSV_path, false);
							float_array_2_TXT_if					(merge_multiplot_Std_Dev_CSV_folder,		merge_multiplot_Std_Dev_TXT_short_filename, merge_multiplot_Std_Dev_data, 	write_merged_multiplot_Std_Dev_TXT_data, overwrite_merged_Std_Dev_TXT_data, 	print_output_TXT_path		);
							float_array_2_TXT_if					(merge_multiplot_PVT_Std_Dev_CSV_folder,	merge_multiplot_Std_Dev_TXT_short_filename, merge_multiplot_Std_Dev_data, 	write_merged_multiplot_Std_Dev_TXT_data, overwrite_merged_Std_Dev_TXT_data, 	print_output_TXT_path		);
						}
						//exit();
						//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
						if											(merge_multiplot_TV_CSVs)
						{
							merge_multiplot_TV_data					= table_grid_fill_all_imported(TV_multiplot_table_grid_labels, TV_multiplot_table_grid_label_indices, TV_multiplot_table_grid_columns, TV_multiplot_table_title_dimensions, TV_table_dimensions, MERGED_TV_TXT_FILE_PATH_LIST, print_input_TXT_path, ROW_ORDER);
							results_table_2_CSV_if					(merge_multiplot_TV_CSV_folder, 		merge_multiplot_TV_CSV_short_filename, 								write_merged_multiplot_TV_CSV_data, overwrite_merged_TV_CSV_data, 	print_output_CSV_path, false);
							results_table_2_CSV_if					(merge_multiplot_PVT_TV_CSV_folder, 	merge_multiplot_TV_CSV_short_filename, 								write_merged_multiplot_TV_CSV_data, overwrite_merged_TV_CSV_data, 	print_output_CSV_path, false);
							float_array_2_TXT_if					(merge_multiplot_TV_CSV_folder, 		merge_multiplot_TV_TXT_short_filename, merge_multiplot_TV_data, 	write_merged_multiplot_TV_TXT_data, overwrite_merged_TV_TXT_data,	print_output_TXT_path		);					
							float_array_2_TXT_if					(merge_multiplot_PVT_TV_CSV_folder, 	merge_multiplot_TV_TXT_short_filename, merge_multiplot_TV_data, 	write_merged_multiplot_TV_TXT_data, overwrite_merged_TV_TXT_data,	print_output_TXT_path		);					
							MERGED_MULTIPLOT_TV_FOLDER_LIST			= Array.concat(MERGED_MULTIPLOT_TV_FOLDER_LIST, 		merge_multiplot_PVT_CSV_folder);
					    	MERGED_MULTIPLOT_TV_CSV_FILENAME_LIST	= Array.concat(MERGED_MULTIPLOT_TV_CSV_FILENAME_LIST,	merge_multiplot_TV_CSV_filename);
					    	MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST	= Array.concat(MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST, 	merge_multiplot_TV_TXT_filename);
						}				
						//exit();
						print_section_separator("Finished merging data for multiplot parameter" + multiplot_parameter_prefix, true);
						if(num_loops++ == KILL_LOOP_INDEX)
							exit();
					}
				}// END for( i = 0; i < lengthOf(all_reduced_path_strings); i+=num_input_directories_per_multiplot)		
			}// END for(slice_2_analyze_index = 0; slice_2_analyze_index < num_slices_2_analyze; slice_2_analyze_index++)		
		}// END for(ROI_selection_diameter_index = 0; ROI_selection_diameter_index < num_ROI_selection_diameters; ROI_selection_diameter_index++)
		print_section_separator("FINISHED MERGING DATA", true);
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
//************************* Directories/files created ***********************************************************************************************************************************************//
//***************************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	print_section_separator	("Input/output directories and filenames created during execution", true								);
	print					("Reconstruction data sets used = " + num_input_data_sets												);
	App						(" MERGED_RSP_ERROR_CSV_FOLDER_LIST:\n------->"	, 			MERGED_RSP_ERROR_CSV_FOLDER_LIST			); 						
	App						(" MERGED_RSP_ERROR_TXT_FILENAME_LIST:\n------->", 			MERGED_RSP_ERROR_TXT_FILENAME_LIST			); 						
	App						(" MERGED_STD_DEV_CSV_FOLDER_LIST:\n------->", 				MERGED_STD_DEV_CSV_FOLDER_LIST				); 						
	App						(" MERGED_STD_DEV_TXT_FILENAME_LIST:\n------->", 			MERGED_STD_DEV_TXT_FILENAME_LIST			); 						
	App						(" MERGED_RSP_CSV_FOLDER_LIST:\n------->", 					MERGED_RSP_CSV_FOLDER_LIST					); 						
	App						(" MERGED_RSP_TXT_FILENAME_LIST:\n------->", 				MERGED_RSP_TXT_FILENAME_LIST				); 						
	App						(" MERGED_TV_CSV_FOLDER_LIST:\n------->",	 				MERGED_TV_CSV_FOLDER_LIST					); 						
	App						(" MERGED_TV_TXT_FILENAME_LIST:\n------->",	 				MERGED_TV_TXT_FILENAME_LIST					); 						
	App						(" MERGED_PVT_RSP_ERROR_TXT_FILENAME_LIST:\n------->", 		MERGED_PVT_RSP_ERROR_TXT_FILENAME_LIST		); 						
	App						(" MERGED_PVT_RSP_TXT_FILENAME_LIST:\n------->", 			MERGED_PVT_RSP_TXT_FILENAME_LIST			); 						
	App						(" MERGED_PVT_STD_DEV_TXT_FILENAME_LIST:\n------->", 		MERGED_PVT_STD_DEV_TXT_FILENAME_LIST		); 						
	App						(" MERGED_PVT_TV_TXT_FILENAME_LIST:\n------->", 			MERGED_PVT_TV_TXT_FILENAME_LIST				); 						
	App						(" MERGED_MULTIPLOT_TV_FOLDER_LIST:\n------->", 			MERGED_MULTIPLOT_TV_FOLDER_LIST				); 						
	App						(" MERGED_MULTIPLOT_TV_CSV_FILENAME_LIST:\n------->", 		MERGED_MULTIPLOT_TV_CSV_FILENAME_LIST		); 						
	App						(" MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST:\n------->", 		MERGED_MULTIPLOT_TV_TXT_FILENAME_LIST		); 						
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
	//print		(" CSV_OUT_LIST:\n------->"				); 	Array.print(CSV_OUT_LIST); 		
	}// END if(perform_data_merging)	
	print_section_separator("FINISHED ALL DATA MERGING", true);			
}// END macro multiplotting
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
//************************* Basic user defined system task function definitions *********************************************************************************************************************//
//***************************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function Ap(arg)
{
	Array.print(arg);
}
function App(statement, array)
{
	print("*******> " + statement + " = ");
	Array.print(array);
}
function clearResults()
{
	run	("Clear Results");
}
function dexit()
{
	exit("-----> Manual exit initiated");
}
function eprint(_print_statement)
{
	print(_print_statement); exit();
}
function eprintvar(_print_statement, _variable)
{
	_variable_array		= array_from_data(_variable);
	App(_print_statement, _variable_array);
	//print(_print_statement + _variable); 
	exit();
}
//	IOprecision_CSV										= 6;
//	IOprecision_image									= 5;
//	IJROI_analysis_measurements 						= "area mean standard min max ";
//	IJROI_analysis_redirect 							= "None";
//	IJROI_analysis_CSV_precision 						= IOprecision_CSV;
//	IJROI_analysis_image_precision 						= IOprecision_image;
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
function IJROIanalysis_config(_IJROI_analysis_measurements, _IJROI_analysis_redirect, _IJROI_analysis_precision)
{
	_IJROI_analysis_measurements_string		= _IJROI_analysis_measurements 					+ SPACE_STRING;
	_IJROI_analysis_redirect_string			= "redirect=" + _IJROI_analysis_redirect 		+ SPACE_STRING;
	_IJROI_analysis_precision_string		= "decimal=" 	+ _IJROI_analysis_precision;
	run										("Set Measurements...", _IJROI_analysis_measurements_string + _IJROI_analysis_redirect_string + _IJROI_analysis_precision_string);
	//run									("Set Measurements...", "area mean standard min max redirect = None decimal=" + IOprecision_CSV);
}
function IJROIanalysis_config_CSV()
{
	IJROIanalysis_config(IJROI_analysis_measurements, IJROI_analysis_redirect, IOprecision_CSV);
}
function IJROIanalysis_config_image()
{
	IJROIanalysis_config(IJROI_analysis_measurements, IJROI_analysis_redirect, IOprecision_image);
}
function IJIO_configOptions(_options_ON)
{
	if(_options_ON)
		IJIO_config(IJIO_jpeg_quality, IJIO_transparent_index, IJIO_ResultsTable_extension, IJIO_ResultsTable_options);
	else
		IJIO_config(IJIO_jpeg_quality, IJIO_transparent_index, IJIO_ResultsTable_extension, EMPTY_STRING);
}
function IJROIanalysis_measure(_shape, _centered, _x, _y, _width, _height)
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
//************************* User defined function definitions ***************************************************************************************************************************************//
//***************************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function append_2_log(_dir)
{
	print("_dir=" + _dir);
	_time_stamp = create_time_stamp(false, false);		
	File.append("merge_data.ijm: " + _time_stamp, _dir + File.separator + ANALYSIS_LOG_FNAME) 							
}
function array_2_CSV(_rows, _columns, _array, _directory, _filename, _print_path, _overwrite_existing_CSV)
{
	for						(_row = 0; _row < _rows; _row++)
		for 				(_column = 0; _column < _columns; _column++)
			setResult		(_column, _row, _array[_row * _columns + _column]);	
	_CSV_filename 			= construct_valid_file_path(_directory, _filename);		
	if						(_print_path)
		print				("Writing to CSV at\n------->" + _CSV_filename);
	if						(!File.exists(_CSV_filename) || _overwrite_existing_CSV)						
	{
		saveAs				("Measurements", _CSV_filename);			
		OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, _CSV_filename);					
	}
	clearResults			();
}	
function array_2_string(array, precisions)
{
	string 			= "";
	for(i = 0; i < lengthOf(array); i++)
	{
		if( precisions[i] == -1 )
			string 	+= array[i] + " ";
		else
			string 	+= d2s(array[i], precisions[i]) + " ";
	}
	return string;
}
//array_2_tables( merged_RSP_Error_data, current_row, first_column, num_ROIs_2_analyze, num_recon_iterations + 1, num_TTP_values);
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
	_init_array 	=  array_fill(_new_array, EMPTY_STRING);
	return 			_init_array;
}
function array_new(_array_length)
{
	_new_array			= newArray(_array_length);
	for(i = 0; i < _new_array.length; i++)
		_new_array[i] 	=  EMPTY_STRING;
	return 				_new_array;
}
function array_remove_indices(_array, _indices_2_remove)
{
	_reduced_array				= newArray();
	_indices_2_remove_array		= array_from_data(_indices_2_remove);
	for							(i = 0; i < _array.length; i++)
	{
		if						(!isMember(i, _indices_2_remove_array))
			_reduced_array		= Array.concat(_reduced_array, _array[i]);
	}
	return 						_reduced_array;
}
function autobreak()
{
	autobreak_boolean 	= file_2_array(ImageJ_macro_directory, auto_break_filename, DONT_PRINT_PATH);
	if(autobreak_boolean[0])
		exit();
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
		if						(!isMember(_window_list[i], _window_exceptions_array))
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
function construct_image_set_filenames(common_filename_prefix, image_set_filename_endings, image_extension)
{
	num_images					= image_set_filename_endings.length;
	image_set_filenames 		= newArray(num_images);
	for(i = 0; i < num_images; i++)
		image_set_filenames[i] 	= common_filename_prefix + "_" + image_set_filename_endings[i] + image_extension;
		return image_set_filenames;
}
function construct_valid_directory_path(directory, subdirectory)
{
	while(startsWith(subdirectory, File.separator))
		subdirectory = substring(subdirectory, 1, lengthOf(subdirectory));
	while(endsWith(directory, File.separator))
		directory = substring(directory, 0, lengthOf(directory) - 1);
	//path 			= directory + File.separator + subdirectory;
	if(debug_path_printing)
		print("construct_valid_directory_path(" + directory + ", " + subdirectory + ") ---->" + directory + File.separator + subdirectory);
	return 			directory + File.separator + subdirectory;
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
function copy_distributed_file(_from_directory, _from_filename, _to_directory, _to_filename, _print_to_path)
{
	_from_path = construct_valid_file_path(_from_directory, _from_filename);
	_to_path = construct_valid_file_path(_to_directory, _to_filename);
	File.copy(_from_path, _to_path);
	if(_print_to_path)
		print("File copied to :\n------->" + _to_path);
	return _to_path;
}
function copy_input_data_file(_input_directory, _input_filename, _output_directory, _output_basename, _output_suffix, _file_extension, _copied_from_log, _copied_to_log, _print_paths)
{
	_copied_input_data_file_output_filename = _output_basename + "_" + _output_suffix + _file_extension; 
	_copy_input_data_file_from				= construct_valid_file_path(_input_directory, _input_filename);
	_copy_input_data_file_to				= construct_valid_file_path(_output_directory, _copied_input_data_file_output_filename);		
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
	copied_input_data_file_output_filename = output_basename + "_" + TTP_range_filenaming + "_" + multiplot_parameter_range_filenaming + "_" + multiplot_parameter_prefix + "=" + multiplot_parameter_value_string + ".txt"; 
	copy_input_data_file_from			= construct_valid_file_path(input_directory, input_filename);
	copy_input_data_file_to				= construct_valid_file_path(output_directory, copied_input_data_file_output_filename);		
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
	duplicate_reconstruction_directory_check = reconstruction_directory + "_" + d2s(start_duplicate_check + 1, 0);
	if( File.exists(duplicate_reconstruction_directory_check) )
		duplicates = count_duplicate_parameter_value_reconstructions(reconstruction_directory, start_duplicate_check + 1);
	return duplicates;
}
function create_time_stamp(_print_time_stamp, _pop_time_stamp_message)
{
	getDateAndTime			(_year, _month, _day_of_week, _day_of_month, _hour, _minute, _second, _msec);
	if (_day_of_month < 10) {_day_of_month = "0" + _day_of_month;}
	if (_hour < 10) 		{_hour = "0" + _hour;}
	if (_minute < 10) 		{_minute = "0" + _minute;}
	if (_second < 10) 		{_second = "0" + _second;}
	_time_stamp_date 	= "Date: " + DAY_NAMES[_day_of_week] + " " + _day_of_month + "-" + MONTH_NAMES[_month] + "-" + _year;
	_time_stamp_time	= "Time: " + _hour + ":" + _minute + ":" + _second;
	_time_stamp			= _time_stamp_date + "\n" + _time_stamp_time;
	if(_print_time_stamp)
		print				(_time_stamp);
	if(_pop_time_stamp_message)
		showMessage			(_time_stamp);
	return 					_time_stamp;
}
function csv_2_array(path, filename, column_headings, rows, element_order, print_path)
{
	file 				= construct_valid_file_path(path, filename);			
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
function csv_merge(paths, filename, column_headings, rows, element_order, print_paths)
{
	num_CSV_files		= paths.length;
	for(CSV_file = 0; CSV_file < num_CSV_files; CSV_file++)
	{	
		path				= paths[CSV_file];
		file 				= construct_valid_file_path(path, filename);			
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
function extract_from_multi_array(_multi_array, _multi_array_start_indices, _multi_array_index)
{
	_multi_array_end_indices = Array.concat(_multi_array_start_indices, (_multi_array.length));
	_multi_array_end_indices = Array.slice(_multi_array_end_indices, 1);
	return Array.slice(_multi_array, _multi_array_start_indices[_multi_array_index], _multi_array_end_indices[_multi_array_index]);
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
function extract_parameter_values(_target_parameter_index, _parameter_values, _num_parameter_values, _parameter_value_offsets)
{
	_target_parameter_start_index 			= _parameter_value_offsets[_target_parameter_index];
	_target_parameter_end_index 			= _parameter_value_offsets[_target_parameter_index] + _num_parameter_values[_target_parameter_index] ;
	_target_parameter_values 				= Array.slice(_parameter_values, _target_parameter_start_index, _target_parameter_end_index); 	
	return _target_parameter_values;
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
function file_2_array(_path, _filename, _print_path)
{
	_file_path 		= construct_valid_file_path(_path, _filename);		
	if(_print_path)
		print		("Importing array from:\n------->" + _file_path);
	_str 			= File.openAsString(_file_path); 
	_lines 			= split(_str,"\n");
	_array 			= newArray(_lines.length);
	for(i = 0; i < _array.length; i++)
		_array[i] 	= _lines[i];
	INPUT_FILE_LIST	= Array.concat(INPUT_FILE_LIST, _file_path);			
	return _array;
}
function file_2_float_array(_path, _filename, _print_path)
{
	_file_path 		= construct_valid_file_path(_path, _filename);		
	if(_print_path)
		print		("Importing array from:\n------->" + _file_path);
	_str 			= File.openAsString(_file_path); 
	_lines 			= split(_str,"\n");
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
	_lines 			= split(_str,"\n");
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
function float_array_2_TXT(_path, _filename, _data_array, _overwrite_existing_TXT, _print_path)	
{
	_TXT_filename 			= construct_valid_file_path(_path, _filename);		
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
		_TXT_filename 			= construct_valid_file_path(_path, _filename);		
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
function folder_2_multiplot_string(folder, string_prefixes, multiplot_parameter, parameter_values, num_parameter_values, parameter_value_offsets, parameter_string_precisions)
{
	multiplot_string_ID 		= generate_multiplot_string(parameter_values, parameter_value_offsets, parameter_string_precisions, multiplot_parameter);
	current_parameter_values 	= folder_name_2_parameter_values (folder, string_prefixes);
	parameter_string 			= "";
	for(parameter = 0; parameter < num_parameter_values.length - 1; parameter++)
	{	
		if( parameter == multiplot_parameter - 1)
			parameter_string 	= parameter_string  + multiplot_string_ID + ", ";						
		else
			parameter_string 	= parameter_string  + string_prefixes[parameter] + "=" + current_parameter_values[parameter] + ", ";
	}	
	parameter_string 			= substring(parameter_string, 0, lengthOf(parameter_string)-2);
	return parameter_string;
}
function folder_2_parameter_string(folder, string_prefixes, string_precisions, last_parameter_2_include)
{
	current_parameter_values 	= folder_name_2_parameter_values(folder, string_prefixes);
	parameter_string 			= "";
	for(parameter = 0; parameter <= last_parameter_2_include; parameter++)
	{	
			parameter_string 	= parameter_string  + string_prefixes[parameter] + " = " + current_parameter_values[parameter] + ", ";
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
		_parameter_value_end_index = indexOf(_folder, "_", _prefix_end_index);
		if(_parameter_value_end_index == -1) 
			_parameter_value_end_index = lengthOf(_folder);
		_parameter_value_string = substring(_folder, _prefix_end_index, _parameter_value_end_index);
		if(_remove_trailing_zeros)
			_parameter_value_string = remove_trailing_zeros(_parameter_value_string, _parameter_string_precisions[j]);
		_parameter_value_equal_string = _parameter_prefixes[j] + "=" + _parameter_value_string;		
		_parameter_equals_strings[j] =  _parameter_value_equal_string;
	}
	return _parameter_equals_strings;
}
function folder_name_2_parameter_values(_folder_name, _parameter_string_prefixes)
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
function generate_all_parameter_value_strings(_parameter_values, _num_parameter_values, _parameter_value_offsets, _parameter_string_precisions)
{
	_num_parameters 			= _parameter_string_precisions.length;
	_parameter_value_strings	= newArray(_parameter_values.length);
	index 						= 0;
	for(parameter = 0; parameter < _num_parameters; parameter++)
		for(i = 0; i < _num_parameter_values[parameter]; i++)
			_parameter_value_strings[index++]	= d2s(_parameter_values[i + _parameter_value_offsets[parameter]], _parameter_string_precisions[parameter]);
	return _parameter_value_strings;
}
function generate_averaged_data_CSV(reconstruction_data_directory, base_reconstruction_folder, input_data_subdirectory, input_data_filename, input_CSV_columns, input_CSV_rows, ROIs_per_reconstruction)
{
	print_section_separator("Generating average quality measures from the ROI analysis CSV files from each reconstruction performed with the current parameters", false);
	all_RSP_data 					= newArray();
	current_test_input_directory 	= construct_valid_directory_path(reconstruction_data_directory, base_reconstruction_folder);
	while(startsWith(input_data_filename , File.separator))
		input_data_filename	 		= substring(input_data_filename, 1, lengthOf(input_data_filename));
	duplicates 						= count_duplicate_parameter_value_reconstructions(current_test_input_directory, 0);
	avg_RSP_data 					= newArray(ROIs_per_reconstruction * (duplicates + 1) );
	base_folder_data 				= csv_2_array(current_test_input_directory + input_data_subdirectory, input_data_filename, input_CSV_columns, input_CSV_rows, ROW_MAJOR, false);
	all_RSP_data 					= Array.concat(all_RSP_data, base_folder_data);		
	for(duplicate = 1; duplicate <= duplicates; duplicate++)
	{
		folder 						= base_reconstruction_folder + "_" + d2s(duplicate, 0);
		directory 					= construct_valid_directory_path(reconstruction_data_directory, folder);
		RSP_data 					= csv_2_array(directory  + input_data_subdirectory, input_data_filename, input_CSV_columns, input_CSV_rows, ROW_MAJOR, false);
		all_RSP_data 				= Array.concat(all_RSP_data, RSP_data);
	}
	avg_RSP_data 					= newArray(ROIs_per_reconstruction);
	avg_RSP_data_strings 			= newArray(ROIs_per_reconstruction);
	Array.fill(avg_RSP_data, 0);
	for(i = 0; i < ROIs_per_reconstruction; i++)
	{
		for(duplicate = 0; duplicate <= duplicates; duplicate++)
			avg_RSP_data[i] 		+= all_RSP_data[i + duplicate * ROIs_per_reconstruction];
		avg_RSP_data[i] 			/= (duplicates + 1);
	}						
	for(i = 0; i < ROIs_per_reconstruction; i++)
		avg_RSP_data_strings[i] 	= d2s(avg_RSP_data[i], 10);
	make_top_directory 				= true;
	_print_directories_created 		= true;
	overwrite_averaged_data_CSV 	= true;
	print_averaged_data_CSV_path 	= true;
	averaged_data_output_directory 	= construct_valid_directory_path(reconstruction_data_directory, base_reconstruction_folder + averaged_data_folder_suffix + input_data_subdirectory);
	parents 						= make_directory_parents(reconstruction_data_directory, averaged_data_output_directory, FOLDER_SEPARATOR, make_top_directory, _print_directories_created);
	array_2_CSV						(num_ROIs_2_analyze, images_per_reconstruction, avg_RSP_data_strings, averaged_data_output_directory, input_data_filename, print_averaged_data_CSV_path, overwrite_averaged_data_CSV);	
	return 							avg_RSP_data_strings;			
}
function generate_averaged_data_TXT(reconstruction_data_directory, base_reconstruction_folder, input_data_filename, measurements_per_reconstruction)
{
	print_section_separator("Generating average quality measures from the ROI analysis TXT files from each reconstruction performed with the current parameters", false);
	print_input_data_path 			= true;
	make_top_directory 				= true;
	_print_directories_created 		= true;
	overwrite_averaged_data_TXT		= true;
	print_averaged_data_TXT_path 	= true;
	all_input_data 					= newArray();
	current_test_input_directory 	= construct_valid_directory_path(reconstruction_data_directory, base_reconstruction_folder);
	while(startsWith(input_data_filename , File.separator))
		input_data_filename	 		= substring(input_data_filename, 1, lengthOf(input_data_filename));
	duplicates 						= count_duplicate_parameter_value_reconstructions(current_test_input_directory, 0);
	print("\nDuplicate reconstructions found = " + duplicates);
	avg_input_data 					= newArray(measurements_per_reconstruction * (duplicates + 1) );
	base_folder_data 				= file_2_array(current_test_input_directory, input_data_filename, print_input_data_path);
	all_input_data 					= Array.concat(all_input_data, base_folder_data);		
	for(duplicate = 1; duplicate <= duplicates; duplicate++)
	{
		print("Adding duplicate # " + duplicate + " data to averaged data file ");
		folder 						= base_reconstruction_folder + "_" + d2s(duplicate, 0);
		directory 					= construct_valid_directory_path(reconstruction_data_directory, folder);
		input_data 					= file_2_array(directory, input_data_filename, print_input_data_path);
		all_input_data 				= Array.concat(all_input_data, input_data);
	}
	Array.print(all_input_data);
	avg_input_data					= newArray(measurements_per_reconstruction);
	//avg_input_data_strings 			= newArray(measurements_per_reconstruction);
	Array.fill(avg_input_data, 0);
	for(i = 0; i < measurements_per_reconstruction; i++)
	{
		//all_input_data[i]				= parseFloat(all_input_data[i]);
		for(duplicate = 0; duplicate <= duplicates; duplicate++)
			avg_input_data[i] 		= avg_input_data[i] + all_input_data[i + duplicate * measurements_per_reconstruction];
		avg_input_data[i] 			/= (duplicates + 1);
		avg_input_data_strings 		= d2s(avg_input_data[i], 10);
	}
	averaged_data_output_directory 	= construct_valid_directory_path(reconstruction_data_directory, base_reconstruction_folder + averaged_data_folder_suffix);
	parents 						= make_directory_parents(reconstruction_data_directory, averaged_data_output_directory, FOLDER_SEPARATOR, make_top_directory, _print_directories_created);
	array_2_TXT						(averaged_data_output_directory, input_data_filename, avg_input_data, print_averaged_data_TXT_path, overwrite_averaged_data_TXT);	
	print("========>Finished calculating and writing averaged reconstruction data to disk at:\n" + averaged_data_output_directory);
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
function generate_combined_parameter_value_range_filenames(_parameter_values, _num_parameter_values, _parameter_value_offsets, _parameter_string_prefixes, _parameter_string_precisions)
{
	_PVT_identifier 			= "";
	_num_parameters 							= _num_parameter_values.length;
	for(parameter = 0; parameter < _num_parameters; parameter++)
	{
		_range_min_string 						= remove_trailing_zeros(_parameter_values[_parameter_value_offsets[parameter]], _parameter_string_precisions[parameter]);
		_range_max_string 						= remove_trailing_zeros(_parameter_values[_parameter_value_offsets[parameter] + _num_parameter_values[parameter] - 1], _parameter_string_precisions[parameter]);	
		_prefix 								= _parameter_string_prefixes[parameter];
		if(_num_parameter_values[parameter] == 1 )
			_PVT_identifier 	+= _prefix + LEFT_BRACKET_STRING + _range_min_string + "]_";
		else
			_PVT_identifier 	+= _prefix + LEFT_BRACKET_STRING + _range_min_string + "-" + _range_max_string + "]_";			
	}
	//_PVT_identifier 			+= _parameter_string_prefixes[_num_parameters - 1] + _TTP_range_suffix;	
	_PVT_identifier			= substring(_PVT_identifier, 0, lengthOf(_PVT_identifier) - 1);
	return _PVT_identifier;						
}
function generate_combined_parameter_value_range_string(_parameter_values, _num_parameter_values, _parameter_value_offsets, _parameter_string_prefixes, _parameter_string_precisions)
{
	_PVT_identifier 			= "";
	_num_parameters 							= _num_parameter_values.length;
	for(parameter = 0; parameter < _num_parameters; parameter++)
	{
		_range_min_string 						= remove_trailing_zeros(_parameter_values[_parameter_value_offsets[parameter]], _parameter_string_precisions[parameter]);
		_range_max_string 						= remove_trailing_zeros(_parameter_values[_parameter_value_offsets[parameter] + _num_parameter_values[parameter] - 1], _parameter_string_precisions[parameter]);	
		_prefix 								= _parameter_string_prefixes[parameter];
		if(_num_parameter_values[parameter] == 1 )
			_PVT_identifier 	+= _prefix + LEFT_BRACKET_STRING + _range_min_string + "]_";
		else
			_PVT_identifier 	+= _prefix + LEFT_BRACKET_STRING + _range_min_string + "-" + _range_max_string + "]_";			
	}
	//_PVT_identifier 			+= _parameter_string_prefixes[_num_parameters - 1] + _TTP_range_suffix;	
	_PVT_identifier			= substring(_PVT_identifier, 0, lengthOf(_PVT_identifier) - 1);
	return _PVT_identifier;						
}
function generate_current_PVT_multiplot_output_directory(_test_batch_directory, _multiplot_parameter_index, _current_PVT_value_strings, _multiplot_suffix_string, _TTP_range_suffix, _parameter_string_prefixes, _parameter_string_precisions)
{
	_current_PVT_multiplot_output_directory 		= _test_batch_directory;
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _multiplot_parameter_index; parameter++)	
		_current_PVT_multiplot_output_directory	+= parameter_string_prefixes[parameter] + "_" + _current_PVT_value_strings[parameter] + "_";	
	_current_PVT_multiplot_output_directory		+= _multiplot_suffix_string + "_";						
	for(parameter = _multiplot_parameter_index + 1; parameter < num_parameters - 1; parameter++)	
		_current_PVT_multiplot_output_directory 	+= parameter_string_prefixes[parameter] + "_" + _current_PVT_value_strings[parameter] + "_";						
	_current_PVT_multiplot_output_directory	+=  parameter_string_prefixes[num_parameters - 1] + _TTP_range_suffix;			
	return _current_PVT_multiplot_output_directory;	
}
function generate_current_PVT_parameter_values_string(_current_PVT_value_strings, _TTP_index, _parameter_string_prefixes)
{
	_num_parameters					= _parameter_string_prefixes.length;		
	_parameter_values_string 		= "";
	for(parameter = 0; parameter < _num_parameters; parameter++)
		_parameter_values_string 	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";
	_parameter_values_string 		= substring(_parameter_values_string, 0, lengthOf(_plot_title_parameter_string) - 2);										
	return _parameter_values_string;
}
function generate_legend_entries(common_entry_text, entry_specific_text)
{
	legend_entries			= newArray(lengthOf(entry_specific_text));
	for(i = 0; i < lengthOf(entry_specific_text); i++)
		legend_entries[i]	= common_entry_text + entry_specific_text[i];
	return legend_entries;
}
function generate_missing_input_data(common_directory, current_PVT_folder, RSP_path, RSP_Error_path, Std_Dev_path)
{
	directory 		= construct_valid_directory_path(common_directory, current_PVT_folder);		
	data_verified 		= true;
	if(!File.exists(directory + RSP_path))
	{	
		print			("Missing RSP input file:\n------->" + directory + RSP_path);
		data_verified 	= false;
	}
	if(!File.exists(directory + RSP_Error_path))
	{	
		print			("Missing RSP error input file:\n------->" + directory + RSP_Error_path);
		data_verified 	= false;
	}
	if(!File.exists(directory + Std_Dev_path))
	{	
		print			("Missing std dev input file:\n------->" + directory + Std_Dev_path);
		data_verified 	= false;
	}
	if(!data_verified)
	{
		if(endsWith(directory, File.separator))
			runMacro	(ROI_analysis_macro_path, directory);
		else
			runMacro	(ROI_analysis_macro_path, directory + FOLDER_SEPARATOR);	
	}			
	return true;					
}		
function generate_missing_test_input_data(common_directory, current_PVT_folders, RSP_path, RSP_Error_path, Std_Dev_path)
{
	for( i = 0; i < current_PVT_folders.length; i++)
	{
		directory 			= construct_valid_directory_path(common_directory, current_PVT_folders[i]);		
		data_verified 		= true;
		print				("Path to RSP input file:\n------->" + directory + RSP_path);
		print				("Path to RSP error input file:\n------->" + directory + RSP_Error_path);
		print				("Path to standard deviation input file:\n------->" + directory + Std_Dev_path);
		if(!File.exists(directory + RSP_path))
		{	
			print			("Missing RSP input file:\n------->" + directory + RSP_path);
			data_verified 	= false;
		}
		if(!File.exists(directory + RSP_Error_path))
		{	
			print			("Missing RSP error input file:\n------->" + directory + RSP_Error_path);
			data_verified 	= false;
		}
		if(!File.exists(directory + Std_Dev_path))
		{	
			print			("Missing standard deviation input file:\n------->" + directory + Std_Dev_path);
			data_verified 	= false;
		}
		if(!data_verified)
		{
			if(endsWith(directory, File.separator))
				runMacro	(ROI_analysis_macro_path, directory);
			else
				runMacro	(ROI_analysis_macro_path, directory + FOLDER_SEPARATOR);	
		}
	}
	return true;			
}		
function generate_modulo_values(_num_parameter_values)
{
	_num_parameters				= _num_parameter_values.length;
	_modulo_values 				= newArray(_num_parameters - 1);	
	Array.fill					(_modulo_values, 1);
	for(i = 0; i < _num_parameters; i++)
		for(j = i + 1; j < _num_parameters; j++)
			_modulo_values[i] 	*= _num_parameter_values[j];		 
	return _modulo_values;
}
function generate_multiplot_parameter_set_string(_multiplot_parameter_index, _num_multiplot_parameter_values, _parameter_values, _parameter_value_offsets, _parameter_string_prefixes, _parameter_string_precisions)
{
	_multiplot_suffix_string 		= _parameter_string_prefixes[_multiplot_parameter_index] + LEFT_BRACKET_STRING;
	for(i = 0; i < _num_multiplot_parameter_values; i++)
		_multiplot_suffix_string 	= _multiplot_suffix_string  + d2s(_parameter_values[_parameter_value_offsets[_multiplot_parameter_index] + i], _parameter_string_precisions[_multiplot_parameter_index]) + ",";
	_multiplot_suffix_string 		= substring(_multiplot_suffix_string, 0, lengthOf(_multiplot_suffix_string) - 1) + RIGHT_BRACKET_STRING;
	return _multiplot_suffix_string;
}
function generate_multiplot_string(parameter_values, parameter_value_offsets, parameter_string_precisions, multiplot_parameter)
{
	multiplot_string_ID 		= parameter_string_prefixes[multiplot_parameter_index] + " = [";
	for(i = 0; i < num_multiplot_parameter_values; i++)
		multiplot_string_ID 	= multiplot_string_ID  + d2s(parameter_values[parameter_value_offsets[multiplot_parameter_index] + i], parameter_string_precisions[multiplot_parameter_index]) + ",";
	multiplot_string_ID 		= substring(multiplot_string_ID, 0, lengthOf(multiplot_string_ID) - 1) + RIGHT_BRACKET_STRING;
	return multiplot_string_ID;
}
function generate_multiplot_suffix_string(_multiplot_parameter_index, _num_multiplot_parameter_values, _parameter_values, _parameter_value_offsets, _parameter_string_prefixes, _parameter_string_precisions)
{
	_multiplot_suffix_string 		= _parameter_string_prefixes[_multiplot_parameter_index] + LEFT_BRACKET_STRING;
	for(i = 0; i < _num_multiplot_parameter_values; i++)
		_multiplot_suffix_string 	= _multiplot_suffix_string  + d2s(_parameter_values[_parameter_value_offsets[_multiplot_parameter_index] + i], _parameter_string_precisions[_multiplot_parameter_index]) + ",";
	_multiplot_suffix_string 		= substring(_multiplot_suffix_string, 0, lengthOf(_multiplot_suffix_string) - 1) + RIGHT_BRACKET_STRING;
	return _multiplot_suffix_string;
}
function generate_multiplot_title_parameter_string(_TTP_range_suffix, _multiplot_parameter_index, _current_PVT_value_strings, _multiplot_parameter_range_plots, _parameter_string_prefixes )
{
	_multiplot_title_parameter_string 		= "";
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _multiplot_parameter_index; parameter++)	
		_multiplot_title_parameter_string	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";	
	_multiplot_title_parameter_string		+= _multiplot_parameter_range_plots + ", ";						
	for(parameter = _multiplot_parameter_index + 1; parameter < num_parameters - 1; parameter++)	
		_multiplot_title_parameter_string 	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";						
	_multiplot_title_parameter_string	+=  parameter_string_prefixes[num_parameters - 1] + " = " + _TTP_range_suffix;			
	return _multiplot_title_parameter_string;	
}		
function generate_multiplot_title_parameter_values_string(_TTP_range_suffix, _multiplot_parameter_index, _current_PVT_value_strings, _multiplot_parameter_range_filenaming, _parameter_string_prefixes )
{
	_multiplot_title_parameter_values_string 		= "";
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _multiplot_parameter_index; parameter++)	
		_multiplot_title_parameter_values_string	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";	
	_multiplot_title_parameter_values_string		+= _multiplot_parameter_range_filenaming + ", ";						
	for(parameter = _multiplot_parameter_index + 1; parameter < num_parameters - 1; parameter++)	
		_multiplot_title_parameter_values_string 	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";						
	_multiplot_title_parameter_values_string	+=  parameter_string_prefixes[num_parameters - 1] + " = " + _TTP_range_suffix;			
	return _multiplot_title_parameter_values_string;	
}		
function generate_multivalue_parameter_equals_suffix(_current_test_parameter_value_strings, _parameter_prefixes, _num_parameter_values, _parameter_precisions, _multiplot_parameter_index, _multiplot_parameter_range_filenaming)
{
	_suffix = EMPTY_STRING;
	_num_parameters = _parameter_prefixes.length;
	for(i = 0; i < _num_parameters - 1; i++)
	{
		if(_num_parameter_values[i] > 1)
		{
			if(i != _multiplot_parameter_index)
				_suffix += _parameter_prefixes[i] + "=" + remove_trailing_zeros(_current_test_parameter_value_strings[i], _parameter_precisions[i]) + "_";
			else
				_suffix += _multiplot_parameter_range_filenaming + "_";
		}
		
	}
	return substring(_suffix, 0, lengthOf(_suffix) -1);						
}
function generate_parameter_value_offsets(_num_parameter_values)
{
	_num_parameters				= _num_parameter_values.length;
	_parameter_value_offsets 	= newArray(_num_parameters);	
	for(i = 0; i < _num_parameters; i++)
		for(j = 0; j < i; j++)
			_parameter_value_offsets[i] 	+= _num_parameter_values[j];		 
	return _parameter_value_offsets;
}
function generate_parameter_value_range_string(_parameter_prefix, _parameter_values, _parameter_string_precision, _remove_trailing_zeros, _single_value_action)
{	
	_extrema 						= find_array_extrema(_parameter_values, TOLERANCE, false);
	if								(_remove_trailing_zeros)
	{
		_range_min_string			= remove_trailing_zeros( _extrema[0], _parameter_string_precision);
		_range_max_string			= remove_trailing_zeros( _extrema[1], _parameter_string_precision);
	}
	else
	{
		_range_min_string			= d2s( _extrema[0], _parameter_string_precision);
		_range_max_string			= d2s( _extrema[1], _parameter_string_precision);
	}
	if								(_parameter_values.length > 1)
		_range_string				= _parameter_prefix + LEFT_BRACKET_STRING + _range_min_string + DASH_STRING + _range_max_string + RIGHT_BRACKET_STRING;
	else
	{
		if							(_single_value_action == SINGLE_VALUE_RANGE_OMIT_PARAMETER)
			_range_string			= EMPTY_STRING;
		else if						(_single_value_action == SINGLE_VALUE_RANGE_BRACKET_VALUE)
			_range_string			= _parameter_prefix + LEFT_BRACKET_STRING + _range_min_string + RIGHT_BRACKET_STRING;
		else if						(_single_value_action == SINGLE_VALUE_RANGE_EQUALS_VALUE)
			_range_string			= _parameter_prefix + EQUALS_STRING + _range_min_string;
		else
			dexit					("ERROR: Invalid '_single_value_action' option passed to 'generate_parameter_value_range_string' function");
	}
	return 							_range_string;
}							
function generate_parameter_value_substring(_parameter_prefix, _parameter_value, _parameter_precision, _prefix_value_separation_string, _substring_suffix, _remove_trailing_zeros)
{
	if(_remove_trailing_zeros)
		_substring	= _parameter_prefix + _prefix_value_separation_string + remove_trailing_zeros(_parameter_value, _parameter_precision) + _substring_suffix;
	else
		_substring	= _parameter_prefix + _prefix_value_separation_string + d2s(_parameter_value, _parameter_precision) + _substring_suffix;
	return _substring;
}
//= (current_test_multiplot_value_strings, 				parameter_string_short_prefixes, parameter_values, num_parameter_values, parameter_string_precisions, EQUALS_STRING, 				REMOVE_TRAILING_ZEROS, MULTIVALUE_ONLY_ON, EMPTY_ARRAY);
function generate_parameter_values_string(_parameter_value_strings, _parameter_prefixes, _parameter_values, _num_parameter_values, _parameter_precisions, _prefix_value_separation_string, _remove_trailing_zeros, _multivalue_only, _single_value_action, _range_indices)
{
	//EMPTY_STRING 										= "";										// String constant: empty string
	//SPACE_STRING 										= " ";										// String constant: space character string
	//UNDERSCORE_STRING 									= "_";										// String constant: underscore character string
	//COMMA_STRING 										= ",";										// String constant: comma character string
	//EQUALS_STRING 										= "=";										// String constant: equals character string
	//DASH_STRING 										= "-";										// String constant: dash character string
	//RIGHT_CARAT_STRING 									= ">";										// String constant: right carat character string
	//REMOVE_TRAILING_ZEROS
	//SINGLE_VALUE_RANGE_OMIT_PARAMETER
	//SINGLE_VALUE_RANGE_BRACKET_VALUE	
	//SINGLE_VALUE_RANGE_EQUALS_VALUE
	//PARAMETER_VALUES_STRING_NO_RANGES						= 0;
	//PARAMETER_VALUES_STRING_TTP_RANGE_ONLY				= 1;
	//PARAMETER_VALUES_STRING_MULTIPLOT_RANGE_ONLY			=2;
	//PARAMETER_VALUES_STRING_TTP_MULTIPLOT_RANGES_ONLY		= 3;
	//PARAMETER_VALUES_STRING_ALL_RANGES					= 4;
	// As booleans: _single_value_action, _multivalue_only, _value_range_options (_multiplot_range, _TTP_range, all_ranges)
	// _range_indices
	// Ranges: _value_range_options = 0 - none, = 1 - TTP, = 2 - MP, = 3 - MP & TTP, = 4 - ALL
	// Range options: _single_value_action
	// indices: omissions, ranges
	// all values, 																	_multivalue_only = false, _value_range_options = 0, _single_value_action = SINGLE_VALUE_RANGE_EQUALS_VALUE
	// multivalue only, 															_multivalue_only = true, _value_range_options = 0, _single_value_action = SINGLE_VALUE_RANGE_EQUALS_VALUE
	// all value ranges + omit single values, 										_multivalue_only = false, _value_range_options = 4, _single_value_action = SINGLE_VALUE_RANGE_OMIT_PARAMETER
	// all value ranges + bracket single values, 									_multivalue_only = false, _value_range_options = 4, _single_value_action = SINGLE_VALUE_RANGE_BRACKET_VALUE
	// all value ranges+ prefix = single values, 									_multivalue_only = false, _value_range_options = 4, _single_value_action = SINGLE_VALUE_RANGE_EQUALS_VALUE
	// multivalue ranges + omit single values, 										_multivalue_only = false, _value_range_options = 4, _single_value_action = SINGLE_VALUE_RANGE_OMIT_PARAMETER
	// multivalue ranges + bracket single values, 									_multivalue_only = false, _value_range_options = 4, _single_value_action = SINGLE_VALUE_RANGE_BRACKET_VALUE
	// multivalue ranges + prefix = single values, 									_multivalue_only = false, _value_range_options = 4, _single_value_action = SINGLE_VALUE_RANGE_EQUALS_VALUE
	// all values & target test parameter range only, 								_multivalue_only = false, _value_range_options = 1, _single_value_action = SINGLE_VALUE_RANGE_EQUALS_VALUE
	// multivalue only & target test parameter range only, 							_multivalue_only = true, _value_range_options = 1, _single_value_action = SINGLE_VALUE_RANGE_OMIT_PARAMETER
	// all values & multiplot range only, 											_multivalue_only = false, _value_range_options = 2, _single_value_action =
	// multivalue only & multiplot range only, 										_multivalue_only = true, _value_range_options = 2, _single_value_action = SINGLE_VALUE_RANGE_OMIT_PARAMETER
	// all values & target test parameter & multiplot parameter ranges only,		_multivalue_only = false, _value_range_options = 3 , _single_value_action =
	// multivalue only & target test parameter & multiplot parameter ranges only,	_multivalue_only = true, _value_range_options = 3 , _single_value_action = SINGLE_VALUE_RANGE_OMIT_PARAMETER
	//PARAMETER_VALUES_STRING_ALL_VALUES
	//PARAMETER_VALUES_STRING_VALUE_RANGES
	//PARAMETER_VALUES_STRING_VALUE_RANGES
	//PARAMETER_VALUES_STRING_VALUE_RANGES
	//PARAMETER_VALUES_STRING_MULTIVALUE_ONLY
	//PARAMETER_VALUES_STRING_MULTIVALUE_ONLY
	//PARAMETER_VALUES_STRING_MULTIVALUE_ONLY
	//PARAMETER_VALUES_STRING_MULTIVALUE_ONLY
	//PARAMETER_VALUES_STRING_MULTIVALUE_ONLY
	//PARAMETER_VALUES_STRING_MULTIVALUE_ONLY
	//SINGLE_VALUE_RANGE_OMIT_PARAMETER				= 0;										// Parameter value range string construction for non-multivalue parameter: <label>[#]
	//SINGLE_VALUE_RANGE_BRACKET_VALUE				= 1;										// Parameter value range string construction for non-multivalue parameter: <label>=#
	//SINGLE_VALUE_RANGE_EQUALS_VALUE					= 2;										// Parameter value range string construction for non-multivalue parameter: omit <label> & value info string
	//print("_num_values" + _num_values);
	//print("_start_index" + _start_index);
	////print("_end_index" + _end_index);
	//App("_parameter_values", _parameter_values);//exit();
	//App("_num_parameter_values", _num_parameter_values);//exit();
	//App("_parameter_value_strings", _parameter_value_strings);//exit();
	_suffix 						= EMPTY_STRING;
	//_num_parameters 				= _parameter_prefixes.length;
	_num_parameters 				= _parameter_value_strings.length;
	_start_index					= 0;
	for								(i = 0; i < _num_parameters; i++)
	//for								(i = 0; i < _num_parameters - 1; i++)
	{
		_num_values					= _num_parameter_values[i];
		_end_index					= _start_index + _num_values;
		if							( isMember(i, _range_indices))
		{
			_values					= Array.slice(_parameter_values, _start_index, _end_index);
			_string_2_append		= generate_parameter_value_range_string(_parameter_prefixes[i], _values, _parameter_precisions[i], _remove_trailing_zeros, SINGLE_VALUE_RANGE_BRACKET_VALUE);
			//_string_2_append		= _values_range_string;
			//print("_values_range_string =\n" + _values_range_string);
			//App(_parameter_prefixes[i], _values);
		}
		//if(i < _num_parameters - 1)
		//{
		//if(_multivalue_only)
		//{
		else
		{
			if						(_num_parameter_values[i] > 1 || !_multivalue_only)
				_string_2_append	= generate_parameter_value_substring(_parameter_prefixes[i], _parameter_value_strings[i], _parameter_precisions[i], _prefix_value_separation_string, UNDERSCORE_STRING, true);
				//_string_2_append	= _parameter_prefixes[i] + "=" + remove_trailing_zeros(_parameter_value_strings[i], _parameter_precisions[i]) + UNDERSCORE_STRING;
			else 
				_string_2_append	= EMPTY_STRING;
				
		}
		//}	
		//}
		_start_index				= _end_index;
		_suffix 					+= _string_2_append;
	}
	//exit();
	return substring(_suffix, 0, lengthOf(_suffix) - 1);						
}
//L=0.0001_F=2_TV=0_A=0.5
//L=0.0001_F=2_TV=0_A=0.5
//L=0.0001_F=2_TV=0_A=0.5 
//L=0.0001_F=2_TV=0_A=0.5
function generate_multivalue_parameter_values_short_title_string(_TTP_range_index, _multiplot_parameter_index, _current_PVT_value_strings, _parameter_string_prefixes, _num_parameter_values )
{
	_multiplot_title_parameter_values_string 		= EMPTY_STRING;
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _num_parameters; parameter++)	
	{
		if(_num_parameter_values[parameter] > 1 && parameter != _TTP_range_index && parameter != _multiplot_parameter_index)
			_multiplot_title_parameter_values_string	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";	
	}
	return _multiplot_title_parameter_values_string;	
}		
function generate_multivalue_parameter_values_title_string(_TTP_range_suffix, _multiplot_parameter_index, _current_PVT_value_strings, _multiplot_parameter_range_filenaming, _parameter_string_prefixes, _num_parameter_values )
{
	_multiplot_title_parameter_values_string 		= "";
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _multiplot_parameter_index; parameter++)	
		if(_num_parameter_values[parameter] > 1)
			_multiplot_title_parameter_values_string	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";	
	_multiplot_title_parameter_values_string		+= _multiplot_parameter_range_filenaming + ", ";						
	for(parameter = _multiplot_parameter_index + 1; parameter < num_parameters - 1; parameter++)	
		if(_num_parameter_values[parameter] > 1)
			_multiplot_title_parameter_values_string 	+= parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";						
	_multiplot_title_parameter_values_string	+=  parameter_string_prefixes[num_parameters - 1] + " = " + _TTP_range_suffix;			
	return _multiplot_title_parameter_values_string;	
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
function generate_parameter_test_combination_indices(_TTP_index, _combination_index, _modulo_values, _parameter_value_offsets )
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
		_parameter_combination_indices[parameter]					= i + _parameter_value_offsets[parameter];
	}		
	_parameter_combination_indices[_TTP_index]	= j + _parameter_value_offsets[_TTP_index];		
	return _parameter_combination_indices;       	
}
function generate_parameter_test_combination(_parameter_combination_indices, _parameter_values)
{
	_num_parameter_combination_indices 	= _parameter_combination_indices.length;
	_parameter_combination 				= newArray(_num_parameter_combination_indices);
	for(parameter = 0; parameter < _num_parameter_combination_indices; parameter++)
		_parameter_combination[parameter]	= _parameter_values[_parameter_combination_indices[parameter]];					
	return _parameter_combination;       	
}
function generate_parameter_test_folder(_parameter_string_prefixes, _parameter_string_precisions, _parameter_combination )
{
	_num_parameters					= _parameter_string_prefixes.length;
	_folder_string 					= EMPTY_STRING;
	for(parameter = 0; parameter < _num_parameters; parameter++)	
		_folder_string 				+= "_" + _parameter_string_prefixes[parameter] + "_" + d2s( _parameter_combination[parameter], _parameter_string_precisions[parameter]);	
	_folder_string					= substring(_folder_string, 1);
	return _folder_string;	
}
//multiplot_parameter_values
function generate_parameter_test_multiplot_folder2(_multiplot_parameter_index, _multiplot_parameter_combination, _multiplot_parameter_value, _parameter_string_prefixes, _parameter_string_precisions )
{
	_num_parameters					= _parameter_string_prefixes.length;		
	_folder_string 					= EMPTY_STRING;
	//index = 0;
	//for								(parameter = 0; parameter < _num_parameters; parameter++,index++)	
	//{
	//	if							(parameter == _multiplot_parameter_index)
	//	{
	//		_folder_string			+= "_" + _parameter_string_prefixes[parameter] + "_" + d2s( _multiplot_parameter_value, _parameter_string_precisions[parameter]);	
	//		index--;
	//	}
	//	else
	//		_folder_string 			+= "_" + _parameter_string_prefixes[parameter] + "_" + d2s( _multiplot_parameter_combination[index], _parameter_string_precisions[parameter]);	
	//}
	for(parameter = 0; parameter < _multiplot_parameter_index; parameter++)	
		_folder_string	= _folder_string + "_" + _parameter_string_prefixes[parameter] + "_" + d2s( _multiplot_parameter_combination[parameter], _parameter_string_precisions[parameter]);
	_folder_string		= _folder_string + "_" + _parameter_string_prefixes[parameter] + "_" + d2s( _multiplot_parameter_value, _parameter_string_precisions[parameter]);	
	for(parameter = _multiplot_parameter_index + 1; parameter < num_parameters; parameter++)	
		_folder_string 	= _folder_string + "_" + _parameter_string_prefixes[parameter] + "_" + d2s( _multiplot_parameter_combination[parameter - 1], _parameter_string_precisions[parameter]);
	_folder_string	= substring(_folder_string, 1);				
	return _folder_string;	
}		
function generate_parameter_test_multiplot_folder(_multiplot_parameter_index, _multiplot_parameter_combination, _multiplot_combination_offset, _parameter_values, _parameter_value_offsets, _parameter_string_prefixes, _parameter_string_precisions )
{
	_num_parameters					= _parameter_string_prefixes.length;		
	_folder_string 					= "";
	for(parameter = 0; parameter < _multiplot_parameter_index; parameter++)	
		_folder_string	= _folder_string + "_" + _parameter_string_prefixes[parameter] + "_" + d2s( _multiplot_parameter_combination[parameter], _parameter_string_precisions[parameter]);
	_folder_string		= _folder_string + "_" + _parameter_string_prefixes[parameter] + "_" + d2s( _parameter_values[_parameter_value_offsets[parameter] + _multiplot_combination_offset], _parameter_string_precisions[parameter]);	
	for(parameter = _multiplot_parameter_index + 1; parameter < num_parameters; parameter++)	
		_folder_string 	= _folder_string + "_" + _parameter_string_prefixes[parameter] + "_" + d2s( _multiplot_parameter_combination[parameter - 1], _parameter_string_precisions[parameter]);
	_folder_string	= substring(_folder_string, 1);				
	return _folder_string;	
}		
function generate_parameter_value_offsets(_num_parameter_values)
{
	_num_parameters				= _num_parameter_values.length;
	_parameter_value_offsets 	= newArray(_num_parameters);	
	for(i = 0; i < _num_parameters; i++)
		for(j = 0; j < i; j++)
			_parameter_value_offsets[i] 	+= _num_parameter_values[j];		 
	return _parameter_value_offsets;
}
//function generate_parameter_value_range_string(_parameter_values, _parameter_string_precision)
//{	
//	_TTP_extrema 				= find_array_extrema(_parameter_values, TOLERANCE, false);
//	_TTP_range_min_string		= d2s( _TTP_extrema[0], _parameter_string_precision);
//	_TTP_range_max_string		= d2s( _TTP_extrema[1], _parameter_string_precision);
//	_TTP_range_suffix			= LEFT_BRACKET_STRING + _TTP_range_min_string + "-" + _TTP_range_max_string + RIGHT_BRACKET_STRING;		
//	return _TTP_range_suffix;
//}							
function generate_parameter_value_strings(_parameter_values, _parameter_string_precision, _minimize_string_length)
{
	_num_parameters 			= _parameter_values.length;
	_parameter_value_strings	= newArray(_num_parameters);
	for(i = 0; i < _num_parameters; i++)
	{
		_parameter_value_string = d2s(_parameter_values[i], _parameter_string_precision);
		if(_minimize_string_length)
			_parameter_value_string = remove_trailing_zeros(_parameter_value_string, _parameter_string_precision);
		_parameter_value_strings[i]	= _parameter_value_string;
	}
	return _parameter_value_strings;
}
function generate_PVT_multiplot_copy_suffixes(_current_test_parameter_value_strings, _parameter_prefixes, _num_parameter_values, _parameter_precisions, _multiplot_parameter_index, _multiplot_parameter_range_filenaming, _append_multiplot_range)
{
	_suffix 					= EMPTY_STRING;
	_num_parameters 			= _parameter_prefixes.length;
	for							(i = 0; i < _num_parameters - 1; i++)
	{
		if						(_num_parameter_values[i] > 1)
		{
			if					(i == _multiplot_parameter_index)
			{	
				if				(_append_multiplot_range)
								_suffix += _multiplot_parameter_range_filenaming + "_";
			}
			else
				_suffix 		+= _parameter_prefixes[i] + "=" + remove_trailing_zeros(_current_test_parameter_value_strings[i], _parameter_precisions[i]) + "_";
		}
		
	}
	return 						substring(_suffix, 0, lengthOf(_suffix) -1);						
}
function generate_plot_title_parameter_string(_current_PVT_value_strings, _TTP_index, _TTP_range_suffix, _parameter_string_prefixes)
{
	_plot_title_parameter_string 		= "";
	for(parameter = 0; parameter < _TTP_index; parameter++)
		_plot_title_parameter_string 	+= _parameter_string_prefixes[parameter] + " = " + _current_PVT_value_strings[parameter] + ", ";
	_plot_title_parameter_string 		+= _parameter_string_prefixes[parameter] + " = " + _TTP_range_suffix;										
	return _plot_title_parameter_string;
}					
function generate_reduced_modulo_values(_num_parameter_values, _modulo_values, _skip_index)
{
	_num_modulo_values 							= _modulo_values.length;
	_modulo_value_divisor						= _num_parameter_values[_skip_index];
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
function generate_reduced_parameter_value_offsets(_num_parameter_values, _parameter_value_offsets, _skip_index)
{
	_num_parameters										= _num_parameter_values.length;
	_reduced_parameter_value_offsets 					= newArray(_num_parameters - 1);	
	_num_multiplot_parameter_values						= _num_parameter_values[_skip_index];	
	Array.fill											(_reduced_parameter_value_offsets, 1);
	for(i = 0; i < _num_parameters; i++)
	{
		if(i < _skip_index)	
			_reduced_parameter_value_offsets[i] 		= _parameter_value_offsets[i];
		if(i >= _skip_index + 1)
			_reduced_parameter_value_offsets[i - 1]		= _parameter_value_offsets[i] - _num_multiplot_parameter_values;
	}
	return _reduced_parameter_value_offsets;
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
function identify_missing_input_data(common_directory, current_PVT_folder, RSP_path, RSP_Error_path, Std_Dev_path)
{
	directory 			= construct_valid_directory_path(common_directory, current_PVT_folder);		
	data_verified 		= true;
	if(!File.exists(directory + RSP_path))
	{	
		print			("Missing RSP input file:\n------->" + directory + RSP_path);
		data_verified 	= false;
	}
	if(!File.exists(directory + RSP_Error_path))
	{	
		print			("Missing RSP error input file:\n------->" + directory + RSP_Error_path);
		data_verified 	= false;
	}
	if(!File.exists(directory + Std_Dev_path))
	{	
		print			("Missing standard deviation input file:\n------->" + directory + Std_Dev_path);
		data_verified 	= false;
	}
	return data_verified;			
}	
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
function import_multiplot_comparison_data(_test_batch_directory, _source_subdirectory, _source_filename, _file_extension, _CSV_column_headings, _CSV_num_rows)
{
	_path 						= construct_valid_directory_path(_test_batch_directory, _source_subdirectory);
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
function import_multiplot_comparison_data_CSV(_test_batch_directory, _CSV_source_subdirectory, _CSV_source_filename, _CSV_column_headings, _CSV_num_rows)
{
	_path 								= construct_valid_directory_path(_test_batch_directory, _CSV_source_subdirectory);
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
function import_multiplot_comparison_data_TXT(_test_batch_directory, _TXT_source_subdirectory, _TXT_source_filename)
{
	_path 								= construct_valid_directory_path(_test_batch_directory, _TXT_source_subdirectory);
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
	_x_axis_coordinates 			= Array.slice(SEQUENTIAL_VALUES_ARRAY, _profile_1st_edge, _profile_2nd_edge + 1);
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
function macro_caller()
{
	_INTERNAL_MACRO_CALLER	= true;
	_EXTERNAL_MACRO_CALLER	= false;
	_macro_arg 				= getArgument();
	if						(_macro_arg == "" )	
		return 				_INTERNAL_MACRO_CALLER;
	else
		return 				_EXTERNAL_MACRO_CALLER;
}
function macro_caller_config(_internal_kill_loop_index, _dont_kill_loop)
{
	_NO_KILL_LOOP_INDEX				= 99999999999;
	if(_dont_kill_loop)
		return 						_NO_KILL_LOOP_INDEX;
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
	return 							KILL_LOOP_INDEX;
}
function macro_caller_variable(_default_var_value)
{
	_macro_arg 	= getArgument();
	if			(_macro_arg == "" )	
		return _default_var_value;
	else
		return _macro_arg;
}
function make_directory_chain(top_directory, subdirectory_chain, FOLDER_SEPARATOR, make_top_directory, _print_directories_created)
{
	path 								= top_directory;
	subdirectory_chain_folders 			= split(subdirectory_chain, FOLDER_SEPARATOR);
	new_folder_paths 					= newArray(subdirectory_chain_folders.length);
	if(make_top_directory)
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
function make_directory_parents(top_directory, bottom_directory, FOLDER_SEPARATOR, make_top_directory, _print_directories_created)
{
	bottom_directory_folders 					= split(bottom_directory, FOLDER_SEPARATOR);
	top_directory_folders 						= split(top_directory, FOLDER_SEPARATOR);
	return_statement							= "------->Top directory through target directory already exist\n";
	if											(top_directory_folders.length != bottom_directory_folders.length)
	{
		if										(make_top_directory)
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
			return_statement 					= return_statement + path + "\n";
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
	File.makeDirectory				(merged_CSV_folder																																);
	File.makeDirectory				(merged_PVT_CSV_folder																															);
	make_directory_parents			(merged_PVT_CSV_folder, 				merged_PVT_ROI_analysis_CSV_folder, 	FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_RSP_CSV_folder, 				FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_RSP_Error_CSV_folder, 		FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_Std_Dev_CSV_folder, 			FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merged_PVT_ROI_analysis_CSV_folder, 	merged_PVT_TV_CSV_folder, 				FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merged_CSV_folder, 					merged_RSP_CSV_folder, 					FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merged_CSV_folder, 					merged_RSP_Error_CSV_folder, 			FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merged_CSV_folder,	 					merged_Std_Dev_CSV_folder, 				FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merged_CSV_folder, 					merged_TV_CSV_folder, 					FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merged_CSV_folder, 					merged_RSP_CSV_folder, 					FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
}
function make_merge_multiplot_CSV_directories()
{
	File.makeDirectory				(merge_multiplot_PVT_CSV_folder																													);
	File.makeDirectory				(merge_multiplot_CSV_folder																														);
	make_directory_parents			(merge_multiplot_PVT_CSV_folder, 	merge_multiplot_PVT_RSP_CSV_folder, 		FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merge_multiplot_PVT_CSV_folder, 	merge_multiplot_PVT_RSP_Error_CSV_folder, 	FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merge_multiplot_PVT_CSV_folder, 	merge_multiplot_PVT_Std_Dev_CSV_folder, 	FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merge_multiplot_PVT_CSV_folder, 	merge_multiplot_PVT_TV_CSV_folder, 			FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merge_multiplot_CSV_folder, 		merge_multiplot_RSP_CSV_folder, 			FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merge_multiplot_CSV_folder, 		merge_multiplot_RSP_Error_CSV_folder, 		FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merge_multiplot_CSV_folder,	 	merge_multiplot_Std_Dev_CSV_folder, 		FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merge_multiplot_CSV_folder, 		merge_multiplot_TV_CSV_folder, 				FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
	make_directory_parents			(merged_CSV_folder, 				merged_RSP_CSV_folder, 						FOLDER_SEPARATOR, DONT_MAKE_TOP_DIR, PRINT_DIRECTORIES_CREATED	);
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
		_directory_2_create = construct_valid_directory_path(_directory_2_create, _subdirectory_folders[i]);
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
function max_string_length(_string_array)
{
	_max_string_array_length			= 0;
	for(i = 0; i < _string_array.length; i++)
		if(lengthOf(_string_array[i]) > _max_string_array_length)
			_max_string_array_length	= lengthOf(_string_array[i]);
	return _max_string_array_length;
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
function open_image(image_type, directory, filename, print_path)
{
	image_path 					= construct_valid_file_path(directory, filename);	
	if(print_image_paths)
		print					("------->Opening image from:\n" + image_path);
	if(image_type == TXT)
		run						("Text Image... ", "open=" + image_path);
	if(image_type == PNG)
		open					(image_path);
	run							("Size...", "width=x_frame_size height=y_frame_size constrain average interpolation=Bilinear");	
	//run							("Set Measurements...", "area mean standard min redirect = None decimal = 4");		
	IJROIanalysis_config_image();
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
	//IJROIanalysis_config_CSV();
	IJROIanalysis_config_image();
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
	file_path 		= construct_valid_file_path(directory, filename);		
	run				("Text Image... ", "open=" + file_path);
	//run				("Set Measurements...", "area mean standard min redirect = None decimal = 4");	
	//IJROIanalysis_config_CSV();
	IJROIanalysis_config_image();
	//IJIO_configOptions(IJIO_CONFIG_OPTIONS_ON);
	//IJIO_configOptions(IJIO_CONFIG_OPTIONS_OFF);
	INPUT_FILE_LIST	= Array.concat(INPUT_FILE_LIST, file_path);					
}																						
function order_comparison_data(unordered_data, ordering_indices, _num_ROIs_2_analyze, images_per_reconstruction, num_TTP_values)
{
	ordered_data 		= newArray(_num_ROIs_2_analyze * images_per_reconstruction * num_TTP_values);
	ordered_data_index 	= 0;
	for(i = 0; i < ordering_indices.length; i++)
		ordered_data[i] = unordered_data[ordering_indices[i]];
	return ordered_data;										
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
function parameter_string_2_index(_parameter_string_prefixes, _parameter_string) 
{
	_num_parameters = _parameter_string_prefixes.length;
	for(i = 0; i < _num_parameters; i++)
		if( _parameter_string_prefixes[i] == _parameter_string)
			return i;
	return -1;
}
function parameter_values_2_parameter_equals_short_strings(_parameter_values, _parameter_value_prefix, _parameter_value_string_precision)
{
	_num_parameter_values	= _parameter_values.length;
	_parameter_value_strings = newArray(_num_parameter_values);
	for(i = 0; i < _num_parameter_values; i++)
		_parameter_value_strings[i]	= _parameter_value_prefix + "=" + remove_trailing_zeros(d2s(_parameter_values[i], _parameter_value_string_precision), _parameter_value_string_precision);
	return _parameter_value_strings;
}
function parameter_values_2_parameter_equals_strings(_parameter_values, _parameter_value_prefix, _parameter_value_string_precision)
{
	_num_parameter_values	= _parameter_values.length;
	_parameter_value_strings = newArray(_num_parameter_values);
	for(i = 0; i < _num_parameter_values; i++)
		_parameter_value_strings[i]	= _parameter_value_prefix + "=" + d2s(_parameter_values[i], _parameter_value_string_precision);
	return _parameter_value_strings;
}
function PVT_folder_name_2_base(_folder_name, _TTP_prefix)
{
	_TTP_prefix_length 		= lengthOf		(_TTP_prefix);
	_start_index 		= indexOf		(_folder_name, _TTP_prefix );
	_end_index 			= _start_index + _TTP_prefix_length;
	_parameter_test_folder_basename 	= substring		(_folder_name, 0, _end_index);
	return _parameter_test_folder_basename;
}
function parameter_values_2_strings(_parameter_values, _parameter_value_string_precision)
{
	_num_parameter_values	= _parameter_values.length;
	_parameter_value_strings = newArray(_num_parameter_values);
	for(i = 0; i < _num_parameter_values; i++)
		_parameter_value_strings[i]	= d2s(_parameter_values[i], _parameter_value_string_precision);
	return _parameter_value_strings;
}
function path_2_phantom_name(path, reconstruction_data_folder)
{
	folder_names 					= split(path, File.separator);
	reconstruction_data_folder_name = substring(reconstruction_data_folder, 1);
	for(i = 0; i < folder_names.length; i++)
		if(folder_names[i] == reconstruction_data_folder_name)
			return folder_names[i + 1];
}
function PNG_sequence_2_animations(PNG_sequence_directory, PNG_sequence_paths, group_2_extract, num_groups, group_size, _property_Booleans, _PNG_basename, _PNG_image_Booleans, _animation_filename, _animated_GIF_info, _AVI_info, close_stack_after_saving)
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
	PNG_subsequence_paths 			= extract_subsequence_group(PNG_sequence_paths, group_2_extract, num_groups, group_size);	
	open_PNG_paths					(PNG_subsequence_paths, _print_input_PNG_paths);
	opened_image_set_2_stack		(_PNG_basename, _animation_filename, _close_stack_images);											
	stack_2_animated_GIF			(_animation_filename, PNG_sequence_directory, _animation_filename + GIF, _GIF_frame_rate, _write_GIF, _overwrite_GIF, _print_multiplot_GIF_paths, DONT_CLOSE_WINDOW);
	stack_2_AVI						(_animation_filename, PNG_sequence_directory, _animation_filename + AVI, _AVI_compression_format, _AVI_frame_rate, _write_AVI, _overwrite_AVI, _print_multiplot_AVI_paths, close_stack_after_saving);
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
	print("-------> Std_Devs_by_iteration  	="	); 	Array.print(Std_Devs_by_iteration);
}
function print_by_ROI_data()
{
	print("-------> RSPs_by_ROI  		="	); 	Array.print(RSPs_by_ROI);
	print("-------> RSP_errors_by_ROI  	="	); 	Array.print(RSP_errors_by_ROI);
	print("-------> Std_Devs_by_ROI  	="	); 	Array.print(Std_Devs_by_ROI);
}		
function print_compared_data_subdirectory_info()
{
	print_section_separator("Printing compared data subdirectory info", PRINT_MAJOR_SECTION													);
	print("-------> multiplot_compared_data_subdirectory 						=\n " 	+ multiplot_compared_data_subdirectory				);	
	print("-------> multiplot_compared_RSP_data_subdirectory 					=\n " 	+ multiplot_compared_RSP_data_subdirectory			);		
	print("-------> multiplot_compared_RSP_Error_data_subdirectory 				=\n " 	+ multiplot_compared_RSP_Error_data_subdirectory	);	
	print("-------> multiplot_compared_Std_Dev_data_subdirectory 				=\n " 	+ multiplot_compared_Std_Dev_data_subdirectory		);	
	print("-------> multiplot_compared_TV_data_subdirectory 					=\n " 	+ multiplot_compared_TV_data_subdirectory			);		
}
function print_loop_status(_status_statement, _loop_status_variable, _section_type)
{
	print_section_separator(_status_statement + _loop_status_variable, _section_type);
}
function print_section_separator(section_heading, print_major_section)
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
	print_section_separator("Printing current parameter value test info", PRINT_MAJOR_SECTION											);
	print("-------> current_test_start_folder 								=\n " 	+ current_test_start_folder							);				
	print("-------> current_test_end_folder 						 		=\n " 	+ current_test_end_folder							);				
	print("-------> current_test_folder_basename							=\n " 	+ current_test_folder_basename						);
	print("-------> current_test_folders									: 	" 														);	Array.print(current_test_folders);			
	print("-------> current_test_parameter_value_strings 		 			: 	" 														);	Array.print(current_test_parameter_value_strings);		
	print("-------> current_test_parameter_values_string			 		=\n " 	+ current_test_parameter_values_string				);				
	print("-------> current_test_plot_title_parameter_values_string  		=\n " 	+ current_test_plot_title_parameter_values_string	);						
	print("-------> current_test_parameter_equals_strings  					: 	"														);	Array.print(current_test_parameter_equals_strings);					
	print("-------> current_test_parameter_equals_short_strings  			: 	"														);	Array.print(current_test_parameter_equals_short_strings);									
	print("-------> current_test_file_suffix  								=\n " 	+ current_test_file_suffix							);									
}
function print_current_PVT_multiplot_info()
{
	print_section_separator("Printing current parameter value test multiplot info...", PRINT_MAJOR_SECTION												);
	print("-------> current_test_multiplot_start_folder 			 			=\n " 	+ current_test_multiplot_start_folder							);	
	print("-------> current_test_multiplot_end_folder 			 				=\n " 	+ current_test_multiplot_end_folder								);				
	print("-------> current_test_multiplot_folders					 			= 	" 																	);	Array.print(current_test_multiplot_folders);
	print("-------> current_test_multiplot_value_strings 		 				= 	" 																	);	Array.print(current_test_multiplot_value_strings);	
	print("-------> current_test_multiplot_title_parameter_values_string		=\n " 	+ current_test_multiplot_title_parameter_values_string			);		
	print("-------> current_test_multiplot_title_other_parameter_values_string	=\n " 	+ current_test_multiplot_title_other_parameter_values_string	);								
	print("-------> current_test_multiplot_parameter_values_string  			=\n " 	+ current_test_multiplot_parameter_values_string				);						
	print("-------> current_test_multiplot_parameter_equals_strings 			: 	" 																	);	Array.print(current_test_multiplot_parameter_equals_strings);	
	print("-------> current_test_multiplot_parameter_equals_short_strings 		: 	" 																	);	Array.print(current_test_multiplot_parameter_equals_short_strings);	
	print("-------> current_test_multiplot_file_suffix  						=\n " 	+ current_test_multiplot_file_suffix							);									
}
function print_ImageJ_info()
{
	print_section_separator("Printing ImageJ info", PRINT_MAJOR_SECTION);
	print("-------> ImageJ_plugins_directory =\n ", ImageJ_plugins_directory);
	print("-------> ImageJ_macro_directory =\n ", ImageJ_macro_directory);
	print("-------> ImageJ_launch_directory =\n ", ImageJ_launch_directory);
	print("-------> ImageJ_previous_macro =\n ", ImageJ_previous_macro);
	print("-------> github_macro_directory =\n ", github_macro_directory);
	print("-------> reconstruction_data_directory_C =\n ", reconstruction_data_directory_C);
	print("-------> reconstruction_data_directory_D =\n ", reconstruction_data_directory_D);
	print("-------> ROI_analysis_macro_filename =\n ", ROI_analysis_macro_filename);
	print("-------> ROI_analysis_macro_path =\n ", ROI_analysis_macro_path);
	print("-------> multiplotting_macro_filename =\n ", multiplotting_macro_filename);
	print("-------> multiplotting_macro_path =\n ", multiplotting_macro_path);
	print("-------> test_result_comparison_macro_filename =\n ", test_result_comparison_macro_filename);
	print("-------> test_result_comparison_macro_path =\n ", test_result_comparison_macro_path);
	print("-------> auto_break_filename =\n ", auto_break_filename);
	print("-------> auto_break_path =\n ", auto_break_path);		
}
function print_partiald_input_output_filenames()
{
	print_section_separator("Printing input/output filenames of ROI analysis, parameter value test comparisons, and parameter value test comparison multiplots", PRINT_MAJOR_SECTION);
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
function print_merged_output_file_info()
{
	print_section_separator("CSV data merging output folders/filenames:", false				);
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
function print_merge_multiplot_output_file_info()
{
	print_section_separator("Multiplot data merging output folders/filenames:", false										);
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
	print("merge_multiplot_PVT_RSP_CSV_short_filename = 		\n" 	+ merge_multiplot_PVT_RSP_CSV_short_filename		);
	print("merge_multiplot_PVT_RSP_TXT_short_filename = 		\n" 	+ merge_multiplot_PVT_RSP_TXT_short_filename		);
	print("merge_multiplot_PVT_RSP_Error_CSV_short_filename = 	\n" 	+ merge_multiplot_PVT_RSP_Error_CSV_short_filename	);
	print("merge_multiplot_PVT_RSP_Error_TXT_short_filename = 	\n" 	+ merge_multiplot_PVT_RSP_Error_TXT_short_filename	);
	print("merge_multiplot_PVT_Std_Dev_CSV_short_filename = 	\n" 	+ merge_multiplot_PVT_Std_Dev_CSV_short_filename	);
	print("merge_multiplot_PVT_Std_Dev_TXT_short_filename = 	\n" 	+ merge_multiplot_PVT_Std_Dev_TXT_short_filename	);
	print("merge_multiplot_PVT_TV_CSV_short_filename = 			\n" 	+ merge_multiplot_PVT_TV_CSV_short_filename			);
	print("merge_multiplot_PVT_TV_TXT_short_filename = 			\n" 	+ merge_multiplot_PVT_TV_TXT_short_filename			);
//print("merged_PVT_RSP_CSV_path = 						\n" 	+ merged_PVT_RSP_CSV_path						);						
}
function print_multiplot_parameter_info()
{			
	print_section_separator("Printing parameter test multiplot info", PRINT_MAJOR_SECTION								);
	print		("-------> multiplot_parameter_index 					=\n " 	+ multiplot_parameter_index				);
	print		("-------> multiplot_parameter	 						=\n " 	+ multiplot_parameter					);
	print		("-------> multiplot_parameter_prefix 					=\n " 	+ multiplot_parameter_prefix			);
	print		("-------> multiplot_parameter_values 					: 	" 											);	Array.print	(multiplot_parameter_values);
	print		("-------> multiplot_parameter_value_strings 			: 	" 											);	Array.print	(multiplot_parameter_value_strings);
	print		("-------> multiplot_parameter_value_short_strings 		: 	" 											);	Array.print	(multiplot_parameter_value_short_strings);
	print		("-------> multiplot_parameter_equals_strings 			: 	" 											);	Array.print	(multiplot_parameter_equals_strings);	
	print		("-------> multiplot_parameter_equals_short_strings 	: 	" 											);	Array.print	(multiplot_parameter_equals_short_strings);	
	print		("-------> multiplot_test_parameter_min_value	 		=\n " 	+ multiplot_test_parameter_min_value	);
	print		("-------> multiplot_test_parameter_max_value	 		=\n " 	+ multiplot_test_parameter_max_value	);
	print		("-------> multiplot_parameter_min_value_string	 		=\n " 	+ multiplot_parameter_min_value_string	);
	print		("-------> multiplot_parameter_max_value_string	 		=\n " 	+ multiplot_parameter_max_value_string	);		
	print		("-------> multiplot_parameter_range_suffix	 			=\n " 	+ multiplot_parameter_range_suffix		);
	print		("-------> multiplot_parameter_range_filenaming	 		=\n " 	+ multiplot_parameter_range_filenaming	);
	print		("-------> multiplot_parameter_range_plots	 			=\n " 	+ multiplot_parameter_range_plots		);
	print		("-------> num_multiplot_parameter_values 				=\n " 	+ num_multiplot_parameter_values		);
	print		("-------> reduced_parameter_values_lower 				: 	" 											);	Array.print	(reduced_parameter_values_lower);
	print		("-------> reduced_parameter_values_upper 				: 	" 											);	Array.print	(reduced_parameter_values_upper);
	print		("-------> reduced_parameter_values 					: 	" 											);	Array.print	(reduced_parameter_values);
	print		("-------> reduced_parameter_value_offsets 				: 	"											);	Array.print	(reduced_parameter_value_offsets);
	print		("-------> reduced_modulo_values     					: 	"											);	Array.print	(reduced_modulo_values);
	print		("-------> reduced_TTP_index 			=\n " 	+ reduced_TTP_index	);	
	print		("-------> reduced_total_combinations 					=\n " 	+ reduced_total_combinations			);
	print		("-------> all_reduced_parameter_combination_indices	: 	"											);	Array.print	(all_reduced_parameter_combination_indices);
	print		("-------> all_reduced_parameter_combinations 			: 	"											);	Array.print	(all_reduced_parameter_combinations);
	print		("-------> all_reduced_folder_strings 					: 	"											);	Array.print	(all_reduced_folder_strings);
	print		("-------> all_reduced_path_strings   					: 	"											);	Array.print	(all_reduced_path_strings);				
}
function print_reconstructed_image_info()
{	
	print_section_separator("Printing reconstructed image(s) properties", PRINT_MAJOR_SECTION									);
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
function print_ROI_analysis_info()
{	
	print_section_separator("Printing reconstructed image(s)/ROI analysis configurations/parameters", PRINT_MAJOR_SECTION		);
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
	print_section_separator("Printing ROI definitions and info", PRINT_MAJOR_SECTION				);
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
function print_TTP_info()
{	
	print_section_separator("Printing parameter value test info...", PRINT_MAJOR_SECTION											);
	print		("-------> target_test_parameter							=\n" 	+ target_test_parameter							);	
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
function print_test_parameter_file_info()
{	
	print_section_separator("Printing parameter value test info...", PRINT_MAJOR_SECTION											);
	print		("-------> parameter_test_number							=\n" 	+ parameter_test_number							);
	print		("-------> parameter_test_info_filename						=\n" 	+ parameter_test_info_filename					);
	print		("-------> num_TTP_tests					=\n"	+ num_TTP_tests				);
	print		("-------> num_parameters									=\n"	+ num_parameters								);	
	print		("-------> parameter_values									: "														);	Array.print	(parameter_values);
	print		("-------> num_parameter_values								: "														);	Array.print	(num_parameter_values);
	print		("-------> parameter_value_offsets 							: "														);	Array.print	(parameter_value_offsets);
	print		("-------> parameter_string_prefixes						: "														);	Array.print	(parameter_string_prefixes);
	print		("-------> parameter_string_short_prefixes					: "														);	Array.print	(parameter_string_short_prefixes);		
	print		("-------> parameter_string_precisions						: "														);	Array.print	(parameter_string_precisions);
	print		("-------> modulo_values 									: "														);	Array.print	(modulo_values);
	
}
function prompt_4_image_set(directory, image_type, stack_suffix, dialog_position_x, dialog_position_y, dialog_character_width)
{		
	directory_folder 			= File.getName(directory_path);
	default_image_basename		= "x_";
	Dialog.create				("Specify reconstructed image set to open");
	Dialog.addString			("Basename common to images in set", default_image_basename); 
	Dialog.addNumber			("Specify 1st image #", 0, 0, dialog_character_width, ""); 
	Dialog.addNumber			("Specify 2nd image #", 12, 0, dialog_character_width, ""); 
	Dialog.addChoice			("Combine image set into image stack", newArray(TRUE, FALSE), TRUE);
	Dialog.setLocation			(dialog_position_x, dialog_position_y);
	Dialog.show					();
	_image_basename 			= Dialog.getString();
	first_image_number 			= Dialog.getNumber();
	second_image_number 		= Dialog.getNumber();
	do_image_set_2_stack	 	= Dialog.getChoice();
	filenames					= number_range_2_filenames(_image_basename, "", first_image_number, second_image_number, 0);
	image_set					= open_image_set(image_type, directory, filenames, TRUE);
	stack_name					= _image_basename + stack_suffix;
	if(do_image_set_2_stack == TRUE)
		opened_image_set_2_stack(_image_basename, stack_name, "false");
	return 						stack_name;
}
function pt()
{
	print("=======>Debugging location marker print #" + debug_print_counter++);
}	
function query_image_dimensions(directory_path, initial_iterate_filename)
{
	file_path 			= construct_valid_file_path(directory_path, initial_iterate_filename);		
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
function results_table_2_CSV(_directory, _filename, _overwrite_existing, _print_path, _clear_results)
{
	_filepath 				= construct_valid_file_path(_directory, _filename);	
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
		_filepath 				= construct_valid_file_path(_directory, _filename);	
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
function ROI_material_names_2_RSPs(_ROI_material_names, _is_simulated_scan)
{
	_num_ROIs_2_analyze 		= _ROI_material_names.length;
	_ROI_material_RSPs 			= newArray(_num_ROIs_2_analyze);
	for(ROI = 0; ROI < _num_ROIs_2_analyze; ROI++)
		_ROI_material_RSPs[ROI] 	= material_name_2_RSP(_ROI_material_names[ROI], _is_simulated_scan);
	return _ROI_material_RSPs;
}
function ROI_parameter_string_2_values(_ROI_definitions_parameter_string, _ROI_definitions_parameter_list, _ROI_parameter_strings, _ROI_parameter_decodings, _ROI_parameter_value_parseFloat)
{
	for(i = 0; i < _ROI_definitions_parameter_list.length; i++)
	{	
		if( matches(ROI_definitions_parameter_list[i], _ROI_definitions_parameter_string))
			_ROI_parameter_string_index			= i;			
	}
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
	if( _num_desired_ROI_parameter_string_elements == 1)
		return _desired_ROI_parameter_values[0];
	else
		 return _desired_ROI_parameter_values;
}
function save_AVI(directory, filename, compression, frame_rate, overwrite_existing, print_path, close_stack_after_saving)
{
	path 					= construct_valid_file_path(directory, filename);	
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
	path 		= construct_valid_file_path(directory, filename);	
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
	PNG_filename 			= construct_valid_file_path(directory, filename);		
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
function string_2_array(string) { return split(string); }
function string_array_concatenation(_string_array, _front_concatenation_string, _back_concatenation_string)
{
	_num_array_strings = _string_array.length;
	_concatenated_string_array = newArray(_num_array_strings);
	for(i = 0; i < _num_array_strings; i++)
		_concatenated_string_array[i] = _front_concatenation_string + _string_array[i] + _back_concatenation_string;
	return _concatenated_string_array;
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
function subdirectory_array_concatenation(_subdirectory_array, _front_concatenation_subdirectory, _back_concatenation_subdirectory)
{
	_num_array_subdirectories = _subdirectory_array.length;
	_concatenated_subdirectory_array = newArray(_num_array_subdirectories);
	for(i = 0; i < _num_array_subdirectories; i++)
	{
		if(lengthOf(_front_concatenation_subdirectory) > 0)
		{	
			_concatenated_subdirectory = construct_valid_directory_path(_front_concatenation_subdirectory, _subdirectory_array[i]);
			//print				("_concatenated_subdirectory =" + _concatenated_subdirectory);		
			if(lengthOf(_back_concatenation_subdirectory) > 0)						
			{	
				_concatenated_subdirectory = construct_valid_directory_path(_concatenated_subdirectory, _back_concatenation_subdirectory);
				//print				("_concatenated_subdirectory =" + _concatenated_subdirectory);	
			}
		}							
		else
		{
			if(lengthOf(_back_concatenation_subdirectory) > 0)						
			{	
				_concatenated_subdirectory = construct_valid_directory_path(_subdirectory_array[i], _back_concatenation_subdirectory);
				//print				("_concatenated_subdirectory2 =" + _concatenated_subdirectory);	
			}
			else
			{
				_concatenated_subdirectory = _subdirectory_array[i];
				//print				("_concatenated_subdirectory2 =" + _concatenated_subdirectory);			
			}
		}		
		_concatenated_subdirectory_array[i]	= 		_concatenated_subdirectory;			
	}
	return _concatenated_subdirectory_array;
}
function suffixes_2_filenames(common_basename, filename_suffixes)
{
	num_suffixes		= filename_suffixes.length;
	filenames			= newArray(num_suffixes);
	for(i = 0; i < num_suffixes; i++)
		filenames[i]	= common_basename + filename_suffixes[i];
	return 				filenames;
}
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
	//return _current_column;
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
//setResult					(  d2s(_start_column + _column, 0), _start_row  + _num_rows, _colsum);
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
	//if(_max_row_label_length - _COLUMN_SUM_ROW_LABEL_LENGTH  - 2 > 0)
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
	return _current_column;
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
		//_current_row 			= table_add(_tables_start_row, _table_colnums[i], _table_colskip_array[i], _table_data, _table_columns, _table_rows, _row_headers);							
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
	table_add_colsum_rows				( _current_row, _tables_start_row + 1, _start_column, _num_columns, _num_rows, _table_grid_columns, _table_colskip, _max_row_label_lengths);
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
function tables_total_columns(_first_column, _table_grid_columns, _table_columns, _table_column_separation)
{
	return _first_column + _table_grid_columns * (_table_columns + _table_column_separation + 1) - _table_column_separation - 1;
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
function verify_file_set(common_directory, common_basename, filename_suffixes, file_extension)
{
	num_files = filename_suffixes.length;
	file_set_validated = true;
	for(i = 0; i < num_files; i++)
	{
		file_path = construct_valid_file_path(common_directory, common_basename + filename_suffixes[i] + file_extension);
		if(!File.exists(file_path))
			return false;
	}
	return true;
}
function verify_input_data(_common_directory, _current_PVT_folders, _current_analysis_RSP_input_data_filenames, _current_analysis_RSP_Error_input_data_filenames, _current_analysis_Std_Dev_input_data_filenames, _current_analysis_TV_input_data_filenames)
{
	for( i = 0; i < _current_PVT_folders.length; i++)
	{
		directory 	= _common_directory + _current_PVT_folders[i];
		print		("------->Verifying RSP input data file exists at:\n" + directory + _current_analysis_RSP_input_data_filenames);
		print		("------->Verifying RSP error input data file exists at:\n" + directory + _current_analysis_RSP_Error_input_data_filenames);
		print		("------->Verifying standard deviation input data file exists at:\n" + directory + _current_analysis_Std_Dev_input_data_filenames);
		print		("------->Verifying total variation (TV) input data file exists at:\n" + directory + _current_analysis_TV_input_data_filenames);
		if(!File.exists(directory + _current_analysis_RSP_input_data_filenames))
			return false;
		if(!File.exists(directory + _current_analysis_RSP_Error_input_data_filenames));
			return false;
		if(!File.exists(directory + _current_analysis_Std_Dev_input_data_filenames));
			return false;
		if(!File.exists(directory + _current_analysis_TV_input_data_filenames));
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
	_reconstruction_output_directory_path = construct_valid_directory_path(_reconstruction_data_directory, _reconstruction_output_directory);		
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
function verify_reconstruction_output_set(_reconstruction_data_directory, _reconstruction_output_directory, _reconstructed_image_filenames, _TV_input_data_filename)
{
	_reconstruction_output_directory_path = construct_valid_directory_path(_reconstruction_data_directory, _reconstruction_output_directory);		
	print				("-------> Verifying reconstruction output data exists for:\n" + _current_PVT_folder				);		
	//_reconstruction_output_data_
	data_verified 			= true;
	_num_iterations			= _reconstructed_image_filenames.length;
	for(iteration = 0; iteration < _num_iterations; iteration++)
	{
		check_image_path 	= _reconstruction_output_directory_path + File.separator + _reconstructed_image_filenames[iteration];
		if(!File.exists(check_image_path))
		{
			print			("ERROR: one or more reconstructed images do not exist:\n" + check_image_path);
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
		print		("=======> RECONSTRUCTION OUTPUT DATA VERIFIED\n" + _current_PVT_folder);
	else
		print		("=======> RECONSTRUCTION OUTPUT DATA NOT FOUND\n" + _current_PVT_folder);
	return data_verified;			
}
function verify_ROI_analysis_output_files(_common_directory, _current_PVT_folder, _ROI_analysis_RSP_output_filename, _ROI_analysis_RSP_Error_output_filename, _ROI_analysis_Std_Dev_output_filename, _ROI_analysis_TV_input_filename, _slices_2_analyze_folders, _ROI_selection_diameter_folders, _print_path)
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
			_current_analysis_subdirectory		= _slice_2_analyze_folder + _ROI_selection_diameter_folder;					
			_current_ROI_analysis_subdirectory	= _slice_2_analyze_folder + _ROI_selection_diameter_folder;					
				
			_current_analysis_ROI_analysis_RSP_output_filename			= _current_ROI_analysis_subdirectory 	+ File.separator 	+ _ROI_analysis_RSP_output_filename;
			_current_analysis_ROI_analysis_RSP_Error_output_filename	= _current_ROI_analysis_subdirectory 	+ File.separator 	+ _ROI_analysis_RSP_Error_output_filename;
			_current_analysis_ROI_analysis_Std_Dev_output_filename		= _current_ROI_analysis_subdirectory 	+ File.separator 	+ _ROI_analysis_Std_Dev_output_filename;
			_current_analysis_ROI_analysis_TV_input_filename			=  _ROI_analysis_TV_input_filename;				
			
			_source_folder		= construct_valid_directory_path(_common_directory, _current_PVT_folder				);
			_RSP_file_path		= construct_valid_file_path(_source_folder, _current_analysis_ROI_analysis_RSP_output_filename			);
			_RSP_Error_file_path= construct_valid_file_path(_source_folder, _current_analysis_ROI_analysis_RSP_Error_output_filename	);
			_Std_Dev_file_path	= construct_valid_file_path(_source_folder, _current_analysis_ROI_analysis_Std_Dev_output_filename		);
			_TV_file_path		= construct_valid_file_path(_source_folder, _current_analysis_ROI_analysis_TV_input_filename			);

			//print("RSP file path = " + _RSP_file_path);
			//print("RSP error file path = " + _RSP_Error_file_path);
			//print("RSP std dev file path = " + _Std_Dev_file_path);
			//print("TV file path = " + _TV_file_path);
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
		print		("=======> ROI analysis data missing for:\n" + _current_PVT_folder);
	else
		print		("=======> ROI ANALYSIS HAS BEEN COMPLETED\n" + _current_PVT_folder);
	return _missing_data;						
}
function verify_ROI_analysis_output_file_set(_common_directory, _current_PVT_folders, _current_analysis_RSP_input_data_filenames, _current_analysis_RSP_Error_input_data_filenames, _current_analysis_Std_Dev_input_data_filenames, _current_analysis_TV_input_data_filenames)
{
	missing_data_directories = newArray();
	print_section_separator		("------->Verifying ROI analysis output data files exist for specified set of reconstructions:\n", PRINT_MAJOR_SECTION);
	for( i = 0; i < _current_PVT_folders.length; i++)
	{
		missing_data = false;
		directory 	= _common_directory + _current_PVT_folders[i];
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