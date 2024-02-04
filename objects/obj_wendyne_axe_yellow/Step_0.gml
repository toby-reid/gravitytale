/// @description Jump up, superstar!
if(image_blend == c_yellow) {
	var _dist = point_distance(x,y,obj_soul.x,obj_soul.y);
	if(_dist <= 25*speed or _dist <= 60) {
		angle += 15;
		x = obj_soul.x + lengthdir_x(_dist,angle);
		y = obj_soul.y + lengthdir_y(_dist,angle);
		if(angle == image_angle+180) {
			direction = image_angle;
			image_blend = c_orange;
		}
		else direction = angle - 180;
	}
}