/// @description Feel the (heart)beat

self.image_index = (self.image_index + 1) mod self.image_number;
if (self.image_index == 1)
{
    if (self.delay > 0)
    {
        --self.delay;
    }
    else
    {
        if (self.heartbeat_index == 0)
        {
            self.heartbeat_color = choose(c_orange, c_aqua);
            self.image_blend = self.heartbeat_color;
        }
        else if (self.heartbeat_index == 3)
        {
            with instance_create_layer(x, y, layer, obj_atk_unicornHeart_wave)
            {
                image_blend = other.heartbeat_color;
            }
            audio_play_sound(sfx_heartbeat, 0, false);
        }
        else self.image_blend = self.heartbeat_color;
        self.heartbeat_index = (self.heartbeat_index + 1) mod 4;
    }
}
else
{
    self.image_blend = c_white;
}
self.alarm[0] = self.heartbeat;
