/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4
{
    if (self.timer == 0)
    {
        var cockroach_count = irandom_range(1, 4 - instance_number(obj_enemy));
        var bbox_bounds_x = [obj_battleBox.x - obj_battleBox.sprite_xoffset, obj_battleBox.x + (obj_battleBox.sprite_width - obj_battleBox.sprite_xoffset)];
        var bbox_bounds_y = [obj_battleBox.y - obj_battleBox.sprite_yoffset, obj_battleBox.y + (obj_battleBox.sprite_height - obj_battleBox.sprite_yoffset)];
        for (var i = 0; i < cockroach_count; ++i)
        {
            instance_create_layer(script_execute_ext(irandom_range, bbox_bounds_x), script_execute_ext(irandom_range, bbox_bounds_y), layer, obj_atk_cockroach);
        }
    }
    else if (self.timer == 420)
    {
        ++global.stage[0];
    }
    ++self.timer;
}
