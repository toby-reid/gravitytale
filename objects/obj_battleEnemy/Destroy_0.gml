/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

if hp <= 0 {
	obj_battleCore.lv += lv
	global.areaKilled[zone]++
	global.player[player.kills]++
	obj_battleCore.sb += sb
}
else {
	global.player[player.spares]++
	obj_battleCore.sb += ceil(sb/2)
}