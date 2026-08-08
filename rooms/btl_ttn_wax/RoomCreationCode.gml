if (scr_has_enum_flag(global.tent_battles, TENT_BATTLE.LIZZIE_GROUCHO))
{
    global.enemy = [
        instance_create_layer(192, 160, layer, obj_enemy_tnt_lizzie),
        instance_create_layer(448, 160, layer, obj_enemy_tnt_groucho)
    ];
    global.tent_battles = scr_remove_enum_flag(global.tent_battles, TENT_BATTLE.LIZZIE_GROUCHO);
}
else if (scr_has_enum_flag(global.tent_battles, TENT_BATTLE.SHAKESPEARE_GENGHIS))
{
    global.enemy = [
        instance_create_layer(192, 160, layer, obj_enemy_tnt_shakespeare),
        instance_create_layer(448, 160, layer, obj_enemy_tnt_genghis)
    ];
    global.tent_battles = scr_remove_enum_flag(global.tent_battles, TENT_BATTLE.SHAKESPEARE_GENGHIS);
}
else if (scr_has_enum_flag(global.tent_battles, TENT_BATTLE.SHERLOCK_LARRY))
{
    global.enemy = [
        instance_create_layer(320, 160, layer, obj_enemy_tnt_sherlock),
        instance_create_layer(128, 160, layer, obj_enemy_tnt_larryKing),
        instance_create_layer(512, 160, layer, obj_enemy_tnt_wizard)
    ];
    global.tent_battles = scr_remove_enum_flag(global.tent_battles, TENT_BATTLE.SHERLOCK_LARRY);
}
// else allow failure; that shouldn't happen
