/// @desc WENDY
// works for 8-10 - causes infighting
if (stage == 0)
{
    m_act_before_check("mention Wendy");
}
else if (clone_number < 8)
{
    obj_battleCore.text[1] = string_concat("The moment you mention Wendy, #", (clone_number == 2) ? "he gets an almost... wistful #look in his eyes?" : "the clones stare you down #until you drop the topic.");
    obj_battleCore.text[0] = global.player.mabel ? "It seems she was the reason #the clones were created.&Touchy subject." : "The clones share your own #motivations, after all.&They just haven't moved on.";
}
else if (stage == 2)
{
    obj_battleCore.text[1] = string_concat("...but ", name, " isn't paying #attention to anything else.");
}
else
{
    obj_battleCore.text[1] = string_concat("As you mention Wendy, #", name, " adopts a look of #determination.");
    stage = 2;
    var _fight_clones = 0;
    with obj_enemy_tnt_clone
    {
        if (stage == 2)
        {
            ++_fight_clones;
        }
    }
    switch _fight_clones
    {
        case 1:
            obj_battleCore.text[0] = string_concat(name, " begins eying up the #other clones, evidently #considering the threats.");
            break;
        case 2:
            obj_battleCore.text[0] = string_concat(name, " is about ready for #an all-out clone fight.");
            break;
        case 3:
            obj_battleCore.text[0] = "The clones begin fighting amongst themselves.&It's a good time to leave.";
            obj_enemy_tnt_clone.spare = true;
            break;
    }
}
