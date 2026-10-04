/// @desc Shine
if (stage == 0)
{
    obj_battleCore.text[1] = string_concat("You hold out something shiny.&", name, " observes #curiously but stays put.");
}
else if (stage <= 5)
{
    obj_battleCore.text[1] = "What, you're just going to #shine his shoes right here?&Weirdo.";
    obj_battleCore.text[0] = string_concat(name, " steps back #a little.&See, it's weird.");
    if (at > 1)
    {
        --at;
    }
}
else
{
    obj_battleCore.text[1] = "His microphone is already #quite shiny.&He must take good care of it.";
}
