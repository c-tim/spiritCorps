shader_type canvas_item;
uniform sampler2D existing_screen_texture : hint_screen_texture, filter_linear_mipmap;
uniform float frequency = 10.0;
uniform float amplitude = 25;
uniform float speed = 10.0;



void vertex() {
	
	VERTEX.y += amplitude * sin(( frequency * UV.x) + (speed* TIME));
	/*vec2 new_uv = SCREEN_UV;
	new_uv.y+= sin(new_uv.x*frequency+TIME)*amplitude;
	vec3 new_colors  = textureLod(existing_screen_texture, new_uv, 0.0).rgb;
	COLOR.rgb = new_colors;*/
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
