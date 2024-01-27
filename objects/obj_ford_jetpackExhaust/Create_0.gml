if !audio_is_playing(sfx_rocket) audio_play_sound(sfx_rocket,0,true)
image_xscale = random(.1)+.1
image_yscale = random(.1)+.1
image_angle = irandom(359)
image_blend = choose(c_grey,c_ltgrey,c_silver,c_white)
vspeed = random(2)+1
alarm[0] = irandom(25)+5