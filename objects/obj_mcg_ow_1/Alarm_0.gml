/// @description Burst from the shadows! (or the engine)
if (global.player.genocide == RUN.ACTIVE) {
	stage = 8;
} else if (image_alpha == 0) {
	car.image_index = 1;
	audio_play_sound(sfx_pound, 0, false);
	image_alpha = 1;
	alarm[0] = 60;
} else {
	vspeed = -2;
}
