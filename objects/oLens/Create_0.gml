application_surface_draw_enable(false);
fuwa_init();

enum LENS_MODE{
	capture,
	live,
	__SIZE
}

enum NORMRANGE{
	vmin,
	vmax,
	vdefault,
	vincrement
}

justStarted = true;

briconChangeTimer = undefined;
briconLastChanged = "Brightness";
modeChangeTimer = undefined;
intervalChangeTimer = undefined;
noticeFadeSpeed = 2;
uiSurface = -1;

hotkeyMap = ds_map_create();

hotkeyMap[? "MOVE_LEFT"] = vk_left;
hotkeyMap[? "MOVE_RIGHT"] = vk_right;
hotkeyMap[? "MOVE_UP"] = vk_up;
hotkeyMap[? "MOVE_DOWN"] = vk_down;
hotkeyMap[? "RESIZE_MODIFIER"] = vk_shift;

hotkeyMap[? "CLOSE"] = vk_escape;
hotkeyMap[? "CHANGE_MODE"] = key_lookup("M");
hotkeyMap[? "INTERVAL_DECREASE"] = key_lookup("Q");
hotkeyMap[? "INTERVAL_INCREASE"] = key_lookup("E");
hotkeyMap[? "TOGGLE_FINDER"] = key_lookup("F");
hotkeyMap[? "TOGGLE_SHADER"] = key_lookup("I");

hotkeyMap[? "BRIGHTNESS_DECREASE"] = key_lookup("MINUS");
hotkeyMap[? "BRIGHTNESS_INCREASE"] = key_lookup("PLUS");
hotkeyMap[? "BRIGHTNESS_MODIFIER"] = key_lookup("SHIFT");
hotkeyMap[? "BRIGHTNESS_RESET"] = key_lookup("BACKSPACE");

hotkeyMap[? "CONTRAST_DECREASE"] = key_lookup("MINUS");
hotkeyMap[? "CONTRAST_INCREASE"] = key_lookup("PLUS");
hotkeyMap[? "CONTRAST_MODIFIER"] = key_lookup("CTRL");
hotkeyMap[? "CONTRAST_RESET"] = key_lookup("BACKSPACE");

options_brightness[NORMRANGE.vmin] = -0.5;
options_brightness[NORMRANGE.vmax] = 0.5;
options_brightness[NORMRANGE.vdefault] = 0;
options_brightness[NORMRANGE.vincrement] = 0.03;

options_contrast[NORMRANGE.vmin] = 0.5;
options_contrast[NORMRANGE.vmax] = 1.5;
options_contrast[NORMRANGE.vdefault] = 1;
options_contrast[NORMRANGE.vincrement] = 0.1;

options_interval[NORMRANGE.vmin] = 15;
options_interval[NORMRANGE.vmax] = 120;
options_interval[NORMRANGE.vdefault] = 60;
options_interval[NORMRANGE.vincrement] = 10;


//window_set_cursor(cr_none);
//cursor_sprite = sBlank;

window_command_hook(window_command_minimize);
window_command_hook(window_command_maximize);
window_command_hook(window_command_restore);
/*window_command_hook(window_command_close);
*/
//window_set_taskbar_button_visible(false);
//window_set_background_redraw()
game_set_speed(60,gamespeed_fps);
mode = LENS_MODE.capture;
interval = options_interval[NORMRANGE.vdefault];
cnt = 0;

finderEnabled = false;

shader = sh_bricon;
shader_bUniform = shader_get_uniform(shader,"brightness");
shader_cUniform = shader_get_uniform(shader,"contrast");
contrast = 1.0;
brightness = 0.0;

captureBuffer = buffer_create(1, buffer_grow, 1);
captureSurface = -1;
captureKey = vk_enter;
winX = 500;
winY = 500;
winW = room_width;
winH = room_height;
captureSuccess = -1;
winResizeWIncrement = 10;
winResizeHIncrement = 10;
winMoveIncrement = 5;

//window_command_run(window_command_minimize);
//
//window_set_topmost(1);