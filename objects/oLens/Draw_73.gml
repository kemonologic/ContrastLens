shader_set(sh_invert);
if (surface_exists(captureSurface)){
	draw_surface_ext(captureSurface,0,0,1,1,0,c_white,1);
}
shader_reset();