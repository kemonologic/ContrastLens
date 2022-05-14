surface_set_target(uiSurface);
draw_clear_alpha(c_black,0);
draw_set_font(uiFont);

if (!is_undefined(briconChangeTimer) && !timer_check(briconChangeTimer)){
	draw_text_shadow_4(5,5,briconLastChanged,c_lime);
	var _indicator = "|--------------|";
	var _dataArr = briconLastChanged == "Brightness" ? options_brightness : options_contrast;
	var _dataVal = briconLastChanged == "Brightness" ? brightness : contrast;
	var _progressPos = range_convert(_dataArr[NORMRANGE.vmin],_dataArr[NORMRANGE.vmax],0,15,_dataVal);
	_indicator = string_insert("|",_indicator,_progressPos + 1);
	draw_text_shadow_4(175,5,_indicator,c_lime);
}
if (!is_undefined(modeChangeTimer) && !timer_check(modeChangeTimer)){
	var _modeStr = mode == LENS_MODE.capture ? "Capture" : "Live";
	draw_text_shadow_4(5,winH - 35,_modeStr,c_lime);	
}
surface_reset_target();