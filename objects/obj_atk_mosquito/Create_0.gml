/// @description Set 'host' on init
at = instance_exists(obj_enemy_min_soothsquito) ? obj_enemy_min_soothsquito.at : 0;
image_xscale = 2;
image_yscale = 2;
image_alpha = 0;
host = instance_exists(obj_enemy_min_soothsquito) ? instance_find(obj_enemy_min_soothsquito, 0) : noone;

self.alarm[1] = irandom_range(30, 120);
min_dist = 20;
max_dist = 40;
