/// @description chop chop
image_index = !image_index
if image_index == 1 {
	count++
	if count == 3 {
		var map = layer_tilemap_get_id("Tiles_2")
		tilemap_set(map,38,31,7)
		tilemap_set(map, 0,31,8)
		tilemap_set(map, 0,31,9)
		camera_set_view_size(view_camera[0],328,246)
		alarm[2] = 10
		alarm[1] = 20
		audio_play_sound(sfx_sans_pound,0,false)
	}
	else audio_play_sound(sfx_wendyne_step,0,false)
}
if alarm[2] == -1 if stage == 3 alarm[1] = 45