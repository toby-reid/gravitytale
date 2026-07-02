/// @desc Play
if (rounds_left > 0)
{
    if (player_stuck_for > 0)
    {
        obj_battleCore.text[1] = "You attempt a shot, but the @ff00ffperfume@ffffff gets in your eyes.&Your shot goes wild.";
        obj_battleCore.text[0] = string_concat(name, " seems amused at your #meager attempt.");
    }
    else
    {
        obj_battleCore.text[1] = string_concat("You attempt a shot.&", global.player.mabel ? "It goes right in after an impressive bank." : "It gets close to the hole.&Sort of.");
        obj_battleCore.text[0] = string_concat(name, " is almost impressed.&She seems pleased you're #finally putting up a fight.");
    }
    tried_shot = true;
}
else
{
    obj_battleCore.text[1] = "You ready a shot, but #there were no holes left #to try.";
}
