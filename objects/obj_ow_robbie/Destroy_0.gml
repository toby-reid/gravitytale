obj_dipper.canMove = true
if !audio_is_playing(mus_snowy)
	audio_play_sound(mus_snowy,0,true)
obj_sign.text = ["(It's a stand advertising #Robbie's band.&(It's a bandstand.)"]
obj_save.image_alpha = 1
audio_sound_pitch(sfx_horn,1)