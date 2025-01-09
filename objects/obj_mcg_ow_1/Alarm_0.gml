/// @description Burst from the shadows! (or the engine)
if (global.player.genocide == RUN.ACTIVE) {
	stage = 8;
} else if (image_alpha == 0) {
	car.image_index = 1;
	audio_play_sound(sfx_pound, 0, false);
	image_alpha = 1;
	alarm[0] = 150;
} else {
	vspeed = -1.5;
	audio_sound_pitch(sfx_whoosh, .5);
	audio_play_sound(sfx_whoosh, 0, false);
}
