/// @desc Check
if (player_stuck_for > 0)
{
    obj_battleCore.text[1] = string_concat("You reach for your ", global.player.mabel ? "scrapbook" : "journal", ", #but you just can't stop #coughing.");
    obj_battleCore.text[0] = "We need to do something about #that @ff00ffperfume@ffffff.";
}
else
{
    event_inherited();
}
