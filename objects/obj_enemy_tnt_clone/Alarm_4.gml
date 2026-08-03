/// @desc Text bubble
bubble = instance_create_layer(x + 40, y - 40, layer, obj_textBubble);
if (clone_number == 2)
{
    bubble.image_index = 1;
    if (spare)
    {
        bubble.set_text([
            "You're just wasting time here with me.",
            string_concat("Go find h", global.player.mabel ? "im" : "er", ", quickly!")
        ]);
    }
    else if (action == 0)
    {
        switch (stage)
        {
            case 1:
                bubble.set_text(
                    global.player.mabel ? [
                        "It's...&It's you.",
                        "What are you doing here?",
                        "This place is too dangerous.",
                        "You need to go back home."
                    ] : [
                        "It's... \nme?",
                        "No, your head is too big...",
                        "...isn't it?",
                        "Something's not quite right here.",
                        "Hold on while I figure this out."
                    ]
                );
                break;
            case 2:
                bubble.set_text(
                    global.player.mabel ? [
                        "You know I'm not your brother, right?",
                        "I know...\nI'm sorry.",
                        "He made us, though.",
                        "All @888800ten #@@of us.",
                        "I'm the first.\nCall me #Tyrone."
                    ] : [
                        "Look, I know I'm not the original.",
                        "That creep who's 90% hair made us to replace you, actually.",
                        "All @888800ten #@@of us.",
                        "I'm the first, but \"Number 2\" seems a little mundane.",
                        "You know the name we've always wanted?"
                    ]
                );
                name = "Tyrone";
                break;
            default:
                bubble.set_text(
                    global.player.mabel ? [
                        "If you don't plan on turning back, I should at least let you know:",
                        "Your real brother and I are basically the same, but some later copies had... defects.",
                        "And I don't even mean the paper jam.\nI still have nightmares from that one.",
                        "Nah, as the copier got warmer, I think the ink smeared or something.",
                        "Either way, you should be careful of the others.",
                        "Oh, but it's probably cooled off by now.",
                        "So this machine here should be fine to use.",
                        "Just don't go too far away from your clone.\nThey're pretty fragile, after all.",
                        "Oh, and if you get attacked, I'd recommend fighting for her.",
                        "I'll go ahead and check the other machines for you.",
                        "If you don't see me again, don't bother looking.",
                        "Find the original.\nThat's your top priority right now."
                    ] : [
                        "You and I are not so different.",
                        "...but that's because the creep hadn't started messing with toner settings yet.",
                        "Some of the later copies had... defects.",
                        "And I don't even mean the paper jam.\nI still have nightmares from that one.",
                        "No, it seems the kid was trying to make a more supportive \"you\".",
                        "Either way, you should be careful of the others.",
                        "Oh, but I've already reconfigured this one.",
                        "So this machine here should be fine to use.",
                        "Just don't go too far away from your clone.\nThey're pretty fragile, after all.",
                        "Oh, and if you get attacked, I'd recommend fighting for him.",
                        "I'll go ahead and fix the other machines for you.",
                        "If you don't see me again, don't bother looking.",
                        "Find her, quickly.\nThat's your top priority right now."
                    ]
                );
                spare = true;
                break;
        }
    }
    else if (action > 0)
    {
        bubble.set_text(
            global.player.mabel ? choose(
                "You really gotta get away from that creep",
                "Don't date the zombie"
                // TODO: Get more quotes for Tyrone to Mabel
            ) : choose(
                "Stop copying me !",
                "Sorry, you first",
                "I know the plan, buddy.",
                "Please, this is you we're talking about",
                "Don't mess this up for us"
            )
        );
    }
    else if (global.player.genocide == RUN.ACTIVE)
    {
        bubble.set_text(string_concat("This track won't bring h", global.player.mabel ? "im" : "er", " back, you know."));
    }
    else
    {
        bubble.set_text("It'll all turn out okay, I'm sure of it.");
    }
}
else if (clone_number <= 4)
{
    bubble.set_text(choose(
        "We just wanna get out of here",
        "I'm more of the surviving type",
        "You learned to ride a bike?",
        "What happened with Robbie, anyway?"
    ));
}
else if (clone_number <= 7)
{
    bubble.set_text(choose(
        "You know, I'm something of an artist myself",
        "You ever try origami?",
        "I like poker, but I'm not very good",
        "You play Dungeons, Dungeons, and More Dungeons?",
        "I paint my own models"
    ));
}
else
{
    bubble.set_text(choose(
        "I can't go out like this",
        "I gotta experience something before I melt",
        "She was kinda hot, wasn't she?",
        string_concat(global.enemy_killed[ENEMY.ROBBIE] ? "Glad Robbie's" : "Gotta get Robbie", " out of the way"),
        "Hey, look!\nA glowing dot!",
        global.enemy_killed[ENEMY.SOOS] ? "Poor Soos, man" : "How's Soos doing?"
    ));
}
bubble.set_sounds(tlk_default); // don't use Dipper's sound clips except for the real deal
