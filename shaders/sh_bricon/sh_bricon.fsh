//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float brightness;
uniform float contrast;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 newColor = gl_FragColor;
	
	for (int c = 0; c < 3; c++){
		newColor[c] += brightness;
		newColor[c] = (newColor[c] - 0.5) * max(contrast,0.0) + 0.5;
	}
	gl_FragColor = newColor;
}
