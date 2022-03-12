winX = window_get_x();
winY = window_get_y();
winW = window_get_width();
winH = window_get_height();

var _step = 5;

var _u = -1 * keyboard_check(vk_up);
var _d = keyboard_check(vk_down);
var _l = -1 * keyboard_check(vk_left);
var _r = keyboard_check(vk_right);
var _changeX = (_l + _r) * _step;
var _changeY = (_u + _d) * _step;


window_set_position(winX + _changeX,winY +  _changeY);



if (cnt % interval == 0){
	//window_set_size(1,1);
	window_command_run(window_command_minimize);
	//window_set_size(winW,winH);
	captureSuccess = display_capture_buffer_part(winX,winY,winW,winH,captureBuffer);
	window_command_run(window_command_restore);
}