/// @description Pressed. (Alarm to be triggered by others if needed)
if image_index%2 == 0 if instance_exists(obj_buttSwitch) if !obj_buttSwitch.done {
	image_index++
	audio_play_sound(sfx_click,0,false)
	obj_buttSwitch.pressed = id
}