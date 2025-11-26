/// @desc for multiple enemies, double heartbeat (and delay, for enemy2)

self.image_xscale = 2;
self.image_yscale = 2;
self.at = instance_exists(obj_enemy_min_unicorn) ? obj_enemy_min_unicorn.at : 0;
self.destroy_on_impact = false;

self.heartbeat = 6;
self.alarm[0] = self.heartbeat;
self.heartbeat_index = 0;
self.image_speed = 0;
self.heartbeat_color = c_white;
self.delay = 0;
