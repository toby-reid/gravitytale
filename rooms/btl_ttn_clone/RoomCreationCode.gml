if (scr_has_enum_flag(global.tent_battles, TENT_BATTLE.TYRONE))
{
    global.enemy = [instance_create_layer(320, 160, layer, obj_enemy_tnt_clone, {clone_number: 2})];
    global.tent_battles = scr_remove_enum_flag(global.tent_battles, TENT_BATTLE.TYRONE);
}
else if (scr_has_enum_flag(global.tent_battles, TENT_BATTLE.CLONE_3_4))
{
    global.enemy = [
        instance_create_layer(192, 160, layer, obj_enemy_tnt_clone, {clone_number: 3}),
        instance_create_layer(448, 160, layer, obj_enemy_tnt_clone, {clone_number: 4})
    ];
    global.tent_battles = scr_remove_enum_flag(global.tent_battles, TENT_BATTLE.CLONE_3_4);
}
else if (scr_has_enum_flag(global.tent_battles, TENT_BATTLE.CLONE_5_6_7))
{
    global.enemy = [
        instance_create_layer(320, 160, layer, obj_enemy_tnt_clone, {clone_number: 5}),
        instance_create_layer(128, 140, layer, obj_enemy_tnt_clone, {clone_number: 6}),
        instance_create_layer(512, 140, layer, obj_enemy_tnt_clone, {clone_number: 7})
    ];
    global.tent_battles = scr_remove_enum_flag(global.tent_battles, TENT_BATTLE.CLONE_5_6_7);
}
else if (scr_has_enum_flag(global.tent_battles, TENT_BATTLE.CLONE_8_9_10))
{
    global.enemy = [
        instance_create_layer(320, 140, layer, obj_enemy_tnt_clone, {clone_number: 8}),
        instance_create_layer(512, 160, layer, obj_enemy_tnt_clone, {clone_number: 9}),
        instance_create_layer(128, 160, layer, obj_enemy_tnt_clone, {clone_number: 10})
    ];
    global.tent_battles = scr_remove_enum_flag(global.tent_battles, TENT_BATTLE.CLONE_8_9_10);
}
// else allow failure; that shouldn't happen
