/// @desc Accuse
if (global.dummy == DUMMY_STATUS.TALKED_TOO_MUCH)
{
    obj_battleCore.text[1] = "In your experience talking to #wax figures, you know she just #must be innocent.";
    obj_battleCore.text[0] = "If the axe doesn't fit, #you must acquit!";
    spare = true;
}
else
{
    obj_battleCore.text[1] = "You point menacingly, #but Lizzie has heard #it all.";
}
