///@desc Room CC: text[0],global.enemy[]
///@desc obj_toBattle: goto
global.stage = [0,0,0,0,-1,0]
//[0]whereWeAre (0battleButtons, 1enemySelect/itemSelect, 2fightTarget/actionSelect/spareRun, 3damageAnimation/textResponse (create text bubble), 4battle, 5transition
//[1]battleButtons 0-3;
//[2]enemyList 0-2;
//[3]itemList 0-7;
//[4]damage/spareRun 0-5/0-1;
//[5]actChoice 0-3

text = ["An error has occurred.&Error code: BTLTX","An error has occurred.&Error code: BTLTX"]//Room CC should cover text[0]
charCount = 0
lv = 0//Set higher if you kill someone important
sb = 0//How many Stan Bucks are earned at the end
goto = room_previous(room)//Should be changed by obj_toBattle
music = silence;//Music to play after battle Ends. Will not play if still noone.
battle = false
run = true;

// TODO: Investigate inventory. Might need to reselect after using item, etc.
inventory = scr_get_inventory();
m_select_item = function(_dir)
{
    var _inventory_size = array_length(inventory);
    if (_inventory_size <= 1)
    {
        global.stage[3] = 0;
        return false;
    }
    var _current_selection = global.stage[3];
    var _is_on_top = (_current_selection % 2) == 0;
    var _check_dir = _is_on_top ? 1 : -1;
    var _page_size = 4;
    if (_dir == DIRECTION.UP || _dir == DIRECTION.DOWN)
    {
        var _straight_index = _current_selection + _check_dir;
        if (_straight_index < _inventory_size)
        {
            audio_play_sound(sfx_beep, 0, false);
            global.stage[3] = _straight_index;
            return true;
        }
        if (_current_selection % _page_size == 2)
        {
            audio_play_sound(sfx_beep, 0, false);
            global.stage[3] = _current_selection - 1;
            return true;
        }
        return false;
    }
    if (_dir == DIRECTION.LEFT)
    {
        if (_current_selection == 0 || _current_selection == 1)
        {
            var _new_index = _inventory_size - 1;
            if (_is_on_top && (_inventory_size % 2) == 0)
            {
                --_new_index;
            }
            if (_new_index >= 0 && _new_index != _current_selection)
            {
                audio_play_sound(sfx_beep, 0, false);
                global.stage[3] = _new_index;
                return true;
            }
            return false;
        }
        audio_play_sound(sfx_beep, 0, false);
        global.stage[3] = _current_selection - 2;
        return true;
    }
    if (_current_selection == _inventory_size - 2 && _current_selection % _page_size == 1)
    {
        audio_play_sound(sfx_beep, 0, false);
        global.stage[3] = _current_selection + 1;
        return true;
    }
    if (_current_selection == _inventory_size - 2 || _current_selection == _inventory_size - 1)
    {
        var _new_index = _current_selection % 2;
        if (_new_index != _current_selection)
        {
            audio_play_sound(sfx_beep, 0, false);
            global.stage[3] = _new_index;
            return true;
        }
        return false;
    }
    audio_play_sound(sfx_beep, 0, false);
    global.stage[3] = _current_selection + 2;
    return true;
}
global.stage[3] = 0;

for(var i = 0; i < 4; i++) with instance_create_layer(33+i*156,431,"Instances",obj_battleButtons) image_index = i;

global.enemy = [];//CC should Create enemies
audio_group_load(Battle)

image_yscale = 2
image_xscale = 2
alarm[0] = 1

/// @desc Sets `global.stage[2]` to the next enemy that matches the direction selected.
/// @param {Enum.DIRECTION} _dir The direction in which to select the enemy
select_enemy = function(_dir = DIRECTION.DOWN)
{
    var _enemy_alive = function(_inst_id) { return instance_exists(_inst_id); };
    var _enemy_count = array_length(global.enemy);
    var _current_selection = global.stage[2];
    var _max_in_col = 3;
    var _has_2_col = _enemy_count > _max_in_col; // useful more for optimization
    if (_has_2_col)
    {
        var _first_col = array_create(_max_in_col);
        var _second_col = array_create(_enemy_count - _max_in_col);
        array_copy(_first_col, 0, global.enemy, 0, _max_in_col);
        array_copy(_second_col, 0, global.enemy, _max_in_col, _enemy_count - _max_in_col);
        var _is_first_col = _current_selection < _max_in_col;
        if (_dir == DIRECTION.LEFT || _dir == DIRECTION.RIGHT)
        {
            var _col_index = _is_first_col ? _current_selection : (_current_selection - _max_in_col);
            var _target_col = _is_first_col ? _second_col : _first_col;
            var _is_backward = _dir == DIRECTION.LEFT;
            var _new_col_index = scr_select_array(_target_col, _enemy_alive, _is_backward, _col_index, true);
            if (instance_exists(_target_col[_new_col_index]))
            {
                audio_play_sound(sfx_beep, 0, false);
                global.stage[2] = _is_first_col ? (_new_col_index + _max_in_col) : _new_col_index;
            }
        }
        else // up/down
        {
            var _col_index = _is_first_col ? _current_selection : (_current_selection - _max_in_col);
            var _target_col = _is_first_col ? _first_col : _second_col;
            var _is_backward = _dir == DIRECTION.UP;
            var _new_col_index = scr_select_array(_target_col, _enemy_alive, _is_backward, _col_index, false);
            if (_new_col_index != _col_index)
            {
                audio_play_sound(sfx_beep, 0, false);
                global.stage[2] = _is_first_col ? _new_col_index : (_new_col_index + _max_in_col);
            }
        }
    }
    else if (_dir == DIRECTION.UP || _dir == DIRECTION.DOWN) // ignore left/right with 1 column
    {
        var _is_backward = _dir == DIRECTION.UP;
        var _new_index = scr_select_array(global.enemy, _enemy_alive, _is_backward, _current_selection, false);
        if (_new_index != _current_selection)
        {
            audio_play_sound(sfx_beep, 0, false);
            global.stage[2] = _new_index;
        }
    }
}
