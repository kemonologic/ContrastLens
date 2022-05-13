winX = window_get_x();
winY = window_get_y();

if (!surface_exists(captureSurface)){
	captureSurface = surface_create(max(320,winW),max(240,winH));
	surface_set_target(captureSurface);
	draw_clear_alpha(c_black,0);
	surface_reset_target();
}

// keyboard input

// finder
if (keyboard_check_pressed(hotkeyMap[? "CLOSE"])){
	game_end();
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
var _changeX = (_l + _r) * _step;
var _changeY = (_u + _d) * _step;

window_set_position(winX + _changeX,winY +  _changeY);


