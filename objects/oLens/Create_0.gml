window_set_cursor(cr_none);
cursor_sprite = sBlank;

window_command_hook(window_command_minimize);
window_command_hook(window_command_maximize);
window_command_hook(window_command_restore);
window_command_hook(window_command_close);

interval = 30;
cnt = 0;
captureBuffer =buffer_create(1, buffer_grow, 1);
captureSurface = -1;
winX = 500;
winY = 500;
winW = room_width;
winH = room_height;
captureSuccess = -1;