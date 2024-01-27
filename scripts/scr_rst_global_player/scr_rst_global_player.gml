// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_rst_global_player(){
	/// @description Resetting global.player[]
	global.player[player.name] = "Dipper"
	//global.player[player.mabel] = false - do not enable, as this is a Reset.save value
	global.player[player.hours] = 0
	global.player[player.minutes] = 0
	global.player[player.seconds] = 0
	global.player[player.kills] = 0
	global.player[player.spares] = 0
	global.player[player.hp] = 20
	global.player[player.maxhp] = 20
	global.player[player.money] = 0
	global.player[player.lv] = 1
	global.player[player.nyarf] = 0
	global.player[player.bonus] = 0
	global.player[player.runActive] = 0
	global.player[player.portalPotty] = 0
	global.player[player.pic] = 0
}