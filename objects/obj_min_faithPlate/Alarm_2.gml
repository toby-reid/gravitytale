/// @description Wait to fire

if (self.is_any_direction) self.dir = obj_dipper.dir;

// Note: These values were calculated based on distances to travel within 40 frames.
switch self.dir
{
    case 0:
        obj_dipper.hspeed = 1;
        if (self.is_strong) obj_dipper.hspeed *= 3;
        obj_dipper.vspeed = -4;
        break;
    case 1:
        obj_dipper.hspeed = 0;
        obj_dipper.vspeed = (self.is_strong) ? -7 : -5;
        break; 
    case 2:
        obj_dipper.hspeed = -1;
        if (self.is_strong) obj_dipper.hspeed *= 3;
        obj_dipper.vspeed = -4;
        break;
    case 3:
        obj_dipper.hspeed = 0;
        obj_dipper.vspeed = (self.is_strong) ? -1 : -3;
        break;
}
self.alarm[0] = self.launchTime;
self.alarm[1] = floor(self.turnTime / 2); // offset the turning time

audio_play_sound(sfx_buttSwitch, 0, false);
self.image_index = 1;
