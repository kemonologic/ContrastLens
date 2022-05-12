if (!surface_exists(captureSurface)){
	captureSurface = surface_create(max(320,winW),max(240,winH));
	surface_set_target(captureSurface);
	draw_clear_alpha(c_black,0);
	surface_reset_target();
}


winX = window_get_x();
winY = window_get_y();
var _step = 5;

var _u = -1 * keyboard_check(vk_up);
var _d = keyboard_check(vk_down);
var _l = -1 * keyboard_check(vk_left);
var _r = keyboard_check(vk_right);
var _changeX = (_l + _r) * _step;
var _changeY = (_u + _d) * _step;

window_set_position(winX + _changeX,winY +  _changeY);


