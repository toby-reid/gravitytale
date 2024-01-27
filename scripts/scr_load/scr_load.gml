// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load(){
	audio_group_stop_all(Music)
	/*if file_exists("Save.save") game_load("Save.save")
	else game_restart()*/
	
	
	//Custom Save/Load
	global.load = true
	ini_open("Info.save")
	
	window_set_caption(ini_read_string("Save","WC",window_get_caption()))
	global.player[0] = ini_read_string("Save","PL0","ERROR")
	for(var i = 1; i < player.total; i++) global.player[i] = ini_read_real("Save","PL"+string(i),noone)
	global.menu = [ini_read_real("Save","MN0",0),ini_read_real("Save","MN1",0)]
	global.battleTimer = ini_read_real("Save","BTLTM",0)
	for(var i = 0; i < enemy.total; i++) {
		global.killed[i] = ini_read_real("Save","K"+string(i),false)
		global.spared[i] = ini_read_real("Save","S"+string(i),false)
	}
	for(var i = 0; i <= 7; i++) global.inventory[i] = ini_read_real("Save","IV"+string(i),item.none)
	for(var i = 0; i < area.total; i++) global.areaKilled[i] = ini_read_real("Save","AK"+string(i),0)
	global.soos = ini_read_real("Save","soos",0)
	global.stans = ini_read_real("Save","stans",0)
	global.toby = ini_read_real("Save","toby",0)
	global.wendy = ini_read_real("Save","wendy",0)
	global.hamstick = ini_read_real("Save","hamstick",false)
	global.fairydust = ini_read_real("Save","fairydust",0)
	global.runemy = []
	for(var i = 0; i < ini_read_real("Save","RUNL",0); i++) global.runemy[i] = ini_read_real("Save","RUN"+string(i),noone)
	global.buttSwitch = []
	for(var i = 0; i < ini_read_real("Save","BUTTL",0); i++) global.buttSwitch[i] = ini_read_real("Save","BUTT"+string(i),noone)
	global.trashCan = []
	for(var i = 0; i < ini_read_real("Save","TRASHL",0); i++) global.trashCan[i] = ini_read_real("Save","TRASH"+string(i),noone)
	
	audio_group_stop_all(Music)
	audio_play_sound(ini_read_real("Save","MS",noone),0,true)
	obj_core.goto = ini_read_real("Save","RM",rm_menu)
	
	ini_close()
	scr_genoMusic()
	obj_core.alarm[2] = 1
	
}