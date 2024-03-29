application_surface_draw_enable(false);
fuwa_init();

#macro SETTINGS_PATH game_save_id + "cl_settings.ini"
#macro HOTKEYS_PATH game_save_id + "cl_hotkeys.ini"

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

winX = 500;
winY = 500;
winW = room_width;
winH = room_height;
winResizeWIncrement = 10;
winResizeHIncrement = 10;
winMoveIncrement = 5;

mode = LENS_MODE.capture;

cnt = 0;
finderEnabled = false;
onTopEnabled = false;
presetSlot = 0;
presetSlotName = undefined;

shader = sh_bricon;
shader_bUniform = shader_get_uniform(shader,"brightness");
shader_cUniform = shader_get_uniform(shader,"contrast");

briChangeTimer = undefined;
briString = "Brightness";
conChangeTimer = undefined;
conString = "Contrast";

modeChangeTimer = undefined;
intervalChangeTimer = undefined;
slotChangeTimer = undefined;
noticeFadeSpeed = 2;
uiSurface = -1;


// FILE HANDLING
if (!file_exists(SETTINGS_PATH)){
	file_copy("cl_settings_blank.ini",SETTINGS_PATH);
}
if (!file_exists(HOTKEYS_PATH)){
	file_copy("cl_hotkeys_blank.ini",HOTKEYS_PATH);
}
if (file_exists("README.txt")){
	file_delete("README.txt");
}
file_copy("README.txt","README.txt");

if (file_exists("CHANGELOG.txt")){
	file_delete("CHANGELOG.txt");
}
file_copy("CHANGELOG.txt","CHANGELOG.txt");

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

options_contrast[NORMRANGE.vmin] = 0.3;
options_contrast[NORMRANGE.vmax] = 1.7;
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


var _fileWinW = file_ini_read_int(settingsFile,"window","WIDTH",winW);
var _fileWinH = file_ini_read_int(settingsFile,"window","HEIGHT",winH);
var _fileWinX = file_ini_read_int(settingsFile,"window","X",-1);
var _fileWinY = file_ini_read_int(settingsFile,"window","Y",-1);
var _fileWinOnTop = file_ini_read_int(settingsFile,"window","ONTOP",false);
if (_fileWinW >= room_width && _fileWinH >= room_height){
	winW = _fileWinW;
	winH = _fileWinH;
	onTopEnabled = _fileWinOnTop;
	if (_fileWinX != -1 && _fileWinY != -1){
		winX = _fileWinX;
		winY = _fileWinY;
		window_set_position(winX,winY);
	}
	window_set_size(winW,winH);
	window_set_topmost(onTopEnabled);
}

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



captureBuffer = buffer_create(1, buffer_grow, 1);
captureSurface = -1;
captureSuccess = -1;


//window_command_run(window_command_minimize);
//
//window_set_topmost(1);