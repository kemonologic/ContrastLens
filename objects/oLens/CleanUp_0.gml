var _isAutoSaveSlot = (presetSlot == 0);

settingsFile = file_ini_open(SETTINGS_PATH);

if (_isAutoSaveSlot){
	file_ini_write_real(settingsFile,"slot0","BRIGHTNESS",brightness);
	file_ini_write_real(settingsFile,"slot0","CONTRAST",contrast);
	file_ini_write_real(settingsFile,"slot0","INTERVAL",interval);
}
file_ini_write_int(settingsFile,"window","WIDTH",winW);
file_ini_write_int(settingsFile,"window","HEIGHT",winH);
file_ini_write_int(settingsFile,"window","X",winX);
file_ini_write_int(settingsFile,"window","Y",winY);
file_ini_write_int(settingsFile,"window","ONTOP",onTopEnabled);

file_ini_close(settingsFile);


ds_map_destroy(hotkeyMap);
timer_destroy(briChangeTimer);
timer_destroy(conChangeTimer);
timer_destroy(modeChangeTimer);
timer_destroy(intervalChangeTimer);
timer_destroy(slotChangeTimer);

fuwa_cleanup();

