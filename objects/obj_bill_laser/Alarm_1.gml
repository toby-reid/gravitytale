/// @description create second laser
var drawx = obj_soul.x + lengthdir_x(360,dir)
var drawy = obj_soul.y + lengthdir_y(360,dir)
with instance_create_layer(drawx,drawy,"Instances",obj_atk_laser) {
	image_angle = other.dir - 180
	spd = other.spd
	at = other.at
}
obj_bill_startBattle.x = obj_bill_startBattle.xstart
instance_destroy()