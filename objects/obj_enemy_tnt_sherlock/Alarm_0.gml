/// @desc Check
event_inherited();
if (stage == 0)
{
    obj_battleCore.text[0] = string_concat("Sherlock Checks you as well.&", global.player.mabel ? "He seems to relax, if only #a little." : "Such is customary between #intellectual gentlemen.");
    stage = 1;
}
