settingsFile = file_ini_open(SETTINGS_PATH);

file_ini_write_real(settingsFile,"slot0","BRIGHTNESS",brightness);
file_ini_write_real(settingsFile,"slot0","CONTRAST",contrast);
file_ini_write_real(settingsFile,"slot0","INTERVAL",interval);
file_ini_write_int(settingsFile,"window","WIDTH",winW);
file_ini_write_int(settingsFile,"window","HEIGHT",winH);

file_ini_close(settingsFile);


ds_map_destroy(hotkeyMap);
timer_destroy(briconChangeTimer);
timer_destroy(modeChangeTimer);
timer_destroy(intervalChangeTimer);

fuwa_cleanup();

