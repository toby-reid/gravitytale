if (!is_active && !instance_exists(obj_textbox) && instance_exists(obj_dipper) && obj_dipper.canMove)
{
    var _dir = obj_dipper.dir
    var ybox = (y > camera_get_view_y(view_camera[0]) + 140) ? 48 : 192;
    if (
        (place_meeting(x - 2, y, obj_dipper) && _dir == 0)
        || (place_meeting(x, y + 2, obj_dipper) && _dir == 1)
        || (place_meeting(x + 2, y, obj_dipper) && _dir == 2)
        || (place_meeting(x, y - 2, obj_dipper) && _dir == 3)
    )
    {
        with instance_create_layer(160, ybox, layer, obj_textbox)
        {
            if (instance_exists(other.flame) && instance_exists(obj_min_gideon_bombDate))
            {
                text = array_concat(
                    [
                        "(It's a flaming Gideon doll.)",
                        "(Extinguish?)##       yes         no",
                        string_concat(
                            "(Use what to extinguish?)#",
                            (array_length(other.tool_to_extinguish) > 1) ? scr_pad_string(other.tool_to_extinguish[0], 10) : "",
                            "#",
                            scr_pad_string(other.tool_to_extinguish[array_length(other.tool_to_extinguish) - 1], 10),
                            scr_pad_string("nevermind", 11)
                        ),
                        "(You manage to extinguish the flames.)"
                    ],
                    other.text
                );
                sound = array_concat(
                    [
                        tlk_default,
                        tlk_default,
                        tlk_default,
                        tlk_default
                    ],
                    other.sound
                );
                while (array_length(sound) < array_length(text))
                {
                    sound[array_length(sound)] = tlk_gideon;
                }
                choice = [0, 1, 1];
                charRate = array_concat([0, 0, 0, 0], other.charRate);
            }
            else
            {
                text = [
                    "(It's a Gideon doll.)",
                    "(Somehow, it's not completely #charred.)"
                ];
            }
        }
        if (instance_exists(flame))
        {
            is_active = true;
        }
    }
}
