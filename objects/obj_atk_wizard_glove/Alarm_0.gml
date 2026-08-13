var _zap_count = (irandom(1) == 0) ? 3 : 4;
var _zap_spread = 20;
var _dir = image_angle - _zap_spread - ((_zap_count == 3) ? 0 : (_zap_spread div 2));
for (var i = 0; i < _zap_count; ++i)
{
    instance_create_layer(x, y, layer, obj_battleAttack, {at: at, image_angle: image_angle, direction: _dir, speed: 3, sprite_index: spr_atk_lightningBolt});
    _dir += _zap_spread;
}
audio_play_sound(sfx_alertAtk, 0, false);
alarm[0] = zap_speed;
