if (instance_exists(obj_dipper))
{
    switch (self.stage)
    {
        case 0:
            if (obj_dipper.canMove)
            {
                if (obj_dipper.x >= 340)
                {
                    obj_dipper.canMove = false;
                    audio_stop_all();
                    with instance_create_layer(100, 200, layer, obj_dontGo)
                    {
                        image_xscale = 2;
                        text = ["OH, C'MON, HON!&Y'ALL DON'T WANNA PARTICIPATE?"];
                        dir = 1;
                    }
                    with instance_create_layer(620, 120, layer, obj_dontGo)
                    {
                        image_yscale = 2;
                        text = ["OH, C'MON, HON!&Y'ALL DON'T WANNA PARTICIPATE?"];
                        dir = 2;
                    }
                    self.alarm[2] = 60;
                    ++self.stage;
                }
            }
            break;
        case 1:
            if (alarm[2] == -1)
            {
                var camera = view_camera[0];
                var currentX = camera_get_view_x(camera);
                if (camera_get_view_target(camera) == obj_dipper)
                {
                    camera_set_view_target(camera, noone);
                }
                else if (currentX < 320)
                {
                    camera_set_view_pos(camera, currentX + 1, 0);
                }
                else
                {
                    camera_set_view_pos(camera, 320, 0);
                    self.alarm[3] = 120;
                    ++self.stage;
                }
            }
            break;
        case 2:
            if (alarm[2] == -1 and alarm[3] == -1)
            {
                alarm[1] = self.alArm_speed;
                ++self.stage;
            }
            break;
        case 3:
            if (alarm[1] == -1)
            {
                with instance_create_layer(160, 192, layer, obj_textbox)
                {
                    text = [
                        "PREVIOUSLY, ON LI'L GIDEON'S #LI'L TOWN:",
                        "(. . .)",
                        "(You hear an exact recording of #your entire conversation with #the TV.)",
                        "OH, WHAT'S THAT?",
                        "DID I JUST HEAR YOUR INNER #MONOLOGUE CALLING THIS AN #ORDINARY TV, HON?",
                        "THAT'S RIGHT, FOLKS!&THIS AIN'T #YOUR MEEMAW'S TV!",
                        "NO, IT'S ALL-NATURAL RECYCLED #MATERIAL, LOCALLY SOURCED FROM #YOUR GRAVITY FALLS CITY DU--",
                        "THIS HERE IS THE LATEST IN HOME #ENTERTAINMENT TECHNOLOGY:",
                        "THE GIDEONTERTAINMENT(tm) #IDEALIZED DEMONSTRATION ENGINE",
                        "WITH OBSERVATIONAL #NANOTECHNOLOGY,",
                        "OR G.I.D.E.O.N. FOR SHORT!",
                        string_concat(
                            "WELL, THEN, MY ",
                            global.player.mabel ? "SWEET" : "FRIEND",
                            ", #LET'S GET ON WITH IT!"
                        ),
                        string_concat(
                            "AS YOU RECALL FROM OUR LAST #ENCOUNTER, Y'ALL AGREED TO #",
                            global.player.mabel ? "BE MY QUEEN" : "GIVE ME YOUR SISTER",
                            "!"
                        ),
                        ". . .",
                        "WHAT, Y'ALL DON'T REMEMBER?",
                        "TOTAL NON-ISSUE, HON!&THAT'S EXACTLY WHY I'M HERE #TODAY!",
                        string_concat(
                            "SEE, I FIGURED Y'ALL WOULD LEAN #MORE INTO THE IDEA IF YOU SAW #JUST HOW I'D TREAT ",
                            global.player.mabel ? "YA" : "'ER",
                            "!"
                        ),
                        string_concat(
                            "SO HERE, WE'RE GOING #TO HAVE A ",
                            global.player.mabel ? "" : "MOCK ",
                            "DATE, #JUST THE TWO OF US!"
                        ),
                        "AND WHAT BETTER DATE THAN TO #MAKE FOOD TOGETHER?",
                        "SO TODAY, WE'RE HERE AT THE #ACTUAL SITE OF THE HIP #RESTAURANT, PAPA'S BUTTERIA,",
                        "TO MAKE THE NATIONAL DISH OF #MY HOMELAND, TEXAS:",
                        "DEEP-FRIED BUTTER SMOTHERED IN #BARBEQUE SAUCE!",
                        "IT'S JUST BURSTING WITH FLAVOR!&YOU'LL LOVE IT!",
                        "THE RECIPE IS SIMPLE:",
                        "FIRST, TAKE SOME BUTTER FROM #THIS COUNTERTOP,",
                        "THEN FRY IT IN THE OIL BEHIND #ME.",
                        "DIP IT IN BIG BOY'S BARBEQUE #SAUCE,",
                        "AND CHOP IT INTO BITE-SIZED #PIECES!", // bite-sized in Texas is just the entire stick of butter
                        "YOU GOT ALL THAT, HON?##       Yes         No",
                        "AHH, I'M SURE YOU'LL DO GREAT!",
                        "SEE WHAT A SUPPORTIVE PARTNER #I CAN BE?",
                        "NOW, LET'S GET TO IT!&GRAB THE FIRST STICK OF BUTTER #TO START!"
                    ];
                    for (var i = 0; i < array_length(text); ++i)
                    {
                        sound[i] = tlk_gideon;
                        choice[i] = 0;
                    }
                    sound[1] = tlk_default;
                    sound[2] = tlk_default;
                    choice[28] = 1;
                }
                audio_play_sound(mus_showtime, 0, true);
                ++self.stage;
            }
            break;
        case 4:
            if (!instance_exists(obj_textbox))
            {
                alarm[2] = 60;
                ++self.stage;
            }
            break;
        case 5:
            if (alarm[2] == -1)
            {
                var camera = view_camera[0];
                var currentX = camera_get_view_x(camera);
                if (currentX > obj_dipper.x - 160)
                {
                    camera_set_view_pos(camera, currentX - 1, 0);
                }
                else
                {
                    camera_set_view_target(camera, obj_dipper);
                    audio_stop_sound(mus_showtime);
                    audio_play_sound(mus_dateStart, 0, true);
                    ++self.stage;
                }
            }
            break;
        case 6:
            if (obj_dipper.canMove)
            {
                var _text = [];
                if (obj_min_cookingDate.correct_count >= 3)
                {
                    _text = global.player.mabel
                        ? [
                            "AND THAT'S IT!&Y'ALL DID WONDERFULLY!",
                            "OF COURSE, THE OUTCOME WAS #NEVER REALLY IN DOUBT!"
                        ] : [
                            "AND THAT'S IT!&Y'ALL DID QUITE WELL!",
                            "I MUST SAY, I'M IMPRESSED!&YOU REALLY SHOWED A TRUE TEXAN SPIRIT THERE!"
                        ];
                }
                else if (obj_min_cookingDate.failed_count >= 10)
                {
                    _text = global.player.mabel
                        ? [
                            "AND THAT'S IT!&LET'S CALL IT A DAY!",
                            "YOU PERFORMED WONDERFULLY UNDER OVERWHELMING PRESSURE!"
                        ] : [
                            "AND THAT'S IT!&...LET'S JUST STOP THIS HERE.",
                            "YOU CERTAINLY KEPT TRYING, #AND THAT CERTAINLY MATTERS!"
                        ];
                }
                if (array_length(_text) != 0)
                {
                    with instance_create_layer(160, 192, layer, obj_textbox)
                    {
                        text = array_concat(
                            _text,
                            global.player.mabel
                                ? [
                                    "WOW, SEE WHAT AN AMAZING JOB WE DO AS A TEAM?",
                                    "CLEARLY, MY SUPPORT IS WHAT ENCOURAGED YOU THROUGH THIS ORDEAL!",
                                    "IN FACT, MIGHT I SAY, YOU LOOK JUST AT HOME IN--"
                                ] : [
                                    "WOW, SEE HOW ENCOURAGING I CAN BE?",
                                    "CLEARLY, I AM THE OPTIMAL PARTNER FOR THE OPTIMAL WOMAN!",
                                    "IN FACT, MAYBE I SHOULD JUST TAKE HER AWAY AND--"
                                ],
                            [
                                ". . .",
                                "THAT'S ALL FOR TODAY, FOLKS!&TUNE IN NEXT TIME!"
                            ]);
                        for (var i = 0; i < array_length(_text); ++i)
                        {
                            sound[i] = tlk_gideon;
                        }
                    }
                    ++self.stage;
                }
            }
            break;
        case 7:
            if (!instance_exists(obj_textbox))
            {
                // TODO: Start the 'move out' animation...
                // For now, we'll just
                instance_destroy();
            }
    }
}
