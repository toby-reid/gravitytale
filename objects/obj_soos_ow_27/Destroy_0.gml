/// @description canMove true
var _set_canMove = true;
with obj_toRoom
{
    if (alpha != 0) _set_canMove = false;
}
if (_set_canMove)
{
    obj_dipper.canMove = true;
}
