/// @description Kill with time / Destroy
if !instance_exists(obj_ford_ow_1) {
	if !instance_exists(obj_textbox) if global.player[player.runActive] == 2 {
		if obj_dipper.x >= x-200 killTime++
		else killTime = 0
		if killTime == 900 with instance_create_layer(160,192,"Instances",obj_textbox) {
			text = ["hey, kid...","didn't i warn you there would #be consequences if you stuck #around?"]
			head = [spr_stans_head_content,spr_stans_head_hollowEye]
			font = [fnt_sans_gui,fnt_sans_gui]
			sound = [tlk_stans,tlk_stans]
			charRate = [.25,.25]
			audio_group_load(Battle)
			room_persistent = false
		}
		if killTime > 900 if !instance_exists(obj_textbox) with instance_create_layer(2*(obj_dipper.x+camera_get_view_x(view_camera[0])),2*obj_dipper.y,"Instances",obj_soul_broken) image_blend = 0xff7019
	}
}