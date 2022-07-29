surface_set_target(uiSurface);
draw_clear_alpha(c_black,0);
draw_set_font(uiFont);

if (!is_undefined(briChangeTimer) && !timer_check(briChangeTimer)){
	draw_text_shadow_4(5,5,briString,c_lime);
	var _indicator = "|--------------|";
	var _progressPos = range_convert(options_brightness[NORMRANGE.vmin],options_brightness[NORMRANGE.vmax],0,15,brightness);
	_indicator = string_insert("|",_indicator,_progressPos + 1);
	draw_text_shadow_4(175,5,_indicator,c_lime);
}

if (!is_undefined(conChangeTimer) && !timer_check(conChangeTimer)){
	draw_text_shadow_4(5,45,conString,c_lime);
	var _indicator = "|--------------|";
	var _progressPos = range_convert(options_contrast[NORMRANGE.vmin],options_contrast[NORMRANGE.vmax],0,15,contrast);
	_indicator = string_insert("|",_indicator,_progressPos + 1);
	draw_text_shadow_4(175,45,_indicator,c_lime);
}


if (!is_undefined(intervalChangeTimer) && !timer_check(intervalChangeTimer)){
	draw_text_shadow_4(5,85,"Interval",c_lime);
	var _indicator = "|--------------|";
	var _progressPos = range_convert(options_interval[NORMRANGE.vmin],options_interval[NORMRANGE.vmax],0,15,interval);
	_indicator = string_insert("|",_indicator,_progressPos + 1);
	draw_text_shadow_4(175,85,_indicator,c_lime,c_white);
	draw_text_shadow_4(360,85,string(interval) + "ms",c_lime);
}


if (!is_undefined(slotChangeTimer) && !timer_check(slotChangeTimer)){
	var _slotNameDraw = is_undefined(presetSlotName) ? string(presetSlot) : presetSlotName;
	draw_text_shadow_4(5,winH - 35,"Preset: " + _slotNameDraw,c_lime);
}

draw_set_halign(fa_right)
if (!is_undefined(modeChangeTimer) && !timer_check(modeChangeTimer)){
	var _modeStr = mode == LENS_MODE.capture ? "Capture" : "Live";
	draw_text_shadow_4(winW - 5,winH - 35,_modeStr,c_lime);	
}
draw_set_halign(fa_left);
surface_reset_target();