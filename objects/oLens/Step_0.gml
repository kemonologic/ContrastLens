if (mode == LENS_MODE.capture){
	lens_state_capture();
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


