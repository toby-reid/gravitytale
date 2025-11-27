/// @description Charms/Harms

obj_battleCore.text[1] = "You try to steal its Luck o' #Charms, but it seems it was #actually Schmuck o' @ffff00Harms@ffffff.";
obj_battleCore.text[0] = "You feel slightly more foolish #than before.&Also more hurt.";
if (global.player.hp > 1)
{
    --global.player.hp;
    audio_play_sound(sfx_damageTaken, 0, false);
}
