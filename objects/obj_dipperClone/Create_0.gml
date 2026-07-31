event_inherited();

strength_uniform = shader_get_uniform(shd_desaturate, "strength");

is_dipper_classic = false;

set_image = function() {
    sprite_index = obj_dipper.sprite_index;
    image_index = (obj_dipper.dir == DIRECTION.DOWN) ? (obj_dipper.image_index - (obj_dipper.image_index % 2)) : choose(8, 10);
}
set_image();
image_speed = 0;

swap = function() {
    set_image();
    var _old_x = obj_dipper.x;
    var _old_y = obj_dipper.y;
    var _old_sprite = obj_dipper.sprite_index;
    obj_dipper.x = x;
    obj_dipper.y = y;
    obj_dipper.dir = DIRECTION.DOWN;
    x = _old_x;
    y = _old_y;
    is_dipper_classic = !is_dipper_classic;
}
