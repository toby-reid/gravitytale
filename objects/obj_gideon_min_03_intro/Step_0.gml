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
                    self.hspeed = 0.5;
                    self.vspeed = 0.25;
                }
            }
            else if (self.y >= 90)
            {
                self.vspeed = 0;
                self.hspeed = 0;
                self.y = 90;
                self.arm = spr_gideon_tv_armbrella_retract;
                self.alarm[0] = 10 * self.alArm_speed;
                self.stage++;
            }
            else
            {
                if (self.x < self.xstart)
                {
                    self.hspeed += 0.02;
                }
                else if (self.x > self.xstart)
                {
                    self.hspeed -= 0.02;
                }
            }
        break;
        case 1:
            if (self.alarm[0] == -1)
            {
                self.arm = spr_gideon_tv_arm_talk_retract;
                self.alarm[1] = 10 * self.alArm_speed;
                self.stage++;
            }
        break;
        case 2:
            if (self.alarm[1] == -1)
            {
                self.arm = spr_gideon_tv_arm_talk;
                audio_sound_pitch(mus_gameshow_tv, 0.8);
                audio_play_sound(mus_gameshow_tv, 0, true);
                with instance_create_layer(160, 192, self.layer, obj_textbox_old)
                {
                    text = [
                        "HELLO, AMERICA!",
                        "THIS IS LI'L GIDEON, #BROADCASTING FROM THE...&THE...",
                        ". . .",
                        "NOW, HOLD ON, HON...&THIS IS TOO DARK, ISN'T IT?",
                        "CAN WE GET SOME LIGHTING #IN HERE?",
                        ". . .",
                        "I DIDN'T ASK HOW BIG THE ROOM #WAS, HON.&LET'S LIGHT 'ER UP!"
                    ];
                    for (var i = 0; i < array_length(text); ++i)
                    {
                        sound[i] = tlk_gideon;
                    }
                }
                self.stage++;
            }
        break;
        case 3:
            if (!instance_exists(obj_textbox_old))
            {
                self.alarm[2] = 180;
                self.arm_index = 0;
                self.image_speed = 0;
                audio_stop_all();
                self.stage++;
            }
            else
            {
                self.arm_index = obj_textbox_old.face;
                self.face = (obj_textbox_old.page <= 1) ? spr_gideon_tv_face_cheery : spr_gideon_tv_face_neutral;
            }
        break;
        case 4:
            if (self.alarm[2] == -1 and self.alarm[3] == -1)
            {
                with instance_create_layer(160, 192, layer, obj_textbox_old)
                {
                    text = [
                        "ISN'T THIS MUCH BETTER?&NOW Y'ALL CAN SEE MY #ADOWABLE FACE!",
                        "ALRIGHT, LET'S TRY THIS AGAIN!",
                        "HELLO, AMERICA!",
                        "THIS IS LI'L GIDEON, #BROADCASTING FROM THE DEPTHS #OF THESE HERE ",
                        "ABANDONED MINES #OF GRAVITY FALLS!",
                        "IT TRULY IS SUCH A GIFT #TO BE WITH Y'ALL TODAY!&SUCH A GIFT!",
                        "NOW, TODAY WE HAVE A TREAT #FOR YOU!",
                        "THIS " + (global.player.mabel ? "DARLING BEAUTY" : "HANDSOME ROGUE") + " HAPPENED #ACROSS OUR STUDIOS!&WHAT A COINCIDENCE!",
                        "LET'S FIND OUT A LITTLE MORE #ABOUT THIS MYSTERIOUS STRANGER!",
                        string_concat(
                            "WHAT'S YOUR NAME, ",
                            global.player.mabel ? "SUGAR" : "PARTNER",
                            "?#",
                            string_repeat(" ", 19),
                            "(Say#       ",
                            global.player.name,
                            string_repeat(" ", 12 - string_length(global.player.name)),
                            "nothing)"
                        ),
                        ". . .",
                        "CHECK OUT THIS " + (global.player.mabel ? "SILENT BEAUTY, #" : "COOL-HEADED #STOIC, ") + "FOLKS!",
                        (global.player.mabel ? "S" : "") + "HE'S NOT LETTING ANYTHING #DISTRACT H" + (global.player.mabel ? "ER" : "IM") + "!",
                        "WELL, THEN, WHAT BRINGS YOU #TO GRAVITY FALLS?#       " + (global.player.mabel ? "Brother" : "Sister ") + "     You",
                        ". . .&Ah, I see.",
                        "I'm sorry to hear that, #" + (global.player.mabel ? "sweetie" : "partner") + ".",
                        ". . .",
                        "BUT JUST LOOK AT THE #DETERMINATION ON THIS ONE, #FOLKS!",
                        "SUCH UNBELIEVABLE RESOLVE!&SUCH INCREDIBLE GRIT!",
                        global.player.mabel
                            ? "SHE TRULY IS THE PERFECT #WOMAN, ISN'T SHE, FOLKS?"
                            : "HIS HEART IS MATCHED ONLY BY #MY OWN!",
                        global.player.mabel
                            ? ". . .&The perfect woman..."
                            : ". . .&Just like my darling...",
                        ". . .",
                        "BUT IT LOOKS LIKE WE'RE #OUT OF TIME FOR TODAY, FOLKS!",
                        "LET'S ALL BID THIS " + (global.player.mabel ? "BEAUTY" : "FELLA") + " A #FOND FAREWELL!",
                        "WE'LL MEET AGAIN, " + (global.player.mabel ? "SWEETCAKES" : "PARTNER") + "!&DON'T DIE OUT THERE!"
                    ];
                    for (var i = 0; i < array_length(text); ++i)
                    {
                        sound[i] = tlk_gideon;
                        choice[i] = 0;
                    }
                    choice[9] = 1;
                    choice[13] = 1;
                    changed_9 = false;
                    changed_13 = false;
                }
                self.image_speed = 1;
                audio_play_sound(mus_showtime, 0, true);
                ++self.stage;
            }
        break;
        case 5:
            if (instance_exists(obj_textbox_old))
            {
                self.arm_index = obj_textbox_old.face;
                if (obj_textbox_old.text[obj_textbox_old.page] != ". . .")
                {
                    self.face = (string_upper(obj_textbox_old.text[obj_textbox_old.page]) == obj_textbox_old.text[obj_textbox_old.page])
                        ? spr_gideon_tv_face_cheery
                        : spr_gideon_tv_face_neutral;
                }
                with obj_textbox
                {
                    if (not changed_9)
                    {
                        if (page == 9)
                        {
                            if (charCount >= 26) charCount = string_length(text[page]);
                        }
                        else if (page >= 10)
                        {
                            if (action[9] == 0)
                            {
                                text[10] = string_concat(
                                    global.player.name,
                                    ", hm?&",
                                    (
                                        (global.player.mabel and string_lower(global.player.name) == "mabel")
                                        or (not global.player.mabel and string_lower(global.player.name) == "dipper")
                                    ) ? "That... makes sense somehow." : "Seems odd to me, but I reckon #you know it better."
                                );
                                text[11] = "WELL, CHECK OUT THIS BOLD #" + (global.player.mabel ? "BEAUTY" : "ADVENTURER") + ", FOLKS!";
                                text[12] = (global.player.mabel ? "S" : "") + "HE'S NOT AFRAID TO PROCLAIM IT #TO THE WORLD!";
                            }
                            changed_9 = true;
                        }
                    }
                    else if (not changed_13)
                    {
                        if (page == 13)
                        {
                            if (charCount >= 46) charCount = string_length(text[page]);
                        }
                        else if (page >= 14)
                        {
                            if (action[13] == 1)
                            {
                                text[14] = ". . .";
                                text[15] = ". . .";
                                if (global.player.mabel)
                                {
                                    text[16] = "Well, I...&I'm honored, sugar!";
                                    text[17] = "BEAUTY @ffff00AND@ffffff BRAINS, FOLKS!&SHE'S THE TOTAL PACKAGE!";
                                    text[18] = "OF COURSE SHE'D GO FOR #WIDDLE OL' ME!";
                                    text[19] = "SHE KNOWS TO LOOK PAST MY #ADORABLE LOOKS TO THE REAL STUD BENEATH!";
                                }
                                else
                                {
                                    text[16] = "Well, that's no surprise.";
                                    text[17] = "THAT'S RIGHT, FOLKS!&THIS BOY CAME CLEAR FROM #CALIFORNIA";
                                    text[18] = "JUST TO GET A GLIMPSE AT #WIDDLE OL' ME!";
                                    text[19] = "HE CERTAINLY KNOWS A STAR #WHEN HE SEES ONE!";
                                }
                            }
                            changed_13 = true;
                        }
                    }
                }
            }
            else
            {
                self.arm = spr_gideon_tv_arm_talk_retract;
                self.arm_index = 0;
                self.alarm[0] = 10 * self.alArm_speed;
                ++self.stage;
            }
        break;
        case 6:
            if (self.alarm[0] == -1)
            {
                self.arm = spr_gideon_tv_arm_move_retract;
                self.alarm[1] = 10 * self.alArm_speed;
                ++self.stage;
            }
        break;
        case 7:
            if (self.alarm[1] == -1)
            {
                self.arm = spr_gideon_tv_arm_move;
                self.alarm[4] = 60;
                self.xstart = self.x;
                ++self.stage;
            }
        break;
        case 8:
            if (self.alarm[4] == -1)
            {
                if (self.x >= room_width + 60)
                {
                    obj_dipper.canMove = true;
                    audio_stop_sound(mus_showtime);
                    audio_sound_gain(mus_showtime, 1);
                    audio_play_sound(mus_wind, 0, true);
                    instance_destroy();
                }
                else if (self.hspeed > 0.2)
                {
                    self.hspeed -= 0.1;
                }
                else
                {
                    self.hspeed = 0;
                    self.alarm[4] = 60;
                }
                audio_sound_gain(mus_showtime, 1 - ((self.x - self.xstart) / (room_width + 40 - self.xstart)));
            }
        break;
    }
}
