/// @desc Joke
if (global.dummy == DUMMY_STATUS.TALKED_TOO_MUCH)
{
    m_dummy_talk();
}
else if (stage == GROUCHO_STAGE.NONE)
{
    obj_battleCore.text[1] = string_concat(name, " doesn't #need to hear your life's #story right now.");
}
else if (scr_has_enum_flag(stage, GROUCHO_STAGE.JOKE))
{
    obj_battleCore.text[1] = "This was originally \"Wordplay\".&I had a joke about eating words #instead of playing with them.";
    obj_battleCore.text[0] = "There are starving children who #would love to have what you're #having, I'd say.";
}
else
{
    obj_battleCore.text[1] = "The Joker is a wild card.&Like the Fool.&So... you.";
    obj_battleCore.text[0] = "Unfortunately, you can't quite #tell if he drops the \"Groucho\" #Persona, so it's all jokes.";
    stage = scr_add_enum_flag(stage, GROUCHO_STAGE.JOKE);
    if (stage == GROUCHO_STAGE.ALL)
    {
        spare = true;
    }
}
