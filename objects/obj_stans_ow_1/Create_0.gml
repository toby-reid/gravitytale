stage = 0
image_speed = 0
killTime = 0
if !variable_global_exists("stans") global.stans = 0
if global.stans >= 1 {
	with instance_create_layer(1220,60,"Instances",obj_save) {
		rmName = "Forest - Grunkle Stans"
		text = "(Meeting such eccentric old men #fills you with anticipation.)"
		music = mus_snowy
		music_nbs = mus_snowy
		loc = area.forest
	}
	instance_destroy(obj_ford_ow_1)
	instance_destroy()
}