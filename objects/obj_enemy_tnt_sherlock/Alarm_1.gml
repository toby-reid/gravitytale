/// @desc Discuss
if (global.dummy == DUMMY_STATUS.TALKED_TOO_MUCH)
{
    obj_battleCore.text[1] = "Sherlock has analyzed you.&He knows how you treat wax #figures.";
    obj_battleCore.text[0] = "He reasons if you are foolish #enough to talk to the inanimate #Wax Stans, you're not a threat.";
    spare = true;
}
else if (stage == 0)
{
    obj_battleCore.text[1] = "Sherlock scoffs.&Surely even you can understand #the need to gather information.";
}
else
{
    obj_battleCore.text[1] = "Sherlock scoffs.&What could you have to talk #about?";
    obj_battleCore.text[0] = string_concat("Sherlock has nothing in common #with a ", global.player.mabel ? "happy-go-lucky #little girl" : "small child in short #pants (or, short trousers)", ".");
}
