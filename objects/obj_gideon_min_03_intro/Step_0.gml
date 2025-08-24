if (instance_exists(obj_dipper))
{
    switch (self.stage)
    {
        case 0:
            if (obj_dipper.canMove)
            {
                if (obj_dipper.x >= 80)
                {
                    obj_dipper.canMove = false;
                    audio_stop_all();
                    self.vspeed = 0.5;
                    // ... float down using an umbrella
                    // Start to say something, note how dark it is, and call obj_min_roomBrightener.make_bright()
                    // ... say how the game works (love confession comes later)
                    // ... push self out of the room
                }
            }
            else if (self.y >= 100)
            {
                self.vspeed = 0;
                self.y = 100;
                self.alarm[0] = self.alArm_speed;
                self.stage++;
            }
        break;
        case 1:
            if (self.alarm[0] == -1)
            {
                self.arm = spr_gideon_tv_arm_talk;
                self.alarm[1] = self.alArm_speed;
                self.stage++;
            }
        break;
        case 2:
            if (self.alarm[1] == -1)
            {
                audio_sound_pitch(mus_gameshow_tv, 0.8);
                audio_play_sound(mus_gameshow_tv, 0, true);
                with instance_create_layer(160, 192, self.layer, obj_textbox)
                {
                    text = [
                        "HELLO, AMERICA!&. . .",
                        ". . .",
                        "NOW, HOLD ON, HON...&THIS IS TOO DARK, ISN'T IT?&CAN WE LIGHT THIS UP?",
                        ". . .",
                        "I DIDN'T ASK HOW BIG THE ROOM #WAS, HON.&LET'S LIGHT 'ER UP!"
                    ];
                }
                self.stage++;
            }
        break;
        case 3:
            if (!instance_exists(obj_textbox))
            {
                self.alarm[2] = 60;
                self.stage++;
            }
            else
            {
                self.arm_index = obj_textbox.face;
                self.face = (obj_textbox.page == 0) ? spr_gideon_tv_face_cheery : spr_gideon_tv_face_neutral;
            }
        case 4:
            if (self.alarm[2] == -1)
            {
                // The lights just turned on
            }
    }
}
