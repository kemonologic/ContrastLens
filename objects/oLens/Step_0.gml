
/*if (keyboard_check_pressed(vk_backspace)){
	
}*/

//
if (!surface_exists(captureSurface)){
	captureSurface = surface_create(max(320,winW),max(240,winH));
	surface_set_target(captureSurface);
	draw_clear_alpha(c_black,0);
	surface_reset_target();
}

if (mode == LENS_MODE.capture){
	if (keyboard_check_pressed(captureKey)){
		window_set_visible_w(false);
		surface_set_target(captureSurface);
		draw_clear_alpha(c_black,1);
		surface_reset_target();
		//window_command_run(window_command_minimize);
		window_set_visible_w(false);
		captureSuccess = display_capture_buffer_part(winX,winY,winW,winH,captureBuffer);
		buffer_set_surface(captureBuffer, captureSurface, 0, 0, 0);
		//window_command_run(window_command_restore);
		window_set_visible_w(true);
	}
}
else if (mode == LENS_MODE.live){
	if (cnt % interval == 0){
		window_set_size(1,1);
	
	}
	else{
		if (window_get_width() == 1){
			captureSuccess = display_capture_buffer_part(winX,winY,winW,winH,captureBuffer);
			window_set_size(winW,winH);
		}
	}
	buffer_set_surface(captureBuffer, captureSurface, 0, 0, 0);
	cnt++;
}


