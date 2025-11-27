at = (instance_exists(obj_enemy_min_leprecorn)) ? obj_enemy_min_leprecorn.at : 0;
destroy_on_impact = false;
image_xscale = 2;
image_yscale = 2;
image_alpha = 0;
image_angle = round(point_direction(obj_battleBox.x, obj_battleBox.y, x, y));

self.move_time = 30; // want to reach it in 30 frames
self.wait_time = 30;
self.move_speed = point_distance(x, y, obj_battleBox.x, obj_battleBox.y) / self.move_time;
self.moving_inward = true;
self.spin_speed = 1;
