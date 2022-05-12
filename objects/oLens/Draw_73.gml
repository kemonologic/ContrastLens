if (surface_exists(captureSurface)){
	draw_surface(captureSurface,0,0);
}

if (finderEnabled){
	shader_reset();
	draw_line_width_color(0,0,winW,winH,8,c_lime,c_lime);
	draw_line_width_color(0,winH,winW,0,8,c_fuchsia,c_fuchsia);
	shader_set(shader);
	if (shader == sh_bricon){
		shader_set_uniform_f(shader_bUniform,brightness);
		shader_set_uniform_f(shader_cUniform,contrast);
	}
}