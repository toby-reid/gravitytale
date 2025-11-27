/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4
{
    if (self.timer == 0)
    {
        var index = (instance_number(obj_battleEnemy) == 1) ? 0 : ((global.enemy[0] == id) ? 1 : 2);
        var bbox_dist = ceil(obj_battleBox.sprite_width / 2);
        if (index == 0 or index == 1)
        {
            instance_create_layer(obj_battleBox.x + bbox_dist, obj_battleBox.y, layer, obj_atk_leprecorn_cloverLeaf);
            instance_create_layer(obj_battleBox.x - bbox_dist, obj_battleBox.y, layer, obj_atk_leprecorn_cloverLeaf);
        }
        if (index == 0 or index == 2)
        {
            instance_create_layer(obj_battleBox.x, obj_battleBox.y - bbox_dist, layer, obj_atk_leprecorn_cloverLeaf);
            instance_create_layer(obj_battleBox.x, obj_battleBox.y + bbox_dist, layer, obj_atk_leprecorn_cloverLeaf);
        }
        if (index == 2 or instance_number(obj_enemy_min_leprecorn) == 1)
        {
            if (irandom(1) == 0) obj_atk_leprecorn_cloverLeaf.spin_speed *= -1;
        }
    }
    else if (self.timer == 540 or (self.timer == 420 and instance_number(obj_battleEnemy) > 1 and instance_number(obj_enemy_min_leprecorn) == 1))
    {
        ++global.stage[0];
    }
    ++self.timer;
}