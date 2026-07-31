//
// Desaturates a sprite
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float strength;

void main()
{
    vec4 base_color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    float average_c_val = (base_color.r + base_color.g + base_color.b) / 3.0;
    gl_FragColor = vec4(
        base_color.r - ((base_color.r - average_c_val) * strength),
        base_color.g - ((base_color.g - average_c_val) * strength),
        base_color.b - ((base_color.b - average_c_val) * strength),
        base_color.a
    );
}
