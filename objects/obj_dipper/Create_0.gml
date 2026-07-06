canMove = true;
image_speed = 0;
enum DIPPER_MENU
{
    CLOSED,
    PRIMARY_SELECT,
    ITEM_LIST,
    ITEM_ACTION,
    JOURNAL
}
enum DIPPER_MENU_PRIMARY
{
    ITEM,
    JOURNAL,
    COMLINK
}
m_MENU_PRIMARY = [
    "ITEM",
    global.player.mabel ? "SCRAPBK" : "JOURNAL",
    "COMLINK"
];
enum DIPPER_MENU_ITEM
{
    USE = 0,
    INFO = 1,
    DROP = 2
}
m_menu = DIPPER_MENU.CLOSED;
m_menu_primary = 0;
m_menu_item = 0;
m_menu_itemAction = DIPPER_MENU_ITEM.USE;

if (array_contains([DIRECTION.RIGHT, DIRECTION.UP, DIRECTION.LEFT, DIRECTION.DOWN], global.dir))
{
    dir = global.dir;
}
else
{
    dir = DIRECTION.DOWN;
}
moving = false;
fixCollide = 3; // Unclear why it's 3. Legacy code, man

set_costume = function()
{
    var _name = string_lower(global.player.name);
    if (global.player.mabel)
    {
        if (_name == "waddle") sprite_index = spr_mabdles;
        else if (global.player.df == AT_DF.NONE || global.player.costume == COSTUME.NO_DF) sprite_index = spr_mabel; // TODO: Add Mabel without a sweater
        else if (
            global.player.df == AT_DF.UPGRADE
            && (global.player.costume == COSTUME.DF_UPGRADE || global.player.costume == COSTUME.DEFAULT)
        ) sprite_index = spr_mabel; // TODO: Add the new sweater variant
        else sprite_index = spr_mabel;
    }
    else
    {
        if (_name == "lamby") sprite_index = spr_diplamb;
        else if (global.player.df == AT_DF.NONE || global.player.costume == COSTUME.NO_DF) sprite_index = spr_dipper;
        else if (
            global.player.df == AT_DF.UPGRADE
            && (global.player.costume == COSTUME.DF_UPGRADE || global.player.costume == COSTUME.DEFAULT)
        ) sprite_index = spr_dippaper;
        else if (_name == "mason") sprite_index = spr_dipstar;
        else sprite_index = spr_diphat;
    }
}
set_costume();

m_inventory = [];
m_consumed_item = false;

m_check_move = function(_dir, _distance = 1)
{
    if (keyboard_check(global.DIR_KEYS[_dir]))
    {
        var _move_x = _distance * dir_get_x(_dir);
        var _move_y = _distance * dir_get_y(_dir);
        if (!place_meeting(x + _move_x, y + _move_y, obj_collide))
        {
            x += _move_x;
            y += _move_y;
            image_speed = 1;
        }
        if (dir != _dir && !keyboard_check(global.DIR_KEYS[dir]))
        {
            dir = _dir;
        }
        return true;
    }
    return false;
}
m_toggle_menu = function()
{
    if (m_menu == DIPPER_MENU.CLOSED)
    {
        m_menu = DIPPER_MENU.PRIMARY_SELECT;
        canMove = false;
    }
    else
    {
        m_menu = DIPPER_MENU.CLOSED;
        canMove = true;
    }
    audio_play_sound(sfx_beep, 0, false);
}
