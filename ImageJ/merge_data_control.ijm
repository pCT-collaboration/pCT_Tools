//C:\Users\Blake\Documents\GitHub\pCT-collaboration\pCT_Tools\ImageJ
macro "merge_data_control"
{
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//***************************************************************************************************************************************************************************************************//
	//************************* Close all windows and clear results table *******************************************************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	close_all_windows		(true, true);
	setBatchMode			(true);	
	//setBatchMode			(false);
	//print_section_separator("Generating multi-curve plots vs target test parameter for a user specified parameter, with each plot having individual curves for each value of this parameter, then writing the plot data and resulting images to disk as PNG", true);
	//***************************************************************************************************************************************************************************************************//
	//************************************************************************************ Define Boolean constants *************************************************************************************//
	//***************************************************************************************************************************************************************************************************//
	ALL_BOOL 										= false;
	NONE_BOOL 										= true;
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
	//***********************************************************************************************************************************************************************************************//
	//***************************************************************************** Set reconstruction data directory/file info *********************************************************************//
	//***********************************************************************************************************************************************************************************************//
	MONTH_NAMES 									= newArray("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
	DAY_NAMES 										= newArray("Sun", "Mon","Tue","Wed","Thu","Fri","Sat");
	FOLDER_SEPARATOR								= File.separator;
	ImageJ_plugins_directory						= getDirectory("plugins");
	ImageJ_macro_directory							= getDirectory("macros");
	ImageJ_program_directory						= getDirectory("imagej") ;
	ImageJ_launch_directory							= getDirectory("startup");
	ImageJ_previous_macro							= getInfo("macro.filepath");
	github_macro_directory							= "C:\\Users\\Blake\\Documents\\GitHub\\Baylor_ICTHUS\\pCT_Reconstruction\\Tools\\ImageJ";
 	github_collab_macro_directory					= "C:\\Users\\Blake\\Documents\\GitHub\\pCT-collaboration\\pCT_Tools\\ImageJ";
 	reconstruction_data_directory_C					= "C:\\Users\\Blake\\Documents\\Education\\Research\\pCT\\pCT_data\\reconstruction_data";
	reconstruction_data_directory_D					= "D:\\pCT\\pCT_data\\reconstruction_data";
	ROI_analysis_macro_filename 					= "ROI_Analysis.ijm";
	ROI_analysis_macro_path 						= github_macro_directory + FOLDER_SEPARATOR + ROI_analysis_macro_filename;
	merge_analysis_macro_filename 					= "merge_data.ijm";
	merge_ROI_analysis_files_macro_path 			= github_collab_macro_directory + FOLDER_SEPARATOR + merge_analysis_macro_filename;
	multiplotting_macro_filename 					= "Multiplotting.ijm";
	multiplotting_macro_path 						= github_macro_directory + FOLDER_SEPARATOR + multiplotting_macro_filename;
	test_result_comparison_macro_filename 			= "Test_Result_Comparison.ijm";
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
	current_reconstruction_data_drive				= drive_D;
	current_reconstruction_data_type				= experimental_data;
	
	if(current_reconstruction_data_drive == drive_C)				reconstruction_data_directory 	= reconstruction_data_directory_C;
	else if(current_reconstruction_data_drive == drive_D)			reconstruction_data_directory 	= reconstruction_data_directory_D;
	if(current_reconstruction_data_type == simulated_data) 			test_batch_directory 			= reconstruction_data_directory + phantom_name_folder + simulated_data_folder + run_date_folder + run_number_folder + output_folder + preprocess_date_folder + FOLDER_SEPARATOR;
	else if(current_reconstruction_data_type == experimental_data)	test_batch_directory 			= reconstruction_data_directory + phantom_name_folder + experimental_data_folder + run_date_folder + run_number_folder + output_folder + preprocess_date_folder + FOLDER_SEPARATOR;		

	//TEST_BATCH_DIR 								= RECON_DATA_DIR + PHANTOM_NAME_FOLDER + EXPERIMENTAL_DATA_FOLDER + FOLDER_SEPARATOR + "B_25600" + FOLDER_SEPARATOR;		
	test_batch_directory 							= reconstruction_data_directory + phantom_name_folder + experimental_data_folder + FOLDER_SEPARATOR + "B_25600" + FOLDER_SEPARATOR;		

	// Image/data filename and directory prefixes, file extensions, and results table column headings
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
	//***********************************************************************************************************************************************************************************************//
	//************************************************************************************** Parameter value arrays *********************************************************************************//
	//***********************************************************************************************************************************************************************************************//
	EMPTY_STRING 									= "";								// Passed to set_plot_extrema when no additional lines are plotted
	empty_array 									= newArray();								// Passed to set_plot_extrema when no additional lines are plotted
	sequential_values								= Array.getSequence(100);					// Long sequential values array which other sequence arrays can be sliced from	
	num_specs 										= 4;										// # of test parameter properties specified in Specs file
	make_top_directory								= true;
	dont_make_top_directory							= false;
	debug_print_counter								= 1;
	//***********************************************************************************************************************************************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	//************************************************************ Set Parameter Names/Values and Construct Paths to Corresponding Data *************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	//***********************************************************************************************************************************************************************************************************//
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	//---------------------------------------------- Specifications used to identify file containing specifications of parameters of parameter value test -------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	parameter_test_number						= 1;
	parameter_test_info_filename				= parameter_test_info_basename + d2s(parameter_test_number, 0)  + TXT;
	parameter_test_info 						= file_2_array(test_batch_directory, parameter_test_info_filename, false);
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
	//allowed_parameter_string_prefixes			= newArray("TV", "A", "L");
	allowed_parameter_string_prefixes			= newArray("A", "L");
	App("parameter_string_prefixes", parameter_string_prefixes);
	App("num_parameter_values", num_parameter_values);
	print(num_parameters);
	print(parameter_string_prefixes.length);
	//exit();
	for(i = 0; i < num_parameters - 1; i++)
	{
		if(num_parameter_values[i] > 1 && isMember(parameter_string_prefixes[i], allowed_parameter_string_prefixes))
		//if(num_parameter_values[i] > 1)
		{
			//print("parameter_string_prefixes[i] = " + parameter_string_prefixes[i]);
			print_section_separator				("Merging data for multiplot parameter w/ prefix = \n ----------> " + parameter_string_prefixes[i], true);
			runMacro							(merge_ROI_analysis_files_macro_path, parameter_string_prefixes[i]);
			//exit();
		}
	}
	//print("parameter_string_prefixes[i]" + parameter_string_prefixes[i]);
	//print("parameter_string_prefixes[4]" + parameter_string_prefixes[4]);
	//runMacro										(merge_ROI_analysis_files_macro_path, parameter_string_prefixes[5]);
	//runMacro										(merge_ROI_analysis_files_macro_path, "A");
	//runMacro										(merge_ROI_analysis_files_macro_path, "L");
//	runMacro		(ROI_ANALYSIS_MACRO_PATH, TEST_BATCH_DIR+ compared_folders[0]  + FOLDER_SEPARATOR );	
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***************************************************************************************************************************************************************************************************//
//************************* User defined function definitions ***************************************************************************************************************************************//
//***************************************************************************************************************************************************************************************************//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function Ap(arg)
{
	Array.print(arg);
}
function dexit()
{
	exit("-----> Manual exit initiated");
}
function pexit(_str)
{
	exit(_str);
}
function App(statement, array)
{
	print("*******> " + statement + " = ");
	Array.print(array);
}
function append_2_log(_dir)
{
	print("_dir=" + _dir);
	_time_stamp = create_time_stamp(false, false);		
	File.append("merge_data.ijm: " + _time_stamp, _dir + File.separator + ANALYSIS_LOG_FNAME) 							
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
function file_2_array(path, filename, print_path)
{
	file_path 		= construct_valid_file_path(path, filename);		
	if(print_path)
		print		("Importing array from:\n------->" + file_path);
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
		print		("Importing array from:\n------->" + file_path);
	str 			= File.openAsString(file_path); 
	lines 			= split(str,"\n");
	array 			= newArray(lines.length);
	for(i = 0; i < array.length; i++)
		array[i] 	= parseFloat(lines[i]);
	INPUT_FILE_LIST	= Array.concat(INPUT_FILE_LIST, file_path);			
	return array;
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
	_parameter_values_string 		= "";
	for(parameter = 0; parameter < _num_parameters; parameter++)
		_parameter_values_string 	+= parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";
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
function generate_missing_input_data(common_directory, current_parameter_value_test_folder, RSP_path, RSP_Error_path, Std_Dev_path)
{
	directory 		= construct_valid_directory_path(common_directory, current_parameter_value_test_folder);		
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
function generate_missing_test_input_data(common_directory, current_parameter_value_test_folders, RSP_path, RSP_Error_path, Std_Dev_path)
{
	for( i = 0; i < current_parameter_value_test_folders.length; i++)
	{
		directory 			= construct_valid_directory_path(common_directory, current_parameter_value_test_folders[i]);		
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
function generate_multiplot_title_parameter_string(_target_test_parameter_range_suffix, _multiplot_parameter_index, _current_parameter_value_test_value_strings, _multiplot_parameter_range_plots, _parameter_string_prefixes )
{
	_multiplot_title_parameter_string 		= "";
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _multiplot_parameter_index; parameter++)	
		_multiplot_title_parameter_string	+= parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";	
	_multiplot_title_parameter_string		+= _multiplot_parameter_range_plots + ", ";						
	for(parameter = _multiplot_parameter_index + 1; parameter < num_parameters - 1; parameter++)	
		_multiplot_title_parameter_string 	+= parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";						
	_multiplot_title_parameter_string	+=  parameter_string_prefixes[num_parameters - 1] + " = " + _target_test_parameter_range_suffix;			
	return _multiplot_title_parameter_string;	
}		
function generate_multiplot_title_parameter_values_string(_target_test_parameter_range_suffix, _multiplot_parameter_index, _current_parameter_value_test_value_strings, _multiplot_parameter_range_filenaming, _parameter_string_prefixes )
{
	_multiplot_title_parameter_values_string 		= "";
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _multiplot_parameter_index; parameter++)	
		_multiplot_title_parameter_values_string	+= parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";	
	_multiplot_title_parameter_values_string		+= _multiplot_parameter_range_filenaming + ", ";						
	for(parameter = _multiplot_parameter_index + 1; parameter < num_parameters - 1; parameter++)	
		_multiplot_title_parameter_values_string 	+= parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";						
	_multiplot_title_parameter_values_string	+=  parameter_string_prefixes[num_parameters - 1] + " = " + _target_test_parameter_range_suffix;			
	return _multiplot_title_parameter_values_string;	
}		
function generate_multivalue_parameter_equals_suffix(_current_test_parameter_value_strings, _parameter_prefixes, _num_parameter_values, _parameter_precisions, _multiplot_parameter_index, _multiplot_parameter_range_filenaming)
{
	_suffix = "";
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
function generate_merged_parameter_equals_suffix(_current_test_parameter_value_strings, _parameter_prefixes, _num_parameter_values, _parameter_precisions, _multiplot_parameter_index, _multiplot_parameter_value)
{
	_suffix = "";
	_num_parameters = _parameter_prefixes.length;
	for(i = 0; i < _num_parameters - 1; i++)
	{
		if(_num_parameter_values[i] > 1)
		{
			if(i != _multiplot_parameter_index)
				_suffix += _parameter_prefixes[i] + "=" + remove_trailing_zeros(_current_test_parameter_value_strings[i], _parameter_precisions[i]) + "_";
			else
				_suffix += _parameter_prefixes[i] + "=" + remove_trailing_zeros(_multiplot_parameter_value, _parameter_precisions[i]) + "_";
		}
		
	}
	return substring(_suffix, 0, lengthOf(_suffix) -1);						
}
function generate_multivalue_parameter_values_short_title_string(_target_test_parameter_range_index, _multiplot_parameter_index, _current_parameter_value_test_value_strings, _parameter_string_prefixes, _num_parameter_values )
{
	_multiplot_title_parameter_values_string 		= "";
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _num_parameters; parameter++)	
	{
		if(_num_parameter_values[parameter] > 1 && parameter != _target_test_parameter_range_index && parameter != _multiplot_parameter_index)
			_multiplot_title_parameter_values_string	+= parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";	
	}
	return _multiplot_title_parameter_values_string;	
}		
function generate_multivalue_parameter_values_title_string(_target_test_parameter_range_suffix, _multiplot_parameter_index, _current_parameter_value_test_value_strings, _multiplot_parameter_range_filenaming, _parameter_string_prefixes, _num_parameter_values )
{
	_multiplot_title_parameter_values_string 		= "";
	_num_parameters					= _parameter_string_prefixes.length;		
	for(parameter = 0; parameter < _multiplot_parameter_index; parameter++)	
		if(_num_parameter_values[parameter] > 1)
			_multiplot_title_parameter_values_string	+= parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";	
	_multiplot_title_parameter_values_string		+= _multiplot_parameter_range_filenaming + ", ";						
	for(parameter = _multiplot_parameter_index + 1; parameter < num_parameters - 1; parameter++)	
		if(_num_parameter_values[parameter] > 1)
			_multiplot_title_parameter_values_string 	+= parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";						
	_multiplot_title_parameter_values_string	+=  parameter_string_prefixes[num_parameters - 1] + " = " + _target_test_parameter_range_suffix;			
	return _multiplot_title_parameter_values_string;	
}		
function generate_ordering_indices(_num_iterations, _num_ROIs_2_analyze, _images_per_reconstruction, _num_target_test_parameter_values)
{
	ordering_indices 										= newArray(_num_ROIs_2_analyze * _images_per_reconstruction * _num_target_test_parameter_values);
	ordering_indices_position 								= 0;
	for(iteration = 0; iteration <= _num_iterations; iteration++)  
	{
		for(ROI = 0; ROI < _num_ROIs_2_analyze; ROI++)
		{
			for( N = 0; N < _num_target_test_parameter_values; N++)
			{
				ordering_index 								= _num_ROIs_2_analyze * _images_per_reconstruction * N + iteration * _num_ROIs_2_analyze + ROI;
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
	_num_parameter_combination_indices 	= _parameter_combination_indices.length;
	_parameter_combination 				= newArray(_num_parameter_combination_indices);
	for(parameter = 0; parameter < _num_parameter_combination_indices; parameter++)
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
function generate_parameter_test_folder_compared(_parameter_string_prefixes, _parameter_string_precisions, _parameter_combination )
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
function generate_parameter_value_offsets(_num_parameter_values)
{
	_num_parameters				= _num_parameter_values.length;
	_parameter_value_offsets 	= newArray(_num_parameters);	
	for(i = 0; i < _num_parameters; i++)
		for(j = 0; j < i; j++)
			_parameter_value_offsets[i] 	+= _num_parameter_values[j];		 
	return _parameter_value_offsets;
}
function generate_parameter_value_range_suffix_string(_parameter_values, _parameter_string_precision)
{	
	_target_test_parameter_extrema = find_array_extrema(_parameter_values, tolerance, false);
	_target_test_parameter_range_min_string		= d2s( _target_test_parameter_extrema[0], _parameter_string_precision);
	_target_test_parameter_range_max_string		= d2s( _target_test_parameter_extrema[1], _parameter_string_precision);
	_target_test_parameter_range_suffix			= "[" + _target_test_parameter_range_min_string + "-" + _target_test_parameter_range_max_string + "]";		
	return _target_test_parameter_range_suffix;
}							
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
function generate_parameter_value_test_multiplot_copy_suffixes(_current_test_parameter_value_strings, _parameter_prefixes, _num_parameter_values, _parameter_precisions, _multiplot_parameter_index, _multiplot_parameter_range_filenaming)
{
	_suffix = "";
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
function generate_plot_title_parameter_string(_current_parameter_value_test_value_strings, _target_test_parameter_index, _target_test_parameter_range_suffix, _parameter_string_prefixes)
{
	_plot_title_parameter_string 		= "";
	for(parameter = 0; parameter < _target_test_parameter_index; parameter++)
		_plot_title_parameter_string 	+= _parameter_string_prefixes[parameter] + " = " + _current_parameter_value_test_value_strings[parameter] + ", ";
	_plot_title_parameter_string 		+= _parameter_string_prefixes[parameter] + " = " + _target_test_parameter_range_suffix;										
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
function identify_missing_input_data(common_directory, current_parameter_value_test_folder, RSP_path, RSP_Error_path, Std_Dev_path)
{
	directory 			= construct_valid_directory_path(common_directory, current_parameter_value_test_folder);		
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
	bottom_directory_folders 			= split(bottom_directory, FOLDER_SEPARATOR);
	top_directory_folders 				= split(top_directory, FOLDER_SEPARATOR);
	return_statement					= "------->Top directory through target directory already exist\n";
	if(top_directory_folders.length != bottom_directory_folders.length)
	{
		if(make_top_directory)
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
			path 							+= FOLDER_SEPARATOR + subdirectories_2_create[i];
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
	if(_print_directories_created)
		print(return_statement);
	return return_statement;											
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
	run							("Set Measurements...", "area mean standard min redirect = None decimal = 4");		
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
	run						("Set Measurements...", "area mean standard min redirect = None decimal = 4");		
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
	run				("Set Measurements...", "area mean standard min redirect = None decimal = 4");	
	INPUT_FILE_LIST	= Array.concat(INPUT_FILE_LIST, file_path);					
}																						
function order_comparison_data(unordered_data, ordering_indices, _num_ROIs_2_analyze, images_per_reconstruction, num_target_test_parameter_values)
{
	ordered_data 		= newArray(_num_ROIs_2_analyze * images_per_reconstruction * num_target_test_parameter_values);
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
function parameter_value_test_folder_name_2_base(_folder_name, _target_test_parameter_prefix)
{
	_target_test_parameter_prefix_length 		= lengthOf		(_target_test_parameter_prefix);
	_start_index 		= indexOf		(_folder_name, _target_test_parameter_prefix );
	_end_index 			= _start_index + _target_test_parameter_prefix_length;
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
