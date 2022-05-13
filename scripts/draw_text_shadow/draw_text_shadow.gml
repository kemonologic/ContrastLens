/// @func draw_text_shadow
/// @arg {real} x
/// @arg {real} y 
/// @arg {string} text
/// @arg {color*} color

var _x = argument[0];
var _y = argument[1];
var _string = argument[2];
var _color = c_white;

if (argument_count > 3){
	_color = argument[3];
}

draw_set_color(c_black);
draw_text(_x - 1,_y - 1,_string);
draw_set_color(_color);
draw_text(_x,_y,_string);