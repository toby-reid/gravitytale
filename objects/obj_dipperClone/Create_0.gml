if (!global.has_clone)
{
    instance_destroy();
    exit;
}

event_inherited();

strength_uniform = shader_get_uniform(shd_desaturate, "strength");

is_dipper_classic = false;

set_image = function() {
    sprite_index = obj_dipper.sprite_index;
    // Must clamp here in case obj_dipper's 'Step' hasn't occurred by the time this function is called
    image_index = obj_dipper.clamp_image_index(obj_dipper.dir, obj_dipper.image_index);
    image_index -= image_index % 2;
}
sprite_index = obj_dipper.sprite_index;
image_index = 8;
image_speed = 0;
obj_dipper.image_alpha = 0;

swap = function() {
    var _old_x = x;
    var _old_y = y;
    var _old_index = image_index;
    x = obj_dipper.x;
    y = obj_dipper.y;
    set_image();
    obj_dipper.x = _old_x;
    obj_dipper.y = _old_y;
    if (_old_index <= 1)
    {
        obj_dipper.dir = DIRECTION.RIGHT;
    }
    else if (_old_index <= 5)
    {
        obj_dipper.dir = DIRECTION.UP;
    }
    else if (_old_index <= 7)
    {
        obj_dipper.dir = DIRECTION.LEFT;
    }
    else
    {
        obj_dipper.dir = DIRECTION.DOWN;
    }
    obj_dipper.image_index = _old_index;
    is_dipper_classic = !is_dipper_classic;
    audio_play_sound(sfx_mmmm, -1, false); // TODO: find a better sound effect for swapping
    alarm[0] = 20;
}

m_set_shaders = function() {
    shader_set(shd_desaturate);
    shader_set_uniform_f(strength_uniform, desaturate_strength);
}
m_draw_self = function() {
    if (!is_dipper_classic)
    {
        m_set_shaders();
    }
    draw_self();
    shader_reset();
}
m_draw_dipper = function() {
    if (is_dipper_classic)
    {
        m_set_shaders();
    }
    draw_sprite(obj_dipper.sprite_index, obj_dipper.image_index, obj_dipper.x, obj_dipper.y);
    shader_reset();
    if (alarm[0] > -1)
    {
        if (alarm[0] < 10)
        {
            draw_set_alpha(alarm[0] / 10);
        }
        draw_sprite(spr_alert, 0, obj_dipper.x, obj_dipper.y - 20);
        draw_set_alpha(1);
    }
}
