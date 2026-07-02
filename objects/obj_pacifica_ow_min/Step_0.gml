switch stage
{
    case 0:
        if (obj_dipper.x >= x && obj_dipper.canMove)
        {
            my_collision = instance_create_layer(obj_dipper.x - 10, obj_dipper.y - 10, layer, obj_collide);
            with instance_create_layer(160, 192, layer, obj_textbox)
            {
                set_text("I heard...");
                set_sounds(tlk_pacifica);
                set_styles(TEXT_STYLE.WAVE);
            }
            ++stage;
        }
        break;
    case 1:
        if (!instance_exists(obj_textbox))
        {
            instance_create_layer(obj_dipper.x + irandom(10), obj_dipper.y + irandom_range(-5, 5), layer, obj_pacifica_ow_perfume);
            alarm[0] = 120;
            ++stage;
        }
        break;
    case 2:
        if (alarm[0] == -1 && !instance_exists(obj_pacifica_ow_perfume))
        {
            alarm[1] = 180;
            ++stage;
        }
        break;
    case 3:
        if (alarm[1] == -1)
        {
            audio_stop_sound(mus_wind);
            blackout_alpha -= 0.01;
            if (blackout_alpha <= 0)
            {
                blackout_alpha = 0;
                alarm[1] = 120;
                ++stage;
            }
        }
        break;
    case 4:
        if (alarm[1] == -1)
        {
            with instance_create_layer(160, 192, layer, obj_textbox)
            {
                set_text([
                    string_concat("...that ", global.player.mabel ? "s" : "", "he's awfully stingy #with h", global.player.mabel ? "er" : "is", " money."),
                    "Eheheheh...",
                    "Do you really think you're #better than me with THAT #cheap getup?",
                    "I've seen you running through #here like you own the place #or something.",
                    global.player.mabel ? "Even in a potato sack, #I'd look better than you." : "When was the last time you #bathed?&or changed your clothes?",
                    "Try it sometime.&I'm sure you'd love it.",
                    ". . .",
                    "But in the meantime, get this #through your thick skull:",
                    "You own nothing.&You are nothing.",
                    "My family, the @8887A9Northwests@ffffff?&We own this town, #down to the last citizen.",
                    "So don't you dare go acting #like you've got anything on us.",
                    ". . .",
                    "Eheheheh...&I've got an idea.",
                    "If you really think a commoner #like you has any chance at #being my equal,",
                    "or even my rival,",
                    "why don't we put that #to the test?",
                    "Mini golf.&18 holes.&Winner takes all.",
                    "I'll knock you down a few #strokes!"
                ]);
                set_sounds(tlk_pacifica);
                set_styles(TEXT_STYLE.WAVE);
                set_charRates(4, 13, 16);
            }
            ++stage;
        }
        break;
    case 5:
        if (!instance_exists(obj_textbox))
        {
            with instance_create_layer(0, 0, layer, obj_toBattle)
            {
                goto = btl_min_pacifica;
                music = mus_spider;
            }
            ++stage;
        }
        break;
    case 6:
        if (!instance_exists(obj_toBattle))
        {
            if (global.enemy_killed[ENEMY.PACIFICA])
            {
                obj_dipper.canMove = true;
                instance_destroy();
            }
            else
            {
                obj_dipper.dir = DIRECTION.UP;
                obj_dipper.canMove = false;
                with instance_create_layer(160, 192, layer, obj_textbox)
                {
                    set_text(array_concat(
                        [
                            "Huh.&Maybe you aren't so bad #after all.",
                            "You know, I'm actually #impressed.",
                            string_concat("You're the first person #who's ever ", global.player.mabel ? "beaten me at #mini golf" : "made me feel like..", ".")
                        ],
                        global.player.mabel ? [
                            "You must practice a lot, huh?",
                            "So who's your trainer?",
                            ". . .",
                            "Oh, honestly.&No one with your skills just #learned themselves.",
                            "See, my trainer is the all-time #Sportslympics gold-winning #champion, Sergei.",
                            ". . .",
                            "I see.",
                            "Well, maybe we should have a #rematch sometime.&I'll watch more closely."
                        ] : [
                            ". . .",
                            ". . .",
                            "That's... not what I meant!",
                            "I've just never been matched #by a commoner before.",
                            "See, as a @8887A9Northwest@ffffff, #you get the best of everything.",
                            "Best trainers, food, #education... the works.",
                            "But then you're also expected #to BE the best AT everything.",
                            "So it's... kind of nice to #have someone who doesn't see #it that way.",
                            "Someone who just sees me #as a normal girl, #with a normal life.",
                            "Maybe we can hang out again #sometime?"
                        ],
                        [
                            "This time with less... #murderous intent?",
                            "Eheheheh...",
                            "You know, to be honest, #I didn't even intend to come #to this hovel.",
                            "No offense.",
                            "I just found, like, a secret #passageway out of @8887A9Northwest #Manor@ffffff?",
                            "That's what this path is #anyway, I think.",
                            string_concat("But I'm glad I found it.&", global.player.mabel ? "I got one of the best games #I've played out of it." : "After all, I met you."),
                            "Come visit sometime.",
                            "Just make sure my parents #aren't around.",
                            "They can be real nuisances #about the company I keep.",
                            ". . .",
                            "I... should probably be going.",
                            string_concat("Don't forget about ", global.player.mabel ? "our rematch, #alright" : "me, okay", "?")
                        ]
                    ));
                    set_sounds(tlk_pacifica);
                    set_styles(TEXT_STYLE.WAVE);
                }
                ++stage;
            }
        }
        break;
    case 7:
        if (!instance_exists(obj_textbox))
        {
            image_alpha -= global.player.mabel ? 0.02 : 0.01;
            if (image_alpha <= 0)
            {
                obj_dipper.canMove = true;
                instance_destroy();
            }
        }
        break;
}
