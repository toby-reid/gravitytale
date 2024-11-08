if global.player.mabel sprite_index = spr_soulM_broken;
if instance_exists(obj_soul) {
	switch obj_soul.image_index {
		case 0:
			image_blend = global.player.mabel ? scr_hexdec("CC277A") : 0xff7019;
			break
		case 1: image_blend = 0xff4123 break
		case 2: image_blend = 0x00aaff break
		case 3: image_blend = 0x00ff00 break
		case 4: image_blend = 0x00ffff break
		case 5: image_blend = 0xff00ff break
		case 6: image_blend = 0xffff00 break
	}
	angle = obj_soul.image_angle
	image_angle = angle - 360*(angle==270)
} else { // not certain why the 'else' is here, but oh well
	angle = 0;
}
audio_stop_all();

room_goto(rm_gameover)
alarm[0] = 60

audio_play_sound(sfx_soulBreak,0,false);

alpha = 0;
charCount = 0;
stage = 0;
text = "Hey, what's the big idea, kid?&You don't die until I say so.&Now get back out there, and #win this time.";
for(var i = 1; i <= string_length(text); i++) {timer[i] = irandom(5);}