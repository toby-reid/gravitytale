/// @description Sing

switch (self.singing)
{
    case 0:
        obj_battleCore.text[1] = "Friday night, we're gonna #party til dawn...";
        obj_battleCore.text[0] = "The Zombie looks at you #inquisitively.";
        break;
    case 1:
        obj_battleCore.text[1] = "There's a zombie on your #lawn...";
        obj_battleCore.text[0] = "The Zombie looks almost #fearful.";
        break;
    case 2:
        obj_battleCore.text[1] = "Whooooooa!&We're taking over tonight!&...the Zombie flees.";
        obj_battleCore.text[0] = "The Zombie has fled #to protect its head.&Look, it rhymes!";
        self.spare = true;
        break;
    default:
        obj_battleCore.text[1] = "If you're seeing this, #an error has occurred.&ZBSNG";
        break;
}
++self.singing;
