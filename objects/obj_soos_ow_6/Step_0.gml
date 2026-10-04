switch stage {
    case 0: if instance_exists(obj_dipper) if obj_dipper.x <= 260 {
        obj_dipper.canMove = false
        with instance_create_layer(160,192,"Instances",obj_textbox_old) {
            text = [
                "Alright, dude, if you're #planning on staying alive, #you'll need to learn ",
                "to @FF7F27FIGHT@ffffff.",
                "If possible, always try #to @FF7F27ACT @ffffffon Enemies instead #of attacking.",
                "Sometimes, however, you #can't spare them, in #which case...",
                string_concat(
                    "Here's a @ff7f27",
                    global.player.mabel ? "GRAPPLING HOOK" : "NYARF GUN",
                    "@ffffff ",
                    global.player.mabel ? "from #the gift shop at my work" : "I #found in the trash at work",
                    ".&Use it only as needed."
                ),
                "Then, to defend yourself, #you'll need to know the #basics...",
                "Why don't you try ACTing #on that @993D3DDUMMY @ffffffover there?"
            ]
            if global.player.mabel text[4] = 
            head = [
                spr_soos_face_happy,
                spr_soos_face_happy,
                spr_soos_face_happy_closed,
                spr_soos_face_happy_side,
                spr_soos_face_happy,
                spr_soos_face_happy_side,
                spr_soos_face_happy
            ]
            for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
        }
        global.player.at = AT_DF.BASE;
        stage++
    } break
    case 1:
        if !instance_exists(obj_textbox_old) {
            speed = 1.5
            image_speed = 1
            direction = 180
            sprite_index = spr_soos_l
            if x <= 100 {
                direction = 90
                sprite_index = spr_soos_u
                stage++
            }
        } else if global.player.mabel
            if obj_textbox_old.page == 4 and obj_textbox_old.charCount == 10
                audio_play_sound(sfx_itemGet,0,false)
    break
    case 2: if y <= 40 {
        speed = 0
        image_speed = 0
        image_index = 0
        sprite_index = spr_soos_d
        obj_dipper.canMove = true
        stage++
    } break
    case 3://Increased by obj_scb_dummy
        if !instance_exists(obj_textbox_old) sprite_index = spr_soos_d
        global.soos = 5.5
    break
    case 4:
        if (global.enemy_killed[ENEMY.DUMMY] || global.enemy_spared[ENEMY.DUMMY])
        {
            switch global.dummy
            {
                case DUMMY_STATUS.NONE:
                    with instance_create_layer(160, 192, layer, obj_textbox_old)
                    {
                        text = [
                            "You didn't even try, #did you?",
                            "You just walked in and #Spared the thing.",
                            "I'll let it pass this #time, but be prepared for #real combat in the future.",
                            "Anyway, we should get #going..."
                        ]
                        head = [
                            spr_soos_face_contempt,
                            spr_soos_face_disappoint_side,
                            spr_soos_face_neutral,
                            spr_soos_face_neutral_side
                        ]
                    }
                    break;
                case DUMMY_STATUS.STANS_FIXED:
                    with instance_create_layer(160, 192, layer, obj_textbox_old)
                    {
                        text = [
                            "I... can't believe it...",
                            "You actually fixed my #Wax Stans...",
                            "You know, Mr. Pines was #like a father to me.",
                            "I know he can be crude #at times, but...",
                            ". . .",
                            "I... guess I should #give you something, #huh?",
                            "(Got $10)",
                            "I know it's not much, #but it's about all I...",
                            ". . .",
                            "We should probably get #going."
                        ]
                        head = [
                            spr_soos_face_surprise,
                            spr_soos_face_surprise_side,
                            spr_soos_face_disapsmile_side,
                            spr_soos_face_disapsmile_closed,
                            spr_soos_face_neutral_side,
                            spr_soos_face_neutral_side,
                            -1,
                            spr_soos_face_neutral,
                            spr_soos_face_neutral_side,
                            spr_soos_face_happy
                        ]
                        global.player.money += 10;
                    }
                    break;
                case DUMMY_STATUS.STANS_MELTED:
                    with instance_create_layer(160, 192, layer, obj_textbox)
                    {
                        set_text([
                            ". . .",
                            "...Oh...",
                            "You know, you really got #my hopes up there.",
                            "I thought, for a second, #that I might see his face #again...",
                            ". . .",
                            "It's all right.",
                            "We all make mistakes, #after all.",
                            "We should probably get #going.",
                            "Just...&Don't touch anything else, #okay?"
                        ]);
                        set_heads([
                            spr_soos_face_disappoint,
                            spr_soos_face_disappoint_side,
                            spr_soos_face_disapsmile_side,
                            spr_soos_face_disapsmile_closed,
                            spr_soos_face_disappoint_closed,
                            spr_soos_face_disappoint_side,
                            spr_soos_face_disapsmile_side,
                            spr_soos_face_disapsmile,
                            spr_soos_face_disappoint_side
                        ]);
                        set_charRates(3);
                        set_sounds(tlk_soos);
                    }
                    break;
                case DUMMY_STATUS.STANS_DESTROYED:
                    with instance_create_layer(160, 192, layer, obj_textbox)
                    {
                        set_text([
                            ". . .",
                            ". . .",
                            "(. . .&(Soos looks like he's about #to cry.)"
                        ]);
                        set_heads([
                            spr_soos_face_sad,
                            spr_soos_face_sad_closed
                        ]);
                        set_sounds(tlk_soos, 0, 2);
                    }
                    break;
                case DUMMY_STATUS.MODIFIED_FIXED:
                case DUMMY_STATUS.MODIFIED_MELTED:
                case DUMMY_STATUS.MODIFIED_DESTROYED:
                    with instance_create_layer(160, 192, layer, obj_textbox_old)
                    {
                        text = [
                            "You...",
                            "You ruined my Wax #Stans...",
                            "Why would you do that?",
                            "Did I do something?",
                            ". . .",
                            "That was my only proud #possession, you know...",
                            ". . .",
                            "Well, no use standing #around...",
                            "Let's get going."
                        ]
                        head = [
                            spr_soos_face_surprise,
                            spr_soos_face_surprise_side,
                            spr_soos_face_sad_side,
                            spr_soos_face_sad,
                            spr_soos_face_sad_closed,
                            spr_soos_face_sad,
                            spr_soos_face_sad_closed,
                            spr_soos_face_sad_side,
                            spr_soos_face_neutral
                        ]
                        for(var i = 0; i < array_length(text); i++) charRate[i] = .25
                    }
                    break;
                case DUMMY_STATUS.TALKED_TOO_MUCH:
                    with instance_create_layer(160, 192, layer, obj_textbox_old)
                    {
                        text = [
                            "Hey, uh...",
                            "You all right there, #dude?",
                            "You seem to be, uh...",
                            ". . .",
                            "...attached to inanimate #objects.",
                            "I mean, I'm not gonna #judge...",
                            "He is a great man, #after all.",
                            "Just, after your accident #and all, I wanna make #sure...",
                            ". . .",
                            "You're ok?",
                            "Alright then, let's get #going..."
                        ]
                        head = [
                            spr_soos_face_neutral_side,
                            spr_soos_face_neutral,
                            spr_soos_face_neutral_side,
                            spr_soos_face_contempt,
                            spr_soos_face_neutral,
                            spr_soos_face_surprise,
                            spr_soos_face_happy_closed,
                            spr_soos_face_neutral_side,
                            spr_soos_face_neutral,
                            spr_soos_face_happy,
                            spr_soos_face_happy_side
                        ]
                        charRate[3] = .2
                        charRate[7] = .2
                    }
                    break;
            }
            with obj_textbox_old for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
            stage++
        }
        break;
    case 5: if !instance_exists(obj_textbox_old) {
        direction = 90
        speed = 1
        image_speed = 1
        sprite_index = spr_soos_u
        if y <= 20 {
            speed = 0
            image_speed = 0
            image_alpha -= .1
            if image_alpha == 0 {
                audio_play_sound(mus_ruins,0,true)
                global.soos = 6
                instance_destroy()
                obj_dipper.canMove = true
            }
        }
    } else obj_dipper.canMove = false break
}