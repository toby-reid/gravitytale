/// @desc Jamb (Door)
obj_battleCore.text[1] = global.player.mabel ? string_concat("You politely hold the door open #for ", name, ".&He mashes into the jamb anyway.") : string_concat("You note ", name, " struggles to #pass doors, mashing into the #jamb most attempts.");
obj_battleCore.text[0] = door ? "...but you already knew that." : string_concat(name, " looks frustrated.");
door = true;
if (blood)
{
    spare = true;
    obj_battleCore.text[0] += string_concat(
        "&",
        name,
        " is ready to reveal a #secret to you, and only you."
    );
}
