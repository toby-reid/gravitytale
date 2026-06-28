/// @desc Jam - Blood
obj_battleCore.text[1] = global.player.mabel ? "You ask what flavor of jam #he's got smeared on his face." : "You ask about the blood he's #got smeared on his face.&Supposedly, it's jam.";
obj_battleCore.text[0] = blood ? "...but you already knew that." : "It's apparently raspberry.";
blood = true;
if (door)
{
    spare = true;
    obj_battleCore.text[0] += string_concat(
        "&",
        name,
        " is ready to reveal a #secret to you, and only you."
    );
}
