if instance_exists(obj_enemy_fst_gnome) at = obj_enemy_fst_gnome.at
else at = instance_find(obj_battleEnemy,0).at
alarm[0] = 30
image_alpha = 0
image_xscale = 2
image_yscale = 2
image_index = irandom(3)