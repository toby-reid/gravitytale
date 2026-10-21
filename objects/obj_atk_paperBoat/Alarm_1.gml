/// @desc Descend into the pit
var _travel_time = 60;
dummy_hspeed = (x - dummy_x) / _travel_time;
// 0 = (acceleration * _travel_time^2) + (initial_v * _travel_time) + initial_y
// initial_v = (-(acceleration * _travel_time^2) - initial_y) / _travel_time
dummy_vspeed = ((y - dummy_y) - (0.5 * dummy_gravity * _travel_time * _travel_time)) / _travel_time;
