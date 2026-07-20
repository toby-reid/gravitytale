event_inherited();

destination = PORTAL_POTTY.NONE;

CAMERA_HEIGHT = 240;
screen = -1;
drawx = [];
drawx_delta = [];
delta_dir = [];
delta_delta = [];
alpha = 0;
is_initialized = false;

cantp = scr_isWaymanDefeated();
if (!global.enemy_spared[ENEMY.WAYMAN] and !global.enemy_killed[ENEMY.WAYMAN])
{
    instance_create_layer(0, 0, layer, obj_wayman_ow);
}

initialize = function(_is_incoming)
{
    drawx = array_create(CAMERA_HEIGHT, 0);
    drawx_delta = array_create(CAMERA_HEIGHT, 0);
    delta_dir = array_create(CAMERA_HEIGHT, 0);
    delta_delta = array_create(CAMERA_HEIGHT, 0);
    for (var i = 0; i < CAMERA_HEIGHT; ++i)
    {
        var _dir = (irandom(1) == 0) ? 1 : -1;
        drawx[i] = _is_incoming ? (-_dir * 680) : 0;
        delta_dir[i] = _dir; // must be reverse for incoming; just use random for outgoing
        drawx_delta[i] = 2 * _dir * irandom_range(2, 4);
        delta_delta[i] = irandom_range(10, 30);
    }
    alpha = _is_incoming ? 1 : 0;
    if (_is_incoming)
    {
        obj_dipper.canMove = false;
        obj_dipper.x = x;
        obj_dipper.y = y + 22;
        obj_dipper.dir = DIRECTION.DOWN;
    }
    else
    {
        audio_stop_all();
        audio_play_sound(sfx_teleport, 0, false);
    }
    screen = sprite_create_from_surface(application_surface, 0, 0, 640, 480, false, false, 0, 0);
    is_initialized = true;
}
reset_init = function()
{
    drawx = [];
    drawx_delta = [];
    delta_dir = [];
    delta_delta = [];
    sprite_delete(screen);
    screen = -1;
    alpha = 0;
    is_initialized = false;
}
teleport = function(_destination)
{
    destination = _destination;
    with obj_textbox
    {
        setCanMove = false;
        instance_destroy();
    }
    initialize(false);
}
m_all_together = function()
{
    for (var i = 0; i < CAMERA_HEIGHT; ++i)
    {
        if (drawx[i] != 0)
        {
            return false;
        }
    }
    return true;
}

if (global.teleport)
{
    initialize(true);
}
