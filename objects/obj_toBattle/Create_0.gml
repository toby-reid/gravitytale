///@desc music,goto,dest
alarm[0] = 1
flashes = 0
music = mus_battle//Change if special
prevMusic = silence//Change if needed
goto = room//Change!
prev = room
dest = 0//0 to the FIGHT button, 1 to the BattleBox, 2 to the middle
if instance_exists(obj_dipper) {
	setMove = obj_dipper.canMove
	obj_dipper.canMove = false
	x = 2*(obj_dipper.x-camera_get_view_x(view_camera[0]))
	y = 2*(obj_dipper.y-camera_get_view_y(view_camera[0]))
}
image_alpha = 0
//audio_stop_all()
global.dir = 4
if global.player[player.mabel] sprite_index = spr_soulM