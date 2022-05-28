fuwa_run();

winX = window_get_x();
winY = window_get_y();

if (!surface_exists(captureSurface)){
	captureSurface = surface_create(max(320,winW),max(240,winH));
	surface_set_target(captureSurface);
	draw_clear_alpha(c_black,0);
	surface_reset_target();
}
if (!surface_exists(uiSurface)){
	uiSurface = surface_create(max(320,winW),max(240,winH));
	surface_set_target(uiSurface);
	draw_clear_alpha(c_black,0);
	surface_reset_target();
}

if (keyboard_check_pressed(hotkeyMap[? "CAPTURE"]) || mode == LENS_MODE.live){
	justStarted = false;
}

// keyboard input

// Close 
if (keyboard_check_pressed(hotkeyMap[? "CLOSE"])){
	game_end();
}

// brightness
if (keyboard_check(hotkeyMap[? "BRIGHTNESS_MODIFIER"])){
	var _brightnessDecreased = keyboard_check_pressed(hotkeyMap[? "BRIGHTNESS_DECREASE"]);
	var _brightnessIncreased = keyboard_check_pressed(hotkeyMap[? "BRIGHTNESS_INCREASE"]);
	var _brightnessChange = ((_brightnessDecreased * -1) + _brightnessIncreased) * options_brightness[NORMRANGE.vincrement];
	var _brightnessReset = keyboard_check_pressed(hotkeyMap[? "BRIGHTNESS_RESET"]);
	brightness = clamp(brightness + _brightnessChange,options_brightness[NORMRANGE.vmin],options_brightness[NORMRANGE.vmax]);
	
	if (_brightnessReset){
		brightness = options_brightness[NORMRANGE.vdefault];
	}
	shader_set_uniform_f(shader_bUniform,brightness);
	if ((_brightnessDecreased ^^ _brightnessIncreased) || _brightnessReset){
		if (briconChangeTimer != undefined){
			timer_restart(briconChangeTimer);
		}
		else{
			briconChangeTimer = timer_create(noticeFadeSpeed,time.s);
		}
		briconLastChanged = "Brightness";
	}
}


// contrast
if (keyboard_check(hotkeyMap[? "CONTRAST_MODIFIER"])){
	var _contrastDecreased = keyboard_check_pressed(hotkeyMap[? "CONTRAST_DECREASE"]);
	var _contrastIncreased = keyboard_check_pressed(hotkeyMap[? "CONTRAST_INCREASE"]);
	var _contrastChange = ((_contrastDecreased * -1) + _contrastIncreased) * options_contrast[NORMRANGE.vincrement];
	var _contrastReset = keyboard_check_pressed(hotkeyMap[? "CONTRAST_RESET"]);
	contrast = clamp(contrast + _contrastChange,options_contrast[NORMRANGE.vmin],options_contrast[NORMRANGE.vmax]);
	
	if (_contrastReset){
		contrast = options_contrast[NORMRANGE.vdefault];
	}
	shader_set_uniform_f(shader_cUniform,contrast);
	if ((_contrastDecreased ^^ _contrastIncreased) || _contrastReset){
		if (briconChangeTimer != undefined){
			timer_restart(briconChangeTimer);
		}
		else{
			briconChangeTimer = timer_create(noticeFadeSpeed,time.s);
		}
		briconLastChanged = "Contrast";	
	}
}


// interval
var _intervalDecreased = keyboard_check_pressed(hotkeyMap[? "INTERVAL_DECREASE"]);
var _intervalIncreased = keyboard_check_pressed(hotkeyMap[? "INTERVAL_INCREASE"]);
var _intervalChange = ((_intervalDecreased * -1) + _intervalIncreased) * options_interval[NORMRANGE.vincrement];

if (mode == LENS_MODE.live){
	interval = clamp(interval + _intervalChange,options_interval[NORMRANGE.vmin],options_interval[NORMRANGE.vmax]);
	if (_intervalChange != 0){
		if (intervalChangeTimer != undefined){
			timer_restart(intervalChangeTimer);
		}
		else{
			intervalChangeTimer = timer_create(noticeFadeSpeed,time.s);
		}
	}
}



// finder
if (keyboard_check_pressed(hotkeyMap[? "TOGGLE_FINDER"])){
	finderEnabled = !finderEnabled;
}

// mode
if (keyboard_check_pressed(hotkeyMap[? "CHANGE_MODE"])){
	mode = (mode + 1) % LENS_MODE.__SIZE;
	if (modeChangeTimer != undefined){
		timer_restart(modeChangeTimer);
	}
	else{
		modeChangeTimer = timer_create(noticeFadeSpeed,time.s);
	}
}

// shader
if (keyboard_check_pressed(hotkeyMap[? "TOGGLE_INVERT"])){
	shader = (shader == sh_invert) ? sh_bricon : sh_invert;
}

// window movement
var _u = -1 * keyboard_check(hotkeyMap[? "MOVE_UP"]);
var _d = keyboard_check(hotkeyMap[? "MOVE_DOWN"]);
var _l = -1 * keyboard_check(hotkeyMap[? "MOVE_LEFT"]);
var _r = keyboard_check(hotkeyMap[? "MOVE_RIGHT"]);

if (keyboard_check(hotkeyMap[? "RESIZE_MODIFIER"])){
	var _resizeW = (_l + _r) * winResizeWIncrement;
	var _resizeH = ((_u + _d) * -1) * winResizeHIncrement; // flip to make up bigger
	if (_resizeW != 0 || _resizeH != 0){
		var _newW = window_get_width() + _resizeW;
		var _newH = window_get_height() + _resizeH;
		
		window_set_size(_newW,_newH);
		surface_resize(captureSurface,winW,winH);
		var offsetX = floor((window_get_width() - _newW) / 2);
		var offsetY = floor((window_get_height() - _newH) / 2);
		window_set_position(window_get_x() + offsetX,window_get_y() + offsetY);
	}
}
else{
	var _changeX = (_l + _r) * winMoveIncrement;
	var _changeY = (_u + _d) * winMoveIncrement;
	window_set_position(winX + _changeX,winY +  _changeY);
}

if (window_get_width() != 1){
	winW = window_get_width();
	winH = window_get_height();
}
winX = window_get_x();
winY = window_get_y();

