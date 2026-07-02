/// @description Wait to fire

if (self.is_any_direction) self.dir = is_reversed ? reverse_dir(obj_dipper.dir) : obj_dipper.dir;

// Note: These values were calculated based on distances to travel within launchTime frames,
// based on the delta_y:
// INT_0^{launchTime} (initial_v + delta_y(x))dx = distance_in_px
// So for horizontal launches, distance_in_px = 0; otherwise, = +- 60 or +- 140
switch self.dir
{
    case 0:
        obj_dipper.hspeed = 1.5; // 60 pixels / 3 tiles
        if (self.short_strong) obj_dipper.hspeed *= 2; // go 6 tiles instead
        else if (self.is_strong) obj_dipper.hspeed *= (7/3); // 140 pixels / 7 tiles
        obj_dipper.vspeed = -4.1; // Not sure why it's not -4, but this seems to work anyway
        break;
    case 1:
        obj_dipper.hspeed = 0;
        if (self.short_strong) obj_dipper.vspeed = -7;
        else if (self.is_strong) obj_dipper.vspeed = -7.5;
        else obj_dipper.vspeed = -5.5;
        break; 
    case 2:
        obj_dipper.hspeed = -1.5;
        if (self.short_strong) obj_dipper.hspeed *= 2;
        else if (self.is_strong) obj_dipper.hspeed *= (7/3);
        obj_dipper.vspeed = -4.1;
        break;
    case 3:
        obj_dipper.hspeed = 0;
        if (self.short_strong) obj_dipper.vspeed = -1;
        else if (self.is_strong) obj_dipper.vspeed = -0.5;
        else obj_dipper.vspeed = -2.5;
        break;
}
obj_dipper.dir = self.dir; // in case we were reversed, set him straight
self.alarm[0] = self.launchTime;
self.alarm[1] = self.turnTime div 2; // offset the turning time

audio_play_sound(sfx_buttSwitch, 0, false);
for (var i = 0; i < array_length(affected_plates); ++i)
{
    affected_plates[i].toggle_active();
}
self.image_index = 1;
