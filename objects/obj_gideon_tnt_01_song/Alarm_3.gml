/// @desc Move !
switch arm_index
{
    case 0:
        if (current_measure < MEASURES_PER_STANZA)
        {
            ++arm_index;
            audio_play_sound(sfx_sans_pound, 0, false);
            self.alarm[3] = beat_time;
        }
        else
        {
            self.arm = spr_gideon_tv_arm_move_retract;
            event_perform(ev_alarm, 0);
        }
        break;
    case 1:
        ++arm_index;
        audio_play_sound(sfx_grass, 0, false);
        self.alarm[3] = beat_time + beat_time;
        break;
    case 2:
        arm_index = 0;
        audio_play_sound(sfx_sans_pound, 0, false);
        self.alarm[3] = beat_time;
        break;
}
