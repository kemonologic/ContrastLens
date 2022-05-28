application_surface_draw_enable(false);
fuwa_init();

#macro SETTINGS_PATH game_save_id + "cl_settings.ini"
#macro HOTKEYS_PATH game_save_id + "cl_settings.ini"

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



if (!file_exists(SETTINGS_PATH)){
	file_copy("cl_settings_blank.ini",SETTINGS_PATH);
}
if (!file_exists(HOTKEYS_PATH)){
	file_copy("cl_hotkeys_blank.ini",HOTKEYS_PATH);
}
settingsFile = file_ini_open(SETTINGS_PATH);
hotkeysFile = file_ini_open(HOTKEYS_PATH);

var hotkeysArr = file_ini_key_names(hotkeysFile,"hotkeys");

hotkeyMap = ds_map_create();
hotkeyMap[? "CLOSE"] = vk_escape;
for (var i = 0; i < array_length_1d(hotkeysArr); i++){
	var _key = hotkeysArr[i];
	var _keyStr = file_ini_read_string(hotkeysFile,"hotkeys",_key);
	var _keyNum = key_lookup(_keyStr);
	ds_map_add(hotkeyMap,_key,_keyNum);
}


options_brightness[NORMRANGE.vmin] = -0.5;
options_brightness[NORMRANGE.vmax] = 0.5;
options_brightness[NORMRANGE.vdefault] = 0.0;
options_brightness[NORMRANGE.vincrement] = 0.025;

options_contrast[NORMRANGE.vmin] = 0.5;
options_contrast[NORMRANGE.vmax] = 1.5;
options_contrast[NORMRANGE.vdefault] = 1.0; 
options_contrast[NORMRANGE.vincrement] = 0.1;

options_interval[NORMRANGE.vmin] = 15;
options_interval[NORMRANGE.vmax] = 120;
options_interval[NORMRANGE.vdefault] = 60;
options_interval[NORMRANGE.vincrement] = 10;


var _fileBrightness = file_ini_read_real(settingsFile,"slot0","BRIGHTNESS",options_brightness[NORMRANGE.vdefault]);
var _fileBrightnessValid = (_fileBrightness >= options_brightness[NORMRANGE.vmin] && _fileBrightness <= options_brightness[NORMRANGE.vmax]);
var _fileContrast = file_ini_read_real(settingsFile,"slot0","CONTRAST",options_contrast[NORMRANGE.vdefault]);
var _fileContrastValid = (_fileContrast >= options_contrast[NORMRANGE.vmin] && _fileContrast <= options_contrast[NORMRANGE.vmax]);
var _fileInterval = file_ini_read_real(settingsFile,"slot0","INTERVAL",options_interval[NORMRANGE.vdefault]);
var _fileIntervalValid = (_fileInterval >= options_interval[NORMRANGE.vmin] && _fileInterval <= options_interval[NORMRANGE.vmax]);

contrast = _fileContrastValid ? _fileContrast : options_contrast[NORMRANGE.vdefault];
brightness = _fileBrightnessValid ? _fileBrightness : options_brightness[NORMRANGE.vdefault];
interval = _fileIntervalValid ? _fileInterval : options_interval[NORMRANGE.vdefault];

file_ini_close(settingsFile);
file_ini_close(hotkeysFile);


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

cnt = 0;
finderEnabled = false;

shader = sh_bricon;
shader_bUniform = shader_get_uniform(shader,"brightness");
shader_cUniform = shader_get_uniform(shader,"contrast");


captureBuffer = buffer_create(1, buffer_grow, 1);
captureSurface = -1;
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