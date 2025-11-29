/// @description Wait to fire

if (self.is_any_direction) self.dir = obj_dipper.dir;

// Note: These values were calculated based on distances to travel within launchTime frames,
// based on the delta_y:
// INT_0^{launchTime} (initial_v + delta_y(x))dx = distance_in_px
// So for horizontal launches, distance_in_px = 0; otherwise, = +- 60 or +- 140
switch self.dir
{
    case 0:
        obj_dipper.hspeed = 1.5; // 60 pixels / 3 tiles
        if (self.is_strong) obj_dipper.hspeed *= (7/3); // 140 pixels / 7 tiles
        obj_dipper.vspeed = -4.1; // Not sure why it's not -4, but this seems to work anyway
        break;
    case 1:
        obj_dipper.hspeed = 0;
        obj_dipper.vspeed = (self.is_strong) ? -7.5 : -5.5;
        break; 
    case 2:
        obj_dipper.hspeed = -1.5;
        if (self.is_strong) obj_dipper.hspeed *= (7/3);
        obj_dipper.vspeed = -4.1;
        break;
    case 3:
        obj_dipper.hspeed = 0;
        obj_dipper.vspeed = (self.is_strong) ? -0.5 : -2.5;
        break;
}
self.alarm[0] = self.launchTime;
self.alarm[1] = floor(self.turnTime / 2); // offset the turning time

audio_play_sound(sfx_buttSwitch, 0, false);
self.image_index = 1;
