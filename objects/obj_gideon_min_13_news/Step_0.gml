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
            with instance_create_layer(160, 192, layer, obj_textbox)
            {
                set_text([
                    "GOOD MORNING, AMERICA!",
                    "WE START OFF OUR BROADCAST TODAY #WITH SOME BREAKING NEWS!",
                    "PAY CLOSE ATTENTION!&THIS INFORMATION JUST MAY #SAVE YOUR LIFE!",
                    "BUT FIRST, A WORD FROM OUR #SPONSOR:&@99D9EAME@ffffff!",
                    "WE HERE (AND BY \"WE\", OF COURSE, #I MEAN \"I\") HAVE BEEN SERVIN' #Y'ALL FOR WELL OVER A YEAR!",
                    "WHAT A LONG-STANDING LEGACY!",
                    "AND THANKS IN PART TO YOUR #LOVING SUPPORT, I AM PLEASED #TO ANNOUNCE",
                    "THE LATEST IN OUR POPULAR #@99D9EAGIDEONTERTAINMENT@ffffff `(trademarked)` #LINE OF MERCHANDISE:",
                    "THIS ADORABLE, HUGGABLE @99D9EAGIDEON #DOLL@ffffff!",
                    "BUT DON'T JUST TAKE MY WORD #FOR IT!&WE HAVE A SPECIAL GUEST TODAY!",
                    string_concat(
                        "ALRIGHT THEN, ",
                        global.player.mabel ? "MY SWEET" : "FRIEND",
                        "...&CARE TO SHARE A FEW WORDS ABOUT #WIDDLE OL' WIDDLE OL' ME?"
                    ),
                    "It is",
                    ". . .",
                    "OF COURSE!&IT WAS MADE IN MY OWN IMAGE, #AFTER ALL!",
                    "BUT THESE DOLLS HAVE A BONUS #SPECIAL SECRET FEATURE!",
                    "IF YOU NOTICE, THEY CAN IGNITE #EASILY!",
                    "SO JUST LIKE I'M THE IDEAL #COMPANION IN LIFE,",
                    "THESE DOLLS ARE THE IDEAL #COMPANION IN ANY SURVIVAL #SITUATION!",
                    ". . .",
                    "THIS JUST IN: #\"ME\" IS NOT A VALID SPONSOR.",
                    "SO FOR OUR NEXT SEGMENT, #I'LL BE TAKING ON A FEW #SPONSORSHIPS!",
                    "PLEASE @99D9EADON'T SKIP THE ADS@ffffff!&THEY HELP SUPPORT US HERE AT #@99D9EAGIDEONTERTAINMENT@ffffff `(trademarked)`!",
                    ". . .",
                    "UHHH...",
                    "WELL, FOLKS, I'VE JUST RECEIVED #WORD THAT MINES CAN EMIT HIGHLY #FLAMMABLE FUMES,",
                    "SO WE HERE AT @99D9EAGIDEONTERTAINMENT@ffffff #`(trademarked)` CANNOT OFFICIALLY #ENDORSE THEIR USE HERE.",
                    "BUT THIS BRINGS US TO OUR NEXT #SEGMENT!&IT'S TIME FOR:",
                    "GATHER ALL THE FLAMING DOLLS #BEFORE EVERYTHING BLOWS UP #AND KILLS EVERYONE!",
                    string_concat(
                        "READY, ",
                        string_upper(global.player.name),
                        "?"
                    ),
                    "HERE WE GO!"
                ]);
                set_sounds(tlk_gideon);
                set_sound(11, tlk_default);
                set_choices(11, ["indeed#small", "flammable"], [
                    noop,
                    method({target: id}, function() { with target {
                        set_text([
                            "OF COURSE!&THEY ARE ONLY MADE WITH THE #HIGHEST-QUALITY MATERIALS!",
                            "BUT I'M IMPRESSED!&YOU DISCOVERED THEIR BONUS #SPECIAL SECRET FEATURE!"
                        ], page + 2);
                    }})
                ]);
            }
            obj_dipper.dir = 3;
            ++stage;
        }
        break;
    case 3:
        if (instance_exists(obj_textbox))
        {
            with obj_textbox
            {
                other.arm_index = head_frame;
                switch (page)
                {
                    case 8: other.showing_doll = true; break;
                    case 15:
                        other.flaming_doll = true;
                        other.alarm[5] = other.flame_speed;
                        break;
                    case 23: other.face = spr_gideon_tv_face_neutral; break;
                    case 25: other.face = spr_gideon_tv_face_determined; break;
                    case 26: other.face = spr_gideon_tv_face_cheery; break;
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
                dir = 3;
                short_strong = true;
                visible = false;
                alarm[2] = 30;
            }
            global.teleport = true;
            global.gideon = 13;
            ++stage;
        }
        break;
}
