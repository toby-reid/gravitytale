enum DIRECTION
{
    RIGHT = 0,
    UP = 1,
    LEFT = 2,
    DOWN = 3
}

/// @desc Reverses a direction.
/// @param {Enum.DIRECTION} _dir The direction to reverse
/// @return {Enum.DIRECTION} The reversed direction
function reverse_dir(_dir)
{
    return (_dir + 2) % 4;
}
