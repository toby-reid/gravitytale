/// @description Fixing obj_battleEnemy AT values
if global.player[player.nyarf] == 3 or global.player[player.nyarf] == 5 for(var i = 0; i < array_length(global.enemy); i++)
	with global.enemy[i] at = ceil(at / 2);