stage = 0
cam = [x+image_xscale/2-160,y+image_yscale/2-120]
if cam[0] < 0 cam[0] = 0
else while cam[0] > room_width-320 cam[0]--
if cam[1] < 0 cam[1] = 0
else while cam[1] > room_height-240 cam[1]--

tiledata = [20,5,15]//by default: path edges, walls, base

var _room_name = room_get_name(room);
if (array_contains(global.completedPuzzleRooms, _room_name))
{
    stage = 4
    event_user(0)
    instance_destroy()
}
else if global.player.genocide == RUN.ACTIVE
{
    array_push(global.completedPuzzleRooms, _room_name);
}
