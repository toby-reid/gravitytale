if (save == 0 && instance_exists(obj_dipper) && obj_dipper.canMove) {
    var dir = obj_dipper.dir
    if (
        (place_meeting(x - 2, y, obj_dipper) and dir == DIRECTION.RIGHT)
        or (place_meeting(x, y + 2, obj_dipper) and dir == DIRECTION.UP)
        or (place_meeting(x + 2, y, obj_dipper) and dir == DIRECTION.LEFT)
        or (place_meeting(x, y - 2, obj_dipper) and dir == DIRECTION.DOWN)
    )
    {
        obj_dipper.canMove = false
        if y > camera_get_view_y(view_camera[0])+140 ybox = 96
        else ybox = 384
        with instance_create_layer(160, ybox div 2, layer, obj_textbox)
        {
            if global.player.genocide == RUN.ACTIVE {
                var _remaining = global.MAX_KILLS[other.loc] - global.areaKills[other.loc];
                set_text(string_concat("@ff0000", (_remaining > 0) ? string_concat(_remaining, " left") : (global.player.mabel ? "Immolation" : "Devastation"), "."));
            }
            else
            {
                set_text(other.text);
            }
            set_sounds(silence);
            set_actions(array_length(m_text) - 1, method({target: other.id}, function() {
                target.grow = 0.1;
            }));
        }
        save = 1
        size = 0
        profile = scr_getSaveProfile();
        global.player.hp = global.player.maxHp;
        audio_play_sound(sfx_heal,0,false)
    }
}
