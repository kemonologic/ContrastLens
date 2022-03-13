if (keyboard_check_pressed(captureKey)){
	//window_set_size(1,1);
	window_set_visible_w(false);
	surface_set_target(captureSurface);
	draw_clear_alpha(c_black,1);
	surface_reset_target();
	//window_command_run(window_command_minimize);
	//window_set_visible_w(false);
	captureSuccess = display_capture_buffer_part(winX,winY,winW,winH,captureBuffer);
	buffer_set_surface(captureBuffer, captureSurface, 0, 0, 0);
	//window_set_visible_w(true);
	//window_set_size(winW,winH);
	window_set_visible_w(true);
	//window_set_fullscreen(true);
}