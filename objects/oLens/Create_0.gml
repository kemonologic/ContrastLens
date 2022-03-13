enum LENS_MODE{
	capture,
	live,
	mirror
}


window_set_cursor(cr_none);
cursor_sprite = sBlank;

window_command_hook(window_command_minimize);
window_command_hook(window_command_maximize);
window_command_hook(window_command_restore);
/*window_command_hook(window_command_close);
*/
//window_set_taskbar_button_visible(false);
//window_set_background_redraw()
game_set_speed(60,gamespeed_fps);
mode = LENS_MODE.capture;
interval = 5;
cnt = 0;
shader = sh_invert;
captureBuffer =buffer_create(1, buffer_grow, 1);
captureSurface = -1;
captureKey = vk_enter;
winX = 500;
winY = 500;
winW = room_width;
winH = room_height;
captureSuccess = -1;

//window_command_run(window_command_minimize);
//window_set_topmost(1);
shader_set(shader);