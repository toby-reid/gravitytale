/// @description Fixing obj_battleEnemy AT values
if global.player.df == AT_DF.UPGRADE {
    for(var i = 0; i < array_length(global.enemy); i++) {
        with global.enemy[i] at = ceil(at / 2);
    }
}