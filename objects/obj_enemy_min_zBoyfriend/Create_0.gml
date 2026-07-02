name = global.player.mabel ? "Norman" : "Zombie";
act = ["Check", "Jam", "Jam", "Jamb"];
check = "Something's off about this one.&We can't Act the same way.";
spare = false;
run = false;
hp = 25; // will change to Gnomes when they attack
maxhp = hp;
at = 6; // will change to Gnomes when they attack
lv = false;//set true if killing person increases LV
sb = 0;
area = AREA.MINES;
timer = 0;
deathx = 0;

blood = false;
door = false;
revealed = false;

image_xscale = 2;
image_yscale = 2;
alarm[11] = irandom_range(30, 120);

obj_battleCore.text[0] = global.player.mabel ? "It's... a teenager?&A little moody, but attractive.&Lesser folk might think zombie." : "Just another generic zombie.&We've encountered these before.";
global.enemy = [id];

m_create_gnomes = function()
{
    var _gnome_positions = [
        [x, y - 120, -1],
        [x - 20, y - 60, 0],
        [x + 40, y - 60, 0],
        [x - 20, y, 1],
        [x + 40, y, 2]
    ];
    var _gnome_count = array_length(_gnome_positions);
    var _gnomes = array_create(_gnome_count);
    for (var i = 0; i < _gnome_count; ++i)
    {
        var _gnome_position = _gnome_positions[i];
        with instance_create_layer(_gnome_position[0], _gnome_position[1], layer, obj_enemy_min_gnome)
        {
            _gnomes[i] = id;
            var _stacked_gnome = _gnome_position[2];
            stacked_gnome = (_stacked_gnome < 0) ? noone : _gnomes[_stacked_gnome];
        }
    }
    global.enemy = _gnomes;
}
