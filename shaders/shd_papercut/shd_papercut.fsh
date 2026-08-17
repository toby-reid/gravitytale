varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const int MAX_DRAW_LINES = 5;
uniform vec2 lineStarts[MAX_DRAW_LINES];
uniform vec2 lineEnds[MAX_DRAW_LINES];
uniform int lineCount;
const vec4 LINE_COLOUR = vec4(0.8, 0.0, 0.0, 1.0); // slightly darker red
const int LINE_THICKNESS = 2;

float distance_to_line(vec2 _point, vec2 _line_start, vec2 _line_end)
{
    vec2 _line_diff = _line_end - _line_start;
    return abs((_line_diff.x * (_point.y - _line_start.y)) - (_line_diff.y * (_point.x - _line_start.x))) / sqrt((_line_diff.x * _line_diff.x) + (_line_diff.y * _line_diff.y));
}

bool is_on_line(vec2 _point)
{
    for (int i = 0; i < MAX_DRAW_LINES && i < lineCount; ++i)
    {
        if (distance_to_line(_point, lineStarts[i], lineEnds[i]) < LINE_THICKNESS)
        {
            return true;
        }
    }
    return false;
}

void main()
{
    vec4 base_colour = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    if (base_colour.a > 0.0 && is_on_line(v_vTexcoord))
    {
        gl_FragColor = vec4(LINE_COLOUR.rgb, base_colour.a);
    }
    else
    {
        gl_FragColor = base_colour;
    }
}
