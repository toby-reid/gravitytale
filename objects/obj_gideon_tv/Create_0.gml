self.face = spr_gideon_tv_face_cheery;
self.arm = spr_gideon_tv_arm_talk;
self.arm_index = 0;
self.alArm_speed = 5; // How quickly the arm retracts/grows (set as alarm value)

function m_arm(_alarm_index, _start_now)
{
    if (_start_now)
    {
        event_perform(ev_alarm, _alarm_index);
    }
    else
    {
        alarm[_alarm_index] = alArm_speed;
    }
}
function retract_arm(_start_now = false) { m_arm(0, _start_now); }
function grow_arm(_start_now = false) { m_arm(1, _start_now); }
