///@desc Shovel
if (instance_exists(stacked_gnome))
{
    obj_battleCore.text[1] = "You tried to flip the Gnome, #but he's too heavy with the others #on top.";
}
else
{
    event_inherited();
}
