//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 newColor = gl_FragColor;
	
	for (int c = 0; c < 3; c++){
		newColor[c] = (1.0 - newColor[c]);
	}
	gl_FragColor = newColor;
}
