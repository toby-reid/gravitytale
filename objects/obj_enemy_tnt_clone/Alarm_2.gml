/// @desc Water
// works for 3-4
// kills them otherwise
if (stage == 0)
{
    m_act_before_check("drink water");
}
else if (clone_number == 3 || clone_number == 4)
{
    obj_battleCore.text[1] = "You make a show of drinking #water in front of the clones.";
    obj_battleCore.text[0] = "Realising their inferiority, #the clones prepare a full #retreat.";
    obj_enemy_tnt_clone.spare = true;
}
else if (global.player.kills == 0)
{
    obj_battleCore.text[1] = string_concat("You were about to melt #", name, ", but he looks so sad.");
    obj_battleCore.text[0] = string_concat("He reminds you of your", global.player.mabel ? " brother" : "self", " #too much to melt.");
}
else
{
    obj_battleCore.text[1] = "You hesitate for a moment, #then douse the clone in water.&He immediately starts to melt.";
    obj_battleCore.text[0] = "That was disturbing, but you #feel you've seen worse.";
    hp = hp div 2;
}
action = 2;
