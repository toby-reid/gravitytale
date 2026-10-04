if hp > 0 draw_self()
else {
    if x == 270 {
        path_start(pth_waxHead,2,path_action_stop,false)
        audio_stop_sound(mus_anticipation)
        audio_play_sound(sfx_whoop,0,false)
    }
    draw_sprite_part_ext(sprite_index,image_index,0,0,40,23,x,y,3,3,c_white,image_alpha)
    draw_sprite_part_ext(sprite_index,image_index,0,23,40,30,270,160,3,3,c_white,image_alpha)
    if path_index != pth_waxHead {
        image_alpha -= .05
        if image_alpha == 0 instance_destroy()
    }

    // No, this does not belong here, but I'm just doing minor refactoring
    if (global.dummy == DUMMY_STATUS.MODIFIED_FIXED or global.dummy == DUMMY_STATUS.MODIFIED_MELTED)
    {
        global.dummy = DUMMY_STATUS.MODIFIED_DESTROYED;
    }
    else
    {
        global.dummy = DUMMY_STATUS.STANS_DESTROYED;
    }
}
