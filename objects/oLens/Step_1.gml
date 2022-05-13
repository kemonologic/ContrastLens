winX = window_get_x();
winY = window_get_y();

if (!surface_exists(captureSurface)){
	captureSurface = surface_create(max(320,winW),max(240,winH));
	surface_set_target(captureSurface);
	draw_clear_alpha(c_black,0);
	surface_reset_target();
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
	brightness = clamp(brightness + _brightnessChange,options_brightness[NORMRANGE.vmin],options_brightness[NORMRANGE.vmax]);
	
	if (keyboard_check_pressed(hotkeyMap[? "BRIGHTNESS_RESET"])){
		brightness = options_brightness[NORMRANGE.vdefault];
	}
	shader_set_uniform_f(shader_bUniform,brightness);
}


// contrast
if (keyboard_check(hotkeyMap[? "CONTRAST_MODIFIER"])){
	var _contrastDecreased = keyboard_check_pressed(hotkeyMap[? "CONTRAST_DECREASE"]);
	var _contrastIncreased = keyboard_check_pressed(hotkeyMap[? "CONTRAST_INCREASE"]);
	var _contrastChange = ((_contrastDecreased * -1) + _contrastIncreased) * options_contrast[NORMRANGE.vincrement];
	contrast = clamp(contrast + _contrastChange,options_contrast[NORMRANGE.vmin],options_contrast[NORMRANGE.vmax]);
	
	if (keyboard_check_pressed(hotkeyMap[? "CONTRAST_RESET"])){
		contrast = options_contrast[NORMRANGE.vdefault];
	}
	shader_set_uniform_f(shader_cUniform,contrast);
}


// interval
var _intervalDecreased = keyboard_check_pressed(hotkeyMap[? "INTERVAL_DECREASE"]);
var _intervalIncreased = keyboard_check_pressed(hotkeyMap[? "INTERVAL_INCREASE"]);
var _intervalChange = ((_intervalDecreased * -1) + _intervalIncreased) * options_interval[NORMRANGE.vincrement];

if (mode == LENS_MODE.live){
	interval = clamp(interval + _intervalChange,options_interval[NORMRANGE.vmin],options_interval[NORMRANGE.vmax]);
}

// finder
if (keyboard_check_pressed(hotkeyMap[? "TOGGLE_FINDER"])){
	finderEnabled = !finderEnabled;
}

// mode
if (keyboard_check_pressed(hotkeyMap[? "CHANGE_MODE"])){
	mode = (mode + 1) % LENS_MODE.__SIZE;
}

// shader
if (keyboard_check_pressed(hotkeyMap[? "TOGGLE_SHADER"])){
	shader_reset();
	shader = (shader == sh_invert) ? sh_bricon : sh_invert;
	shader_set(shader);
	if (shader == sh_bricon){
		shader_set_uniform_f(shader_bUniform,brightness);
		shader_set_uniform_f(shader_cUniform,contrast);
	}
}

// window movement
var _step = 5;

var _u = -1 * keyboard_check(hotkeyMap[? "MOVE_UP"]);
var _d = keyboard_check(hotkeyMap[? "MOVE_DOWN"]);
var _l = -1 * keyboard_check(hotkeyMap[? "MOVE_LEFT"]);
var _r = keyboard_check(hotkeyMap[? "MOVE_RIGHT"]);

if (keyboard_check(hotkeyMap[? "RESIZE_MODIFIER"])){
	var _resizeW = (_l + _r) * winResizeWIncrement;
	var _resizeH = (_u + _d) * winResizeHIncrement;
	if (_resizeW != 0 || _resizeH != 0){
		var _newW = winW + _resizeW;
		var _newH = winH + _resizeH;
		window_set_size(_newW,_newH);
		var offsetX = floor((_newW - winW) / 2);
		var offsetY = floor((_newH - winH) / 2);
		window_set_position(winX - offsetX,winY - offsetY);
	}
}
else{
	var _changeX = (_l + _r) * winMoveIncrement;
	var _changeY = (_u + _d) * winMoveIncrement;
	window_set_position(winX + _changeX,winY +  _changeY);
}

winW = window_get_width();
winH = window_get_height();
winX = window_get_x();
winY = window_get_y();