active = false
teleport = false
drawx[320] = 0
change[320] = 0
changeDir[320] = 0
changeChange[320] = 0
loc = 0
cantp = false;
if !global.enemy_spared[ENEMY.WAYMAN] and !global.enemy_killed[ENEMY.WAYMAN] {
	instance_create_layer(0,0,layer,obj_wayman_ow)
}
