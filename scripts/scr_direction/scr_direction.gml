enum DIRECTION
{
    RIGHT = 0,
    UP = 1,
    LEFT = 2,
    DOWN = 3,
    ALL = 4
}
global.DIR_KEYS = [
    vk_right,
    vk_up,
    vk_left,
    vk_down
];
function dir_get_x(_dir)
{
    return (_dir % 2 == 0) ? ((_dir == DIRECTION.RIGHT) ? 1 : -1) : 0;
}
function dir_get_y(_dir)
{
    return (_dir % 2 != 0) ? ((_dir == DIRECTION.DOWN) ? 1 : -1) : 0;
}

function dir_get_angle(_dir)
{
    return _dir * 90;
}

/// @desc Reverses a direction.
/// @param {Enum.DIRECTION} _dir The direction to reverse
/// @return {Enum.DIRECTION} The reversed direction
function reverse_dir(_dir)
{
    return (_dir + 2) % 4;
}
