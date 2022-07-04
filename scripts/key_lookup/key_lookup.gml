/// @func key_lookup
/// @arg {string} key
// single letter: look up ord value
// multiple letters: get vk value
// multiple letters with C- or A-: ???? multiple functions ???
var key = argument[0];

if (string_length(key) == 1) {
	return ord(key);
} else {
	key = string_upper(key);
	switch (key) {
		case "SLASH":
			return 191;
		case "BACKSLASH":
			return 220;
		case "DASH":
		case "HYPHEN":
		case "MINUS":
			return 189;
		case "LBRACKET":
			return 219;
		case "RBRACKET":
			return 221;
		case "APOSTROPHE":
			return 222;
		case "PERIOD":
		case "DOT":
			return 190;
		case "SEMICOLON":
			return 186;
		case "EQUALS":
		case "PLUS":
			return 187;
		case "COMMA":
			return 188;
		case "TICK":
		case "TILDE":
		case "GRAVE":
			return 192;
		case "F1":
			return vk_f1;
		case "F2":
			return vk_f2;
		case "F3":
			return vk_f3;
		case "F4":
			return vk_f4;
		case "F5":
			return vk_f5;
		case "F6":
			return vk_f6;
		case "F7":
			return vk_f7;
		case "F8":
			return vk_f8;
		case "F9":
			return vk_f9;
		case "F10":
			return vk_f10;
		case "F11":
			return vk_f11;
		case "F12":
			return vk_f12;
		case "LARROW":
		case "LEFT":
			return vk_left;
		case "RARROW":
		case "RIGHT":
			return vk_right;
		case "UARROW":
		case "UP":
			return vk_up;
		case "DARROW":
		case "DOWN":
			return vk_down;
		case "ENTER":
			return vk_enter;
		case "ESC":
		case "ESCAPE":
			return vk_escape;
		case "SPACE":
			return vk_space;
		case "SHIFT":
			return vk_shift;
		case "CTRL":
			return vk_control;
		case "ALT":
			return vk_alt;
		case "BACKSPACE":
			return vk_backspace;
		case "TAB":
			return vk_tab;
		case "HOME":
			return vk_home;
		case "END":
			return vk_end;
		case "DELETE":
		case "DEL":
			return vk_delete;
		case "INSERT":
		case "INS":
			return vk_insert;
		case "PAGEUP":
		case "PGUP":
			return vk_pageup;
		case "PAGEDN":
		case "PGDN":
			return vk_pagedown;
		case "PAUSE":
			return vk_pause;
		case "PRINTSCREEN":
		case "PRINTSCR":
		case "PRTSC":
			return vk_printscreen;
		case "NUMPAD0":
			return vk_numpad0;
		case "NUMPAD1":
			return vk_numpad1;
		case "NUMPAD2":
			return vk_numpad2;
		case "NUMPAD3":
			return vk_numpad3;
		case "NUMPAD4":
			return vk_numpad4;
		case "NUMPAD5":
			return vk_numpad5;
		case "NUMPAD6":
			return vk_numpad6;
		case "NUMPAD7":
			return vk_numpad7;
		case "NUMPAD8":
			return vk_numpad8;
		case "NUMPAD9":
			return vk_numpad9;
		case "MULTIPLY":
			return vk_multiply;
		case "DIVIDE":
			return vk_divide;
		case "ADD":
			return vk_add;
		case "SUBTRACT":
			return vk_subtract;
		case "DECIMAL":
			return vk_decimal;
		case "NONE":
		default:
			return -1;
	}
}
