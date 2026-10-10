/// @desc Roast
if (global.dummy == DUMMY_STATUS.TALKED_TOO_MUCH)
{
    m_dummy_talk();
}
else if (stage == GROUCHO_STAGE.NONE)
{
    obj_battleCore.text[1] = string_concat("As you step forward, #", name, " delivers #the greatest roast you've heard.");
    obj_battleCore.text[0] = "You can't stop crying.&It wasn't even about you.";
}
else if (scr_has_enum_flag(stage, GROUCHO_STAGE.ROAST))
{
    obj_battleCore.text[1] = "What, are you going to go #slaughter another cow?&Be reasonable.";
}
else
{
    obj_battleCore.text[1] = "You dish out a roast with #expert delivery.&It seems to land well.";
    obj_battleCore.text[0] = "He appreciates the gesture; #he was quite hungry, #after all.";
    stage = scr_add_enum_flag(stage, GROUCHO_STAGE.ROAST);
    if (stage == GROUCHO_STAGE.ALL)
    {
        spare = true;
    }
}
