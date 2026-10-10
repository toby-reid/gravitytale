/// @desc Quip
if (global.dummy == DUMMY_STATUS.TALKED_TOO_MUCH)
{
    m_dummy_talk();
}
else if (stage == GROUCHO_STAGE.NONE)
{
    obj_battleCore.text[1] = "But you haven't even talked #with him.";
}
else if (scr_has_enum_flag(stage, GROUCHO_STAGE.QUIP))
{
    obj_battleCore.text[1] = "Eh, don't force it.&That just makes it weird.";
}
else
{
    obj_battleCore.text[1] = "You were about to tell a joke, #but you couldn't think of #anything.";
    obj_battleCore.text[0] = "Next time, come better #e-quip-ped.";
    stage = scr_add_enum_flag(stage, GROUCHO_STAGE.QUIP);
    if (stage == GROUCHO_STAGE.ALL)
    {
        spare = true;
    }
}
