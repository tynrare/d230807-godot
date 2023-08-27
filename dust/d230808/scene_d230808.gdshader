shader_type canvas_item;

void fragment() {
	//vec2 center = vec2(0.5, 0.5) - SCREEN_UV;
	//float dist = length(center);
	COLOR = texture(TEXTURE, UV); //read from texture
	COLOR.a = round(COLOR.a);
	// Place fragment code here.
}
