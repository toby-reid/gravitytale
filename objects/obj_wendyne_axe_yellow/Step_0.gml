/// @description Jump up, superstar!
if(image_blend == c_yellow) {
	var _dist = point_distance(x,y,obj_soul.x,obj_soul.y);
	if(_dist <= 100) {
		if(speed != 0) {
			spd = speed;
			speed = 0;
		}
		
		angle += 10;
		if(angle == image_angle+180) {
			direction = image_angle;
			image_blend = c_orange;
			speed = spd;
		}
		x = obj_soul.x + lengthdir_x(_dist,angle);
		y = obj_soul.y + lengthdir_y(_dist,angle);
	}
}