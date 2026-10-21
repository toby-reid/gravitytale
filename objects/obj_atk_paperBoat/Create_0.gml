event_inherited();
rocking_left = irandom(1) == 0;

var _bbox_left = obj_battleBox.x - obj_battleBox.sprite_xoffset;
var _bbox_top = obj_battleBox.y - obj_battleBox.sprite_yoffset;
battlebox_left = _bbox_left + 5;
battlebox_top = _bbox_top + 5;
battlebox_right = _bbox_left + obj_battleBox.sprite_width - 5;
battlebox_bottom = _bbox_top + obj_battleBox.sprite_height - 5;

yscale_mult = 0;
dummy_exists = true;
dummy_x = x;
dummy_y = y;
dummy_hspeed = 0;
dummy_vspeed = 0;
dummy_gravity = 0.3;
x = irandom_range(battlebox_left + 20, battlebox_right - 20);
y = battlebox_bottom - 20;
