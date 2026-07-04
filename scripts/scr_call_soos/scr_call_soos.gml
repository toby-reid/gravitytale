function scr_call_soos(_room_or_index)
{
    var _soos_answer = ["Hey, dude!&How's it going?", ". . .", "Oh, you just #wanted a hint...?"];
    var _soos_answer_heads = [spr_soos_face_happy, spr_soos_face_neutral, spr_soos_face_disappoint];
    var _text;
    var _heads = [];
    if (global.enemy_killed[ENEMY.SOOS] || instance_exists(obj_bill_overworld))
    {
        _text = ["(...but there was no answer.)"];
    }
    else
    {
        switch _room_or_index
        {
            case ow_scb_2_start:
            case ow_scb_3_meetSoos:
            case ow_scb_4_puzzle1:
            case ow_scb_5_puzzle2:
            case ow_scb_6_nyarf:
                _text = array_concat(
                    _soos_answer,
                    [
                        "Well, why are you #backtracking, dude?",
                        "You should be moving #forward...&Exploring..."
                    ]
                );
                _heads = array_concat(
                    _soos_answer_heads,
                    [
                        spr_soos_face_content,
                        spr_soos_face_happy_side
                    ]
                );
                break;
            case ow_scb_7_walkTest:
                _text = array_concat(
                    _soos_answer_heads,
                    [
                        "Erm...&How do I put this...",
                        "When I said I wanted you #to stay...",
                        "You were supposed to #follow me to my cabin..."
                    ]
                );
                _heads = array_concat(
                    _soos_answer_heads,
                    [
                        spr_soos_face_contempt,
                        spr_soos_face_neutral_side,
                        spr_soos_face_neutral
                    ]
                );
                break
            case ow_scb_8_puzzle3:
            case ow_scb_9_pz3cal:
                _text = array_concat(
                    _soos_answer_heads,
                    ["There's a calendar to the #north.&Check that out sometime."]
                );
                _heads = array_concat(
                    _soos_answer_heads,
                    [spr_soos_face_happy_closed]
                );
                break;
            case ow_scb_10_puzzle4:
                _text = array_concat(
                    _soos_answer_heads,
                    ["Have you tried reading #signs?&They can give hints..."]
                );
                _heads = array_concat(
                    _soos_answer_heads,
                    [spr_soos_face_happy]
                );
                break;
            case ow_scb_11_blendin:
                if (instance_exists(obj_scb_blendin))
                {
                    _text = array_concat(
                        _soos_answer_heads,
                        [
                            "Hm...&I have no idea who that #guy is, dude...",
                            ". . .",
                            "How do I know there's #someone there?",
                            "What, you can't hear him #rambling to himself?",
                            "Might as well go talk to #him...",
                            "See if he has my #screwdriver while you're #at it."
                        ]
                    );
                    _heads = array_concat(
                        _soos_answer_heads,
                        [
                            spr_soos_face_neutral_side,
                            spr_soos_face_neutral,
                            spr_soos_face_happy_side,
                            spr_soos_face_content,
                            spr_soos_face_happy,
                            spr_soos_face_happy_side
                        ]
                    );
                }
                else
                {
                    _text = [
                        "Whoa, dude...&That was a time #traveller?",
                        "Well, you didn't happen #to ask him if he took my #screwdriver, did you?",
                        ". . .",
                        "Oh well.&You should move on #anyway, dude."
                    ];
                    _heads = [
                        spr_soos_face_surprise,
                        spr_soos_face_happy_side,
                        spr_soos_face_neutral,
                        spr_soos_face_happy
                    ];
                }
                break;
            case ow_scb_12_puzzle5:
                _text = array_concat(
                    _soos_answer,
                    [
                        "Did you read that sign, #dude?",
                        "...Have you considered #vertices?"
                    ]
                );
                _heads = array_concat(
                    _soos_answer_heads,
                    [
                        spr_soos_face_happy,
                        spr_soos_face_happy_side
                    ]
                );
                break;
            case ow_scb_13_puzzle6:
            case ow_scb_14_pz6_l:
            case ow_scb_14_pz6_r:
                _text = array_concat(
                    _soos_answer,
                    [
                        "Did you read that sign, #dude?",
                        "There are 4 rooms to the #east and west..."
                    ]
                );
                _heads = array_concat(
                    _soos_answer_heads,
                    [
                        spr_soos_face_happy,
                        spr_soos_face_happy_side
                    ]
                );
                break;
            case ow_scb_15_puzzle7:
                _text = array_concat(
                    _soos_answer,
                    [
                        "Did you read that sign, #dude?",
                        "There's a common cipher #that fits here...",
                        "Try fitting letters to #numbers."
                    ]
                );
                _heads = array_concat(
                    _soos_answer_heads,
                    [
                        spr_soos_face_happy,
                        spr_soos_face_happy_side,
                        spr_soos_face_content
                    ]
                );
                break;
            case ow_scb_16_soosHome:
            case ow_scb_17_homeMid:
            case ow_scb_18_homeLeft:
            case ow_scb_19_homeRight:
            case ow_scb_20_homeRoom:
            case ow_scb_21_homeBath:
                _text = [
                    "Hey, dude!&Welcome to the island #cabin!",
                    "Why don't you try the #game upstairs?``&If it's there, that is..."
                ];
                _heads = [
                    spr_soos_face_happy,
                    spr_soos_face_happy_side
                ];
                break;
            case ow_scb_22_dock_0:
            case ow_scb_23_dock_1:
            case ow_scb_24_dock_2:
            case ow_scb_25_dock_3:
            case ow_scb_26_dock_4:
            case ow_scb_27_dock:
            case ow_fst_0_boatDock:
                if (!instance_exists(obj_soos_ow_dock) and !instance_exists(obj_soos_ow_27))
                {
                    _text = array_concat(
                        _soos_answer,
                        [
                            ". . .",
                            "Water you buoying?&I'm right here, dude!"
                        ]
                    );
                    _heads = array_concat(
                        _soos_answer_heads,
                        [
                            spr_soos_face_neutral,
                            spr_soos_face_wink
                        ]
                    );
                }
                else
                {
                    _text = [". . .", ". . .", ". . ."];
                    _heads = [
                        spr_soos_face_disappoint_side,
                        spr_soos_face_disappoint,
                        spr_soos_face_disappoint_closed
                    ];
                }
                break;
            case ow_fst_1_meetStans:
                if (instance_exists(obj_stans_ow_1) and obj_dipper.x < 900)
                {
                    _text = array_concat(
                        _soos_answer,
                        [
                            "Well, those are some #creepy trees, dude...",
                            "Just... be careful..."
                        ]
                    );
                    _heads = array_concat(
                        _soos_answer_heads,
                        [
                            spr_soos_face_neutral_side,
                            spr_soos_face_neutral
                        ]
                    );
                }
                else if (instance_exists(obj_stans_ow_1))
                {
                    _text = array_concat(
                        _soos_answer,
                        [
                            "What kind of hint do you #need, dude!?",
                            "You got the amazing #Mr. Pines right in front #of you!",
                            "Take a few moments to #bask in his glory, dude!"
                        ]
                    );
                    _heads = array_concat(
                        _soos_answer_heads,
                        [
                            spr_soos_face_surprise,
                            spr_soos_face_happy,
                            spr_soos_face_happy
                        ]
                    );
                }
                else
                {
                    _text = array_concat(
                        _soos_answer,
                        [
                            "Those are some creepy #trees, dude...",
                            "Don't @ffff00stay still@ffffff or #something is bound to #attack..."
                        ]
                    );
                    _heads = array_concat(
                        _soos_answer_heads,
                        [
                            spr_soos_face_neutral_side,
                            spr_soos_face_disappoint
                        ]
                    );
                }
                break;
            case ow_fst_2_pz1:
                _text = array_concat(
                    _soos_answer,
                    [
                        "This puzzle is even #easier than my first...&You really need help?",
                        "Turn all those triangles #into circles, dude.",
                        "If there's a square, #reset the puzzle using #that lever.",
                        ". . .",
                        "You... know what these #shapes are, right...?"
                    ]
                );
                _heads = array_concat(
                    _soos_answer_heads,
                    [
                        spr_soos_face_happy_side,
                        spr_soos_face_happy_closed,
                        spr_soos_face_happy,
                        spr_soos_face_neutral,
                        spr_soos_face_happy_side
                    ]
                );
                break;
            case ow_fst_5_pz2:
            case ow_fst_6_pz3:
            case ow_fst_8_pz4:
            case ow_fst_9_pz5:
            case ow_fst_10_pz6:
            case ow_fst_11_pz7:
            case ow_fst_13_pz8:
            case ow_fst_14_pz9:
            case ow_fst_15_pz10:
            case ow_fst_16_pz11:
                _text = array_concat(
                    _soos_answer,
                    [
                        "These puzzles are all the #same, dude...",
                        "Turn all the triangles #into circles.",
                        "You don't really need #my help here.",
                        "Or did you just want #to talk to me?"
                    ]
                );
                _heads = array_concat(
                    _soos_answer_heads,
                    [
                        spr_soos_face_disappoint_side,
                        spr_soos_face_neutral,
                        spr_soos_face_neutral_side,
                        spr_soos_face_happy
                    ]
                );
                break;
            case ow_fst_7_stanco:
            case ow_cav_2_standco:
                _text = array_concat(
                    _soos_answer,
                    [
                        "What kind of hint do you #need??",
                        "You got the amazing #Mr. Pines right in front #of you!",
                        "Take a few moments to #bask in his glory, dude!"
                    ]
                );
                _heads = array_concat(
                    _soos_answer_heads,
                    [
                        spr_soos_face_surprise,
                        spr_soos_face_happy,
                        spr_soos_face_happy
                    ]
                );
                break;
            case ow_fst_12_robbie:
                _text = array_concat(
                    _soos_answer,
                    [
                        "Yeah, that's my #coworker's old #boyfriend...",
                        "He acts tough, but he #won't hit someone who #doesn't move...",
                        "He's super obsessed with #my coworker, so maybe get #him talking?"
                    ]
                );
                _heads = array_concat(
                    _soos_answer_heads,
                    [
                        spr_soos_face_disappoint_side,
                        spr_soos_face_happy_closed,
                        spr_soos_face_contempt
                    ]
                );
                break;
            case ow_fst_17_sheriff:
                _text = [
                    "Hey, dude, you're almost #to the town?",
                    "I knew you could make it!",
                    ". . .",
                    "Well, I'm glad you made #it, at least..."
                ];
                _heads = [
                    spr_soos_face_surprise,
                    spr_soos_face_happy,
                    spr_soos_face_neutral,
                    spr_soos_face_happy_side
                ];
                break;
            case ow_fst_18_town_0:
            case ow_fst_18_waterTower:
            case ow_fst_19_town_1:
            case ow_fst_19_determinedNews:
            case ow_fst_19_greasys:
                _text = [
                    "Welcome to Gravity Falls, #dude!",
                    "Take a look around!&There's a lot to do!",
                    "You can visit the Mystery #Shack to the east, too!",
                    "If you talk to Mr. Pines, #he'll probably set you up #with lodging...",
                    "Enemies only get tougher #from here, so please...&Stay in town."
                ];
                _heads = [
                    spr_soos_face_happy,
                    spr_soos_face_happy_side,
                    spr_soos_face_happy,
                    spr_soos_face_happy_side,
                    spr_soos_face_disappoint
                ];
                break;
            case ow_fst_20_town_2:
                _text = [
                    "Welcome to the Mystery #Shack, dude!",
                    "This is where I work, for #the kind, honest Mr. #Stan Pines!",
                    "Take a look inside, dude!&You'll like what you see!"
                ];
                _heads = [
                    spr_soos_face_happy,
                    spr_soos_face_happy_closed,
                    spr_soos_face_happy
                ];
                break;
            default:
                _text = ["(...no answer.&(You must have a bad #connection.)"];
                break;
        }
    }
    with instance_create_layer(160, 192, layer, obj_textbox)
    {
        set_text("Beep, beep... *");
        set_text(_text, 1);
        set_heads(_heads, 1);
    }
    audio_play_sound(sfx_comlink, 0, false);
}
