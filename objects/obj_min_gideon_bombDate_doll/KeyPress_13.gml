if (!instance_exists(obj_textbox_old) && instance_exists(obj_dipper) && obj_dipper.canMove)
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
                var _base_text = [
                    "(It's a flaming Gideon doll.)",
                    "(Extinguish?)",
                    "(Use what to extinguish?)",
                    "(You manage to extinguish the #flames.)"
                ];
                var _base_text_length = array_length(_base_text);
                set_text(array_concat(_base_text, other.text));
                set_sounds(other.sound, _base_text_length);
                set_sound_range(tlk_gideon, max(_base_text_length, array_length(m_sounds)));
                set_choices(1, [ "yes", "no" ], [
                    noop,
                    method({target: id}, function() { with target {
                        array_delete(m_text, page + 1, array_length(m_text));
                        m_text[page + 1] = "(You're right.&(We should just let it all #blow up.)";
                        set_autoskip(page + 1, -1);
                        set_choiceCount(page + 1, 0);
                    }})
                ]);
                set_choices(2, [ other.tool_to_extinguish, "nevermind" ], [
                    method({target: other.flame}, function() {
                        --obj_min_gideon_bombDate.doll_count;
                        instance_destroy(target);
                    }),
                    method({target: id}, function() { with target {
                        array_delete(m_text, page + 1, array_length(m_text));
                        m_text[page + 1] = "(Yeah, that sounds like a dumb #tool to use.&(Let's just give up.)";
                    }})
                ]);
                set_charRate_range(other.charRate, _base_text_length);
                set_skippable_range(false, _base_text_length);
            }
            else
            {
                set_text([
                    "(It's a Gideon doll.)",
                    "(Somehow, it's not completely #charred.)"
                ]);
            }
        }
    }
}
