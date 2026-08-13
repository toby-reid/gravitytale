/// @description Override - Attack
if (image_alpha == 1 && !instance_exists(obj_textBubble) && global.stage[0] == 4)
{
    if (instance_number(obj_enemy) == 1 || (instance_number(obj_enemy_tnt_wizard) > 1 && instance_find(obj_enemy_tnt_wizard, 1) == id))
    {
        if (timer == 0)
        {
            if (instance_number(obj_enemy_tnt_wizard) == 2)
            {
                instance_create_layer(obj_dipper.x, obj_battleBox.y - (sprite_get_height(obj_battleBox.sprite_index) div 2), layer, obj_atk_wizard_glove, {sync_x: true, image_angle: 270});
            }
            else
            {
                var _x_offset = sprite_get_width(obj_battleBox.sprite_index) div 2;
                instance_create_layer(obj_battleBox.x - _x_offset, obj_dipper.y, layer, obj_atk_wizard_glove, {sync_x: false});
                instance_create_layer(obj_battleBox.x + _x_offset, obj_dipper.y, layer, obj_atk_wizard_glove, {sync_x: false, image_angle: 180, start_with_delay: true});
            }
        }
        else if (timer == 420)
        {
            if (obj_soul.image_xscale == 1)
            {
                ++global.stage[0];
            }
            else
            {
                restore_soul();
            }
        }
    }
    else if (timer == 0)
    {
        instance_create_layer(0, 0, layer, obj_atk_wizard_biggerizer, {biggerize: true});
        // Rely on other enemies to restore soul if needed
    }
    ++timer;
}
if (!revealed && obj_battleCore.enemies_glittered)
{
    m_reveal();
}
