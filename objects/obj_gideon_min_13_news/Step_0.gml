switch self.stage
{
    case 0:
        if (instance_exists(obj_dipper) && obj_dipper.x >= 196)
        {
            obj_dipper.canMove = false;
            alarm[2] = self.emerge_speed;
            audio_group_stop_all(Music);
            ++stage;
        }
        break;
    case 1:
        if (alarm[2] == -1 && alarm[4] == -1)
        {
            self.drawy = 0;
            alarm[3] = 120;
            audio_play_sound(sfx_rocket, 0, true);
            ++stage;
        }
        break;
    case 2:
        if (alarm[1] == -1 && alarm[3] == -1)
        {
            self.arm = spr_gideon_tv_arm_talk;
            audio_play_sound(mus_newsreport, 0, true);
            with instance_create_layer(160, 192, layer, obj_textbox_old)
            {
                text = [
                    "GOOD MORNING, AMERICA!",
                    "WE START OFF OUR BROADCAST TODAY #WITH SOME BREAKING NEWS!",
                    "PAY CLOSE ATTENTION!&THIS INFORMATION JUST MAY #SAVE YOUR LIFE!",
                    "BUT FIRST, A WORD FROM OUR #SPONSOR:&ME!",
                    "WE HERE (AND BY \"WE\", OF COURSE, #I MEAN \"I\") HAVE BEEN SERVIN' #Y'ALL FOR WELL OVER A YEAR!",
                    "WHAT A LONG-STANDING LEGACY!",
                    "AND THANKS IN PART TO YOUR #LOVING SUPPORT, I AM PLEASED #TO ANNOUNCE",
                    "THE LATEST IN OUR POPULAR #GIDEONTERTAINMENT `(trademarked)` #LINE OF MERCHANDISE:",
                    "THIS ADORABLE, HUGGABLE GIDEON #DOLL!",
                    "BUT DON'T JUST TAKE MY WORD #FOR IT!&WE HAVE A SPECIAL GUEST TODAY!",
                    string_concat(
                        "ALRIGHT THEN, ",
                        global.player.mabel ? "MY SWEET" : "FRIEND",
                        "...&CARE TO SHARE A FEW WORDS ABOUT #WIDDLE OL' WIDDLE OL' ME?"
                    ),
                    "       It is#       indeed      It looks#       little      flammable",
                    ". . .",
                    "OF COURSE!&IT WAS MADE IN MY OWN IMAGE, #AFTER ALL!",
                    "BUT THESE DOLLS HAVE A BONUS #SPECIAL SECRET FEATURE!",
                    "IF YOU NOTICE, THEY CAN IGNITE #EASILY!",
                    "SO JUST LIKE I'M THE IDEAL #COMPANION IN LIFE,",
                    "THESE DOLLS ARE THE IDEAL #COMPANION IN ANY SURVIVAL #SITUATION!",
                    ". . .",
                    "UHHH...",
                    "WELL, FOLKS, I'VE JUST RECEIVED #WORD THAT MINES CAN EMIT HIGHLY #FLAMMABLE FUMES,",
                    "SO WE HERE AT GIDEONTERTAINMENT #`(trademarked)` CANNOT OFFICIALLY #ENDORSE THEIR USE HERE.",
                    "BUT THIS BRINGS US TO OUR NEXT #SEGMENT!&IT'S TIME FOR:",
                    "GATHER ALL THE FLAMING DOLLS #BEFORE EVERYTHING BLOWS UP #AND KILLS EVERYONE!",
                    string_concat(
                        "READY, ",
                        string_upper(global.player.name),
                        "?"
                    ),
                    "HERE WE GO!"
                ];
                for (var i = 0; i < array_length(text); ++i)
                {
                    sound[i] = tlk_gideon;
                }
                sound[11] = tlk_default;
                choice[11] = 1;
            }
            obj_dipper.dir = 3;
            ++stage;
        }
        break;
    case 3:
        if (instance_exists(obj_textbox_old))
        {
            self.arm_index = obj_textbox_old.face;
            with obj_textbox
            {
                switch (page)
                {
                    case 8: other.showing_doll = true; break;
                    case 11: charCount = string_length(text[page]); break;
                    case 12:
                        if (action[11] == 1)
                        {
                            text[13] = "OF COURSE!&THEY ARE ONLY MADE WITH THE #HIGHEST-QUALITY MATERIALS!";
                            text[14] = "BUT I'M IMPRESSED!&YOU DISCOVERED THEIR BONUS #SPECIAL SECRET FEATURE!";
                            action[11] = 0; // just to avoid doing this again
                        }
                        break;
                    case 15:
                        other.flaming_doll = true;
                        other.alarm[5] = other.flame_speed;
                        break;
                    case 19: other.face = spr_gideon_tv_face_neutral; break;
                    case 21: other.face = spr_gideon_tv_face_determined; break;
                    case 22: other.face = spr_gideon_tv_face_cheery; break;
                }
            }
        }
        else
        {
            self.arm_index = 0;
            self.arm = spr_gideon_tv_arm_talk_retract;
            self.alarm[0] = self.alArm_speed;
            ++stage;
        }
        break;
    case 4:
        if (alarm[0] == -1)
        {
            self.arm = spr_gideon_tv_arm_point_retract;
            self.alarm[1] = self.alArm_speed;
            ++stage;
        }
        break;
    case 5:
        if (alarm[1] == -1)
        {
            self.arm = spr_gideon_tv_arm_point;
            self.alarm[4] = 60;
            ++stage;
        }
        break;
    case 6:
        if (alarm[4] == -1)
        {
            audio_group_stop_all(Music);
            audio_play_sound(sfx_beep, 0, false);
            alarm[4] = 120;
            ++stage;
        }
        break;
    case 7:
        if (alarm[4] == -1)
        {
            with instance_create_layer(obj_dipper.x - 10, obj_dipper.y, layer, obj_min_faithPlate)
            {
                dir = 0;
                is_strong = true;
                is_active = true;
                alarm[2] = 30;
            }
            global.gideon = 13;
            ++stage;
        }
        break;
}
