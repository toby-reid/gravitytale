function scr_name_matches()
{
    var _name = string_lower(global.player.name);
    var _compare = global.player.mabel ? "mabel" : "dipper"
    return _name == _compare;
}
