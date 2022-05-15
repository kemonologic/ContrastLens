if (justStarted){
	draw_set_halign(fa_center);
	draw_clear_alpha(c_black,1);
	draw_text(winW / 2,50,"Welcome to ContrastLens!");
	draw_text(winW / 2,105,"Capture an image (ENTER) \n or switch modes (M) \n to get started.");
	draw_text(winW / 2,winH - 50,"deerbell.itch.io/contrastlens");
	draw_set_halign(fa_left);
}

if (surface_exists(captureSurface)){
	shader_set(shader);
	if (shader == sh_bricon){
		shader_set_uniform_f(shader_bUniform,brightness);
		shader_set_uniform_f(shader_cUniform,contrast);
	}
	draw_surface(captureSurface,0,0);
	shader_reset();
	
	if (finderEnabled){
		draw_line_width_color(0,0,winW,winH,8,c_lime,c_lime);
		draw_line_width_color(0,winH,winW,0,8,c_fuchsia,c_fuchsia);
	}
	draw_surface(uiSurface,0,0);
}
