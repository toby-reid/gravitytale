/// @description Fade in
if (instance_exists(obj_dipper) && global.toRoom && !global.teleport && global.toRoom_num == num && dir == reverse_dir(global.dir))
{
    switch dir
    {
        case DIRECTION.RIGHT:
            obj_dipper.x = x - 10;
            obj_dipper.y = y + (sprite_height div 2);
            break;
        case DIRECTION.UP:
            obj_dipper.x = x + (sprite_width div 2);
            obj_dipper.y = y + sprite_height + 10;
            break;
        case DIRECTION.LEFT:
            obj_dipper.x = x + sprite_width + 10;
            obj_dipper.y = y + (sprite_height div 2);
            break;
        case DIRECTION.DOWN:
            obj_dipper.x = x + (sprite_width div 2);
            obj_dipper.y = y - 10;
            break;
    }
}
room_persistent = true; // enables battles and whatnot
if (alpha == 0 && goto == -1)
{
    instance_destroy();
}
