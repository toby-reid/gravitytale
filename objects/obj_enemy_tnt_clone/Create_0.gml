name = string_concat("Number ", clone_number);
act = ["Check", "Fold", "Water", "WENDY"];
action = -1;
switch clone_number
{
    case 3:
    case 4:
        check = "You were warned about these.&Water should take care of them.";
        break;
    case 5:
    case 6:
    case 7:
        check = "These are cheaper prints.&They seem less wary of you.";
        break;
    case 8:
    case 9:
    case 10:
        check = "These are fresher prints.&They seem desperate to \"live\".";
        break;
    default:
        check = ""; // will be handled later
        break;
}
spare = false;
run = false;
hp = 36;
maxhp = hp;
at = 1;

lv = false; // set true if killing person increases LV
sb = 30;
area = AREA.TENT;
timer = 0;
bubble = noone;
deathx = 0;
stage = 0;

image_xscale = 2;
image_yscale = 2;
if (clone_number != 2)
{
    image_index = irandom(image_number);
}

obj_battleCore.text[0] = global.player.mabel ? "The resemblance is uncanny." : "It's like looking in a mirror.";

m_act_before_check = function(_attempted_action)
{
    obj_battleCore.text[1] = string_concat("You were about to ", _attempted_action, " #but you realised you know #nothing about these ", (clone_number == 2) ? "things" : "ones", ".");
    obj_battleCore.text[0] = global.player.mabel
        ? string_concat("In honor of your dear brother, #whose image ", (clone_number == 2) ? "this is" : "these are", ", #you should exercise caution.")
        : string_concat("You should exercise caution.&", (clone_number == 2) ? "He is" : "They are", " made in your own image, #after all.");
}

flutter_start = sprite_get_height(sprite_index);
flutter_width = sprite_get_width(sprite_index);

flutters = [];
add_flutter = function(_height, _x_scale)
{
    array_push(flutters, {
        size: _height,
        y_offset: flutter_start,
        y_endpoint: -_height,
        x_scale: _x_scale,
        width: flutter_width * _x_scale
    });
}
update_flutters = function()
{
    // Iterate backward to avoid offsetting the indices
    for (var i = array_length(flutters) - 1; i >= 0; --i)
    {
        var _flutter = flutters[i];
        --_flutter.y_offset;
        if (_flutter.y_offset == _flutter.y_endpoint)
        {
            array_delete(flutters, i, 1);
        }
    }
}
alarm[11] = 60;
