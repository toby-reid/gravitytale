shader_set_uniform_f(shader_get_uniform(shd_desaturate, "strength"), desaturate_strength);

sprite_index = obj_dipper.sprite_index;
image_index = 8;

swap = function(_target = obj_dipper) {
    var _old_x = _target.x;
    var _old_y = _target.y;
    var _old_sprite = _target.sprite_index;
    _target.x = x;
    _target.y = y;
    _target.dir = DIRECTION.DOWN;
    x = _old_x;
    y = _old_y;
    sprite_index = _old_sprite;
}
