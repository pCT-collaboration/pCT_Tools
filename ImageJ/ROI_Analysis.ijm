//C:\\Users\\Blake\\Documents\\GitHub\\pCT-collaboration\\pCT_Tools\\ImageJ\\ROI_Analysis.ijm
macro "ROI_Analysis [F2]"
{
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***************************************************************************************************************************************************************************************************//
	//************************* Close all windows and clear results table *******************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//close_all_windows									(true, true);
	//close_windows										(true, true, false);
	setBatchMode										(true);

	//setBatchMode										(false);
	print_major_log_section_separator					("Performing RSP and standard deviation analysis and extracting the line and gradient profiles of each ROI of the images from each iteration of reconstruction...");
  	//***************************************************************************************************************************************************************************************************//
	//************************* Close all windows and clear results table *******************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//	
	simulated_scan 										= true;
	experimental_scan 									= !simulated_scan;
	log_printing										= true;		
	exporting_log										= false;		
	analyze_compared_data 								= false;
	generate_averaged_data								= false;
	printing_ROI_definitions							= true;		
	printing_reconstructed_image_analysis_info			= true;
	printing_parameter_value_test_info					= true;
	printing_multiplot_parameter_info					= true;	
	print_ROI_definitions_path							= true;		
	print_directories_created 							= false;
	print_slice_ops										= false;		
	print_current_iteration								= true;		
	print_task_progress									= true;		
	print_input_data_path								= true;
	print_input_CSV_path								= true;
	print_input_TXT_path								= true;
	print_input_PNG_paths								= false;
	print_output_CSV_path								= false;
	//print_output_CSV_path								= true;
	print_output_TXT_path								= true;
	print_output_PNG_path								= false;
	print_multiplot_animation_paths 					= true;		
	print_multiplot_GIF_paths 							= true;		
	print_multiplot_AVI_paths 							= true;		
	print_TXT_stack_image_paths							= true;
	print_PNG_stack_image_paths							= true;
	print_GIF_stack_paths								= true;
	print_AVI_stack_paths								= true;
	close_saved_PNG_image								= true;
	close_input_PNG_images								= true;
	close_output_PNG_images								= true;
	close_stack_images									= true;		
	close_multiplot_stack_images 						= true;									
	close_stack_image_sets								= true;
	close_animated_GIF_stack							= false;
	close_AVI_stack										= true;
	clear_results_table									= true;
	dont_clear_results_table							= true;		
	specify_multiplot_parameter_prefix					= true;
	specify_multiplot_parameter_number					= true && !specify_multiplot_parameter_prefix;
	specify_multiplot_parameter_index					= true && !specify_multiplot_parameter_prefix && !specify_multiplot_parameter_number;
	GIF_stacks_2_disk									= true;
	AVI_stacks_2_disk									= true;
	write_folder_strings 								= false;
	write_path_strings 									= false;	
	//write_RSP_data 									= true;
	//write_RSP_error_data 								= true;
	//write_std_dev_data 								= true;
	overwrite_AVI_stacks								= true;							
	overwrite_GIF_stacks								= true;
	//overwrite_RSP_data 								= true;
	//overwrite_RSP_error_data 							= true;
	//overwrite_std_dev_data 							= true;
	add_comparison_lines_2_plots						= true;
	add_compared_RSP_data 								= false;
	add_compared_RSP_error_data 						= false;
	add_compared_std_dev_data 							= true;
	add_compared_TV_data 								= true;
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************ Define Boolean constants *************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	INTERNAL_MACRO_CALLER								= true;
	EXTERNAL_MACRO_CALLER								= false;
	IJIO_CONFIG_OPTIONS_ON								= true;
	IJIO_CONFIG_OPTIONS_OFF								= false;
	ALL_BOOL 											= false;
	NONE_BOOL 											= true;
	AND_LOGIC 											= true;
	OR_LOGIC 											= false;
	COLUMN_ORDER										= true;
	ROW_ORDER											= false;
	COLUMN_MAJOR										= true;
	ROW_MAJOR											= false;
	CLOSE_PNG											= true;
	DONT_CLOSE_PNG										= false;
	SHORTEN_STRINGS										= true;
	DONT_SHORTEN_STRINGS								= false;	
	PRINT_PATH											= true;
	DONT_PRINT_PATH										= false;	
	PRINTING_ON											= true;
	PRINTING_OFF										= false;	
	USE_TAB_CMD_STRING									= true;
	USE_TAB_SPACES_STRING								= false;
	PRINT_MAJOR_SECTION									= true;
	PRINT_MINOR_SECTION									= false;	
	PRINT_IO_INFO										= true;
	DONT_PRINT_IO_INFO									= false;	
	CLOSE_WINDOW										= true;
	DONT_CLOSE_WINDOW									= false;	
	MAKE_TOP_DIR										= true;
	DONT_MAKE_TOP_DIR									= false;
	MAKE_TOP_DIRECTORY									= true;
	DONT_MAKE_TOP_DIRECTORY								= false;	
	PRINT_DIRECTORIES_CREATED							= true;
	DONT_PRINT_DIRECTORIES_CREATED						= false;
	MULTIVALUE_ONLY_ON									= true;
	MULTIVALUE_ONLY_OFF									= false;
	REMOVE_TRAILING_ZEROS								= true;
	DONT_REMOVE_TRAILING_ZEROS							= false;
	STRING_ADD_SPACES									= true;
	STRING_DONT_ADD_SPACES								= false;
	REMOVE_PARAMETER_VALUE_ONLY							= true;
	REMOVE_PARAMETER_PREFIX_AND_VALUE					= false;
	SWITCH_OPERANDS										= true;
	DONT_SWITCH_OPERANDS								= false;
	THROW_MISMATCH_ERROR								= true;
	DONT_THROW_MISMATCH_ERROR							= false;
	MULTIPLICATION										= 0;
	DIVISION											= 1;
	ADDITION											= 2;
	SUBTRACTION											= 3;
	ARRAY_VALUES_RANGE_TYPE_BRACKETED					= 0;										// Parameter value range string construction form: <label>[#-#]
	ARRAY_VALUES_RANGE_TYPE_EQUALS						= 1;										// Parameter value range string construction form: <label> = [#-#]
	ARRAY_VALUES_RANGE_TYPE_UNDERSCORED					= 2;										// Parameter value range string construction form: <label>_[#-#]
	ARRAY_VALUES_RANGE_OMIT_SINGLE_VALUE				= 0;										// Parameter value range string construction for non-multivalue parameter: <label>[#]
	ARRAY_VALUES_RANGE_BRACKET_SINGLE_VALUE				= 1;										// Parameter value range string construction for non-multivalue parameter: <label>=#
	ARRAY_VALUES_RANGE_EQUALS_SINGLE_VALUE				= 2;										// Parameter value range string construction for non-multivalue parameter: omit <label> & value info string
	debug_print_counter									= 1;
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************* Define string constants *************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	FOLDER_SEPARATOR									= File.separator;
	TXT 												= ".txt";
	CSV 												= ".csv";
	PNG 												= ".png";
	GIF 												= ".gif";
	AVI 												= ".avi";
	IJM 												= ".ijm";
	TRUE												= "true";
	FALSE												= "false";
	add_operation										= "add";
	multiply_operation									= "multiply";
	x_direction											= "x";
	y_direction											= "y";	 					
	circular_ROI										= "circle";
	square_ROI											= "square";		
	no_compression										= "None";
	JPEG_compression									= "JPEG";
	PNG_compression										= "PNG";
	ROI_definition_numbers_decoding_op					= "parseFloat";	
	ROI_definition_strings_decoding_op					= "none";	
	ROI_material_RSP_column_label 						= "Predicted RSP";
	RSP_error_column_label 								= "% Error";
	mean_column_label 									= "Mean";	
	COLUMN_SUM_ROW_LABEL 								= "Sum";	
	TV_before_TVS_label 								= "TV: Before TVS";	
	TV_after_TVS_label 									= "TV: After TVS";
	TV_reduction_label 									= "TVS TV Reduction";
	TV_table_titles										= newArray(TV_before_TVS_label, TV_after_TVS_label, TV_reduction_label);
	MONTH_NAMES 										= newArray("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
	DAY_NAMES 											= newArray("Sun", "Mon","Tue","Wed","Thu","Fri","Sat");
	EMPTY_STRING 										= "";										// String constant: empty string
	SPACE_STRING 										= " ";										// String constant: space character string
	UNDERSCORE_STRING 									= "_";										// String constant: underscore character string
	COMMA_STRING 										= ",";										// String constant: comma character string
	DECIMAL_STRING 										= ".";										// String constant: decimal character string
	PERIOD_STRING 										= ".";										// String constant: period character string
	EQUALS_STRING 										= "=";										// String constant: equals character string
	DASH_STRING 										= "-";										// String constant: dash character string
	RIGHT_CARAT_STRING 									= ">";										// String constant: right carat character string
	LEFT_BRACKET_STRING 								= "[";										// String constant: right carat character string
	RIGHT_BRACKET_STRING 								= "]";										// String constant: right carat character string
	NUM_TAB_SPACES 										= 8;
	NEWLINE_CMD_STRING									= "\n";
	TAB_CMD_STRING										= "\t";
	TAB_AS_SPACES_STRING								= string_tab_construction(USE_TAB_SPACES_STRING, NUM_TAB_SPACES);	
	TAB_STRING											= string_tab_construction(exporting_log, NUM_TAB_SPACES);	
	//***********************************************************************************************************************************************************************************************************//
	//********************************************************************************** Log Printing Properties and Settings ***********************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	PRINTING_STATUS										= PRINTING_ON;
	print("TAB_CMD_STRING \n" + DASH_STRING + TAB_CMD_STRING + DASH_STRING);
	print("TAB_AS_SPACES_STRING \n" + DASH_STRING + TAB_AS_SPACES_STRING + DASH_STRING);
	print("TAB_STRING \n" + DASH_STRING + TAB_STRING + DASH_STRING);
	exit();
	//***************************************************************************************************************************************************************************************************//
	//************************* Boolean control *******************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//	
	write_all											= true;
	write_plots_only									= false;
	write_data_only										= true;
	write_animations_only								= false;
	write_only_bools 									= newArray(write_plots_only, write_data_only, write_animations_only);
	write_all_plots										= only_bool_array_control(0, write_only_bools, true, ALL_BOOL);
	write_all_data										= only_bool_array_control(1, write_only_bools, true, ALL_BOOL);
	write_all_animations								= only_bool_array_control(2, write_only_bools, true, ALL_BOOL);
	write_no_plots										= only_bool_array_control(0, write_only_bools, false, NONE_BOOL);
	write_no_data										= only_bool_array_control(1, write_only_bools, false, NONE_BOOL);
	write_no_animations									= only_bool_array_control(2, write_only_bools, false, NONE_BOOL);	
	overwrite_all										= true;
	overwrite_plots_only								= false;
	overwrite_data_only									= true;
	overwrite_animations_only							= false;
	overwrite_only_bools 								= newArray(overwrite_plots_only, overwrite_data_only, overwrite_animations_only);
	overwrite_all_plots									= only_bool_array_control(0, overwrite_only_bools, true, ALL_BOOL);
	overwrite_all_data									= only_bool_array_control(1, overwrite_only_bools, true, ALL_BOOL);
	overwrite_all_animations							= only_bool_array_control(2, overwrite_only_bools, true, ALL_BOOL);
	overwrite_no_plots									= only_bool_array_control(0, overwrite_only_bools, false, NONE_BOOL);
	overwrite_no_data									= only_bool_array_control(1, overwrite_only_bools, false, NONE_BOOL);
	overwrite_no_animations								= only_bool_array_control(2, overwrite_only_bools, false, NONE_BOOL);	
	create_plots										= false;
	//***************************************************************************************************************************************************************************************************//
	//********************* Set task action performance: (plots, data writes, animations) = (T/F, T/F, T/F) *********************************************************************************************//
	//***************************************************************************************************************************************************************************************************//	
	write_none											= newArray(write_no_plots, write_no_data, write_no_animations);
	tasksof_perform_ROI_analysis 						= newArray(true, true, true);
	tasksof_perform_selection_analysis					= newArray(true, true, false);
		tasksof_line_profile_on							= newArray(true, true, false);
		tasksof_perform_region_analysis					= newArray(true, true, false);
		tasksof_gradient_profile_on 					= newArray(true, true, false);
		tasksof_perform_vs_predicted_RSP_analysis		= newArray(true, false, false);
			tasksof_plot_measured_vs_predicted_RSP		= newArray(true, false, false);
			tasksof_plot_ROI_errors_vs_predicted_RSP	= newArray(true, false, false);
			tasksof_plot_ROI_std_dev_vs_predicted_RSP	= newArray(true, false, false);
		tasksof_perform_vs_iteration_analysis			= newArray(true, false, false);
			tasksof_RSP_analysis_on 					= newArray(true, false, false);
			tasksof_RSP_error_analysis_on 				= newArray(true, false, false);
			tasksof_std_dev_analysis_on					= newArray(true, false, false);
	tasksof_perform_TV_analysis							= newArray(true, false, false);
		tasksof_plot_TV_analysis						= newArray(true, false, false);
		tasksof_plot_TV_step_analysis					= newArray(true, false, false);
	//***************************************************************************************************************************************************************************************************//
	//************************* Close all windows and clear results table *******************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//	
	perform_ROI_analysis								= task_only_bool_dependence(true, tasksof_perform_ROI_analysis, write_none);
	//for(s = 0; s < num_slices_2_analyze; s++)
	//for(ROI_selection_diameter_index = 0; ROI_selection_diameter_index < ROI_selection_diameters.length; ROI_selection_diameter_index++)
	perform_selection_analysis							= task_only_bool_dependence(true, tasksof_perform_selection_analysis, write_none);
	//for(s = 0; s < num_slices_2_analyze; s++)
	//for(ROI_selection_diameter_index = 0; ROI_selection_diameter_index < ROI_selection_diameters.length; ROI_selection_diameter_index++)
		// for(iteration = 0; iteration <= num_iterations; iteration++)
		//all_slices_2_PNG 								= false;
		write_slice_2_PNG 								= bool_control(true, write_all_plots, write_no_plots, true);//true;
			overwrite_slice_2_PNG 						= bool_control(true, overwrite_all_plots, overwrite_no_plots, false);//true;
		line_profile_on									= true;
			write_profile_plot							= bool_control(true, write_all_plots, write_no_plots, false);//true;
				overwrite_profile_plot					= bool_control(true, overwrite_all_plots, overwrite_no_plots, false);//true;
			write_profile_data 							= bool_control(true, write_all_data, write_no_data, false);//true;
				overwrite_profile_data 					= bool_control(true, overwrite_all_data, overwrite_no_data, false);//true;	
		perform_region_analysis							= true;
			write_regions_data 							= bool_control(true, write_all_data, write_no_data, false);//true;
				overwrite_regions_data 					= bool_control(true, overwrite_all_data, overwrite_no_data, false);//true;			
		gradient_profile_on 							= true;
			write_gradient_plot 						= bool_control(true, write_all_plots, write_no_plots, false);//true;
				overwrite_gradient_plot 				= bool_control(true, overwrite_all_plots, overwrite_no_plots, false);//true;			
			write_gradient_data 						= bool_control(true, write_all_data, write_no_data, false);//true;		
				overwrite_gradient_data 				= bool_control(true, overwrite_all_data, overwrite_no_data, false);//true;	
	//*****************************************************************************************************************************************************************************
	true_if_task 										= bool_dependence(true, (perform_selection_analysis && perform_region_analysis), AND_LOGIC);
	false_if_task 										= bool_dependence(false, (perform_selection_analysis && perform_region_analysis), AND_LOGIC);
	//*****************************************************************************************************************************************************************************
		write_RSP_CSV									= bool_control(true_if_task, write_all_data, write_no_data, false);//true && perform_selection_analysis && perform_region_analysis;
			overwrite_RSP_CSV							= bool_control(true, overwrite_all_data, overwrite_no_data, false);//true;	
		write_RSP_error_CSV								= bool_control(true_if_task, write_all_data, write_no_data, false);//true  && perform_selection_analysis && perform_region_analysis;
			overwrite_RSP_error_CSV						= bool_control(true, overwrite_all_data, overwrite_no_data, false);//true;	
		write_std_dev_CSV								= bool_control(true_if_task, write_all_data, write_no_data, false);//true  && perform_selection_analysis && perform_region_analysis;
			overwrite_std_dev_CSV						= bool_control(true, overwrite_all_data, overwrite_no_data, false);//true;
		perform_vs_predicted_RSP_analysis				= task_only_bool_dependence(true, tasksof_perform_vs_predicted_RSP_analysis, write_none);//true;
			//for(iteration = first_iteration_2_analyze; iteration <= last_iteration_2_analyze; iteration++)			
			plot_measured_vs_predicted_RSP				= bool_control(true_if_task, write_all_plots, write_no_plots, false);//true  && perform_selection_analysis && perform_region_analysis;						
				write_RSP_comparison_plot				= bool_control(true, write_all_plots, write_no_plots, false);//true;				
					overwrite_RSP_comparison_plot		= bool_control(true, overwrite_all_plots, overwrite_no_plots, false);//true;					
			plot_ROI_errors_vs_predicted_RSP			= bool_control(true_if_task, write_all_plots, write_no_plots, false);//true  && perform_selection_analysis && perform_region_analysis;					
				write_RSP_error_comparison_plot			= bool_control(true, write_all_plots, write_no_plots, false);//true;			
					overwrite_RSP_error_comparison_plot	= bool_control(true, overwrite_all_plots, overwrite_no_plots, false);//true;								
			plot_ROI_std_dev_vs_predicted_RSP			= bool_control(true_if_task, write_all_plots, write_no_plots, false);//true  && perform_selection_analysis && perform_region_analysis;												
				write_std_dev_comparison_plot			= bool_control(true, write_all_plots, write_no_plots, false);//true;													
					overwrite_std_dev_comparison_plot	= bool_control(true, overwrite_all_plots, overwrite_no_plots, false);//true;										
		perform_vs_iteration_analysis					= bool_control(true, write_all_plots, write_no_plots, false);//true;	
			//for( n = 0; n < num_ROIs_2_analyze; n++ )
			RSP_analysis_on 							= true_if_task;
				write_RSP_plot 							= bool_control(true, write_all_plots, write_no_plots, false);//true;
					overwrite_RSP_plot 					= bool_control(true, overwrite_all_plots, overwrite_no_plots, false);//true;
			RSP_error_analysis_on 						= true_if_task;
				write_RSP_error_plot 					= bool_control(true, write_all_plots, write_no_plots, false);//true;
					overwrite_RSP_error_plot 			= bool_control(true, overwrite_all_plots, overwrite_no_plots, false);//true;
			std_dev_analysis_on							= true_if_task;
				write_std_dev_plot 						= bool_control(true, write_all_plots, write_no_plots, false);//true;
					overwrite_std_dev_plot 				= bool_control(true, overwrite_all_plots, overwrite_no_plots, false);//true;										
	perform_TV_analysis									= bool_control(true, write_all_plots, write_no_plots, false);//true;
		plot_TV_analysis								= bool_control(true, write_all_plots, write_no_plots, false);//true;
			write_TV_analysis_plot						= bool_control(true, write_all_plots, write_no_plots, false);//true;
				overwrite_TV_analysis_plot				= bool_control(true, overwrite_all_plots, overwrite_no_plots, false);//true;								
		plot_TV_step_analysis							= task_only_bool_dependence(true, tasksof_plot_TV_step_analysis, write_none);//true;
			write_TV_step_analysis_plot					= bool_control(true, write_all_plots, write_no_plots, false);//true;
				overwrite_TV_step_analysis_plot			= bool_control(true, overwrite_all_plots, overwrite_no_plots, false);//true;	
	build_image_stacks									= false;					
		//for(s = 0; s < num_slices_2_analyze; s++)
		build_slice_2_PNG_stack							= bool_control(true, write_all_plots, write_no_plots, false);//true;					
		//for(ROI_selection_diameter_index = 0; ROI_selection_diameter_index < ROI_selection_diameters.length; ROI_selection_diameter_index++)
		build_by_iteration_image_stacks					= true;
			build_RSP_comparison_plot_stack				= true;					
			build_RSP_error_comparison_plot_stack		= true;												
			build_std_dev_comparison_plot_stack			= true;
		//for( n = 0; n < num_ROIs_2_analyze; n++ )	
		build_by_ROI_and_iteration_image_stacks			= true;
			build_profile_plot_stack					= true;
			build_gradient_plot_stack					= true;
		build_by_ROI_image_stacks						= true;
			build_RSP_plot_stack						= true;
			build_RSP_error_plot_stack					= true;
			build_std_dev_plot_stack					= true;	
	//peq("true_if_task", true_if_task);
	//peq("false_if_task", false_if_task);
	//dq();
	//exit();
	//***************************************************************************************************************************************************************************************************//
	//************************* Close all windows and clear results table *******************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//						
	directory_path 										= getArgument();
	if(directory_path == "" )
	
		directory_path 									= getDirectory("Choose a Directory");
	
	else
	{
		macro_called_externally							= true;
		printing_ROI_definitions						= false;		
		printing_reconstructed_image_analysis_info		= false;
		printing_parameter_value_test_info				= false;
		printing_multiplot_parameter_info				= false;	
	}
	directory_folder 									= File.getName(directory_path);
	folder_separator									= File.separator;
	ImageJ_plugins_directory							= getDirectory("plugins");
	ImageJ_macro_directory								= getDirectory("macros");
	ImageJ_program_directory							= getDirectory("imagej") ;
	ImageJ_launch_directory								= getDirectory("startup");
	ImageJ_previous_macro								= getInfo("macro.filepath");
	github_macro_directory_Baylor_ICTHUS				= "C:\\Users\\Blake\\Documents\\GitHub\\Baylor_ICTHUS\\pCT_Reconstruction\\Tools\\ImageJ\\";
 	github_macro_directory_pCT_Collaboration			= "C:\\Users\\Blake\\Documents\\GitHub\\pCT-collaboration\\pCT_Tools\\ImageJ";
 	reconstruction_data_directory_C						= "C:\\Users\\Blake\\Documents\\Education\\Research\\pCT\\pCT_data\\reconstruction_data";
	reconstruction_data_directory_D						= "D:\\pCT\\pCT_data\\reconstruction_data";
	ROI_analysis_macro_filename 						= "ROI_Analysis.ijm";
	phantom_basename									= "CTP404_Sensitom";
	//phantom_basename									= "CTP404_Sensitom_4M";
	phantom_name_folder									= folder_separator + phantom_basename;
	reconstruction_data_folder							= folder_separator + "reconstruction_data";
	simulated_data_folder								= folder_separator + "Simulated";
	experimental_data_folder							= folder_separator + "Experimental";
	output_folder										= folder_separator + "Output";
	geant4_data_folder_basename							= folder_separator + "G_";	
	// Options controlling construction of reconstruction_data_directory/test_batch_directory
	simulated_data										= "Simulated";
	experimental_data									= "Experimental";	
	drive_C												= "C";
	drive_D												= "D";
	current_reconstruction_data_drive					= "D";
	current_reconstruction_data_type					= simulated_data;
	
	if(current_reconstruction_data_drive == drive_C)				
		reconstruction_data_directory	 				= reconstruction_data_directory_C;
	else if(current_reconstruction_data_drive == drive_D)			
		reconstruction_data_directory 					= reconstruction_data_directory_D;
	//if(current_reconstruction_data_type == simulated_data) 			test_batch_directory 			= reconstruction_data_directory + phantom_name_folder + simulated_data_folder + run_date_folder + run_number_folder + output_folder + preprocess_date_folder + folder_separator;
	//else if(current_reconstruction_data_type == experimental_data)	test_batch_directory 			= reconstruction_data_directory + phantom_name_folder + experimental_data_folder + run_date_folder + run_number_folder + output_folder + preprocess_date_folder + folder_separator;		
	
	phantom_name 										= path_2_phantom_name(directory_path, reconstruction_data_folder);
	test_batch_directory 								= File.getParent(directory_path);

	// Input/Output directory/subdirectory names/prefixes 
	iteration_2_analyze_folder_prefix 					= "Iteration_";
	slice_2_analyze_folder_prefix 						= "Slice_";
	ROI_selection_diameter_folder_prefix 				= "d";
	compared_data_folder_suffix							= "_compared";
	averaged_data_folder_suffix							= "_avg";
		
	ROI_definitions_filename_suffix						= "_ROIs" + TXT;	
	ROI_definitions_filename							= phantom_basename + ROI_definitions_filename_suffix;
	ROI_definitions_file_path							= github_macro_directory_Baylor_ICTHUS + folder_separator + ROI_definitions_filename;
	reconstructed_image_file_basenames 					= "x_";
	initial_iterate_filename 							= reconstructed_image_file_basenames + "0" + TXT;	
	parameter_test_info_basename						= "Test_Parameters_";
	multiplot_folders_filename 							= "multiplot_folders.txt";
	compared_folders_filename 							= "compared_folders.txt";	
	ANALYSIS_LOG_FNAME 									= "AnalysisLog.nfo";
	initial_iterate_filename 							= reconstructed_image_file_basenames + "0" + TXT;	
	profile_CSV_basename 								= "Line_Profiles";
	profile_data_file_basenames 						= "Line_Profile";
	regions_data_file_basenames							= "Region_Statistics";
	gradient_CSV_basename 								= "Gradients";
	gradient_data_file_basenames 						= "Gradient";	
	RSP_data_file_basenames								= "RSP";
	RSP_error_data_file_basenames						= "RSP_error";
	RSP_Error_data_file_basenames						= "RSP_Error";
	std_dev_data_file_basenames							= "Std_Dev";
	TV_data_file_basenames								= "TV";
	TV_measurements_basename							= "TV_measurements";
	TV_step_data_file_basenames							= "TV_step";
	TV_difference_data_file_basenames					= "TV_difference";
	
	RSP_basename 										= "RSP";
	RSP_error_basename 									= "RSP_Error";
	std_dev_basename 									= "Std_Dev";
	TV_measurements_basename							= "TV_measurements";
	TV_measurements_step_plot_basename					= "TV_step_plot";		

	RSP_animation_basename								= "RSP";
	RSP_error_animation_basename 						= "RSP_Error";
	std_dev_animation_basename 							= "Std_Dev";

	RSP_comparison_basename 							= "RSP_Comparison";
	RSP_error_comparison_basename 						= "RSP_Error_Comparison";
	std_dev_comparison_basename 						= "Std_Dev_Comparison";	
	
	RSP_comparison_animation_basename 					= "RSP_Comparison";
	RSP_error_comparison_animation_basename 			= "RSP_Error_Comparison";
	std_dev_comparison_animation_basename 				= "Std_Dev_Comparison";	
	
	RSP_CSV_filename 									= RSP_data_file_basenames 				+ CSV;
	RSP_error_CSV_filename 								= RSP_error_basename 					+ CSV;
	std_dev_CSV_filename 								= std_dev_basename 						+ CSV;
	TV_measurements_TXT_filename						= TV_measurements_basename 				+ TXT;
	TV_measurements_plot_filename						= TV_measurements_basename 				+ PNG;
	TV_measurements_step_plot_filename					= TV_measurements_step_plot_basename	+ PNG;		
	//***********************************************************************************************************************************************************************************************//
	//************************************************************************************** Parameter value arrays *********************************************************************************//
	//***********************************************************************************************************************************************************************************************//
	ROI_definitions_filename_suffix			= "_ROIs" + TXT;	
	ROI_definitions_filename				= phantom_basename + ROI_definitions_filename_suffix;
	ROI_definitions_file_path				= github_macro_directory_Baylor_ICTHUS + folder_separator + ROI_definitions_filename;
	ROI_material_names_decoding				= ROI_definition_strings_decoding_op; 										//= air, air, PMP, LDPE,	polystyrene, acrylic, delrin, teflon
	ROI_labels_decoding						= ROI_definition_strings_decoding_op; 										//= Air(bottom), Air(top), PMP, LDPE, Polystyrene, Acrylic, Delrin, Teflon
	ROI_shapes_decoding						= ROI_definition_strings_decoding_op;										// = circular_ROI, circular_ROI, circular_ROI, circular_ROI, circular_ROI, circular_ROI, circular_ROI, circular_ROI
	ROI_diameters_decoding					= ROI_definition_numbers_decoding_op;										//= 12.2, 12.2, 12.2, 12.2, 12.2, 12.2, 12.2, 12.2		
	ROI_selection_radii_decoding			= ROI_definition_numbers_decoding_op; 										//	= 3.5, 4, 6
	ROI_profile_radius_beyond_ROI_decoding	= ROI_definition_numbers_decoding_op;										//	= 8														
	bulk_material_decoding					= ROI_definition_strings_decoding_op;										//	= epoxy	
	ROI_parameter_decodings					= newArray(ROI_material_names_decoding, ROI_labels_decoding, ROI_shapes_decoding, ROI_diameters_decoding, ROI_selection_radii_decoding, ROI_profile_radius_beyond_ROI_decoding, bulk_material_decoding);		
	ROI_definitions_parameter_list			= newArray("ROI_material_names", "ROI_labels", "ROI_shapes", "ROI_diameters", "ROI_selection_radii", "ROI_profile_radius_beyond_ROI", "bulk_material" );
	ROI_material_names_index 				= 0;
	ROI_labels_index 						= 1;
	ROI_shapes_index 						= 2;
	ROI_diameters_index 					= 3;
	ROI_selection_radii_index 				= 4;
	ROI_profile_radius_beyond_ROI_index	 	= 5;
	bulk_material_index 					= 6;
	ROI_parameter_strings					= file_2_key_value_pairs(github_macro_directory_Baylor_ICTHUS, ROI_definitions_filename, phantom_basename, ROI_definitions_parameter_list, ROI_parameter_decodings, ROI_definition_numbers_decoding_op, printing_ROI_definitions);		
	ROI_material_names 						= ROI_parameter_string_2_values(ROI_parameter_strings, ROI_material_names_index, ROI_parameter_decodings, ROI_definition_numbers_decoding_op, true);	
	ROI_labels 								= ROI_parameter_string_2_values(ROI_parameter_strings, ROI_labels_index, ROI_parameter_decodings, ROI_definition_numbers_decoding_op, true);
	ROI_shapes 								= ROI_parameter_string_2_values(ROI_parameter_strings, ROI_shapes_index, ROI_parameter_decodings, ROI_definition_numbers_decoding_op, true);	
	ROI_diameters 							= ROI_parameter_string_2_values(ROI_parameter_strings, ROI_diameters_index, ROI_parameter_decodings, ROI_definition_numbers_decoding_op, true);
	ROI_selection_radii 					= ROI_parameter_string_2_values(ROI_parameter_strings, ROI_selection_radii_index, ROI_parameter_decodings, ROI_definition_numbers_decoding_op, true);
	ROI_profile_radius_beyond_ROI	 		= ROI_parameter_string_2_values(ROI_parameter_strings, ROI_profile_radius_beyond_ROI_index, ROI_parameter_decodings, ROI_definition_numbers_decoding_op, false);	//ROI_profile_radius_beyond_ROI = ROI_profile_radius_beyond_ROI[0];
	bulk_material 							= ROI_parameter_string_2_values(ROI_parameter_strings, bulk_material_index, ROI_parameter_decodings, ROI_definition_numbers_decoding_op, false);					//bulk_material = bulk_material[0];
	bulk_material_RSP 						= material_name_2_RSP(bulk_material, simulated_scan);
	ROI_material_RSPs 						= ROI_material_names_2_RSPs(ROI_material_names, simulated_scan);
	num_ROIs_2_analyze 						= ROI_material_names.length; 										// # of material ROI ROIs in phantom
	//***********************************************************************************************************************************************************************************************//
	//************************************************************************************** Parameter value arrays *********************************************************************************//
	//***********************************************************************************************************************************************************************************************//
	//x_dimensions 							= query_image_dimensions(directory_path, initial_iterate_filename);
	//x_columns 								= x_dimensions[0];
	//x_rows  								= x_dimensions[1];					
	//x_slices 								= x_dimensions[2]; 					
	//x_height								= x_dimensions[3]; 	
	x_columns 								= 200;
	x_rows  								= 200;					
	x_slices 								= 20; 					
	x_height								= 4000; 	
	voxel_width 							= 1;																	// 
	voxel_height							= 1;
	voxel_thickness							= 2.5;	
	voxel_dimensions						= newArray(voxel_width, voxel_height, voxel_thickness);
	voxels_per_mm							= 1;			
	flip_horizontally						= false;																// Specify if correct orientation of reconstructed images requires flipping horizontally
	flip_vertically							= true;																	// Specify if correct orientation of reconstructed images requires flipping vertically
	empty_array 							= newArray();															// Passed to set_plot_extrema when no additional lines are plotted	
	SEQUENTIAL_VALUES_ARRAY					= Array.getSequence(maxOf(x_columns, x_rows));							// Long sequential values array which other sequence arrays can be sliced from	
	//SEQUENTIAL_VALUES_ARRAY				= Array.getSequence(1000);							// Long sequential values array which other sequence arrays can be sliced from	
	//***********************************************************************************************************************************************************************************************//
	//************************************************************************************** Parameter value arrays *********************************************************************************//
	//***********************************************************************************************************************************************************************************************//		
	num_recon_iterations 					= 12;										// # of iterations of feasibility seeking performed in reconstruction
	images_per_reconstruction 				= num_recon_iterations + 1;					// 	
	first_iteration_2_analyze				= 0;
	last_iteration_2_analyze				= num_recon_iterations;
	iterations_2_analyze					= Array.slice(SEQUENTIAL_VALUES_ARRAY, first_iteration_2_analyze, last_iteration_2_analyze + 1);
	num_iterations_2_analyze				= iterations_2_analyze.length;				// # of iterations of feasibility seeking image results to analyze
	iterations_2_analyze_string_precision 	= 0;										// # of digits after decimal point to use in conversion of iteration # to string 	
	//first_slice_2_analyze 				= x_slices/2;												// first slice analyzed by pCT_Analysis macro
	//last_slice_2_analyze 					= x_slices/2;												// last slice analyzed by pCT_Analysis macro		
	first_slice_2_analyze					= 10;
	last_slice_2_analyze					= 10;
	slices_2_analyze						= Array.slice(SEQUENTIAL_VALUES_ARRAY, first_slice_2_analyze, last_slice_2_analyze + 1);
	num_slices_2_analyze					= slices_2_analyze.length;					// # of slices analyzed 
	slices_2_analyze_string_precision 		= 0;										// # of digits after decimal point to use in conversion of slice # to string 	
	ROI_radii 								= newArray(ROI_diameters.length);						// radii of circular selections used to analyze phantom ROIs
	ROI_profile_radii 						= newArray(ROI_diameters.length);							// Set distance to extend profile line left/right from material insert ROI centers
	//ROI_std_selection_radii 				= newArray(3.5, 4.0, 6.0);					// radii of circular selections used to analyze phantom ROIs
	//ROI_selection_radii 					= Array.slice(ROI_std_selection_radii,0,1);	// radii of circular selections used to analyze phantom ROIs
	ROI_selection_diameters 				= Array.copy(ROI_selection_radii);//newArray(ROI_selection_radii.length);		// diameters of circular selections used to analyze phantom ROIs	
	//ROI_selection_diameters 				= newArray(ROI_selection_radii.length);		// diameters of circular selections used to analyze phantom ROIs	
	ROI_selection_diameter_string_precision	= 0;										// # of digits after decimal point to use in conversion of an ROI selection diameter value to string	
	num_ROI_selection_diameters				= ROI_selection_diameters.length;			// diameters of circular selections used to analyze phantom ROIs 	
	
	// Parameters of PNG image generated for specified slice of x	
	for(iteration_check = 0; iteration_check <= num_recon_iterations; iteration_check++)
		if( !File.exists( directory_path + reconstructed_image_file_basenames + d2s(iteration_check, 0) + TXT))
			existing_iterations 			= iteration_check - 1;
	last_iteration_2_analyze				= minOf(last_iteration_2_analyze, iteration_check - 1);
	//***********************************************************************************************************************************************************************************************//
	//************************* Construct commonly used strings for parameter values and files/folders **********************************************************************************************//
	//***********************************************************************************************************************************************************************************************//	
	reconstructed_image_strings 						= newArray(images_per_reconstruction);		
	reconstructed_image_folders 						= newArray(images_per_reconstruction);		
	iterations_2_analyze_strings 						= newArray(images_per_reconstruction);		
	iterations_2_analyze_folders 						= newArray(images_per_reconstruction);		
	slices_2_analyze_strings 							= newArray(num_slices_2_analyze);						
	slices_2_analyze_folders 							= newArray(num_slices_2_analyze);						
	ROI_selection_diameter_strings 						= newArray(num_ROI_selection_diameters);				
	ROI_selection_diameter_folders 						= newArray(num_ROI_selection_diameters);
	for(i = 0; i <= num_recon_iterations; i++)	
	{							
		reconstructed_image_strings[i] 					= reconstructed_image_file_basenames + d2s(i, iterations_2_analyze_string_precision);		
		reconstructed_image_folders[i] 					= folder_separator +  reconstructed_image_file_basenames + d2s(i, iterations_2_analyze_string_precision);	
		iterations_2_analyze_strings[i] 				= d2s(i, iterations_2_analyze_string_precision);		
		iterations_2_analyze_folders[i] 				= folder_separator + iteration_2_analyze_folder_prefix + d2s(i, iterations_2_analyze_string_precision);	
	}	
	for(i = 0; i < num_slices_2_analyze; i++)	
	{							
		slices_2_analyze_strings[i] 					= d2s(slices_2_analyze[i], slices_2_analyze_string_precision);		
		slices_2_analyze_folders[i] 					= folder_separator + slice_2_analyze_folder_prefix + d2s(slices_2_analyze[i], slices_2_analyze_string_precision);	
	}
	for(i = 0; i < num_ROI_selection_diameters; i++)								
	{																					
		ROI_selection_diameters[i] 						= 2 * ROI_selection_radii[i];									
		ROI_selection_diameter_strings[i] 				= d2s(ROI_selection_diameters[i], ROI_selection_diameter_string_precision);	
		ROI_selection_diameter_folders[i] 				= folder_separator + ROI_selection_diameter_folder_prefix + d2s(ROI_selection_diameters[i], ROI_selection_diameter_string_precision);	
	}																								
	for(i = 0; i < ROI_diameters.length; i++)
	{
		ROI_radii[i] 									= ROI_diameters[i] / 2;		
		ROI_profile_radii[i]							= ROI_radii[i] + ROI_profile_radius_beyond_ROI;	
	}			
	reconstructed_image_range_string					= "[" + iterations_2_analyze_strings[0] + "-" + iterations_2_analyze_strings[last_iteration_2_analyze] + "]";
	iterations_2_analyze_range_string					= "[" + iterations_2_analyze_strings[first_iteration_2_analyze] + "-" + iterations_2_analyze_strings[last_iteration_2_analyze] + "]";
	//***************************************************************************************************************************************************************************************************//
	//************************************** Parameters whose values rarely change, effectively constants ***********************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	num_specs 						= 4;											// # of test parameter properties specified in Specs file
	tolerance						= 0.0000001;									// Tolerance separating min/max values of array used in findMinima/findMaxima
	filterwidth 					= 3;											// Width of filter used in median filtering FBP image
	sobel_x 						= "[-1 0 1\n-2 0 2\n-1 0 1\n]";					// Matrix convolved with image to generate approximate image gradient in x-direction
	sobel_y 						= "[-1 -2 -1\n0 0 0\n1 2 1\n]";					// Matrix convolved with image to generate approximate image gradient in y-direction
	scharr_x 						= "[-3 0 3\n-10 0 10\n-3 0 3\n]";				// Matrix convolved with image to generate approximate image gradient in x-direction
	scharr_y 						= "[-3 -10 -3\n0 0 0\n3 10 3\n]";				// Matrix convolved with image to generate approximate image gradient in y-direction
	gradient_x_kernel				= scharr_x;										// Specify which matrix to convolve with image to generate approximate x-direction derivative
	gradient_y_kernel				= scharr_y;										// Specify which matrix to convolve with image to generate approximate x-direction derivative
	x_magnification 				= 5;											// Factor by which extracted slices are magnified before saving as PNG
	lower_limits_scale 				= 0.95;											// Scale factor to apply to minimum value of curve to define lower axis limit
	upper_limits_scale 				= 1.05;											// Scale factor to apply to maximum value of curve to define upper axis limit
	difference_scale				= 0.1;											// Scale factor to apply to minimum/maximum value of y-axis to improve appearance
	alignment_column 				= 25;
	screen_width					= screenWidth;
	screen_height					= screenHeight;
	x_frame_size					= 780;											// Size of plots (in pixels) in x-direction
	y_frame_size					= 380;											// Size of plots (in pixels) in y-direction
	text_xpos_ratio					= 0.45;											//
	text_ypos_ratio					= 0.01;											//
	text_size						= 30;
	legend_text_size				= 22;
	axis_label_text_size			= 28;
	data_line_color					= "blue";										// Specify color of primary plot curves
	add_line_color					= "green";										// Specify color of secondary plot curves
	color_rotation					= newArray("green", "blue",  "cyan",  "magenta", "orange", "red", "pink", "yellow", "darkGray", "gray", "lightGray", "black", "white"); 
	add_text_justification			= "center";										//
	linewidth						= 3.5;											//
	plot_parameters 				= newArray(voxel_width, tolerance, lower_limits_scale, upper_limits_scale, difference_scale, x_frame_size, y_frame_size, text_xpos_ratio, text_ypos_ratio, add_line_color, linewidth);
	grayscale_range_min				= 0.0;											// Specify min value of grayscale range, all values at or below are shown as black 
	grayscale_range_max				= 2.0;											// Specify max value of grayscale range, all values at or above are shown as white 
	GIF_frame_rate					= 4;											// Specify animated GIF's frame rate in frames per second (fps)
	animated_GIF_info				= newArray(print_multiplot_GIF_paths, close_stack_images, close_multiplot_stack_images, GIF_frame_rate );
	AVI_compression_format			= PNG_compression;								// Specify image compression format used in constructing AVI  video from image stack
	AVI_frame_rate					= 5;											// Specify AVI video frame rate in frames per second (fps)
	AVI_info						= newArray(print_multiplot_AVI_paths, close_stack_images, close_multiplot_stack_images, AVI_frame_rate, AVI_compression_format );	
	INPUT_FILE_LIST 				= newArray();   		
	OUTPUT_FILE_LIST				= newArray();
	//COPIED_FILE_LIST				= newArray();
	COPIED_FILE_FROM_LIST			= newArray();
	COPIED_FILE_TO_LIST				= newArray();
	DIRECTORIES_CREATED				= newArray();                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
	debug_print_counter				= 1;
	//***********************************************************************************************************************************************************************************************************//
	//************************* Name and predicted RSP for each ROI and array where the mean measured RSPs are to be stored *************************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	// Coordinates of the center of ROIs in specified slice for CTP404 phantom
	// For 200 x 200
	if(x_columns == 200 )
	{//														"Air(bottom)" "Air(top)"   "PMP",     "LDPE", 	   "Poly",    "Acrylic",  "Delrin",   "Teflon"
		//centersx 									= newArray( 100.5,  	100.5,  	71.5,   	41,   		71.5,  		129.5,  	158.5,  	129.5	);
		//centersy_offsets 							= newArray( 158.5,   	41.5,   	151,  		100.5,   	51,     	51,  		100.5,  	151		);
		//centersx 									= newArray( 100,  		100,  		70,   		42,   		70,  		129.5,  	158,  		129		);
		//centersy_offsets 							= newArray( 158,   		42,   		151,  		100,   		50,     	50,  		100,  		151	);
		centersx 									= newArray( 99.75,  		99.75,  		70,   		41.0,   		70.0,  		129,  	158.0,  		129.0		);
		centersy_offsets 							= newArray( 158.0,   		41.5,   		151,  		100.0,   		49.5,     	49.5,  		100.0,  		151.0	);		
		centersx_odd								= newArray( 100.25,  		100.25,  		70.5,   		41.5,   		70.5,  		129.5,  	158.5,  		129.5		);
		centersy_offsets_odd 							= newArray( 158.5,   		42.0,   		151.5,  		100.5,   		50.0,     	50.0,  		100.5,  		151.5	);
	}
	// For 220 x 220 but RECON_CYL_RADIUS = 10.0cm
	else if(x_columns == 220 )
	{//														"Air(bottom)" "Air(top)"   "PMP",     "LDPE", 	   "Poly",    "Acrylic",  "Delrin",   "Teflon"
		centersx 									= newArray( 100,  		100,  		70,   		42,   		70,  		129.5,  	158,  		129.5	);
		centersy_offsets 							= newArray( 158,   		42,   		151,  		100,   		50,     	50,  		100,  		150		);
	}
	else if(x_columns == 240)
	{
		// For 240 x 240 										"Air(bottom)" "Air(top)"   "PMP",     "LDPE", 	   "Poly",    "Acrylic",  "Delrin",   "Teflon"
		centersx 									= newArray( 120, 		120.3,  	90.8,  		61.2,	 	90.8,  		148.8,	 	178, 	 	150.4	);
		centersy_offsets 							= newArray( 178.4, 		61.5,  		171.2,  	119.8,  	70.2, 		68.2,  		120,	 	171.2	);
	}	
	//***********************************************************************************************************************************************************************************************************//
	//***************** Specifications used to identify file containing specifications of parameters of parameter value test ************************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	parameter_test_number						= 6;
	parameter_test_info_filename				= parameter_test_info_basename + d2s(parameter_test_number, 0)  + TXT;
	parameter_test_info 						= file_2_array(test_batch_directory, parameter_test_info_filename, print_input_data_path);
	//Ap(parameter_test_info);
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
	//for(i = 0; i < parameter_values.length; i++)
	//	parameter_values[i] 					= parseFloat(parameter_values[i]);	
	parameter_value_offsets 					= generate_parameter_value_offsets(num_parameter_values);
	parameter_value_strings 					= generate_all_parameter_value_strings(parameter_values, num_parameter_values, parameter_value_offsets, parameter_string_precisions);
	modulo_values 								= generate_modulo_values(num_parameter_values);
	total_combinations 							= series_product(num_parameter_values);
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//
	//parameter_string_prefixes 						= newArray("B", "L", "Hull_r", "FBP_r", "TV", "A", "L0_0_Nk");
	//parameter_string_precisions 					= newArray(0, 6, 0, 0, 0, 6, 0);				
	current_parameters_string						= folder_2_parameter_string(directory_folder, parameter_string_prefixes, parameter_string_precisions, parameter_string_prefixes.length - 1);
	//print(current_parameters_string);
	//exit();
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//
	ROIs_per_reconstruction 							= num_ROIs_2_analyze * images_per_reconstruction;
	//ROIs_per_test 										= ROIs_per_reconstruction * num_target_test_parameter_values;
	//ROIs_per_multiplot_data 							= ROIs_per_test * num_multiplot_parameter_values;
	//ROIs_per_test_iteration								= num_target_test_parameter_values * num_ROIs_2_analyze;									
	//before_TVS_index 									= 0;
	//after_TVS_index 									= 1;
	//TV_step_measurements_per_iteration					= 2;
	//TV_step_measurements_per_reconstruction 			= num_recon_iterations * TV_step_measurements_per_iteration;
	//TV_step_measurements_per_multiplot_curve 			= num_target_test_parameter_values * TV_step_measurements_per_iteration;
	//TV_step_measurements_per_multiplot 					= TV_step_measurements_per_multiplot_curve * num_multiplot_parameter_values;
	//TV_step_measurements_per_test 						= TV_step_measurements_per_reconstruction * num_target_test_parameter_values;				
	//TV_measurements_per_reconstruction 					= TV_step_measurements_per_reconstruction 	/ TV_step_measurements_per_iteration;
	//TV_measurements_per_multiplot_curve 				= TV_step_measurements_per_multiplot_curve 	/ TV_step_measurements_per_iteration;
	//TV_measurements_per_multiplot 						= TV_step_measurements_per_multiplot	 	/ TV_step_measurements_per_iteration;
	//TV_measurements_per_test 							= TV_step_measurements_per_test 			/ TV_step_measurements_per_iteration;					
	//num_input_directories_per_multiplot				= num_multiplot_parameter_values * num_target_test_parameter_values;	
	//*******************************************************************************************************************************************************************************************//
	//**** Parameter value test plot and multiplot data array sizing, indexing, and partitioning info used to identify, extract/collect, and plot subets of data ********************************//
	//*******************************************************************************************************************************************************************************************//
	//zero_line_by_target_parameter_values 			= newArray(num_target_test_parameter_values);					
	zero_line_by_iteration							= newArray(ROIs_per_reconstruction);
	zero_line_by_ROI								= newArray(num_ROIs_2_analyze);			
	//Array.fill										(zero_line_by_target_parameter_values, 0);	
	Array.fill										(zero_line_by_iteration, 0.0);
	Array.fill										(zero_line_by_ROI, 0.0);
	//ROI_material_RSP_line_by_target_parameter		= newArray(num_target_test_parameter_values);
	ROI_material_RSP_line_no_air					= Array.slice(ROI_material_RSPs, 2, num_ROIs_2_analyze);			
	ROI_material_RSPs_by_iteration					= newArray(ROIs_per_reconstruction);
	RSPs_by_ROI										= newArray(ROIs_per_reconstruction);
	RSPs_by_iteration								= newArray(ROIs_per_reconstruction);
	RSP_errors_by_ROI								= newArray(ROIs_per_reconstruction);
	RSP_errors_by_iteration							= newArray(ROIs_per_reconstruction);
	std_devs_by_ROI									= newArray(ROIs_per_reconstruction);
	std_devs_by_iteration							= newArray(ROIs_per_reconstruction);			
	TV_measurements_by_iteration					= newArray(ROIs_per_reconstruction);
	//indices_4_ordering_data 						= generate_ordering_indices(num_recon_iterations, num_ROIs_2_analyze, images_per_reconstruction, num_target_test_parameter_values);
	if(log_printing)
	{				
		if(printing_ROI_definitions)
			print_ROI_definitions						(bulk_material, bulk_material_RSP, ROI_profile_radius_beyond_ROI, ROI_selection_radii, ROI_shapes, ROI_material_names, ROI_labels, ROI_diameters);
		if(printing_reconstructed_image_analysis_info)						
			print_reconstructed_image_analysis_info		();
		//if(printing_parameter_value_test_info)								
		//	print_parameter_value_test_info				();
		//if(printing_multiplot_parameter_info)							
		//	print_multiplot_parameter_info				();
	}
	//exit();
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//**************************************************************************************************************************************************************************************************//
	//***************************************************** Repeat analysis routines for each specified slice of the image *****************************************************************************//
	//**************************************************************************************************************************************************************************************************//		
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	if(perform_ROI_analysis)
	{
		print_major_log_section_separator											("Performing analysis of = " + directory_path );
		for(slice_2_analyze_index = 0; slice_2_analyze_index < num_slices_2_analyze; slice_2_analyze_index++)
		{
		
			//**************************************************************************************************************************************************************************************************//
			//*********************************************** Repeat analysis routines for each specified circular region diameter *****************************************************************************//
			//**************************************************************************************************************************************************************************************************//		
			for(ROI_selection_diameter_index = 0; ROI_selection_diameter_index < ROI_selection_diameters.length; ROI_selection_diameter_index++)
			{
				slice								= slices_2_analyze[slice_2_analyze_index];
				slice_string						= slices_2_analyze_strings[slice_2_analyze_index];
				ROI_selection_radius 				= ROI_selection_radii[ROI_selection_diameter_index];
				ROI_selection_diameter				= ROI_selection_diameters[ROI_selection_diameter_index];
				centersy 							= set_ROI_y_coordinates(slice, x_rows, centersy_offsets);			
				slice_2_analyze_folder 				= slices_2_analyze_folders[slice_2_analyze_index];
				slice_2_analyze_directory 			= directory_path + slice_2_analyze_folder;			
				ROI_selection_diameter_folder		= ROI_selection_diameter_folders[ROI_selection_diameter_index] + folder_separator;			
				ROI_selection_diameter_directory	= directory_path + slice_2_analyze_folder + ROI_selection_diameter_folder;	
				File.makeDirectory					(slice_2_analyze_directory);
				File.makeDirectory					(ROI_selection_diameter_directory);

				append_2_log						(directory_path);
				append_2_log						(ROI_selection_diameter_directory);
				run									("Input/Output...", "jpeg=85 gif=-1 file=.csv copy_column copy_row save_column save_row");
				if(log_printing)
				{
					print							("directory_path = " 					+ directory_path);
					print							("slice_2_analyze_directory = " 		+ slice_2_analyze_directory);
					print							("ROI_selection_diameter_directory = " 	+ ROI_selection_diameter_directory);												
				}
				if(perform_selection_analysis)
				{
					print_major_log_section_separator							("Performing ROI analysis for the current slice and writing the extracted slice and resulting plots to disk as PNG images...");
					if(print_task_progress)
						print						("ROI analysis progress:");
					for(iteration = first_iteration_2_analyze; iteration <= last_iteration_2_analyze; iteration++)
			
					{
						if(print_task_progress)
							print					(TAB_STRING + "Analyzing iteration " + iteration + " of " + last_iteration_2_analyze + "...");
						iteration_string			= iterations_2_analyze_strings[iteration];
						TXT_image_filename 			= reconstructed_image_strings[iteration] + TXT;
						PNG_image_filename 			= reconstructed_image_strings[iteration] + PNG;			
						open_reconstructed_image	(directory_path, TXT_image_filename);
						//**************************************************************************************************************************************************************************************************//
						//********************************************** Extract and save PNG of the slice of x being analysed *********************************************************************************************//
						//**************************************************************************************************************************************************************************************************//
						if(write_slice_2_PNG && ROI_selection_diameter == ROI_selection_diameters[0]) // PNG_image_filename = "x_#.png"
						{
							//extract_slice(slice, x_magnification, flip_horizontally, flip_vertically, grayscale_range_min, grayscale_range_max, PNG_image_filename, print_slice_ops);
							slice_2_PNG				(slice_2_analyze_directory, PNG_image_filename, slice, x_magnification, flip_horizontally, flip_vertically, grayscale_range_min, grayscale_range_max, overwrite_slice_2_PNG, PNG_image_filename, close_saved_PNG_image, print_slice_ops );
						}
						//**************************************************************************************************************************************************************************************************//
						//************* Plot profile analysis: extract profile along line across the diameter and through the center of the ROIs and write results to disk **********************************************//
						//**************************************************************************************************************************************************************************************************//
						if(line_profile_on)
						{
							//print					("-------> Extracting line profile through each region of interest, writing the data and resulting plot to disk as CSV and PNG files, respectively...");			
							legend_entries		= newArray("Profile through ROI", "Predicted ROI Profile", "Selection Center"									);
							xlabel 				= "x [mm]";
							ylabel 				= "RSP(x)";
							for (ROI = 0; ROI < num_ROIs_2_analyze; ROI++)
							{
				
								title 				= "Line profile for " + ROI_labels[ROI] + " in slice " +  slice_string + " after " + iteration_string + " iterations";
								text 				= current_parameters_string + "\nLine profile for " + ROI_labels[ROI] + " in slice " +  slice_string + " after " + iteration_string + " iterations";
								//function line_profile(_ROI_number, _ROI_x, _ROI_y, _ROI_radius, _profile_radius, _profile_direction, _base_value, _ref_value, 							_voxel_dimensions, _x_frame_size, _y_frame_size, _title, _text, _text_size, _xlabel, _ylabel, _add_text_justification, _legend_entries, _legend_text_size, _plot_parameters, _is_gradient_analysis)
								profile				= line_profile(ROI, centersx[ROI], centersy[ROI], ROI_radii[ROI], ROI_profile_radii[ROI], x_direction, bulk_material_RSP, ROI_material_RSPs[ROI], voxel_dimensions, write_profile_plot, title, text, text_size, xlabel, ylabel, legend_entries, legend_text_size, plot_parameters, false);
								filename 			= profile_data_file_basenames + "_" + ROI_labels[ROI] + "_" + reconstructed_image_strings[iteration] + PNG;
								if(write_profile_plot)	//profile_data_file_basenames = "Line_Profile";
									save_PNG			(ROI_selection_diameter_directory, filename, overwrite_profile_plot, close_saved_PNG_image, print_output_PNG_path);
								//else
								//	close				();							
							}//END for (ROI = 0; ROI < num_ROIs_2_analyze; ROI++)
							filename				= profile_CSV_basename + "_" + reconstructed_image_strings[iteration] + CSV;
							if(write_profile_data)
		//profile_CSV_basename = "Line_Profiles";
								results_table_2_CSV	(ROI_selection_diameter_directory, filename, overwrite_profile_data, print_output_CSV_path, clear_results_table);
						}
						//exit();
						//*******************************************************************************************************************************************************************************************************//
						//************** Select circular region inside each ROI, record its area and RSP mean/min/max/standard deviation values and write results to disk ****************************************************//
						//*******************************************************************************************************************************************************************************************************//
						if(perform_region_analysis)
						{
							//print("-------> Performing analysis of ROIs of reconstructed images from each iteration of feasibility seeking (and potentially including TVS)...");	
							filename = regions_data_file_basenames + "_" + reconstructed_image_strings[iteration] + CSV;
							for (ROI = 0; ROI < num_ROIs_2_analyze; ROI++)
							{			
								//makeOval									(centersx[ROI] - ROI_selection_radius, centersy[ROI] - ROI_selection_radius, ROI_selection_diameter, ROI_selection_diameter);
								if(ROI_selection_diameter % 2 == 1)
								{
									selection_center_x = centersx[ROI] + 0.5; 
									selection_center_y = centersy[ROI] + 0.5; 
								}
								else
								{
									selection_center_x = centersx[ROI]; 
									selection_center_y = centersy[ROI]; 
								}
								run											("Specify...", "width=" + ROI_selection_diameter + " height=" + ROI_selection_diameter + " x=" + selection_center_x + " y=" + selection_center_y + " oval centered");
								run											("Measure");
								List.setMeasurements;
								by_ROI_index 								= iteration * num_ROIs_2_analyze + ROI;					// Grouping all measurements for each iteration together  	
								by_iteration_index 							= ROI * images_per_reconstruction + iteration;	// Grouping all measurements for each ROI together 
								mean_RSP_val 								= List.getValue("Mean");
								RSPs_by_ROI[by_ROI_index] 					= mean_RSP_val;	
								RSPs_by_iteration[by_iteration_index] 		= mean_RSP_val;	
								RSP_error									= (mean_RSP_val - ROI_material_RSPs[ROI]) / ROI_material_RSPs[ROI] * 100;
								RSP_errors_by_ROI[by_ROI_index] 			= RSP_error;	
								RSP_errors_by_iteration[by_iteration_index] = RSP_error;	
								std_dev_ROI 								= List.getValue("StdDev");
								std_devs_by_ROI[by_ROI_index] 				= std_dev_ROI;	
								std_devs_by_iteration[by_iteration_index] 	= std_dev_ROI;	
								setResult									(ROI_material_RSP_column_label, ROI, ROI_material_RSPs[ROI]);
								setResult									(RSP_error_column_label, ROI, RSP_error);									
							}	
							if(write_regions_data)							//regions_data_file_basenames = "Region_Statistics";
								results_table_2_CSV							(ROI_selection_diameter_directory, filename, overwrite_regions_data, print_output_CSV_path, clear_results_table);					
						}
						//run("Clear Results");	
						//**************************************************************************************************************************************************************************************************//
						//***** Plot gradient profile analysis: define a line across the diameter of ROIs through their center, extract profile along this line, and write profile values to disk ***********************//
						//**************************************************************************************************************************************************************************************************//				
						if( gradient_profile_on )
						{	
							//print						("-------> Extracting gradient line profile through ROIs and performing gradient analysis, writing the data and resulting plot to disk as CSV and PNG files, respectively...");				
							makeRectangle				(0, 0, x_columns, x_height);			
							run							("Convolve...", "text1=" + gradient_x_kernel + " normalize"); // Scharr-x		
							xlabel 						= "x [mm]";
							ylabel 						= "d/dx[RSP(x)])";
							legend_entries 				= newArray("Gradient Profile through ROI", "Predicted Gradient Profile", "Selection Center");
							for(ROI = 0; ROI < num_ROIs_2_analyze; ROI++)
							{						
								title 					= "Line gradient for " + ROI_labels[ROI] + " in slice " +  slice_string + " after " + iteration_string + " iterations" ;
								text 					= current_parameters_string + "\nLine gradient for " + ROI_labels[ROI] + " in slice " +  slice_string + " after " + iteration_string + " iterations";
								//function line_profile(_ROI_number, _ROI_x, _ROI_y, _ROI_radius, _profile_radius, _profile_direction, _base_value, _ref_value, _voxel_dimensions, _x_frame_size, _y_frame_size, _title, _text, _text_size, _xlabel, _ylabel, _add_text_justification, _legend_entries, _legend_text_size, _plot_parameters, _is_gradient_analysis)
								//profile				= line_profile(ROI, centersx[ROI], centersy[ROI], ROI_radii[ROI], ROI_profile_radii[ROI], x_direction, bulk_material_RSP, ROI_material_RSPs[ROI], voxel_dimensions, x_frame_size, y_frame_size, title, text, text_size, xlabel, ylabel, add_text_justification, legend_entries, legend_text_size, plot_parameters, false);
								gradient				= line_profile(ROI, centersx[ROI], centersy[ROI], ROI_radii[ROI], ROI_profile_radii[ROI], x_direction, bulk_material_RSP, ROI_material_RSPs[ROI], voxel_dimensions, write_gradient_plot, title, text, text_size, xlabel, ylabel, legend_entries, legend_text_size, plot_parameters, true);										
								filename				= gradient_data_file_basenames + "_" + ROI_labels[ROI] + "_" + reconstructed_image_strings[iteration] + PNG;
								if(write_gradient_plot)	//gradient_data_file_basenames = "Gradient";
									save_PNG			(ROI_selection_diameter_directory, filename, overwrite_gradient_plot, close_saved_PNG_image, print_output_PNG_path);
								//else
								//	close				();																								
							}// END for(ROI = 0; ROI < num_ROIs_2_analyze; ROI++)					
							filename 					= gradient_CSV_basename + "_" + reconstructed_image_strings[iteration] + CSV;
							if(write_gradient_data)		//gradient_CSV_basename = "Gradients";
								results_table_2_CSV		(ROI_selection_diameter_directory, filename, overwrite_gradient_data, print_output_CSV_path, clear_results_table);											
						}//END if(gradient_profile_on)
						close(TXT_image_filename);
					}// END for(iteration = first_iteration_2_analyze; iteration <= last_iteration_2_analyze; iteration++)
					if(write_RSP_CSV)						//RSP_CSV_filename = "RSP" + CSV;	
						array_2_CSV(num_ROIs_2_analyze, images_per_reconstruction, RSPs_by_iteration, 		ROI_selection_diameter_directory, 	RSP_CSV_filename, 		print_output_CSV_path, overwrite_RSP_CSV);
					if(write_RSP_error_CSV)					//RSP_error_CSV_filename = "RSP_Error" + CSV;
						array_2_CSV(num_ROIs_2_analyze, images_per_reconstruction, RSP_errors_by_iteration,	ROI_selection_diameter_directory, 	RSP_error_CSV_filename, print_output_CSV_path, overwrite_RSP_error_CSV);			
					if(write_std_dev_CSV)					//std_dev_CSV_filename = "Std_Dev" + CSV;
						array_2_CSV(num_ROIs_2_analyze, images_per_reconstruction, std_devs_by_iteration, 	ROI_selection_diameter_directory, 	std_dev_CSV_filename,	print_output_CSV_path, overwrite_std_dev_CSV);						
					//exit();					
				}// END if(perform_ROI_analysis)	
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//***************************************************************************************************************************************************************************************************************//
		//************************************** Perform analyses of measurements vs. ROI or predicted RSP (ROIs defined in increasing RSP order) ***********************************************************************//
		//***************************************************************************************************************************************************************************************************************//		
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				//print_by_ROI_selection_diameter_data();					
				//print_by_iteration_data();
				if(perform_vs_predicted_RSP_analysis)
				{
					print_major_log_section_separator("Performing analyses of measurements vs. predicted ROI RSP for the current slice and writing the resulting plots to disk as PNG images...");
					if(print_task_progress)
						print						("Reconstructed vs. Predicted analysis progress:");
					for(iteration = first_iteration_2_analyze; iteration <= last_iteration_2_analyze; iteration++)
					{	
						if(print_task_progress)
							print					(TAB_STRING + "Analyzing iteration " + iteration + " of " + last_iteration_2_analyze + "...");
						iteration_string					= iterations_2_analyze_strings[iteration];
						by_ROI_start_index 					= iteration * num_ROIs_2_analyze;							// Index of the 1st ROI's measurements for current iteration
						by_ROI_end_index 					= (iteration + 1) * num_ROIs_2_analyze;					// Index of the last ROI's measurements for current iteration
						current_RSPs_by_ROI 				= Array.slice(RSPs_by_ROI, by_ROI_start_index, by_ROI_end_index); 
						current_RSP_errors_by_ROI			= Array.slice(RSP_errors_by_ROI, by_ROI_start_index, by_ROI_end_index); 
						current_std_devs_by_ROI 			= Array.slice(std_devs_by_ROI, by_ROI_start_index, by_ROI_end_index); 			
						current_RSPs_by_ROI_no_air 			= Array.slice(RSPs_by_ROI, by_ROI_start_index + 2, by_ROI_end_index); 
						current_RSP_errors_by_ROI_no_air	= Array.slice(RSP_errors_by_ROI, by_ROI_start_index + 2, by_ROI_end_index); 
						current_std_devs_by_ROI_no_air 		= Array.slice(std_devs_by_ROI, by_ROI_start_index + 2, by_ROI_end_index); 			
						//print_current_by_ROI_selection_diameter_data();					
						//*******************************************************************************************************************************************************************************************************//
						//*************** Plot % error between predicted and measured RSP vs. predicted RSP and write the resulting image/data to disk as PNG/CSV ***************************************************************//
						//*******************************************************************************************************************************************************************************************************//				
						if(plot_measured_vs_predicted_RSP)
						{
							//print				("-------> Plotting predicted vs. measured RSP and writing image to disk as PNG...");			
							title 				= "Predicted vs. Measured RSP after " + iteration_string + " iterations" + " for slice " +  slice_string;
							text 				= current_parameters_string + "\nPredicted vs. Measured RSP after " + iteration_string + " iterations" + " for slice " +  slice_string;
							xlabel 				= "Predicted RSP";
							ylabel				= "% Error";
							legend_entries 		= newArray("Predicted vs. Mean RSP", "Predicted RSP Line");
							Plot.create			(title, xlabel, ylabel, ROI_material_RSPs, current_RSPs_by_ROI);
							Plot.setLimits		(0, ROI_material_RSPs[num_ROIs_2_analyze - 1], 0, ROI_material_RSPs[num_ROIs_2_analyze - 1]);
							Plot.setColor		("yellow");
							Plot.add			("error bars", current_RSPs_by_ROI, current_std_devs_by_ROI);
							//set_plot_props		(legend_entries, x_frame_size, y_frame_size, text, text_xpos_ratio, text_ypos_ratio, add_line_color, linewidth);					
							set_plot_props		(legend_entries, legend_text_size, x_frame_size, y_frame_size, text, text_size, text_xpos_ratio, text_ypos_ratio, add_text_justification, add_line_color, linewidth	);					
							Plot.setColor		("yellow");
							Plot.setColor		(add_line_color);
							Plot.add			("line", ROI_material_RSPs, ROI_material_RSPs);
							//set_plot_data_props	(data_line_color, add_text_justification);					
							set_plot_data_props	(data_line_color, add_text_justification, x_frame_size, y_frame_size											);			
							filename 			= RSP_comparison_basename + "_" + reconstructed_image_strings[iteration] + PNG;
							if(write_RSP_comparison_plot)//RSP_comparison_basename = "RSP_Comparison";
								save_PNG		(ROI_selection_diameter_directory, filename, overwrite_RSP_comparison_plot, close_saved_PNG_image, print_output_PNG_path);												
						}
						//*******************************************************************************************************************************************************************************************************//
						//*************** Plot % error between predicted and measured RSP vs. predicted RSP and write the resulting image/data to disk as PNG/CSV ***************************************************************//
						//*******************************************************************************************************************************************************************************************************//				
						if(plot_ROI_errors_vs_predicted_RSP)
						{
							//print				("-------> Plotting RSP % error vs true RSP and writing image to disk as PNG...");			
							plot_extrema		= set_plot_extrema(current_RSP_errors_by_ROI_no_air, zero_line_by_ROI, tolerance, lower_limits_scale, upper_limits_scale, difference_scale);
							ymin 				= plot_extrema[0];
							ymax				= plot_extrema[1];
							title 				= "% error vs. predicted RSP after " + iteration_string + " iterations" + " for slice " +  slice_string;
							text 				= current_parameters_string + "\nRSP % error between reconstructed and predicted RSP after " + iteration_string + " iterations" + " for slice " +  slice_string;
							xlabel				= "Predicted RSP";
							ylabel 				= "RSP % Error";
							legend_entries 		= newArray("RSP % Error", "Optimal % Error"																);
							Plot.create			(title, xlabel, ylabel, ROI_material_RSP_line_no_air, current_RSP_errors_by_ROI_no_air );
							Plot.setLimits		(ROI_material_RSPs[2], ROI_material_RSPs[num_ROIs_2_analyze - 1], ymin, ymax);
							//set_plot_props		(legend_entries, x_frame_size, y_frame_size, text, text_xpos_ratio, text_ypos_ratio, add_line_color, linewidth);					
							set_plot_props		(legend_entries, legend_text_size, x_frame_size, y_frame_size, text, text_size, text_xpos_ratio, text_ypos_ratio, add_text_justification, add_line_color, linewidth	);					
							Plot.add			("line", zero_line_by_ROI);
							Plot.setColor		(data_line_color);
							//Plot.add			("error bars", mean_RSPs, std_devs);
							//set_plot_data_props	(data_line_color, add_text_justification);									
							set_plot_data_props	(data_line_color, add_text_justification, x_frame_size, y_frame_size											);			
							filename			= RSP_error_comparison_basename + "_" + reconstructed_image_strings[iteration] + PNG;
							if(write_RSP_error_comparison_plot)//RSP_error_comparison_basename = "RSP_Error_Comparison";
								save_PNG		(ROI_selection_diameter_directory, filename, overwrite_RSP_error_comparison_plot, close_saved_PNG_image, print_output_PNG_path);												
						}
						//*******************************************************************************************************************************************************************************************************//
						//*************** Plot standard deviation vs. predicted RSP and write the resulting image/data to disk as PNG/CSV ***************************************************************//
						//*******************************************************************************************************************************************************************************************************//				
						if(plot_ROI_std_dev_vs_predicted_RSP)
						{
							//print				("-------> Plotting RSP standard deviation vs true RSP and writing image to disk as PNG...");			
							plot_extrema		= set_plot_extrema(current_std_devs_by_ROI, zero_line_by_ROI, tolerance, lower_limits_scale, upper_limits_scale, difference_scale);
							ymin 				= plot_extrema[0];
							ymax				= plot_extrema[1];
							title 				= "Standard deviation vs. predicted RSP after " + iteration_string + " iterations" + " for slice " +  slice_string;
							text 				= current_parameters_string + "\nStandard deviation vs. predicted RSP after " + iteration_string + " iterations" + " for slice " +  slice_string;
							xlabel				= "Predicted RSP";
							ylabel 				= "Standard Deviation";
							legend_entries 		= newArray("Standard Deviation", "Optimal Standard Deviation"																);
							Plot.create			(title, xlabel, ylabel, ROI_material_RSPs, current_std_devs_by_ROI );
							Plot.setLimits		(ROI_material_RSPs[2], ROI_material_RSPs[num_ROIs_2_analyze - 1], ymin, ymax);
							//set_plot_props		(legend_entries, x_frame_size, y_frame_size, text, text_xpos_ratio, text_ypos_ratio, add_line_color, linewidth);					
							set_plot_props		(legend_entries, legend_text_size, x_frame_size, y_frame_size, text, text_size, text_xpos_ratio, text_ypos_ratio, add_text_justification, add_line_color, linewidth	);					
							Plot.add			("line", zero_line_by_ROI);
							Plot.setColor		(data_line_color);
							//Plot.add			("error bars", mean_RSPs, std_devs);
							//set_plot_data_props	(data_line_color, add_text_justification);	
							set_plot_data_props	(data_line_color, add_text_justification, x_frame_size, y_frame_size											);			
							filename			= std_dev_comparison_basename + "_" + reconstructed_image_strings[iteration] + PNG;
							if(write_std_dev_comparison_plot)//std_dev_comparison_basename = "Std_Dev_Comparison";
								save_PNG		(ROI_selection_diameter_directory, filename, overwrite_std_dev_comparison_plot, close_saved_PNG_image, print_output_PNG_path);												
						}				
					}// END for(iteration = first_iteration_2_analyze; iteration <= last_iteration_2_analyze; iteration++)		
					//exit();		
				}// END if(perform_vs_predicted_RSP_analysis)
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//*******************************************************************************************************************************************************************************************************************//
		//*********************************************************** Perform analyses of measurements vs. iteration ********************************************************************************************************//
		//*******************************************************************************************************************************************************************************************************************//		
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				if(perform_vs_iteration_analysis)
				{
					print_major_log_section_separator("Performing analyses of measurements vs. iteration for the current slice and writing the resulting plots to disk as PNG images...");
					if(print_task_progress)
						print						("Convergence analysis progress:");
					for(ROI = 0; ROI < num_ROIs_2_analyze; ROI++)
					{
						if(print_task_progress)
							print					(TAB_STRING + "Analyzing ROI " + d2s(ROI + 1, 0) + " of " + num_ROIs_2_analyze + "...");
						by_iteration_start_index 		= ROI * images_per_reconstruction;
						by_iteration_end_index 			= ROI * images_per_reconstruction + num_recon_iterations + 1;
						current_RSPs_by_iteration		= Array.slice(RSPs_by_iteration, by_iteration_start_index, by_iteration_end_index); 
						current_RSP_errors_by_iteration	= Array.slice(RSP_errors_by_iteration, by_iteration_start_index, by_iteration_end_index); 
						current_std_devs_by_iteration 	= Array.slice(std_devs_by_iteration, by_iteration_start_index, by_iteration_end_index); 				
						//print_current_by_iteration_data	();				
						//*******************************************************************************************************************************************************************************************************//
						//********************************** Plots of RSP as a function of iteration (showing convergence behavior) *********************************************************************************************//
						//*******************************************************************************************************************************************************************************************************//
						if(RSP_analysis_on)
						{
							//print				("-------> Plotting mean RSP as a function of iteration and writing image to disk as PNG...");			
							title 				= "Convergence of mean RSP as a function of iteration for " + ROI_labels[ROI] + " in slice " +  slice_string;
							text 				= current_parameters_string + "\nConvergence of mean RSP as a function of iteration for " + ROI_labels[ROI] + " in slice " +  slice_string;
							xlabel				= "i [Iteration #]";
							ylabel 				= "Mean RSP(i)";
							Array.fill			(ROI_material_RSPs_by_iteration, ROI_material_RSPs[ROI]);
							plot_extrema		= set_plot_extrema(current_RSPs_by_iteration, ROI_material_RSPs_by_iteration, tolerance, lower_limits_scale, upper_limits_scale, difference_scale);
							ymin 				= plot_extrema[0];
							ymax  				= plot_extrema[1];
							legend_entries 		= newArray("RSP vs. Iteration", "Predicted RSP");
							Plot.create			(title, xlabel, ylabel, iterations_2_analyze, current_RSPs_by_iteration );
							Plot.setLimits		(first_iteration_2_analyze, last_iteration_2_analyze, ymin, ymax);					
							//set_plot_props		(legend_entries, x_frame_size, y_frame_size, text, text_xpos_ratio, text_ypos_ratio, add_line_color, linewidth);					
							set_plot_props		(legend_entries, legend_text_size, x_frame_size, y_frame_size, text, text_size, text_xpos_ratio, text_ypos_ratio, add_text_justification, add_line_color, linewidth	);					
							Plot.add			("line", ROI_material_RSPs_by_iteration);				
							//set_plot_data_props	(data_line_color, add_text_justification);
							set_plot_data_props	(data_line_color, add_text_justification, x_frame_size, y_frame_size											);			
							filename			= RSP_data_file_basenames + "_" + ROI_labels[ROI] + PNG;
							if(write_RSP_plot)	//RSP_data_file_basenames = "RSP";
								save_PNG		(ROI_selection_diameter_directory, filename, overwrite_RSP_plot, close_saved_PNG_image, print_output_PNG_path);									
						}	
						//*******************************************************************************************************************************************************************************************************//
						//************************ Plot of the RSP % error between predicted and reconstructed RSPs as a function of iteration **********************************************************************************//
						//*******************************************************************************************************************************************************************************************************//
						if(RSP_error_analysis_on)
						{
							//print				("-------> Plotting RSP % error as a function of iteration and writing image to disk as PNG...");			
							plot_extrema		= set_plot_extrema(current_RSP_errors_by_iteration, zero_line_by_iteration, tolerance, lower_limits_scale, upper_limits_scale, difference_scale);
							ymin 				= plot_extrema[0];
							ymax				= plot_extrema[1];
							title		 		= "RSP % error as a function of iteration for " + ROI_labels[ROI] + " in slice " +  slice_string;
							text 				= current_parameters_string + "\nRSP % error as a function of iteration for " + ROI_labels[ROI] + " in slice " +  slice_string;
							xlabel				= "i [Iteration #]";
							ylabel 				= "RSP % Error";
							legend_entries 		= newArray("RSP % Error vs. Iteration", "Optimal % Error");
							Plot.create			(title, xlabel, ylabel, iterations_2_analyze, current_RSP_errors_by_iteration );
							Plot.setLimits		(first_iteration_2_analyze, last_iteration_2_analyze, ymin, ymax);
							//set_plot_props		(legend_entries, x_frame_size, y_frame_size, text, text_xpos_ratio, text_ypos_ratio, add_line_color, linewidth);					
							set_plot_props		(legend_entries, legend_text_size, x_frame_size, y_frame_size, text, text_size, text_xpos_ratio, text_ypos_ratio, add_text_justification, add_line_color, linewidth	);					
							Plot.add			("line", zero_line_by_iteration);
							//set_plot_data_props	(data_line_color, add_text_justification);
							set_plot_data_props	(data_line_color, add_text_justification, x_frame_size, y_frame_size											);			
							filename			= RSP_error_basename + "_" + ROI_labels[ROI] + PNG;
							if(write_RSP_error_plot)//RSP_error_basename = "RSP_Error";
								save_PNG		(ROI_selection_diameter_directory, filename, overwrite_RSP_error_plot, close_saved_PNG_image, print_output_PNG_path);																
						}
					//***********************************************************************************************************************************************************************************************************//
					//******************************************************************** Standard deviation analysis **********************************************************************************************************//
					//***********************************************************************************************************************************************************************************************************//
						if(std_dev_analysis_on)
						{
							//print("-------> Performing standard deviation trend analysis, writing the data and resulting plot to disk as CSV and PNG files, respectively...");				
							plot_extrema		= set_plot_extrema(current_std_devs_by_iteration, zero_line_by_iteration, tolerance, lower_limits_scale, upper_limits_scale, difference_scale);
							ymin 				= plot_extrema[0];
							ymax				= plot_extrema[1];
							xlabel				= "i [Iteration #]";
							ylabel 				= "Standard deviation(i)";
							title 				= "Standard deviation as a function of iteration for " + ROI_labels[ROI] + " in slice " +  slice_string;
							text 				= current_parameters_string + "\nStandard deviation as a function of iteration for " + ROI_labels[ROI] + " in slice " +  slice_string;
							legend_entries 		= newArray("Standard Deviation vs. Iteration", "Optimal Standard Deviation");
							Plot.create			(title, xlabel, ylabel, iterations_2_analyze, current_std_devs_by_iteration );
							//Plot.getValues	(xpoints, ypoints);
							Plot.setLimits		(first_iteration_2_analyze, last_iteration_2_analyze, ymin, ymax);
							//set_plot_props		(legend_entries, x_frame_size, y_frame_size, text, text_xpos_ratio, text_ypos_ratio, add_line_color, linewidth);					
							set_plot_props		(legend_entries, legend_text_size, x_frame_size, y_frame_size, text, text_size, text_xpos_ratio, text_ypos_ratio, add_text_justification, add_line_color, linewidth	);					
							Plot.add			("line", zero_line_by_iteration);
							//set_plot_data_props	(data_line_color, add_text_justification);					
							set_plot_data_props	(data_line_color, add_text_justification, x_frame_size, y_frame_size											);			
							filename			= std_dev_basename + "_" + ROI_labels[ROI] + PNG;
							if(write_std_dev_plot)//std_dev_basename = "Std_Dev";
								save_PNG		(ROI_selection_diameter_directory, filename, overwrite_std_dev_plot, close_saved_PNG_image, print_output_PNG_path);												
						}		
					}// END for(ROI = 0; ROI < num_ROIs_2_analyze; ROI++)
				}// END if(perform_vs_iteration_analysis)
				run("Clear Results");				
			}// END for(ROI_selection_diameter_index = 0; ROI_selection_diameter_index < ROI_selection_diameters.length; ROI_selection_diameter_index++)
		}// END for(slice_2_analyze_index = 0; slice_2_analyze_index < num_slices_2_analyze; slice_2_analyze_index++)	
	}// END if(perform_ROI_analysis)
	//**************************************************************************************************************************************************************************************************//
	//*************************** Perform analysis of TV measurements, plot TV vs iteration, and write image to disk as PNG ****************************************************************************//
	//**************************************************************************************************************************************************************************************************//
	if(perform_TV_analysis)
	{
		print_major_log_section_separator("Performing analysis of total variation (TV) as a function of iteration and writing the resulting plots to disk as PNG images...");			
		before_TVS_data		= newArray(num_recon_iterations);
		after_TVS_data		= newArray(num_recon_iterations);
		TVS_data 			= file_2_array(directory_path, TV_measurements_TXT_filename, print_input_data_path);
		x_axis_data			= Array.slice(iterations_2_analyze, 1, num_recon_iterations + 1);
		for(iteration = 0; iteration < num_recon_iterations; iteration++)
		{
			start_index 				= 2 * iteration;
			before_TVS_data[iteration] 	= TVS_data[start_index];
			after_TVS_data[iteration]  	= TVS_data[start_index + 1];
		}
		if(plot_TV_analysis)
		{
			print				("-------> Plotting TV before and after TVS vs. iteration as separate curves and writing image to disk as PNG...");			
			plot_extrema		= set_plot_extrema(before_TVS_data, after_TVS_data, tolerance, lower_limits_scale, upper_limits_scale, difference_scale);						
			ymin 				= plot_extrema[0];
			ymax				= plot_extrema[1];
			title		 		= "TV measurements vs. Iteration";
			text 				= current_parameters_string + "\nTV measurements vs. Iteration";
			xlabel				= "i [Iteration #]";
			ylabel 				= "Total Variation (TV)";
			legend_entries 		= newArray("TV After TVS", "TV Before TVS");
			Plot.create			(title, xlabel, ylabel, x_axis_data, after_TVS_data);
			Plot.setLimits		(1, num_recon_iterations, ymin, ymax);
			//set_plot_props		(legend_entries, x_frame_size, y_frame_size, text, text_xpos_ratio, text_ypos_ratio, add_line_color, linewidth);					
			set_plot_props		(legend_entries, legend_text_size, x_frame_size, y_frame_size, text, text_size, text_xpos_ratio, text_ypos_ratio, add_text_justification, add_line_color, linewidth	);					
			Plot.add			("line", x_axis_data, before_TVS_data);
			//set_plot_data_props	(data_line_color, add_text_justification);		
			set_plot_data_props	(data_line_color, add_text_justification, x_frame_size, y_frame_size											);			
			if(write_TV_analysis_plot)
				save_PNG		(directory_path, TV_measurements_plot_filename, overwrite_TV_analysis_plot, close_saved_PNG_image, PRINT_PATH);	//print_output_PNG_path
		}	
		if(plot_TV_step_analysis)
		{
			print				("-------> Plotting TV before/after TVS vs. iteration as single step curve and writing image to disk as PNG...");								
			TV_step_data	 	= newArray(before_TVS_data.length + after_TVS_data.length);
			x_axis_data			= newArray(before_TVS_data.length + after_TVS_data.length);
			x_axis_data_min		= 1;
			for(i = 0; i < before_TVS_data.length; i++)
			{
				start_index 					= 2 * i;
				TV_step_data[start_index] 		= before_TVS_data[i];
				TV_step_data[start_index + 1] 	= after_TVS_data[i];	
				x_axis_data[start_index] 		= x_axis_data_min + i;					
				x_axis_data[start_index + 1] 	= x_axis_data_min + i;
			}
			plot_extrema		= set_plot_extrema(before_TVS_data, after_TVS_data, tolerance, lower_limits_scale, upper_limits_scale, difference_scale);						
			ymin 				= plot_extrema[0];
			ymax				= plot_extrema[1];
			title		 		= "TV measurements vs. Iteration";
			text 				= current_parameters_string + "\nTV measurements vs. Iteration";
			xlabel				= "i [Iteration #]";
			ylabel 				= "Total Variation (TV)";
			legend_entries 		= newArray("TV Before/After TVS");
			Plot.create			(title, xlabel, ylabel, x_axis_data, TV_step_data );
			Plot.setLimits		(1, num_recon_iterations, ymin, ymax);
			//set_plot_props		(legend_entries, x_frame_size, y_frame_size, text, text_xpos_ratio, text_ypos_ratio, add_line_color, linewidth);					
			set_plot_props		(legend_entries, legend_text_size, x_frame_size, y_frame_size, text, text_size, text_xpos_ratio, text_ypos_ratio, add_text_justification, add_line_color, linewidth	);					
			//Plot.add			("line", x_axis_data, after_TVS_data);
			//set_plot_data_props	("blue", add_text_justification);			
			set_plot_data_props	(data_line_color, add_text_justification, x_frame_size, y_frame_size											);			
			if(write_TV_step_analysis_plot)//TV_measurements_step_plot_filename		= "TV_step_plot" + PNG;
				save_PNG		(directory_path, TV_measurements_step_plot_filename, overwrite_TV_step_analysis_plot, close_saved_PNG_image, PRINT_PATH);	//print_output_PNG_path
		}// END: if(plot_TV_step_analysis)				
	}// END: if(perform_TV_analysis)	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//*******************************************************************************************************************************************************************************************************************//
	//*********************************************************** Perform analyses of measurements vs. iteration ********************************************************************************************************//
	//*******************************************************************************************************************************************************************************************************************//		
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	if(build_image_stacks)
	{
		print_major_log_section_separator("Constructing image stacks from image sets containing an image for each iteration and/or ROI and saving the resulting stacks as animated GIF and/or AVI video...");			
		for(slice_2_analyze_index = 0; slice_2_analyze_index < num_slices_2_analyze; slice_2_analyze_index++)
		{	
			slice									= slices_2_analyze[slice_2_analyze_index];
			slice_string							= slices_2_analyze_strings[slice_2_analyze_index];
			slice_2_analyze_folder					= slice_2_analyze_folder_prefix + slice_string + folder_separator;
			slice_2_analyze_directory 				= construct_valid_directory_path(directory_path, slice_2_analyze_folder);			
			if(build_slice_2_PNG_stack)		
			{
				image_set_filenames			= suffixes_2_filenames	(reconstructed_image_file_basenames, reconstructed_image_strings);
				animation_filename 			= reconstructed_image_file_basenames + reconstructed_image_range_string;
				stack_dimensions			= image_set_2_stack(PNG, slice_2_analyze_directory, reconstructed_image_strings, reconstructed_image_file_basenames, animation_filename, print_PNG_stack_image_paths, close_stack_image_sets);
				stack_2_animated_GIF		(animation_filename, slice_2_analyze_directory, animation_filename + GIF, GIF_frame_rate, GIF_stacks_2_disk, overwrite_GIF_stacks, print_GIF_stack_paths, close_animated_GIF_stack);
				stack_2_AVI					(animation_filename, slice_2_analyze_directory, animation_filename + AVI, AVI_compression_format, AVI_frame_rate, AVI_stacks_2_disk, overwrite_AVI_stacks, print_AVI_stack_paths, close_AVI_stack);
			}						
			//**************************************************************************************************************************************************************************************************//
			//*********************************************** Repeat analysis routines for each specified circular region diameter *****************************************************************************//
			//**************************************************************************************************************************************************************************************************//		
			for(ROI_selection_diameter_index = 0; ROI_selection_diameter_index < ROI_selection_diameters.length; ROI_selection_diameter_index++)
			{
				ROI_selection_radius 					= ROI_selection_radii[ROI_selection_diameter_index];
				ROI_selection_diameter					= ROI_selection_diameters[ROI_selection_diameter_index];
				ROI_selection_diameter_folder			= ROI_selection_diameter_folders[ROI_selection_diameter_index] + folder_separator;			
				//ROI_selection_diameter_directory		= directory_path + slice_2_analyze_folder + ROI_selection_diameter_folder;	
				ROI_selection_diameter_directory 		= construct_valid_directory_path(slice_2_analyze_directory, ROI_selection_diameter_folder);			
				run										("Input/Output...", "jpeg=85 gif=-1 file=.csv copy_column copy_row save_column save_row");
				if(build_by_iteration_image_stacks)
				{
					//print("-------> Constructing image stacks from image sets containing an image for each iteration and saving the resulting stacks as animated GIF and/or AVI video...");			
					if(build_RSP_comparison_plot_stack)		
					{//reconstructed_image_range_string = [x_0-x_12]
						image_set_filenames			= suffixes_2_filenames	(RSP_comparison_basename + "_", reconstructed_image_strings);
						animation_filename 			= RSP_comparison_animation_basename + "_" + ROI_labels[ROI_selection_diameter_index] + "_" + reconstructed_image_range_string;
						stack_dimensions			= image_set_2_stack(PNG, ROI_selection_diameter_directory, image_set_filenames, RSP_comparison_basename, animation_filename, print_PNG_stack_image_paths, close_stack_image_sets);
						stack_2_animated_GIF		(animation_filename, ROI_selection_diameter_directory, animation_filename + GIF, GIF_frame_rate, GIF_stacks_2_disk, overwrite_GIF_stacks, print_GIF_stack_paths, close_animated_GIF_stack);
						stack_2_AVI					(animation_filename, ROI_selection_diameter_directory, animation_filename + AVI, AVI_compression_format, AVI_frame_rate, AVI_stacks_2_disk, overwrite_AVI_stacks, print_AVI_stack_paths, close_AVI_stack);
					}
					if(build_RSP_error_comparison_plot_stack)		
					{//reconstructed_image_range_string = [x_0-x_12]
						image_set_filenames					= suffixes_2_filenames	(RSP_error_comparison_basename + "_", reconstructed_image_strings);
						animation_filename 					= RSP_error_comparison_animation_basename + "_" + ROI_labels[ROI_selection_diameter_index] + "_" + reconstructed_image_range_string;
						stack_dimensions					= image_set_2_stack(PNG, ROI_selection_diameter_directory, image_set_filenames, RSP_error_comparison_basename, animation_filename, print_PNG_stack_image_paths, close_stack_image_sets);
						stack_2_animated_GIF				(animation_filename, ROI_selection_diameter_directory, animation_filename + GIF, GIF_frame_rate, GIF_stacks_2_disk, overwrite_GIF_stacks, print_GIF_stack_paths, close_animated_GIF_stack);
						stack_2_AVI							(animation_filename, ROI_selection_diameter_directory, animation_filename + AVI, AVI_compression_format, AVI_frame_rate, AVI_stacks_2_disk, overwrite_AVI_stacks, print_AVI_stack_paths, close_AVI_stack);
					}
					if(build_std_dev_comparison_plot_stack)		
					{//reconstructed_image_range_string = [x_0-x_12]
						image_set_filenames				= suffixes_2_filenames	(std_dev_comparison_basename + "_", reconstructed_image_strings);
						animation_filename 				= std_dev_comparison_animation_basename + "_" + ROI_labels[ROI_selection_diameter_index] + "_" + reconstructed_image_range_string;
						stack_dimensions				= image_set_2_stack(PNG, ROI_selection_diameter_directory, image_set_filenames, std_dev_comparison_basename, animation_filename, print_PNG_stack_image_paths, close_stack_image_sets);
						stack_2_animated_GIF			(animation_filename, ROI_selection_diameter_directory, animation_filename + GIF, GIF_frame_rate, GIF_stacks_2_disk, overwrite_GIF_stacks, print_GIF_stack_paths, close_animated_GIF_stack);
						stack_2_AVI						(animation_filename, ROI_selection_diameter_directory, animation_filename + AVI, AVI_compression_format, AVI_frame_rate, AVI_stacks_2_disk, overwrite_AVI_stacks, print_AVI_stack_paths, close_AVI_stack);
					}
				}// END if(build_by_iteration_image_stacks)
				if(build_by_ROI_and_iteration_image_stacks)
				{
					//print("-------> Constructing image stacks from image sets containing an image for each iteration and ROI combination and saving the resulting stacks as animated GIF and/or AVI video...");			
					for(ROI_selection_diameter_index = 0; ROI_selection_diameter_index < num_ROIs_2_analyze; ROI_selection_diameter_index++)
					{		
						if(build_profile_plot_stack)
						{//reconstructed_image_range_string = [x_0-x_12]
							ROI_profile_plot_basename	= profile_data_file_basenames + "_" + ROI_labels[ROI_selection_diameter_index];
							image_set_filenames			= suffixes_2_filenames	(ROI_profile_plot_basename + "_", reconstructed_image_strings);
							animation_filename 			= profile_data_file_basenames + "_" + ROI_labels[ROI_selection_diameter_index] + "_" + reconstructed_image_range_string;
							stack_dimensions			= image_set_2_stack(PNG, ROI_selection_diameter_directory, image_set_filenames, profile_data_file_basenames, animation_filename, print_PNG_stack_image_paths, close_stack_image_sets);
							stack_2_animated_GIF		(animation_filename, ROI_selection_diameter_directory, animation_filename + GIF, GIF_frame_rate, GIF_stacks_2_disk, overwrite_GIF_stacks, print_GIF_stack_paths, close_animated_GIF_stack);
							stack_2_AVI					(animation_filename, ROI_selection_diameter_directory, animation_filename + AVI, AVI_compression_format, AVI_frame_rate, AVI_stacks_2_disk, overwrite_AVI_stacks, print_AVI_stack_paths, close_AVI_stack);
						}
						if(build_gradient_plot_stack)
						{//reconstructed_image_range_string = [x_0-x_12]
							ROI_gradient_plot_basename	= gradient_data_file_basenames + "_" + ROI_labels[ROI_selection_diameter_index];
							image_set_filenames			= suffixes_2_filenames	(ROI_gradient_plot_basename + "_", reconstructed_image_strings);
							animation_filename 			= gradient_data_file_basenames + "_" + ROI_labels[ROI_selection_diameter_index] + "_" + reconstructed_image_range_string;
							stack_dimensions			= image_set_2_stack(PNG, ROI_selection_diameter_directory, image_set_filenames, ROI_gradient_plot_basename, animation_filename, print_PNG_stack_image_paths, close_stack_image_sets);
							stack_2_animated_GIF		(animation_filename, ROI_selection_diameter_directory, animation_filename + GIF, GIF_frame_rate, GIF_stacks_2_disk, overwrite_GIF_stacks, print_GIF_stack_paths, close_animated_GIF_stack);
							stack_2_AVI					(animation_filename, ROI_selection_diameter_directory, animation_filename + AVI, AVI_compression_format, AVI_frame_rate, AVI_stacks_2_disk, overwrite_AVI_stacks, print_AVI_stack_paths, close_AVI_stack);
						}
					}// END for(n = 0; n < num_ROIs_2_analyze; n++)
				}// END if(build_by_ROI_and_iteration_image_stacks)
				if(build_by_ROI_image_stacks)
				{
					//print("-------> Constructing image stacks from image sets containing an image for each ROI and saving the resulting stacks as animated GIF and/or AVI video...");			
					if(build_RSP_plot_stack)
					{
						image_set_filenames			= suffixes_2_filenames	(RSP_data_file_basenames + "_", ROI_labels);
						animation_filename 			= RSP_animation_basename + "_[ROIs]";
						stack_dimensions			= image_set_2_stack(PNG, ROI_selection_diameter_directory, image_set_filenames, RSP_data_file_basenames, animation_filename, print_PNG_stack_image_paths, close_stack_image_sets);
						stack_2_animated_GIF		(animation_filename, ROI_selection_diameter_directory, animation_filename + GIF, GIF_frame_rate, GIF_stacks_2_disk, overwrite_GIF_stacks, print_GIF_stack_paths, close_animated_GIF_stack);
						stack_2_AVI					(animation_filename, ROI_selection_diameter_directory, animation_filename + AVI, AVI_compression_format, AVI_frame_rate, AVI_stacks_2_disk, overwrite_AVI_stacks, print_AVI_stack_paths, close_AVI_stack);
					}
					if(build_RSP_error_plot_stack)
					{
						image_set_filenames			= suffixes_2_filenames	(RSP_error_basename + "_", ROI_labels);
						animation_filename 			= RSP_error_animation_basename + "_[ROIs]";
						stack_dimensions			= image_set_2_stack(PNG, ROI_selection_diameter_directory, image_set_filenames, RSP_error_basename, animation_filename, print_PNG_stack_image_paths, close_stack_image_sets);
						stack_2_animated_GIF		(animation_filename, ROI_selection_diameter_directory, animation_filename + GIF, GIF_frame_rate, GIF_stacks_2_disk, overwrite_GIF_stacks, print_GIF_stack_paths, close_animated_GIF_stack);
						stack_2_AVI					(animation_filename, ROI_selection_diameter_directory, animation_filename + AVI, AVI_compression_format, AVI_frame_rate, AVI_stacks_2_disk, overwrite_AVI_stacks, print_AVI_stack_paths, close_AVI_stack);
					}
					if(build_std_dev_plot_stack)	
					{
						image_set_filenames			= suffixes_2_filenames	(std_dev_basename + "_", ROI_labels);
						animation_filename 			= std_dev_animation_basename + "_[ROIs]";
						stack_dimensions			= image_set_2_stack(PNG, ROI_selection_diameter_directory, image_set_filenames, std_dev_basename, animation_filename, print_PNG_stack_image_paths, close_stack_image_sets);
						stack_2_animated_GIF		(animation_filename, ROI_selection_diameter_directory, animation_filename + GIF, GIF_frame_rate, GIF_stacks_2_disk, overwrite_GIF_stacks, print_GIF_stack_paths, close_animated_GIF_stack);
						stack_2_AVI					(animation_filename, ROI_selection_diameter_directory, animation_filename + AVI, AVI_compression_format, AVI_frame_rate, AVI_stacks_2_disk, overwrite_AVI_stacks, print_AVI_stack_paths, close_AVI_stack);
					}
				}// END if(build_by_ROI_image_stacks)				
			}// END for(ROI_selection_diameter_index = 0; ROI_selection_diameter_index < ROI_selection_diameters.length; ROI_selection_diameter_index++)
		}// END for(slice = start_slice; slice <= end_slice; slice++)	
		//close_all_windows(true, false);
	}// END if(build_image_stacks)
}//end macro "CTP404_Full_Analysis"
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
//************************* User defined function definitions ***************************************************************************************************************************************//
//***************************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function Ap				(_array)								{ Array.print		(_array);																									}
function App			(_print_statement, _array)				{ print				("-----> " + _print_statement + " = "); 					Array.print	(_array);							}
function Appexit		(_print_statement, _array)				{ App				(_print_statement, _array); 								Array.print	(_array);							}
function clearResults	()										{ run				("Clear Results");																							}
function dexit			()										{ exit				("-----> Manual exit initiated");																			}
function dq				()										{ dump				(); 														exit		();									}
function lexit			(_loop_variable, _loop_kill_index)		{ if				(_loop_variable >= _loop_kill_index) 						exit		("-----> Reached loop kill index"); }
function peq			(_print_statement, _variable)			{ print				(_print_statement + " = " + toString(_variable)); 															}
function eprint			(_print_statement)						{ print				(_print_statement); 										exit		();									}
function eprintvar		(_print_statement, _variable)			{ _variable_array	= array_from_data(_variable);								Appexit		(_print_statement, _variable_array);}
function printn			(_print_statement, _variable)			{ print				(_print_statement + NEWLINE_CMD_STRING + _variable );														}
function PRINT_ON		()										{ return 			PRINTING_ON;																								}
function PRINT_OFF		()										{ return 			PRINTING_OFF;																								}
function string_2_array	(string) 								{ return 			split(string); 																								}
function append_2_log(_log_directory)
{
	if					( (PRINT_DIRECTORIES_CREATED && PRINTING_STATUS == PRINTING_ON) )
		print			("Execution info appended to execution log at:\n" + _log_directory);
	_time_stamp 		= create_time_stamp(false, false);		
	File.append			("merge_data.ijm: " + _time_stamp, _log_directory + File.separator + ANALYSIS_LOG_FNAME) 							
}
function array_2_CSV(rows, columns, array, directory, filename, print_path, overwrite_existing_CSV)
{
	for(row = 0; row < rows; row++)
		for (column = 0; column < columns; column++)
			setResult		(column, row, array[row * columns + column]);	
	CSV_filename 			= construct_valid_file_path(directory, filename);		
	if(print_path)
		print				("------->Writing to CSV at\n" + CSV_filename);
	if(!File.exists(CSV_filename) || overwrite_existing_CSV)						
	{
		saveAs				("Measurements", CSV_filename);			
		OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, CSV_filename);					
	}
	run						("Clear Results");
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
//function bool_array_control(_bool_in, _bool_index, _bool_all, _bool_none)
function bool_array_control(_bool_in, _bool_index, _bool_all, _bool_none, _bool_explicit)
{
	if(_bool_explicit)
		return _bool_in;
	_bool_out = _bool_in;
	if(_bool_all[_bool_index])
		_bool_out = true;
	if(_bool_none[_bool_index])
		_bool_out = false;
	return _bool_out;
}
//function bool_control(_bool_in, _bool_all, _bool_none)
function bool_control(_bool_in, _bool_all, _bool_none, _bool_explicit)
{
	if(_bool_explicit)
		return _bool_in;
	_bool_out = _bool_in;
	if(_bool_all)
		_bool_out = true;
	if(_bool_none)
		_bool_out = false;
	return _bool_out;
}
function bool_dependence(_bool_in, _dependence_expression, _dependence)
{
	_dependence_expression_eval	= _dependence_expression;
	if(_dependence)
		return (_bool_in && _dependence_expression_eval);
	else
		return (_bool_in || _dependence_expression_eval);
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
function construct_valid_directory_path(directory, subdirectory)
{
	while(startsWith(subdirectory, File.separator))
		subdirectory = substring(subdirectory, 1, lengthOf(subdirectory));
	while(endsWith(directory, File.separator))
		directory = substring(directory, 0, lengthOf(directory) - 1);
	//path 			= directory + File.separator + subdirectory;
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
function copy_input_data_file(input_directory, input_filename, output_directory, output_basename, output_suffix, file_extension, copied_from_log, copied_to_log)
{
	copied_input_data_file_output_filename = output_basename + "_" + output_suffix + file_extension; 
	copy_input_data_file_from			= construct_valid_file_path(input_directory, input_filename);
	copy_input_data_file_to				= construct_valid_file_path(output_directory, copied_input_data_file_output_filename);		
	//print("copy_input_data_file_from 			= " +  copy_input_data_file_from);
	//print("copy_input_data_file_to 			= " +  copy_input_data_file_to);
	File.copy								(copy_input_data_file_from, copy_input_data_file_to);	
	copied_from_log				= Array.concat(copied_from_log, copy_input_data_file_from);				
	copied_to_log					= Array.concat(copied_to_log, copy_input_data_file_to);				
	return copy_input_data_file_to;
}
function copy_parameter_value_test_input_data_files(input_directory, input_filename, output_directory, output_basename, multiplot_parameter_prefix, multiplot_parameter_value_string, target_test_parameter_range_string, multiplot_parameter_range_string)
{
	copied_input_data_file_output_filename = output_basename + "_" + target_test_parameter_range_string + "_" + multiplot_parameter_range_string + "_" + multiplot_parameter_prefix + "=" + multiplot_parameter_value_string + ".txt"; 
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
function csv_2_array(path, filename, column_headings, rows, element_order)
{
	file 				= construct_valid_file_path(path, filename);		
	print				("------->Reading CSV at:\n" + file);
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
//function extract_slice(slice, magnification, flip_horizontally, flip_vertically, grayscale_min, grayscale_max, overwrite_existing, window_title, close_image)
function extract_slice(slice, magnification, flip_horizontally, flip_vertically, grayscale_min, grayscale_max, window_title, console_print)
{
	if(console_print)
		print			("Extracting and saving PNG image of the slice of x being analysed...");			
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
	run					("Size...", "width=" + image_size_x + " height=" + image_size_y + " constrain average interpolation=Bilinear");	
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
function extract_target_parameter_values(_target_parameter_index, _parameter_values, _num_parameter_values, _parameter_value_offsets)
{
	_target_parameter_start_index 			= _parameter_value_offsets[_target_parameter_index];
	_target_parameter_end_index 			= _parameter_value_offsets[_target_parameter_index] + _num_parameter_values[_target_parameter_index] ;
	_target_parameter_values 				= Array.slice(_parameter_values, _target_parameter_start_index, _target_parameter_end_index); 	
	return _target_parameter_values;
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
function file_2_float_array(_path, _filename, _print_path)
{
	_file_path 				= construct_valid_file_path(_path, _filename);		
	if(_print_path)
		print				("------->Importing array from:\n" + _file_path);
	_file_content_string 	= File.openAsString(_file_path); 
	_lines 					= split(_file_content_string,"\n");
	_array 					= newArray(_lines.length);
	for(i = 0; i < _array.length; i++)
		_array[i] 			= parseFloat(_lines[i]);
	INPUT_FILE_LIST			= Array.concat(INPUT_FILE_LIST, _file_path);			
	return 					_array;
}
function file_2_key_value_pairs(_ROI_definitions_directory, _ROI_definitions_filename, _phantom_basename, _ROI_definitions_parameter_list, _ROI_parameter_decodings, _ROI_parameter_value_parseFloat, _printing_ROI_definitions)
{
	_ROI_definition_file_key_value_pairs		= file_2_array(_ROI_definitions_directory, _ROI_definitions_filename, _printing_ROI_definitions);
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
function folder_name_2_parameter_values(folder_name, parameter_string_prefixes)
{
	num_parameters 			= parameter_string_prefixes.length;
	prefix_lengths 			= newArray		(parameter_string_prefixes.length);
	value_strings 			= newArray		(num_parameters);
	for( i = 0; i < num_parameters - 1; i++)
	{
		prefix 				= parameter_string_prefixes[i];
		prefix_length 		= lengthOf		(prefix);
		start_index 		= indexOf		(folder_name, prefix + "_");
		end_index 			= indexOf		(folder_name, "_", start_index + prefix_length + 1);
		value_strings[i] 	= substring		(folder_name, start_index + prefix_length + 1, end_index);
	}
	start_index 			= lastIndexOf	(folder_name, "_");
	value_strings[i] 		= substring		(folder_name, start_index + 1, lengthOf(folder_name) );
	return value_strings;
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
function generate_combined_parameter_value_range_string(_parameter_values, _num_parameter_values, _parameter_value_offsets, _parameter_string_prefixes, _parameter_string_precisions)
{
	_parameter_value_test_identifier 			= "";
	_num_parameters 							= _num_parameter_values.length;
	for(parameter = 0; parameter < _num_parameters; parameter++)
	{
		_range_min_string 						= remove_trailing_zeros(_parameter_values[_parameter_value_offsets[parameter]], _parameter_string_precisions[parameter]);
		_range_max_string 						= remove_trailing_zeros(_parameter_values[_parameter_value_offsets[parameter] + _num_parameter_values[parameter] - 1], _parameter_string_precisions[parameter]);	
		_prefix 								= _parameter_string_prefixes[parameter];
		if(_num_parameter_values[parameter] == 1 )
			_parameter_value_test_identifier 	+= _prefix + "[" + _range_min_string + "]_";
		else
			_parameter_value_test_identifier 	+= _prefix + "[" + _range_min_string + "-" + _range_max_string + "]_";			
	}
	//_parameter_value_test_identifier 			+= _parameter_string_prefixes[_num_parameters - 1] + _target_test_parameter_range_suffix;	
	_parameter_value_test_identifier			= substring(_parameter_value_test_identifier, 0, lengthOf(_parameter_value_test_identifier) - 1);
	return _parameter_value_test_identifier;						
}
function generate_current_parameter_value_test_multiplot_output_directory(_test_batch_directory, _multiplot_parameter_index, _current_parameter_value_test_value_strings, _multiplot_suffix_string, _target_test_parameter_range_suffix, _parameter_string_prefixes, _parameter_string_precisions)
{
	_current_parameter_value_test_multiplot_output_directory 		= _test_batch_directory;
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _multiplot_parameter_index; parameter++)	
		_current_parameter_value_test_multiplot_output_directory	+= parameter_string_prefixes[parameter] + "_" + _current_parameter_value_test_value_strings[parameter] + "_";	
	_current_parameter_value_test_multiplot_output_directory		+= _multiplot_suffix_string + "_";						
	for(parameter = _multiplot_parameter_index + 1; parameter < num_parameters - 1; parameter++)	
		_current_parameter_value_test_multiplot_output_directory 	+= parameter_string_prefixes[parameter] + "_" + _current_parameter_value_test_value_strings[parameter] + "_";						
	_current_parameter_value_test_multiplot_output_directory	+=  parameter_string_prefixes[num_parameters - 1] + _target_test_parameter_range_suffix;			
	return _current_parameter_value_test_multiplot_output_directory;	
}
function generate_current_parameter_value_test_parameter_values_string(_current_parameter_value_test_value_strings, _target_test_parameter_index, _parameter_string_prefixes)
{
	_num_parameters					= _parameter_string_prefixes.length;		
	_plot_title_parameter_string 		= "";
	for(parameter = 0; parameter < _num_parameters; parameter++)
		_plot_title_parameter_string 	+= parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";
	_plot_title_parameter_string 		= substring(_plot_title_parameter_string, 0, lengthOf(_plot_title_parameter_string) - 2);										
	return _plot_title_parameter_string;
}
function generate_legend_entries(common_entry_text, entry_specific_text)
{
	legend_entries			= newArray(lengthOf(entry_specific_text));
	for(i = 0; i < lengthOf(entry_specific_text); i++)
		legend_entries[i]	= common_entry_text + entry_specific_text[i];
	return legend_entries;
}
function generate_missing_input_data(common_directory, current_parameter_value_test_folder, RSP_path, RSP_Error_path, Std_Dev_path)
{
	directory 		= construct_valid_directory_path(common_directory, current_parameter_value_test_folder);		
	data_verified 		= true;
	if(!File.exists(directory + RSP_path))
	{	
		print			("------->Missing RSP input file:\n" + directory + RSP_path);
		data_verified 	= false;
	}
	if(!File.exists(directory + RSP_Error_path))
	{	
		print			("------->Missing RSP error input file:\n" + directory + RSP_Error_path);
		data_verified 	= false;
	}
	if(!File.exists(directory + Std_Dev_path))
	{	
		print			("------->Missing std dev input file:\n" + directory + Std_Dev_path);
		data_verified 	= false;
	}
	if(!data_verified)
	{
		if(endsWith(directory, File.separator))
			runMacro	(ROI_analysis_macro_path, directory);
		else
			runMacro	(ROI_analysis_macro_path, directory + folder_separator);	
	}			
	return true;					
}		
function generate_missing_test_input_data(common_directory, current_parameter_value_test_folders, RSP_path, RSP_Error_path, Std_Dev_path)
{
	for( i = 0; i < current_parameter_value_test_folders.length; i++)
	{
		directory 			= construct_valid_directory_path(common_directory, current_parameter_value_test_folders[i]);		
		data_verified 		= true;
		print				("------->Path to RSP input file:\n" + directory + RSP_path);
		print				("------->Path to RSP error input file:\n" + directory + RSP_Error_path);
		print				("------->Path to standard deviation input file:\n" + directory + Std_Dev_path);
		if(!File.exists(directory + RSP_path))
		{	
			print			("------->Missing RSP input file:\n" + directory + RSP_path);
			data_verified 	= false;
		}
		if(!File.exists(directory + RSP_Error_path))
		{	
			print			("------->Missing RSP error input file:\n" + directory + RSP_Error_path);
			data_verified 	= false;
		}
		if(!File.exists(directory + Std_Dev_path))
		{	
			print			("------->Missing standard deviation input file:\n" + directory + Std_Dev_path);
			data_verified 	= false;
		}
		if(!data_verified)
		{
			if(endsWith(directory, File.separator))
				runMacro	(ROI_analysis_macro_path, directory);
			else
				runMacro	(ROI_analysis_macro_path, directory + folder_separator);	
		}
	}
	return true;			
}		
function generate_modulo_values(num_parameter_values)
{
	num_parameters				= num_parameter_values.length;
	modulo_values 				= newArray(num_parameters - 1);	
	Array.fill					(modulo_values, 1);
	for(i = 0; i < num_parameters; i++)
		for(j = i + 1; j < num_parameters; j++)
			modulo_values[i] 	*= num_parameter_values[j];		 
	return modulo_values;
}
function generate_multiplot_parameter_set_string(_multiplot_parameter_index, _num_multiplot_parameter_values, _parameter_values, _parameter_value_offsets, _parameter_string_prefixes, _parameter_string_precisions)
{
	_multiplot_suffix_string 		= _parameter_string_prefixes[_multiplot_parameter_index] + "[";
	for(i = 0; i < _num_multiplot_parameter_values; i++)
		_multiplot_suffix_string 	= _multiplot_suffix_string  + d2s(_parameter_values[_parameter_value_offsets[_multiplot_parameter_index] + i], _parameter_string_precisions[_multiplot_parameter_index]) + ",";
	_multiplot_suffix_string 		= substring(_multiplot_suffix_string, 0, lengthOf(_multiplot_suffix_string) - 1) + "]";
	return _multiplot_suffix_string;
}
function generate_multiplot_string(parameter_values, parameter_value_offsets, parameter_string_precisions, multiplot_parameter)
{
	multiplot_string_ID 		= parameter_string_prefixes[multiplot_parameter_index] + " = [";
	for(i = 0; i < num_multiplot_parameter_values; i++)
		multiplot_string_ID 	= multiplot_string_ID  + d2s(parameter_values[parameter_value_offsets[multiplot_parameter_index] + i], parameter_string_precisions[multiplot_parameter_index]) + ",";
	multiplot_string_ID 		= substring(multiplot_string_ID, 0, lengthOf(multiplot_string_ID) - 1) + "]";
	return multiplot_string_ID;
}
function generate_multiplot_suffix_string(_multiplot_parameter_index, _num_multiplot_parameter_values, _parameter_values, _parameter_value_offsets, _parameter_string_prefixes, _parameter_string_precisions)
{
	_multiplot_suffix_string 		= _parameter_string_prefixes[_multiplot_parameter_index] + "[";
	for(i = 0; i < _num_multiplot_parameter_values; i++)
		_multiplot_suffix_string 	= _multiplot_suffix_string  + d2s(_parameter_values[_parameter_value_offsets[_multiplot_parameter_index] + i], _parameter_string_precisions[_multiplot_parameter_index]) + ",";
	_multiplot_suffix_string 		= substring(_multiplot_suffix_string, 0, lengthOf(_multiplot_suffix_string) - 1) + "]";
	return _multiplot_suffix_string;
}
function generate_multiplot_title_parameter_string(_target_test_parameter_range_suffix, _multiplot_parameter_index, _current_parameter_value_test_value_strings, _multiplot_parameter_range_string, _parameter_string_prefixes )
{
	_multiplot_title_parameter_string 		= "";
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _multiplot_parameter_index; parameter++)	
		_multiplot_title_parameter_string	+= parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";	
	_multiplot_title_parameter_string		+= _multiplot_parameter_range_string + ", ";						
	for(parameter = _multiplot_parameter_index + 1; parameter < num_parameters - 1; parameter++)	
		_multiplot_title_parameter_string 	+= parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";						
	_multiplot_title_parameter_string	+=  parameter_string_prefixes[num_parameters - 1] + " = " + _target_test_parameter_range_suffix;			
	return _multiplot_title_parameter_string;	
}		
function generate_multiplot_title_parameter_values_string(_target_test_parameter_range_suffix, _multiplot_parameter_index, _current_parameter_value_test_value_strings, _multiplot_parameter_range_string, _parameter_string_prefixes )
{
	_multiplot_title_parameter_values_string 		= "";
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _multiplot_parameter_index; parameter++)	
		_multiplot_title_parameter_values_string	+= parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";	
	_multiplot_title_parameter_values_string		+= _multiplot_parameter_range_string + ", ";						
	for(parameter = _multiplot_parameter_index + 1; parameter < num_parameters - 1; parameter++)	
		_multiplot_title_parameter_values_string 	+= parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";						
	_multiplot_title_parameter_values_string	+=  parameter_string_prefixes[num_parameters - 1] + " = " + _target_test_parameter_range_suffix;			
	return _multiplot_title_parameter_values_string;	
}		
function generate_ordering_indices(_num_iterations, _num_ROIs_2_analyze_2_analyze, _images_per_reconstruction, _num_target_test_parameter_values)
{
	ordering_indices 										= newArray(_num_ROIs_2_analyze_2_analyze * _images_per_reconstruction * _num_target_test_parameter_values);
	ordering_indices_position 								= 0;
	for(iteration = 0; iteration <= _num_iterations; iteration++)  
	{
		for(ROI = 0; ROI < _num_ROIs_2_analyze_2_analyze; ROI++)
		{
			for( N = 0; N < _num_target_test_parameter_values; N++)
			{
				ordering_index 								= _num_ROIs_2_analyze_2_analyze * _images_per_reconstruction * N + iteration * _num_ROIs_2_analyze_2_analyze + ROI;
				ordering_indices[ordering_indices_position] = ordering_index;
				ordering_indices_position++;
			}
		}
	}
	return ordering_indices;										
}
function generate_parameter_test_combination_indices(_target_test_parameter_index, _combination_index, _modulo_values, _parameter_value_offsets )
{	
	j 								= _combination_index;
	_parameter_combination_indices 		= newArray(_target_test_parameter_index + 1);
	for(parameter = 0; parameter < _target_test_parameter_index; parameter++)
	{
		i = 0;
		while(j - _modulo_values[parameter] >= 0)
		{
			j = j - _modulo_values[parameter];
			i++;
		}
		_parameter_combination_indices[parameter]					= i + _parameter_value_offsets[parameter];
	}		
	_parameter_combination_indices[_target_test_parameter_index]	= j + _parameter_value_offsets[_target_test_parameter_index];		
	return _parameter_combination_indices;       	
}
function generate_parameter_test_combination(_parameter_combination_indices, _parameter_values)
{
	num_parameter_combination_indices 	= _parameter_combination_indices.length;
	_parameter_combination 				= newArray(num_parameter_combination_indices);
	for(parameter = 0; parameter < num_parameter_combination_indices; parameter++)
		_parameter_combination[parameter]	= _parameter_values[_parameter_combination_indices[parameter]];					
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
function generate_parameter_value_offsets(num_parameter_values)
{
	num_parameters				= num_parameter_values.length;
	parameter_value_offsets 	= newArray(num_parameters);	
	for(i = 0; i < num_parameters; i++)
		for(j = 0; j < i; j++)
			parameter_value_offsets[i] 	+= num_parameter_values[j];		 
	return parameter_value_offsets;
}
function generate_parameter_value_range_suffix_string(_parameter_values, _parameter_string_precision)
{	
	_target_test_parameter_extrema = find_array_extrema(_parameter_values, tolerance, false);
	_target_test_parameter_range_min_string		= d2s( _target_test_parameter_extrema[0], _parameter_string_precision);
	_target_test_parameter_range_max_string		= d2s( _target_test_parameter_extrema[1], _parameter_string_precision);
	_target_test_parameter_range_suffix			= "[" + _target_test_parameter_range_min_string + "-" + _target_test_parameter_range_max_string + "]";		
	return _target_test_parameter_range_suffix;
}							
function generate_parameter_value_strings(_parameter_values, _parameter_string_precision)
{
	_num_parameters 			= _parameter_values.length;
	_parameter_value_strings	= newArray(_num_parameters);
	index 						= 0;
	//for(parameter = 0; parameter < _num_parameters; parameter++)
		for(i = 0; i < _num_parameters; i++)
			_parameter_value_strings[i]	= d2s(_parameter_values[i], _parameter_string_precision);
	return _parameter_value_strings;
}
function generate_plot_title_parameter_string(_current_parameter_value_test_value_strings, _target_test_parameter_index, _target_test_parameter_range_suffix, _parameter_string_prefixes)
{
	_plot_title_parameter_string 		= "";
	for(parameter = 0; parameter < _target_test_parameter_index; parameter++)
		_plot_title_parameter_string 	+= _parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";
	_plot_title_parameter_string 		+= _parameter_string_prefixes[parameter] + " = " + _target_test_parameter_range_suffix;										
	return _plot_title_parameter_string;
}					
function generate_reduced_modulo_values(num_parameter_values, modulo_values, skip_index)
{
	num_modulo_values 							= modulo_values.length;
	modulo_value_divisor						= num_parameter_values[skip_index];
	reduced_modulo_values 						= newArray(num_modulo_values - 1);	
	Array.fill									(reduced_modulo_values, 1);
	for(i = 0; i < num_modulo_values; i++)
	{
		if(i < skip_index)
			reduced_modulo_values[i] 			= modulo_values[i] / modulo_value_divisor;
		if(i >= skip_index)
			if(i < num_modulo_values)
				reduced_modulo_values[i - 1] 	= modulo_values[i];			
	}
	return reduced_modulo_values;
}
function generate_reduced_parameter_value_offsets(num_parameter_values, parameter_value_offsets, skip_index)
{
	num_parameters					= num_parameter_values.length;
	reduced_parameter_value_offsets = newArray(num_parameters - 1);	
	Array.fill						(reduced_parameter_value_offsets, 1);
	for(i = 0; i < num_parameters; i++)
	{
		if(i < multiplot_parameter_index)	
			reduced_parameter_value_offsets[i] 		= parameter_value_offsets[i];
		if(i >= multiplot_parameter)
			reduced_parameter_value_offsets[i - 1]	= parameter_value_offsets[i] - num_multiplot_parameter_values;
	}
	return reduced_parameter_value_offsets;
}
function identify_missing_input_data(common_directory, current_parameter_value_test_folder, RSP_path, RSP_Error_path, Std_Dev_path)
{
	directory 			= construct_valid_directory_path(common_directory, current_parameter_value_test_folder);		
	data_verified 		= true;
	if(!File.exists(directory + RSP_path))
	{	
		print			("------->Missing RSP input file:\n" + directory + RSP_path);
		data_verified 	= false;
	}
	if(!File.exists(directory + RSP_Error_path))
	{	
		print			("------->Missing RSP error input file:\n" + directory + RSP_Error_path);
		data_verified 	= false;
	}
	if(!File.exists(directory + Std_Dev_path))
	{	
		print			("------->Missing standard deviation input file:\n" + directory + Std_Dev_path);
		data_verified 	= false;
	}
	return data_verified;			
}	
function identify_missing_test_input_data(common_directory, current_parameter_value_test_folders, RSP_path, RSP_Error_path, Std_Dev_path)
{
	for( i = 0; i < current_parameter_value_test_folders.length; i++)
	{
		directory 			= construct_valid_directory_path(common_directory, current_parameter_value_test_folders[i]);		
		data_verified 		= true;
		if(!File.exists(directory + RSP_path))
		{	
			print			("------->Missing RSP input file:\n" + directory + RSP_path);
			data_verified 	= false;
		}
		if(!File.exists(directory + RSP_Error_path))
		{	
			print			("------->Missing RSP error input file:\n" + directory + RSP_Error_path);
			data_verified 	= false;
		}
		if(!File.exists(directory + Std_Dev_path))
		{	
			print			("------->Missing standard deviation input file:\n" + directory + Std_Dev_path);
			data_verified 	= false;
		}
	}
	return true;			
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
//function line_profile(ROI_number, ROI_x, ROI_y, ROI_radius, profile_radius, profile_direction, base_value, ref_value, voxel_dimensions, title, text, xlabel, ylabel, legend_entries, plot_parameters, is_gradient_analysis)
//{
//							
//	voxel_width 				= plot_parameters[0]; 	tolerance		= plot_parameters[1]; 	lower_limits_scale	= plot_parameters[2]; upper_limits_scale 	= plot_parameters[3]; 
//	difference_scale 			= plot_parameters[4]; 	x_frame_size  	= plot_parameters[5]; 	y_frame_size 		= plot_parameters[6]; text_xpos_ratio 		= plot_parameters[7]; 
//	text_ypos_ratio 			= plot_parameters[8]; 	add_line_color 	= plot_parameters[9]; 	linewidth 			= plot_parameters[10]; 
//	voxel_width 				= voxel_dimensions[0]; 	voxel_height 	= voxel_dimensions[1];	voxel_thickness 	= voxel_dimensions[2];
//
//	ROI_selection_diameter = ROI_radius * 2;
//	if(ROI_selection_diameter % 2 == 1)
//	{
//		profile_center_x = ROI_x + 0.5; 
//		profile_center_y = ROI_y + 0.5; 
//	}
//	else
//	{
//		profile_center_x = ROI_x; 
//		profile_center_y = ROI_y; 
//	}
//	//run											("Specify...", "width=" + ROI_selection_diameter + " height=" + ROI_selection_diameter + " x=" + selection_center_x + " y=" + selection_center_y + " oval centered");
//							
//	if(profile_direction == x_direction)
//	{
//		ROI_varying_direction 	= profile_center_x;
//		ROI_constant_direction 	= profile_center_y;
//		voxel_dimension	 		= voxel_width;
//	}
//	else
//	{
//		ROI_varying_direction 	= profile_center_y;
//		ROI_constant_direction 	= profile_center_x;
//		voxel_dimension 		= voxel_height;
//	}
//	data_shifted_distance		= ROI_varying_direction - floor(ROI_varying_direction);
//	
//	profile_1st_edge			= floor((	ROI_varying_direction - profile_radius							) 	* voxel_dimension	);
//	profile_2nd_edge			= ceil(( 	ROI_varying_direction + profile_radius 							) 	* voxel_dimension	);		
//	ROI_1st_edge				= ( 		ROI_varying_direction - ROI_radius - data_shifted_distance		) 	* voxel_dimension;
//	ROI_2nd_edge				= ( 		ROI_varying_direction + ROI_radius - data_shifted_distance		) 	* voxel_dimension;		
//	center_coordinate 			= ( 		ROI_varying_direction 											)	* voxel_dimension;														
//	
//	if(profile_direction == x_direction)
//		makeLine				(profile_1st_edge, ROI_constant_direction, profile_2nd_edge, ROI_constant_direction );	
//	else
//		makeLine				(ROI_constant_direction, profile_1st_edge, ROI_constant_direction, profile_2nd_edge );		
//	profile 					= getProfile();
//	profile_elements			= profile.length;
//	getSelectionCoordinates		(xpoints, ypoints);
//	selection_length			= xpoints[1] - xpoints[0];
//	point_separation			= selection_length / (profile_elements - 1);
//	x_axis_coordinates 			= Array.slice(SEQUENTIAL_VALUES_ARRAY, profile_1st_edge, profile_2nd_edge + 1);
//	predicted_profile_coords 	= newArray(profile_1st_edge, ROI_1st_edge, ROI_1st_edge, ROI_1st_edge, ROI_2nd_edge, ROI_2nd_edge, ROI_2nd_edge, profile_2nd_edge);
//	predicted_profile 			= newArray(base_value, base_value, base_value, ref_value, ref_value, base_value, base_value, base_value );			
//	//setResult					(1, ROI_number, profile[0]);
//	for(i = 0; i < profile.length; i++)							
//		setResult				(i, ROI_number, profile[i]);
//	profile_extrema 			= set_plot_extrema(profile, predicted_profile, tolerance, lower_limits_scale, upper_limits_scale, difference_scale);
//	plot_ymin 					= profile_extrema[0];
//	plot_ymax 					= profile_extrema[1];
//	center_line_x 				= newArray(center_coordinate, center_coordinate);
//	center_line_y 				= newArray(plot_ymin, plot_ymax);
//	if(is_gradient_analysis)
//	{
//		if( ref_value > base_value)
//			predicted_profile 	= newArray(0.0, 0.0, plot_ymax, 0.0, 0.0, plot_ymin, 0.0, 0.0 );				
//		else
//			predicted_profile 	= newArray(0.0, 0.0, plot_ymin, 0.0, 0.0, plot_ymax, 0.0, 0.0 );
//	}
//	Plot.create					(title, xlabel, ylabel, x_axis_coordinates, profile																);
//	Plot.setLimits				(profile_1st_edge, profile_2nd_edge, plot_ymin, plot_ymax														);
//	set_plot_props				(legend_entries, x_frame_size, y_frame_size, text, text_xpos_ratio, text_ypos_ratio, add_line_color, linewidth	);					
//	Plot.setColor				("green"																										);
//	Plot.add					("line", predicted_profile_coords, predicted_profile															);
//	Plot.setColor				("yellow"																										);
//	Plot.add					("line", center_line_x, center_line_y																			);					
//	set_plot_data_props			(data_line_color, add_text_justification																		);			
//	return profile;
//}
function line_profile(_ROI_number, _ROI_x, _ROI_y, _ROI_radius, _profile_radius, _profile_direction, _base_value, _ref_value, _voxel_dimensions, _construct_plot, _title, _text, _text_size, _xlabel, _ylabel, _legend_entries, _legend_text_size, _plot_parameters, _is_gradient_analysis)
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
	if(_construct_plot)
	{
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
		//	set_plot_props			(legend_entries, 					  x_frame_size, y_frame_size, text, 				text_xpos_ratio, text_ypos_ratio, add_line_color, linewidth	);					
		set_plot_props				(_legend_entries, _legend_text_size, _x_frame_size, _y_frame_size, _text, _text_size, _text_xpos_ratio, _text_ypos_ratio, add_text_justification, _add_line_color, _linewidth	);					
		Plot.setColor				("green"																										);
		Plot.add					("line", _predicted_profile_coords, _predicted_profile															);
		Plot.setColor				("yellow"																										);
		Plot.add					("line", _center_line_x, _center_line_y																			);					
		set_plot_data_props			(data_line_color, add_text_justification, _x_frame_size, _y_frame_size											);			
	}
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
function make_directory_chain(top_directory, subdirectory_chain, folder_separator, _make_top_directory, _print_directories_created)
{
	path 								= top_directory;
	subdirectory_chain_folders 			= split(subdirectory_chain, folder_separator);
	new_folder_paths 					= newArray(subdirectory_chain_folders.length);
	if(_make_top_directory)
	{
		if(_print_directories_created)
			print							("------->Creating top directory:\n" + path );
		//File.makeDirectory			(path);
		//DIRECTORIES_CREATED 			= Array.concat(DIRECTORIES_CREATED, path);		
		directory_created_successfully	= make_directory_recorded(path, DIRECTORIES_CREATED, _print_directories_created);
	}
	for(i = 0; i < subdirectory_chain_folders.length; i++)
	{
		path 							+= folder_separator + subdirectory_chain_folders[i];
		new_folder_paths[i] 			= path;
		if(_print_directories_created)
			print						("------->Creating directory:\n" + path );
		//File.makeDirectory			(path);
		//DIRECTORIES_CREATED			= Array.concat(DIRECTORIES_CREATED, path);		
		directory_created_successfully	= make_directory_recorded(path, DIRECTORIES_CREATED, _print_directories_created);
	}
	return new_folder_paths;											
}
function make_directory_parents(top_directory, bottom_directory, folder_separator, _make_top_directory, _print_directories_created)
{
	bottom_directory_folders 			= split(bottom_directory, folder_separator);
	top_directory_folders 				= split(top_directory, folder_separator);
	return_statement					= "------->Top directory through target directory already exist\n";
	if(top_directory_folders.length != bottom_directory_folders.length)
	{
		if(_make_top_directory)
		{
			if(!File.exists(top_directory))
			{
				directory_created_successfully	= make_directory_recorded(top_directory, DIRECTORIES_CREATED, _print_directories_created);		
				return_statement =  "------->Top directory created:\n" + top_directory;	
			}
			else
				return_statement = "";			
		}
		path 								= top_directory;
		return_statement = return_statement + "------->Subdirectories created:\n";
		subdirectories_2_create = Array.slice(bottom_directory_folders, top_directory_folders.length, bottom_directory_folders.length);		
		for(i = 0; i < subdirectories_2_create.length; i++)
		{
			path 							+= folder_separator + subdirectories_2_create[i];
			if(!File.exists(path))
				directory_created_successfully	= make_directory_recorded(path, DIRECTORIES_CREATED, _print_directories_created);		
			//else
			//	print("------->Directory already exists");
			return_statement = return_statement + path + "\n";
		}
		return subdirectories_2_create;
	}
	else
		return_statement = return_statement + "--------------->Top directory and target directory are the same\n";
	print(return_statement);
	return return_statement;											
}

function make_directory_recorded(directory_2_create, directory_creation_record, _print_directory_path)
{
	if(!File.exists(directory_2_create))
	{
		if(_print_directory_path)
			print("\n------->Creating directory and adding it to the directory created log:\n" + directory_2_create);
		File.makeDirectory							(directory_2_create);
		directory_creation_record					= Array.concat(directory_creation_record, directory_2_create);		
		if(!File.exists(directory_2_create))
			print("**************ERROR: Directory creation failure*********************\n");
		return false;
	}
	else
		return true;
	//else
	//	print("------->Directory already exists");
	//return File.exists							(directory_2_create);
}
function make_current_parameter_value_test_output_directories(_print_directories_created)						
{
	print_statement 								= "Creating the parameter value test output directories and their parent directories where the RSP, % Error, Standard Deviation, and Total Variation (TV) data/images are to be written..."; 
	if(_print_directories_created)
		print_major_log_section_separator(print_statement);
	else
		print("\n------->" + print_statement);
	//File.makeDirectory							(current_test_output_directory);					
	//File.makeDirectory							(current_test_multiplot_output_directory);	
	//DIRECTORIES_CREATED							= Array.concat(DIRECTORIES_CREATED, current_test_output_directory);		
	//DIRECTORIES_CREATED							= Array.concat(DIRECTORIES_CREATED, current_test_multiplot_output_directory);	
	//directory_created_successfully				= make_directory_recorded(current_test_output_directory, DIRECTORIES_CREATED, _print_directories_created);
	//directory_created_successfully				= make_directory_recorded(current_test_multiplot_output_directory, DIRECTORIES_CREATED, _print_directories_created);			
	MAKE_TOP_DIRECTORY								= true;
	current_RSP_directory_parents 					= make_directory_parents(current_test_output_directory, current_test_RSP_directory, 		folder_separator, MAKE_TOP_DIRECTORY, _print_directories_created);
	current_RSP_error_directory_parents 			= make_directory_parents(current_test_output_directory, current_test_RSP_error_directory, 	folder_separator, MAKE_TOP_DIRECTORY, _print_directories_created);
	current_std_dev_directory_parents 				= make_directory_parents(current_test_output_directory, current_test_std_dev_directory, 	folder_separator, MAKE_TOP_DIRECTORY, _print_directories_created);
	current_TV_directory_parents 					= make_directory_parents(current_test_output_directory, current_test_TV_directory, 			folder_separator, MAKE_TOP_DIRECTORY, _print_directories_created);
	directory_created_successfully 					= false;		
	
	for(i = 1; i < reconstructed_image_folders.length; i++)
	{
		//File.makeDirectory	(									current_test_RSP_directory 			+ reconstructed_image_folders[i]						);			
		//File.makeDirectory	(									current_test_RSP_error_directory 	+ reconstructed_image_folders[i]						);			
		//File.makeDirectory	(									current_test_std_dev_directory  	+ reconstructed_image_folders[i]						);	
		//DIRECTORIES_CREATED	= Array.concat(DIRECTORIES_CREATED, current_test_RSP_directory 			+ reconstructed_image_folders[i]						);		
		//DIRECTORIES_CREATED	= Array.concat(DIRECTORIES_CREATED, current_test_RSP_error_directory 	+ reconstructed_image_folders[i]						);		
		//DIRECTORIES_CREATED	= Array.concat(DIRECTORIES_CREATED, current_test_std_dev_directory 		+ reconstructed_image_folders[i]						);	
		directory_created_successfully		= make_directory_recorded(current_test_RSP_directory		+ reconstructed_image_folders[i], DIRECTORIES_CREATED, _print_directories_created	);
		directory_created_successfully		= directory_created_successfully && make_directory_recorded(current_test_RSP_error_directory	+ reconstructed_image_folders[i], DIRECTORIES_CREATED, _print_directories_created	);
		directory_created_successfully		= directory_created_successfully && make_directory_recorded(current_test_std_dev_directory	+ reconstructed_image_folders[i], DIRECTORIES_CREATED, _print_directories_created	);	
	}
	if(directory_created_successfully)
			print("------->Parameter value test irectories already existed");

}					
function make_multiplot_output_directories(_print_directories_created)						
{
	print_statement 								= "Creating the multiplot output directories and their parent directories where the RSP, % Error, Standard Deviation, and Total Variation (TV) data/images are to be written...";  
	if(_print_directories_created)
		print_major_log_section_separator(print_statement);
	else
		print("\n------->" + print_statement);
		//File.makeDirectory							(current_test_output_directory);					
	//File.makeDirectory							(current_test_multiplot_output_directory);	
	//DIRECTORIES_CREATED							= Array.concat(DIRECTORIES_CREATED, current_test_output_directory);		
	//DIRECTORIES_CREATED							= Array.concat(DIRECTORIES_CREATED, current_test_multiplot_output_directory);				
	MAKE_TOP_DIRECTORY								= true;
	current_RSP_multiplot_directory_parents 		= make_directory_parents(current_test_multiplot_output_directory, current_test_RSP_multiplot_directory, 		folder_separator, MAKE_TOP_DIRECTORY, _print_directories_created);
	current_RSP_multiplot_error_directory_parents	= make_directory_parents(current_test_multiplot_output_directory, current_test_RSP_error_multiplot_directory, 	folder_separator, MAKE_TOP_DIRECTORY, _print_directories_created);
	current_std_dev_multiplot_directory_parents 	= make_directory_parents(current_test_multiplot_output_directory, current_test_std_dev_multiplot_directory, 	folder_separator, MAKE_TOP_DIRECTORY, _print_directories_created);
	current_TV_multiplot_directory_parents 			= make_directory_parents(current_test_multiplot_output_directory, current_test_TV_multiplot_directory, 			folder_separator, MAKE_TOP_DIRECTORY, _print_directories_created);
	current_TV_step_multiplot_directory_parents 	= make_directory_parents(current_test_multiplot_output_directory, current_test_TV_step_multiplot_directory, 	folder_separator, MAKE_TOP_DIRECTORY, _print_directories_created);
	directory_created_successfully 					= false;		
	for(i = 1; i < reconstructed_image_folders.length; i++)
	{
		//File.makeDirectory	(											current_test_RSP_multiplot_directory 		+ reconstructed_image_folders[i]													);			
		//File.makeDirectory	(											current_test_RSP_error_multiplot_directory 	+ reconstructed_image_folders[i]													);			
		//File.makeDirectory	(											current_test_std_dev_multiplot_directory  	+ reconstructed_image_folders[i]													);
		//File.makeDirectory	(											current_test_TV_multiplot_directory  																							);
		//File.makeDirectory	(											current_test_TV_step_multiplot_directory  																						);
		//DIRECTORIES_CREATED	= Array.concat(DIRECTORIES_CREATED, 		current_test_RSP_multiplot_directory 		+ reconstructed_image_folders[i]													);		
		//DIRECTORIES_CREATED	= Array.concat(DIRECTORIES_CREATED, 		current_test_RSP_error_multiplot_directory 	+ reconstructed_image_folders[i]													);		
		//DIRECTORIES_CREATED	= Array.concat(DIRECTORIES_CREATED, 		current_test_std_dev_multiplot_directory 	+ reconstructed_image_folders[i]													);		
		//DIRECTORIES_CREATED	= Array.concat(DIRECTORIES_CREATED, 		current_test_TV_multiplot_directory 																							);		
		//DIRECTORIES_CREATED	= Array.concat(DIRECTORIES_CREATED, 		current_test_TV_step_multiplot_directory 																						);
		directory_created_successfully										= make_directory_recorded(current_test_RSP_multiplot_directory			+ reconstructed_image_folders[i], 	DIRECTORIES_CREATED, _print_directories_created	);
		directory_created_successfully										= directory_created_successfully && make_directory_recorded(current_test_RSP_error_multiplot_directory	+ reconstructed_image_folders[i], 	DIRECTORIES_CREATED, _print_directories_created	);
		directory_created_successfully										= directory_created_successfully && make_directory_recorded(current_test_std_dev_multiplot_directory		+ reconstructed_image_folders[i], 	DIRECTORIES_CREATED, _print_directories_created	);	
		directory_created_successfully										= directory_created_successfully && make_directory_recorded(current_test_TV_multiplot_directory, 												DIRECTORIES_CREATED, _print_directories_created	);	
		directory_created_successfully										= directory_created_successfully && make_directory_recorded(current_test_TV_step_multiplot_directory, 										DIRECTORIES_CREATED, _print_directories_created	);				
	}
	if(directory_created_successfully)
		print("------->Multiplot output directories already existed");
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
		if(material_name == material_names[j])
			return material_RSPs[j];
}
function modn(value, divisor)
{
	modulo_value 		= value;
	while(modulo_value >= divisor)
		modulo_value 	-= divisor;
	return modulo_value;
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
function opened_image_set_2_stack(image_names_matching, stack_title, close_image_set)
{
	open_image_list 		= getList("image.titles");	
	run						("Images to Stack", "name=" + stack_title + " title=" + image_names_matching + " use keep");			
	Stack.getDimensions		(width, height, channels, slices, frames);
	stack_dimensions 		= newArray(width, height, channels, slices, frames);
	return stack_dimensions;			
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
	run							("Set Measurements...", "area mean standard min redirect=None decimal=4");		
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
function open_reconstructed_image(directory, filename)
{
	file_path 		= construct_valid_file_path(directory, filename);		
	run				("Text Image... ", "open=" + file_path);
	run				("Set Measurements...", "area mean standard min redirect=None decimal=4");	
	INPUT_FILE_LIST	= Array.concat(INPUT_FILE_LIST, file_path);					
}																						
function order_comparison_data(unordered_data, ordering_indices, _num_ROIs_2_analyze_2_analyze, images_per_reconstruction, num_target_test_parameter_values)
{
	ordered_data 		= newArray(_num_ROIs_2_analyze_2_analyze * images_per_reconstruction * num_target_test_parameter_values);
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
function parameter_values_2_parameter_equals_strings(_parameter_values, _parameter_value_prefix, _parameter_value_string_precision)
{
	_num_parameter_values	= _parameter_values.length;
	_parameter_value_strings = newArray(_num_parameter_values);
	for(i = 0; i < _num_parameter_values; i++)
		_parameter_value_strings[i]	= _parameter_value_prefix + "=" + d2s(_parameter_values[i], _parameter_value_string_precision);
	return _parameter_value_strings;
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
function PNG_sequence_2_stack(PNG_sequence_directory, PNG_sequence_paths, group_2_extract, num_groups, group_size, _property_Booleans, _PNG_basename, _PNG_image_Booleans, _animation_filename, _animated_GIF_info, _AVI_info, close_stack_after_saving)
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
	stack_2_animated_GIF			(_animation_filename, PNG_sequence_directory, _animation_filename + GIF, _GIF_frame_rate, _write_GIF, _overwrite_GIF, _print_multiplot_GIF_paths, false);
	stack_2_AVI						(_animation_filename, PNG_sequence_directory, _animation_filename + AVI, _AVI_compression_format, _AVI_frame_rate, _write_AVI, _overwrite_AVI, _print_multiplot_AVI_paths, close_stack_after_saving);
	return PNG_subsequence_paths;
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
	print("------->RSPs_by_iteration  ="		); 			Array.print(RSPs_by_iteration);
	print("------->RSP_errors_by_iteration  ="	); 			Array.print(RSP_errors_by_iteration);
	print("------->std_devs_by_iteration  ="	); 			Array.print(std_devs_by_iteration);
}
function print_by_ROI_data()
{
	print("------->RSPs_by_ROI  ="		); 					Array.print(RSPs_by_ROI);
	print("------->RSP_errors_by_ROI  ="); 					Array.print(RSP_errors_by_ROI);
	print("------->std_devs_by_ROI  ="	); 					Array.print(std_devs_by_ROI);
}		
function print_current_analysis_directories()
{
	print_major_log_section_separator("Printing current analysis input/output directories, paths, and filenames..."				);
	print("------->current_analysis_subdirectory 					= " 	+ current_analysis_subdirectory 					);		
	print("------->current_analysis_slice_2_analyze_subdirectory	= " 	+ current_analysis_slice_2_analyze_subdirectory 	);	
	print("------->current_analysis_RSP_input_data_filenames		= " 	+ current_analysis_RSP_input_data_filenames 		);	
	print("------->current_analysis_RSP_error_input_data_filenames 	= " 	+ current_analysis_RSP_error_input_data_filenames 	);	
	print("------->current_analysis_std_dev_input_data_filenames 	= " 	+ current_analysis_std_dev_input_data_filenames 	);
	print("------->current_analysis_TV_input_data_filenames			= " 	+ current_analysis_TV_input_data_filenames 			);										
}
function print_current_by_iteration_data()
{
	print("------->current_RSPs_by_iteration  ="		); 	Array.print(current_RSPs_by_iteration);
	print("------->current_RSP_errors_by_iteration  ="	); 	Array.print(current_RSP_errors_by_iteration);
	print("------->current_std_devs_by_iteration  ="	); 	Array.print(current_std_devs_by_iteration);
}		
function print_current_by_ROI_data()
{
	print("------->current_RSPs_by_ROI  ="				); 	Array.print(current_RSPs_by_ROI);
	print("------->current_RSP_errors_by_ROI  ="		); 	Array.print(current_RSP_errors_by_ROI);
	print("------->current_std_devs_by_ROI  ="			); 	Array.print(current_std_devs_by_ROI);
	print("------->current_RSPs_by_ROI_no_air  ="		); 	Array.print(current_RSPs_by_ROI_no_air);
	print("------->current_RSP_errors_by_ROI_no_air  ="	); 	Array.print(current_RSP_errors_by_ROI_no_air);
	print("------->current_std_devs_by_ROI_no_air  ="	); 	Array.print(current_std_devs_by_ROI_no_air);
}						
function print_current_parameter_value_test_strings(_current_test_parameter_value_strings, _current_test_parameter_values_string, _current_test_plot_title_parameter_values_string)//, _multiplot_title_parameter_values_string, _multiplot_suffix_string)
{	
	print_major_log_section_separator("Printing current parameter value test strings..."														);
	print("------->current_parameter_value_test_parameter_value_strings 				= " + _current_test_parameter_value_strings 			);
	print("------->current_parameter_value_test_parameter_values_string					= " + _current_test_parameter_values_string 			);
	print("------->current_parameter_value_test_plot_title_parameter_values_string		= " + _current_test_plot_title_parameter_values_string	);
}
function print_major_log_section_separator(section_heading)
{
	print("//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////");
	print("//*******************************************************************************************************************************************************************************************************************************************************************//");
	print("//************************ " + section_heading + " *****************************************************************************************************************************************************************************************************//");
	print("//*************************************************************************************************************************************************************************************************************************************************************//");	
	print("///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////");																											
}
function print_minor_log_section_separator(section_heading)
{
	print("//*******************************************************************************************************************************************************************************************************************************************************************//");
	print("//************************ " + section_heading + " *****************************************************************************************************************************************************************************************************//");
	print("//*************************************************************************************************************************************************************************************************************************************************************//");	
}
function print_multiplot_directories()
{	
	print_major_log_section_separator("Printing multiplot input/output directories, paths, and filenames..."				);
	print("------->current_test_multiplot_output_directory 		= " 	+ current_test_multiplot_output_directory			);	
	print("------->current_test_RSP_multiplot_directory			= " 	+ current_test_RSP_multiplot_directory				);	
	print("------->current_test_RSP_error_multiplot_directory	= "		+ current_test_RSP_error_multiplot_directory		);	
	print("------->current_test_std_dev_multiplot_directory		= " 	+ current_test_std_dev_multiplot_directory			);			
	print("------->current_test_TV_multiplot_directory			= " 	+ current_test_TV_multiplot_directory				);					
	print("------->current_test_TV_step_multiplot_directory		= " 	+ current_test_TV_step_multiplot_directory			);	
}
function print_multiplot_parameter_info()
{			
	print_major_log_section_separator("Printing parameter test multiplot info..."											);
	print		("------->multiplot_parameter_index 				= " 			+ multiplot_parameter_index				);
	print		("------->multiplot_parameter	 					= " 			+ multiplot_parameter					);
	print		("------->multiplot_parameter_prefix 				= " 			+ multiplot_parameter_prefix			);
	print		("------->multiplot_parameter_values 				: " 													);	Array.print	(multiplot_parameter_values);
	print		("------->num_multiplot_parameter_values 			= " 			+ num_multiplot_parameter_values		);
	print		("------->multiplot_parameter_range_suffix	 		= " 			+ multiplot_parameter_range_suffix		);
	print		("------->multiplot_parameter_range_string	 		= " 			+ multiplot_parameter_range_string		);
	print		("------->multiplot_parameter_range_bounds	 		= " 			+ multiplot_parameter_range_bounds		);
	print		("------->reduced_parameter_values_lower 			: " 													);	Array.print	(reduced_parameter_values_lower);
	print		("------->reduced_parameter_values_upper 			: " 													);	Array.print	(reduced_parameter_values_upper);
	print		("------->reduced_parameter_values 					: " 													);	Array.print	(reduced_parameter_values);
	print		("------->reduced_parameter_value_offsets 			: "														);	Array.print	(reduced_parameter_value_offsets);
	print		("------->reduced_modulo_values     				: "														);	Array.print	(reduced_modulo_values);
	print		("------->reduced_target_test_parameter_index 		= " 			+ reduced_target_test_parameter_index	);	
	print		("------->reduced_total_combinations 				= " 			+ reduced_total_combinations			);
	print		("------->all_reduced_parameter_combination_indices : "														);	Array.print	(all_reduced_parameter_combination_indices);
	print		("------->all_reduced_parameter_combinations 		: "														);	Array.print	(all_reduced_parameter_combinations);
	print		("------->all_reduced_folder_strings 				: "														);	Array.print	(all_reduced_folder_strings);
	print		("------->all_reduced_path_strings   				: "														);	Array.print	(all_reduced_path_strings);				
}
function print_current_parameter_value_test_directory_info()
{	
	print_major_log_section_separator("Printing current parameter test input/output directories, paths, and filenames..."	);
	print("-------> current_test_slice_2_analyze_directory 	= " 		+ current_test_input_directory					);
	print("-------> current_test_input_directory 			= " 		+ current_test_input_directory						);
	print("-------> current_test_output_directory 			= " 		+ current_test_output_directory						);
	print("-------> current_test_start_folder_index			= " 		+ current_test_start_folder_index					);
	print("-------> current_test_start_folder 				= " 		+ current_test_start_folder							);				
	print("-------> current_test_end_folder 				= " 		+ current_test_end_folder							);				
	print("-------> current_test_folders 					= "  															); 	Array.print(current_test_folders);
	print("-------> current_test_RSP_directory 				= " 		+ current_test_RSP_directory						);
	print("-------> current_test_RSP_error_directory 		= " 		+ current_test_RSP_error_directory					);
	print("-------> current_test_std_dev_directory 			= " 		+ current_test_std_dev_directory					);		
	print("-------> current_test_TV_directory 				= " 		+ current_test_TV_directory							);			
	print("-------> current_test_start_folder  				= " 		+ current_test_input_directory						);			
	print("-------> current_test_folder_basename_end_index 	= " 		+ current_test_input_directory						);
	print("-------> current_test_start_folder_index		 	= " 		+ current_test_input_directory						);
	print("-------> current_test_end_folder 	 			= " 		+ current_test_input_directory						);	
}
function print_current_parameter_value_test_output_directories()
{	
	print_major_log_section_separator("Printing current parameter test input/output directories, paths, and filenames..."		);
	print("-------> current_test_input_directory 		= " 				+ current_test_input_directory						);
	print("-------> current_test_output_directory 		= " 				+ current_test_output_directory						);
	print("-------> current_test_folders 				= "  																	); 	Array.print(current_test_folders);
	print("-------> current_test_RSP_directory 			= " 				+ current_test_RSP_directory						);
	print("-------> current_test_RSP_error_directory	= " 				+ current_test_RSP_error_directory					);
	print("-------> current_test_std_dev_directory 		= " 				+ current_test_std_dev_directory					);		
	print("-------> current_test_TV_directory 			= " 				+ current_test_TV_directory							);			
}
function print_parameter_value_test_info()
{	
	print_major_log_section_separator("Printing parameter value test info..."												);
	print		("-------> parameter_test_number					= " 	+ parameter_test_number							);
	print		("-------> parameter_test_info_filename				= " 	+ parameter_test_info_filename					);
	print		("-------> num_target_test_parameter_tests			= " 	+ num_target_test_parameter_tests				);
	print		("-------> num_parameters							: "		+ num_parameters								);	
	print		("-------> parameter_values							: "														);	Array.print	(parameter_values);
	print		("-------> num_parameter_values						: "														);	Array.print	(num_parameter_values);
	print		("-------> parameter_value_offsets 					: "														);	Array.print	(parameter_value_offsets);
	print		("-------> parameter_string_prefixes				: "														);	Array.print	(parameter_string_prefixes);
	print		("-------> parameter_string_precisions				: "														);	Array.print	(parameter_string_precisions);
	print		("-------> modulo_values 							: "														);	Array.print	(modulo_values);
	print		("-------> target_test_parameter					= " 	+ target_test_parameter							);	
	print		("-------> target_test_parameter_index				= " 	+ target_test_parameter_index					);	
	print		("-------> target_test_parameter_prefix				= " 	+ target_test_parameter_prefix					);	
	print		("-------> target_test_parameter_values 			: "														);	Array.print(target_test_parameter_values);
	print		("-------> num_target_test_parameter_values 		: "		+ num_target_test_parameter_values				);
	print		("-------> target_test_parameter_range_suffix		= " 	+ target_test_parameter_range_suffix			);		
	print		("-------> target_test_parameter_range_string		= " 	+ target_test_parameter_range_string			);		
	print		("-------> target_test_parameter_range_bounds		= " 	+ target_test_parameter_range_bounds			);		
	print		("-------> total_combinations 						= " 	+ total_combinations							);
	print		("-------> all_parameter_combination_indices		: "														);	Array.print	(all_parameter_combination_indices);
	print		("-------> all_parameter_combinations				: "														);	Array.print	(all_parameter_combinations);
	print		("-------> all_folder_strings						: "														);	Array.print	(all_folder_strings);
	print		("-------> all_path_strings							: "														);	Array.print	(all_path_strings);
	print		("-------> parameter_value_test_identifier			= " 	+ parameter_value_test_identifier				); 					
	print		("-------> parameter_value_test_input_directory 	= " 	+ parameter_value_test_input_directory			);
	print		("-------> parameter_value_test_output_directory 	= "		+ parameter_value_test_output_directory			);
}
function print_reconstructed_image_analysis_info()
{	
	print_major_log_section_separator("Printing reconstructed image(s) properties and analysis configuration/parameters");
	print		("\nReconstructed image(s) properties-------------------> "													);	
	print		("-------> voxel_dimensions								: "													);	Array.print	(voxel_dimensions);	
	print		("-------> voxel_width 									= " 	+ voxel_width								);									// 
	print		("-------> voxel_height									= " 	+ voxel_height								);
	print		("-------> voxel_thickness								= " 	+ voxel_thickness							);
	//print		("-------> voxel_dimensions								= " 	+ voxel_dimensions							);
	print		("-------> voxels_per_mm								= " 	+ voxels_per_mm								);
	print		("-------> num_recon_iterations							= " 	+ num_recon_iterations						);
	print		("-------> images_per_reconstruction					= " 	+ images_per_reconstruction					);
	print		("-------> reconstructed_image_strings					: "													);	Array.print	(reconstructed_image_strings);
	print		("-------> reconstructed_image_folders					: "													);	Array.print	(reconstructed_image_folders);
 	
	print		("\nImage analysis configuration/parameters-------------> "													);	
	print		("-------> first_iteration_2_analyze					= " 	+ first_iteration_2_analyze					);
	print		("-------> last_iteration_2_analyze						= " 	+ last_iteration_2_analyze					);
	print		("-------> num_iterations_2_analyze						= " 	+ num_iterations_2_analyze					);
	print		("-------> iterations_2_analyze							: "													);	Array.print	(iterations_2_analyze);	
	print		("-------> iterations_2_analyze_string_precision		= " 	+ iterations_2_analyze_string_precision		);
	print		("-------> iterations_2_analyze_strings					: "													);	Array.print	(iterations_2_analyze_strings);
	print		("-------> iterations_2_analyze_folders					: "													);	Array.print	(iterations_2_analyze_folders);
	print		("-------> first_slice_2_analyze						= " 	+ first_iteration_2_analyze					);
	print		("-------> last_slice_2_analyze							= " 	+ last_iteration_2_analyze					);
	print		("-------> num_slices_2_analyze							= " 	+ num_slices_2_analyze						);
	print		("-------> slices_2_analyze								: "													);	Array.print	(slices_2_analyze);
	print		("-------> slices_2_analyze_string_precision			= " 	+ slices_2_analyze_string_precision			);
	print		("-------> slices_2_analyze_strings						: "													);	Array.print	(slices_2_analyze_strings);
	print		("-------> slices_2_analyze_folders						: "													);	Array.print	(slices_2_analyze_folders);
	print		("-------> num_ROIs_2_analyze							= " 	+ num_ROIs_2_analyze						);
	print		("-------> num_ROI_selection_diameters					= " 	+ num_ROI_selection_diameters				);
	print		("-------> ROI_profile_radii							: "													);	Array.print	(ROI_profile_radii);	
	print		("-------> ROI_selection_radii 							= "													); 	Array.print(ROI_selection_radii);	
	print		("-------> ROI_selection_diameters						: "													);	Array.print	(ROI_selection_diameters);
	print		("-------> ROI_selection_diameter_string_precision		= " 	+ ROI_selection_diameter_string_precision	);
	print		("-------> ROI_selection_diameter_strings				: "													);	Array.print	(ROI_selection_diameter_strings);
	print		("-------> ROI_selection_diameter_folders				: "													);	Array.print	(ROI_selection_diameter_folders);	
}
function print_ROI_definitions(bulk_material, bulk_material_RSP, ROI_profile_radius_beyond_ROI, ROI_selection_radii, ROI_shapes, ROI_labels, ROI_material_names, ROI_diameters)
{
	print_major_log_section_separator("Printing ROI definitions and info..."						);
	print	("-------> phantom_basename					= " 	+ phantom_basename					);
	print	("-------> ROI_definitions_filename			= " 	+ ROI_definitions_filename			);
	print	("-------> ROI_definitions_file_path		= " 	+ ROI_definitions_file_path			);
	print	("-------> num_ROIs_2_analyze 				= " 	+ num_ROIs_2_analyze				);
	print	("-------> ROI_material_names 				= "											); 	Array.print(ROI_material_names);	
	print	("-------> ROI_material_RSPs 				= "											); 	Array.print(ROI_material_RSPs);	
	print	("-------> ROI_labels 						= "											); 	Array.print(ROI_labels);	
	print	("-------> ROI_shapes 						= "											); 	Array.print(ROI_shapes);	
	print	("-------> ROI_diameters 					= "											); 	Array.print(ROI_diameters);	
	print	("-------> ROI_selection_radii 				= "											); 	Array.print(ROI_selection_radii);	
	print	("-------> ROI_profile_radius_beyond_ROI	= " 	+ ROI_profile_radius_beyond_ROI		);
	print	("-------> bulk_material 					= " 	+ bulk_material						);
	print	("-------> bulk_material_RSP 				= " 	+ bulk_material_RSP					);
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
	_image_basename 				= Dialog.getString();
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
function query_image_dimensions(directory_path, initial_iterate_filename)
{
	file_path 			= construct_valid_file_path(directory_path, initial_iterate_filename);		
	run					("Text Image... ", "open=" + file_path);
	getDimensions		(image_columns, image_height, image_channels, image_layers, image_frames);
	image_rows 			= image_columns;
	image_slices 		= image_height / image_rows;
	image_dimensions 	= newArray(image_columns, image_rows, image_slices, image_height, image_channels, image_layers, image_frames);
	//run					("Close");	
	return image_dimensions;
}
function query_open_image_dimensions()
{
	getDimensions		(_image_columns, _image_height, _image_channels, _image_layers, _image_frames);
	_image_rows 		= _image_columns;
	_image_slices 		= _image_height / _image_rows;
	_image_dimensions 	= newArray(_image_columns, _image_rows, _image_slices, _image_height, _image_channels, _image_layers, _image_frames);
	//run				("Close");	
	return _image_dimensions;
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
		_ROI_parameter_key 						= substring(_ROI_definition_file_key_value_pairs[i], 0, _ROI_key_value_pair_separation_index);
		_ROI_values_string						= substring(_ROI_definition_file_key_value_pairs[i], _ROI_key_value_pair_separation_index + 1);
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
function results_table_2_CSV(directory, filename, overwrite_existing, print_path, clear_results)
{
	filepath 			= construct_valid_file_path(directory, filename);	
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
function ROI_parameter_string_2_values(_ROI_parameter_strings, ROI_parameter_string_index, _ROI_parameter_decodings, _ROI_parameter_value_parseFloat, _force_array)
{
	desired_ROI_parameter_string = _ROI_parameter_strings[ROI_parameter_string_index];
	desired_ROI_parameter_string_elements = split(desired_ROI_parameter_string, ",");
	num_desired_ROI_parameter_string_elements = desired_ROI_parameter_string_elements.length;
	desired_ROI_parameter_values			= newArray(num_desired_ROI_parameter_string_elements);
	for(i = 0; i < num_desired_ROI_parameter_string_elements; i++)
	{
		_spaceless_parameter_value_string = strip_surrounding_spaces(desired_ROI_parameter_string_elements[i]);
		if(_ROI_parameter_decodings[ROI_parameter_string_index] == _ROI_parameter_value_parseFloat)
			desired_ROI_parameter_values[i] 			= parseFloat(_spaceless_parameter_value_string);
		else
			desired_ROI_parameter_values[i] 			= _spaceless_parameter_value_string;
	}
	if( num_desired_ROI_parameter_string_elements == 1 && !_force_array)
		return desired_ROI_parameter_values[0];
	else
		return desired_ROI_parameter_values;
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
function save_GIF(directory, filename, overwrite_existing, print_path, close_stack_after_saving)
{
	path 		= construct_valid_file_path(directory, filename);	
	if(print_path)
		print	("------->Saving image stack as GIF and writing to:\n" + path);
	if(!File.exists(path) || overwrite_existing)
	{
		//run		("Animated Gif... ", "save=" + path);
		run("Animated Gif ... ", "number=0 filename=" + path);
		OUTPUT_FILE_LIST	= Array.concat(OUTPUT_FILE_LIST, path);	
	}	
	if(close_stack_after_saving)
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
function set_plot_data_props(data_line_color, add_text_justification)
{	
	Plot.setColor			(data_line_color);				
	Plot.setAxisLabelSize	(axis_label_text_size);
	Plot.setFormatFlags		("11111111111111");	
	Plot.setFrameSize		(x_frame_size, y_frame_size);
	Plot.show				();										
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
function set_plot_extrema(plot_data, additional_data, tolerance, lower_limits_scale, upper_limits_scale, difference_scale)
{
	plot_extrema 				= newArray(2);
	extrema 					= find_array_extrema(plot_data, tolerance, true);
	if(additional_data.length != 0)
	{
		additional_data_extrema	= find_array_extrema(additional_data, tolerance, false);
		plot_extrema[0] 		= minOf(extrema[0], additional_data_extrema[0]) * lower_limits_scale;
		plot_extrema[1] 		= maxOf(extrema[1], additional_data_extrema[1]) * upper_limits_scale;
		//plot_extrema[0] 		= minOf(extrema[0], additional_data_extrema[0]) * lower_limits_scale;
		//plot_extrema[1] 		= maxOf(extrema[1], additional_data_extrema[1]) * upper_limits_scale;
	}
	else
	{
		plot_extrema[0] 		= extrema[0] * lower_limits_scale;
		plot_extrema[1] 		= extrema[1] * upper_limits_scale;
		//plot_extrema[0] 		= extrema[0] * lower_limits_scale;
		//plot_extrema[1] 		= extrema[1] * upper_limits_scale;
	}
	diff_adjustment 			= (plot_extrema[1] - plot_extrema[0]) * difference_scale;
	plot_extrema[0] 			-= diff_adjustment;
	plot_extrema[1] 			+= diff_adjustment;
	
	if(plot_extrema[0] < 0)
		plot_extrema[0] 		*= upper_limits_scale / lower_limits_scale;
	if(plot_extrema[1] < 0)
		plot_extrema[1] 		*= lower_limits_scale / upper_limits_scale;
	return plot_extrema;
}
function set_plot_props(legend_entries, x_frame_size, y_frame_size, text, text_xpos_ratio, text_ypos_ratio, add_line_color, linewidth)
{
	//run					("Profile Plot Options...", "width=1000 height=1000 font=20 minimum=0 maximum=0 draw draw_ticks interpolate sub-pixel");
	legend_text 			= legend_entries[0];
	for(i = 1; i < legend_entries.length; i++)
		legend_text 		+= "\n" + legend_entries[i];
	Plot.addLegend			(legend_text, "Bottom-Right");						
	Plot.setLineWidth		(linewidth);
	setForegroundColor		(255, 255, 255);
	//run					("Colors...", "foreground=white background=white selection=yellow");	
	//run					("Canvas Size...", "width=900 height=500 position=Center");	
	Plot.setJustification	(add_text_justification);	
	Plot.setFontSize		(text_size);
	Plot.addText			(text, text_xpos_ratio, text_ypos_ratio);							
	Plot.setColor			(add_line_color);																
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
//function extract_slice(slice, magnification, flip_horizontally, flip_vertically, grayscale_min, grayscale_max, window_title)
//slice_2_PNG		(slice_2_analyze_directory, PNG_image_filename, slice, x_magnification, flip_horizontally, flip_vertically, grayscale_range_min, grayscale_range_max, overwrite_slice_2_PNG, PNG_image_filename, close_saved_PNG_image, print_slice_ops );
function slice_2_PNG(_directory, _filename, _slice, _magnification, _flip_horizontally, _flip_vertically, _grayscale_range_min, _grayscale_range_max, _overwrite_existing, _window_title, _close_image, _console_print )
{					
	if(_console_print)
		print			("Extracting and saving PNG image of the slice of x being analysed...");			
	_dimensions 		= query_open_image_dimensions();
	_columns 			= _dimensions[0];
	_rows  				= _dimensions[1];					
	_image_slices 		= _dimensions[2]; 					
	_x_colunns 			= _magnification * _columns;
	_x_rows 			= _magnification * _rows;
	_y_upper_LHS 		= (_slice - 1) * _rows;			// y-coordinate of upper left corner of slice to be analyzed
	makeRectangle		( 0, _y_upper_LHS, _columns, _rows);
	//imageCalculator	("Copy create", filename ,filename );
	//run				("Enhance Contrast", "saturated=0.35");
	run					("Duplicate...", "title=" + _window_title );
	setMinAndMax		(_grayscale_range_min, _grayscale_range_max);
	if(_flip_horizontally)
		run				("Flip Horizontally");
	if(_flip_vertically)
		run				("Flip Vertically");
	run					("Size...", "width=" + _x_colunns + " height=" + _x_rows + " constrain average interpolation=Bilinear");	
	save_PNG			(_directory, _filename, _overwrite_existing, _close_image, _console_print);				
}
function stack_2_animated_GIF(stack_title, GIF_directory, GIF_filename, GIF_speed, GIF_2_disk, overwrite_GIF, print_GIF_path, close_stack_after_saving)
{
	selectImage		(stack_title);
	run				("Animation Options...", "speed=" + GIF_speed);
	if(GIF_2_disk)
		save_GIF	(GIF_directory, GIF_filename, overwrite_GIF, print_GIF_path, close_stack_after_saving);
}
function stack_2_AVI(stack_title, directory, filename, compression, frame_rate, AVI_2_disk, overwrite_AVI, print_path, close_stack_after_saving)
{
	selectImage		(stack_title);
	if(AVI_2_disk)
		save_AVI	(directory, filename, compression, frame_rate, overwrite_AVI, print_path, close_stack_after_saving);
}
function string_array_concatenation(_string_array, _front_concatenation_string, _back_concatenation_string)
{
	_num_array_strings = _string_array.length;
	_concatenated_string_array = newArray(_num_array_strings);
	for(i = 0; i < _num_array_strings; i++)
		_concatenated_string_array[i] = _front_concatenation_string + _string_array[i] + _back_concatenation_string;
	return _concatenated_string_array;
}
function string_match(_string, _string_2_match, _throw_mismatch_error)
{
	_strings_match 				= (_string == _string_2_match);
	if							(_throw_mismatch_error && !_strings_match)	
		showMessageWithCancel	("String mismatch: \n" + _string + "\n" + _string_2_match);
	return 		 				_strings_match;
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
function suffixes_2_filenames(common_basename, filename_suffixes)
{
	num_suffixes		= filename_suffixes.length;
	filenames			= newArray(num_suffixes);
	for(i = 0; i < num_suffixes; i++)
		filenames[i]	= common_basename + filename_suffixes[i];
	return 				filenames;
}
function task_only_bool_dependence(_bool_default, _task_bools, _write_no_bools)
{
	_bool_out_array = Array.copy(_task_bools);
	for(i = 0; i < _write_no_bools.length; i++)
		if(_write_no_bools[i])
			_bool_out_array[i] = false;
	for(i = 0; i < _bool_out_array.length; i++)
		if(_bool_out_array[i])
			return _bool_default;
	return false;
}
function verify_reconstruction_output(_all_path_strings, _current_parameter_value_test_folder, _reconstructed_image_strings, _TV_input_data_filename)
{
	directory 				= construct_valid_directory_path(common_directory, _current_parameter_value_test_folder);		
	data_verified 			= true;
	_num_reconstructions 	= _all_path_strings.length;
	_num_iterations			= _reconstructed_image_strings.length;
	missing_data			= newArray();
	for(reconstruction = 0; reconstruction < _num_reconstructions; reconstruction++)
	{
		check_reconstruction_directory	= _all_path_strings[reconstruction];
		for(iteration = 0; iteration < _num_iterations; iteration++)
		{
			check_image_path 	= check_reconstruction_directory + File.separator + _reconstructed_image_strings[iteration] + ".txt";
			if(!File.exists(check_image_path))
			{
				print			("*****ERROR: reconstructed image does not exist:*****\n" + check_image_path);
				data_verified 	= false;
				missing_data	= Array.concat(missing_data, check_image_path);
			}			
		}
		check_TV_path			= check_reconstruction_directory + File.separator + _TV_input_data_filename + ".txt";
		if(!File.exists(check_TV_path))
		{
			print				("*****ERROR: TV measurement file does not exist:*****\n" + check_TV_path);
			data_verified 		= false;
			missing_data		= Array.concat(missing_data, check_TV_path);
		}
	}
	return data_verified;			
}
function verify_input_data(_common_directory, _current_parameter_value_test_folders, _current_analysis_RSP_input_data_filenames, _current_analysis_RSP_error_input_data_filenames, _current_analysis_std_dev_input_data_filenames, _current_analysis_TV_input_data_filenames)
{
	for( i = 0; i < _current_parameter_value_test_folders.length; i++)
	{
		directory 	= _common_directory + _current_parameter_value_test_folders[i];
		print		("------->Verifying RSP input data file exists at:\n" + directory + _current_analysis_RSP_input_data_filenames);
		print		("------->Verifying RSP error input data file exists at:\n" + directory + _current_analysis_RSP_error_input_data_filenames);
		print		("------->Verifying standard deviation input data file exists at:\n" + directory + _current_analysis_std_dev_input_data_filenames);
		print		("------->Verifying total variation (TV) input data file exists at:\n" + directory + _current_analysis_TV_input_data_filenames);
		if(!File.exists(directory + _current_analysis_RSP_input_data_filenames))
			return false;
		if(!File.exists(directory + _current_analysis_RSP_error_input_data_filenames));
			return false;
		if(!File.exists(directory + _current_analysis_std_dev_input_data_filenames));
			return false;
		if(!File.exists(directory + _current_analysis_TV_input_data_filenames));
			return false;
	}
	return true;						
}
function verify_ROI_analysis_output_files(_common_directory, _current_parameter_value_test_folders, _current_analysis_RSP_input_data_filenames, _current_analysis_RSP_error_input_data_filenames, _current_analysis_std_dev_input_data_filenames, _current_analysis_TV_input_data_filenames)
{
	for( i = 0; i < _current_parameter_value_test_folders.length; i++)
	{
		directory 	= _common_directory + _current_parameter_value_test_folders[i];
		print		("------->Verifying RSP input data file exists at:\n" + directory + _current_analysis_RSP_input_data_filenames);
		print		("------->Verifying RSP error input data file exists at:\n" + directory + _current_analysis_RSP_error_input_data_filenames);
		print		("------->Verifying standard deviation input data file exists at:\n" + directory + _current_analysis_std_dev_input_data_filenames);
		print		("------->Verifying total variation (TV) input data file exists at:\n" + directory + _current_analysis_TV_input_data_filenames);
		if(!File.exists(directory + _current_analysis_RSP_input_data_filenames))
			return false;
		if(!File.exists(directory + _current_analysis_RSP_error_input_data_filenames));
			return false;
		if(!File.exists(directory + _current_analysis_std_dev_input_data_filenames));
			return false;
		if(!File.exists(directory + _current_analysis_TV_input_data_filenames));
			return false;
	}
	return true;						
}
function verify_reconstruction_output(_reconstruction_data_directory, _reconstruction_output_directory, _reconstructed_image_strings, _TV_input_data_filename)
{
	_reconstruction_output_directory_path = construct_valid_directory_path(_reconstruction_data_directory, _reconstruction_output_directory);		
	//_reconstruction_output_data_
	data_verified 			= true;
	_num_iterations			= _reconstructed_image_strings.length;
	for(iteration = 0; iteration < _num_iterations; iteration++)
	{
		check_image_path 	= _reconstruction_output_directory_path + File.separator + _reconstructed_image_strings[iteration] + ".txt";
		if(!File.exists(check_image_path))
		{
			print			("ERROR: reconstructed image does not exist:\n" + check_image_path);
			data_verified 	= false;
			missing_data	= Array.concat(missing_data, check_image_path);
		}			
	}
	check_TV_path			= _reconstruction_output_directory_path + File.separator + _TV_input_data_filename + ".txt";
	if(!File.exists(check_TV_path))
	{
		print				("ERROR: TV measurement file does not exist:\n" + check_TV_path);
		data_verified 		= false;
		missing_data		= Array.concat(missing_data, check_TV_path);
	}
	return data_verified;			
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
