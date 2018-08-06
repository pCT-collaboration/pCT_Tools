//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
function shiftKeyDown			() 										{ setKeyDown			(SHIFT_KEY); 																									}
function altKeyDown				() 										{ setKeyDown			(ALT_KEY); 																										}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//	RECTANGLE_STRING 								= "rectangle";
//	OVAL_STRING 									= "oval";
//	POLYGON_STRING 									= "polygon";
//	FREEHAND_STRING 								= "freehand";
//	TRACED_STRING 									= "traced";
//	STRAIGHT_LINE_STRING 							= "straight_line";
//	SEGMENTED_LINE_STRING 							= "segmented_line";
//	FREEHAND_LINE_STRING 							= "freehand_line";
//	ANGLE_STRING 									= "angle";
//	COMPOSITE_STRING 								= "composite";
//	POINT_STRING 									= "point";
//	CIRCULAR_STRING 								= "circle";
//	MULTIPOINT_STRING 								= "multipoint";
//	ROUNDRECT_STRING 								= "roundrect";
//	ROTRECT_STRING 									= "rotrect";
//	CIRCLE_STRING 									= "circle";
//	ELLIPSE_STRING 									= "ellipse";
//	WAND_STRING 									= "wand";
//	BRUSH_STRING 									= "brush";
//	ARROW_STRING 									= "arrow";	

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//IJ.setTool("polygon");
x=newArray(1); y=newArray(1);
x[0]=90; y[0]=50;
makeSelection("traced", x, y);
selectionType();
makeSelection("tracing", newArray(140,50,130), newArray(20,40,100));
selectionType();
makeSelection("wand", newArray(140,50,130), newArray(20,40,100));
selectionType();
makeSelection("composite", newArray(140,50,130), newArray(20,40,100));
selectionType();
setKeyDown("shift");
makeSelection("brush", newArray(140,50,130), newArray(20,40,100));
selectionType() ;
makeSelection("traced", newArray(140,50,130,120), newArray(20,40,100,120));
selectionType() ;

makeSelection("wand", newArray(140,50,130,120), newArray(20,40,100,120));
setKeyDown("shift");
makeSelection("wand", newArray(110,150,11,112), newArray(20,40,100,120));
selectionType() ;
makeSelection("traced", newArray(140,50,130,120), newArray(20,40,100,120));
setKeyDown("shift");
makeSelection("traced", newArray(110,150,11,112), newArray(20,40,100,120));
selectionType() ;
makeSelection("composite", newArray(140,50,130,120), newArray(20,40,100,120));
setKeyDown("shift");
makeSelection("composite", newArray(110,150,11,112), newArray(20,40,100,120));
selectionType() ;

//setKeyDown("shift");
//makeSelection("brush", newArray(140,50), newArray(20,40), 40);
//setKeyDown("shift");
//makeSelection("brush", newArray(11,112), newArray(100,120));
//selectionType() ;

makeSelection("point", newArray(140,50,130,120), newArray(20,40,100,120));
setKeyDown("shift");
makeSelection("point", newArray(110,150,11,112), newArray(20,40,100,120));
selectionType() ;

makeSelection("traced", newArray(140,50,130,120), newArray(20,40,100,120));
setKeyDown("shift");
makeSelection("traced", newArray(110,150,11,112), newArray(20,40,100,120));
selectionType() ;
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

setTool("brush");
x=newArray(1); y=newArray(1);
x[0]=90; y[0]=50;
makeSelection("brush",  newArray(140,50,130,120));
setKeyDown("shift");
x[0]=90; y[0]=55;
makeSelection("brush", x, y);
selectionType();

setTool("brush");
doWand(50, 50);
setKeyDown("shift");
doWand(95, 150);
//doWand(150, 150);
selectionType() ;


setKeyDown("shift");
makeSelection("wand", newArray(140,50,130), newArray(20,40,100));
makeSelection("brush", newArray(140,50,130), newArray(20,40,100));
makeSelection("traced", newArray(140,50,130,120), newArray(20,40,100,120));
makeSelection("wand", newArray(140,50,130,120), newArray(20,40,100,120));
setKeyDown("shift");
makeSelection("wand", newArray(110,150,11,112), newArray(20,40,100,120));
selectionType() ;
makeSelection("traced", newArray(140,50,130,120), newArray(20,40,100,120));
setKeyDown("shift");
makeSelection("traced", newArray(110,150,11,112), newArray(20,40,100,120));
selectionType() ;
makeSelection("composite", newArray(140,50,130,120), newArray(20,40,100,120));
setKeyDown("shift");
makeSelection("composite", newArray(110,150,11,112), newArray(20,40,100,120));
selectionType() ;


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//"multipoint", "roundrect", "rotrect", "ellipse", "wand", "brush", "arrow"
//setKeyDown("shift");
//setKeyDown("alt");
doWand(72, 43);
setKeyDown("shift");
doWand(98, 77);
setKeyDown("shift");
doWand(105, 114);
setKeyDown("shift");
doWand(131, 89);
run("Invert"); wait(2000); run("Invert");
wait(2000);
  
// delete 2 of the objects
setKeyDown("alt");
doWand(98, 77);
setKeyDown("alt");
doWand(105, 114);
run("Invert"); wait(1000); run("Invert");
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//setTool("multipoint");
//setTool("wand");
//setTool("arrow");
//setTool("brush");
//setTool("ellipse");
//setTool("roundrect");
//run("Convex Hull");
//run("Make Inverse");
//run("Rotate...", "  angle=0.5");
//run("Create Mask");
//run("To Bounding Box");
//selectionContains(x, y)
//selectionName;
//selectionType();
//selectImage(id);
//makeEllipse(x1, y1, x2, y2, aspectRatio);
//makeLine(x1, y1, x2, y2);
//makeLine(x1, y1, x2, y2, lineWidth);
//makeOval(x, y, width, height);
//makePoint(x, y);
//makePolygon(x1, y1, x2, y2, x3, y3, ...);
//makeRectangle(x, y, width, height);
//makeRectangle(x, y, width, height, arcSize);
//makeRotatedRectangle(x1, y1, x2, y2, width);
//makeSelection("point", newArray(50,100,150,140), newArray(40,25,50,100));

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	else if(_ROI_type == COMPOSITE )
	{
		for( _selection_num = 0; _selection_num < _composite_selections; _selection_num++)
		{
			setKeyDown("shift");
		  	makeOval(50,10,15,10);
			setKeyDown("shift");
			makeOval(150,110,15,10);
			setKeyDown("shift");
			makeOval(150,11,15,10);
			setKeyDown("shift");
			makeRectangle(41, 21, 105, 68);	
			setKeyDown("shift");
  			wait(ROI_SELECTION_DELAY);
			selectionType();		
		}
		//setKeyDown("shift");makeSelection("composite", newArray(140,50,130,120), newArray(20,40,100,120));selectionType();	
		//setKeyDown("shift");makeSelection("composite", newArray(14,5,130,120), newArray(20,40,100,120));selectionType();	
		//makeOval(50,100,15,10);
		//setKeyDown("shift");makeSelection("wand", newArray(140,50,130), newArray(20,40,100));selectionType();	
		//setKeyDown("shift");makeSelection("brush", newArray(140,50,130), newArray(20,40,100));selectionType();	
		//setKeyDown("shift");makeSelection("traced", newArray(110,150,11,112), newArray(20,40,100,120));selectionType();	
		//selectionType();		
	}
	else if(_ROI_type == POINT )
	{
		//makePoint(x, y);
		//x=newArray(1); y=newArray(1);
	  	//x[0]=90; y[0]=50;
	  	//makeSelection("point", x, y);
	  	//setKeyDown("shift");; makeSelection("point", newArray(50,100,150,140), newArray(40,25,50,100));selectionType();
		//setKeyDown("shift");; makeSelection("multipoint", newArray(50,100,150,140), newArray(40,25,50,100));selectionType();
		makeSelection("point", _ROI_xparameters, _ROI_yparameters_shifted);
	}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//function parse_ROI_parameter_line(_ROI_positions_string, _ROI_index, _ROI_decoding, _force_array, _print_extraction)
//function ROI_positions_extraction(_ROI_positions_linenum, _ROI_definitions_file_lines, _ROI_PARAMETER_DECODINGS, _force_array, _print_extraction)
//function parse_ROI_xyparameter_lines(_ROI_definitions_file_lines, _ROI_xcoordinates_linenum, _ROI_ycoordinates_linenum,_ROI_PARAMETER_DECODINGS, _return_string, _print_extraction )
//function parse_ROI_parameters_string(_ROI_coordinates_string, _ROI_index, _return_specifier, _print_extraction )
//function parse_ROI_slices(_ROI_slices_string, _ROI_index, _print_slices)
//function polygon_ROI_coordinates(_ROI_coordinates_string, _ROI_index, _return_specifier, _print_extraction )
//function oval_ROI_parameters(_ROI_parameters_string, _ROI_index, _return_specifier, _print_extraction )
//function parse_ROI_type_parameters(_ROI_coordinates_string, _ROI_types, _ROI_index, _return_specifier, _print_extraction )
centersx 						= 69, 83, 99, 82, 90, 72, 82, 69 ; 95, 101, 107, 110, 105,  98,  93,  95 ; 114, 9
centersy_offsets 				= 73, 70, 70, 96, 128, 116, 96, 73 ; 93, 92,  96,  101, 106,  106, 104, 93 ; 80,  15
ROI_slices						= 7 ; 7; 7           
ROI_types 						= polygon, polygon, oval
ROI_SELECTION_SHAPES			= newArray("rectangle", "oval" , "polygon",  "freehand", "traced", "straight_line", "segmented_line", "freehand_line", "angle", "composite", "point");
	rectangle, oval , polygon,  freehand, traced, straight_line, segmented_line, freehand_line, angle, composite, point

//ROI_MATERIAL_NAMES_LINENUM						= 0;
//ROI_LABELS_LINENUM								= 1;
//ROI_LABEL_NICKNAMES_LINENUM						= 2;
//ROI_TYPES_LINENUM								= 3;
//ROI_DIAMETERS_LINENUM							= 4;
//CENTERSX_LINENUM								= 5;
//CENTERSY_OFFSETS_LINENUM						= 6;
//ROI_SLICES_LINENUM								= 7;
//ROI_SELECTION_RADII_LINENUM						= 8;
//ROI_PROFILE_RADIUS_LINENUM			= 9;
//BULK_MATERIAL_LINENUM							= 10;
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	RECTANGLE 										= 0;
	OVAL 											= 1;
	POLYGON 										= 2;
	FREEHAND 										= 3;
	TRACED 											= 4;
	STRAIGHT LINE 									= 5;
	SEGMENTED LINE 									= 6;
	FREEHAND LINE 									= 7;
	ANGLE 											= 8;
	COMPOSITE 										= 9;
	POINT 											= 10;
	MULTIPOINT 										= 11;
	ROUNDRECT 										= 12;
	ROTRECT 										= 13;
	CIRCLE	 										= 14;
	ELLIPSE 										= 15;
	WAND 											= 16;
	BRUSH 											= 17;
	ARROW 											= 18;
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	insert_names 	= newArray("Soft tissue", "Brain tissue", "Trabecular bone");
	true_RSPs 	= newArray(1.037, 1.047, 1.108);
slices_2_analyze = newArray(7,8,9); // 19 and 39 for the case of 90 slices. WARNING: ALTHOUGHT I HAVE 8, 9, BUT IT JUST ANALYZES SLICE 7. WE CAN ADD ANALYSIS FOR OTHER SLICES AS A FUTURE WORK.'

// soft tissue
makePolygon(69, 73, 83, 70, 99, 70, 82, 96, 90, 128, 72, 116, 82, 96, 69, 73 );
69, 83, 99, 82, 90, 72, 82, 69
73, 70, 70, 96, 128, 116, 96, 73
// brain tissue
makePolygon(95, 93, 101, 92, 107, 96, 110, 101, 105, 106, 98, 106, 93, 104, 95, 93);
95, 101, 107, 110, 105,  98,  93,  95
93, 92,  96,  101, 106,  106, 104, 93
// Trabeular bone
makeOval(114, 80, 9, 15 );
114, 9
80,  15 
"Soft tissue", "Brain tissue", "Trabecular bone"
"polygon", "polygon", "oval"
  makeSelection("polygon", newArray(50,100,150,100), newArray(50,25,50,100));

  makeOval(70, 20, 50, 80);

ROI_material_names 				= softTissue, brainTissue, trabecularBone
ROI_labels 						= Soft Tissue, Brain Tissue, Trabecular Bone
ROI_label_nicknames				= soft, brain, trabec
ROI_types 						= polygon_ROI, polygon_ROI, oval_ROI
ROI_diameters 					= 12.2, 12.2, 12.2
centersx 						= 69, 83, 99, 82, 90, 72, 82, 69 ; 95, 101, 107, 110, 105,  98,  93,  95 ; 114, 9
centersy_offsets 				= 73, 70, 70, 96, 128, 116, 96, 73 ; 93, 92,  96,  101, 106,  106, 104, 93 ; 80,  15
ROI_slices						= 7 ; 7; 7           
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	rows = 240;				// # of rows in images
	columns = 240;				// # of columns in images
	current_slice = 39; // other options : 19 and 69	
	slices_2_analyze = newArray(19, 39); 
insert_names 	= newArray("Tooth", "Soft tissue", "Brain tissue", "Trabecular bone");
 	
 	true_RSPs 	= newArray(1.788, 1.037,  1.047,  1.108);
slice_2_analyze == 19 
 makePolygon(53, 92, 56, 94, 57, 98, 56, 98, 53, 98, 48, 98, 46, 101, 44, 102, 42, 100, 43, 97, 47, 97, 51, 96, 53, 92); //"Tooth"
/ slice_2_analyze == 39
/ soft tissue
 makePolygon(83, 88, 100, 85, 119, 84, 99,116, 109, 154, 87, 140, 99, 116, 83, 88);// soft tissue
makePolygon(114, 112, 122, 111, 129, 116, 132, 122, 127, 128, 118, 128, 112, 125, 114, 112 );// brain tissue
// Trabeular bone
makeOval( 137, 97, 11 ,19 );
                

function ROI_draw()
{
	makeEllipse(x1, y1, x2, y2, aspectRatio) //Creates an elliptical selection, where x1,y1,x2,y2 specify the major axis of the ellipse and aspectRatio (<=1.0) is the ratio of the lengths of minor and major axis.
	makeLine(x1, y1, x2, y2)//Creates a new straight line selection. The origin (0,0) is assumed to be the upper left corner of the image. Coordinates are in pixels. You can create segmented line selections by specifying more than two coordinate pairs, for example makeLine(25,34,44,19,69,30,71,56).
	makeLine(x1, y1, x2, y2, lineWidth)//Creates a straight line selection with the specified width. See also: getLine.
	makeOval(x, y, width, height)//Creates an elliptical selection, where (x,y) define the upper left corner of the bounding rectangle of the ellipse.
	makePoint(x, y)//Creates a point selection at the specified location. Create a multi-point selection by using makeSelection("point",xpoints,ypoints). Use setKeyDown("shift"); makePoint(x, y); to add a point to an existing point selection.
	makePolygon(x1, y1, x2, y2, x3, y3, ...)//Creates a polygonal selection. At least three coordinate pairs must be specified, but not more than 200. As an example, makePolygon(20,48,59,13,101,40,75,77,38,70) creates a polygon selection with five sides.
	makeRectangle(x, y, width, height)//Creates a rectangular selection. The x and y arguments are the coordinates (in pixels) of the upper left corner of the selection. The origin (0,0) of the coordinate system is the upper left corner of the image.
	makeRectangle(x, y, width, height, arcSize)//Creates a rounded rectangular selection using the specified corner arc size.
	makeRotatedRectangle(x1, y1, x2, y2, width)//Creates a rotated rectangular selection, which is similar to a wide line where (x1,y1) is the start of the line, (x2,y2) is the end of the line and 'width' is the line width.
	makeSelection(type, xcoord, ycoord)
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	parse_ROI_parameters_string				(ROI_parameters_string, 0, RETURN_XCOORDINATES, PRINT_ROI_COORDINATES );
	parse_ROI_parameters_string				(ROI_parameters_string, 1, RETURN_YCOORDINATES, PRINT_ROI_COORDINATES );
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
		
	print_sep								(PRINT_STAR_SEP);
	print("parse_ROI_xyparameter_line");
	parse_ROI_xyparameter_line(ROI_centersx_string, 0, FLOAT_DECODING_OP, FORCE_VALUE_2_ARRAY, PRINT_ROI_EXTRACTION);
	parse_ROI_xyparameter_line(ROI_centersx_string, 1, FLOAT_DECODING_OP, FORCE_VALUE_2_ARRAY, PRINT_ROI_EXTRACTION);
	parse_ROI_xyparameter_line(ROI_centersx_string, 2, FLOAT_DECODING_OP, FORCE_VALUE_2_ARRAY, PRINT_ROI_EXTRACTION);	
	parse_ROI_xyparameter_line(ROI_centersy_offsets_string, 0, FLOAT_DECODING_OP, FORCE_VALUE_2_ARRAY, PRINT_ROI_EXTRACTION);
	parse_ROI_xyparameter_line(ROI_centersy_offsets_string, 1, FLOAT_DECODING_OP, FORCE_VALUE_2_ARRAY, PRINT_ROI_EXTRACTION);
	parse_ROI_xyparameter_line(ROI_centersy_offsets_string, 2, FLOAT_DECODING_OP, FORCE_VALUE_2_ARRAY, PRINT_ROI_EXTRACTION);
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	print_sep									(PRINT_STAR_SEP);
	print("parse_ROI_parameters_string");
	parse_ROI_parameters_string(ROI_parameters_string, 0, RETURN_XCOORDINATES, PRINT_ROI_COORDINATES );
	parse_ROI_parameters_string(ROI_parameters_string, 1, RETURN_YCOORDINATES, PRINT_ROI_COORDINATES );
	parse_ROI_parameters_string(ROI_parameters_string, 2, RETURN_COORDINATE_PAIRS, PRINT_ROI_COORDINATES );
	print_sep									(PRINT_STAR_SEP);
	print("parse_ROI_slices");
	parse_ROI_slices(ROI_slices_string, 0, PRINT_ROI_SLICES);
	parse_ROI_slices(ROI_slices_string, 1, PRINT_ROI_SLICES);
	parse_ROI_slices(ROI_slices_string, 2, PRINT_ROI_SLICES);
//	RETURN_PARAMETERS								= 0;
//	RETURN_PARAMETERS_STRING						= 1;
	print_sep									(PRINT_STAR_SEP);
	print("oval_ROI_parameters");
	oval_ROI_parameters(ROI_parameters_string, 2, RETURN_PARAMETERS, PRINT_ROI_PARAMETERS );
	oval_ROI_parameters(ROI_parameters_string, 2, RETURN_PARAMETERS, PRINT_ROI_PARAMETERS );

	print_sep									(PRINT_STAR_SEP);
	print("parse_ROI_type_parameters");
	ROI_type_parameters 						= parse_ROI_type_parameters(ROI_parameters_string, ROI_types, 0, RETURN_PARAMETERS, PRINT_ROI_PARAMETERS );
	ROI_type_parameters 						= parse_ROI_type_parameters(ROI_parameters_string, ROI_types, 1, RETURN_PARAMETERS, PRINT_ROI_PARAMETERS );
	ROI_type_parameters 						= parse_ROI_type_parameters(ROI_parameters_string, ROI_types, 2, RETURN_PARAMETERS, PRINT_ROI_PARAMETERS );
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
	//centersx 								= ROI_positions_extraction(CENTERSX_LINENUM, 					ROI_parameter_strings, 	ROI_PARAMETER_DECODINGS, FORCE_VALUE_2_ARRAY		);
	//centersy_offsets 						= ROI_positions_extraction(CENTERSY_OFFSETS_LINENUM, 			ROI_parameter_strings, 	ROI_PARAMETER_DECODINGS, FORCE_VALUE_2_ARRAY		);
	//ROI_slices 							= ROI_slices_extraction(_ROI_slices_string, _ROI_index, _print_slices);
	//ROI_slices 							= ROI_parameter_string_2_values(ROI_SLICES_LINENUM, 		ROI_parameter_strings, 	ROI_PARAMETER_DECODINGS, FLOAT_DECODING_OP, FORCE_VALUE_2_ARRAY		);

