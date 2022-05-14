surface_set_target(uiSurface);
draw_clear_alpha(c_black,0);
draw_set_color(c_lime);
if (!is_undefined(briconChangeTimer) && !timer_check(briconChangeTimer)){
	draw_text(0,15,briconLastChanged);	
}
if (!is_undefined(modeChangeTimer) && !timer_check(modeChangeTimer)){
	var _modeStr = mode == LENS_MODE.capture ? "Capture" : "Live";
	draw_text(0,15,_modeStr);	
}
draw_set_color(c_white);
surface_reset_target();