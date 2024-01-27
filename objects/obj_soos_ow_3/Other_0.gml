obj_dipper.canMove = true
audio_stop_all()
audio_play_sound(mus_ruins,0,true)
if instance_exists(obj_save) obj_save.image_alpha = 1
global.soos = 3
instance_destroy()