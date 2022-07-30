/// @func draw_text_shadow_4
/// @arg {real} x
/// @arg {real} y 
/// @arg {string} text
/// @arg {color*} color
/// @arg {color*} shadowColor

var _x = argument[0];
var _y = argument[1];
var _string = argument[2];
var _color = c_white;
var _shadowColor = c_black;

if (argument_count == 4){
	_color = argument[3];
}
if (argument_count == 5){
	_color = argument[3];
	_shadowColor = argument[4];
}

draw_set_color(_shadowColor);
draw_text(_x - 1,_y - 1,_string);
draw_text(_x - 1,_y + 1,_string);
draw_text(_x + 1,_y - 1,_string);
draw_text(_x + 1,_y + 1,_string);
draw_set_color(_color);
draw_text(_x,_y,_string);
draw_set_color(c_white);