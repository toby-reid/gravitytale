/// @desc text bubble
with instance_create_layer(x + 100, y - 40, layer, obj_textBubble)
{
    switch other.rounds_left
    {
        case 18:
            text = [
                "something #something"
            ];
            break;
        default:
            text = ["Placeholder #text"];
            break;
    }
    for (var i = 0, _text_length = array_length(text); i < _text_length; ++i)
    {
        sound[i] = tlk_pacifica;
        style[i] = TEXT_STYLE.WAVE;
    }
    image_index = 1;
}
