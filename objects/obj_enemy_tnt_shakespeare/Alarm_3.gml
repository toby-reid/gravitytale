/// @desc Sword
switch stage
{
    case 0:
        obj_battleCore.text[1] = "You could have sword you put #it somewhere around here...";
        break;
    case 1:
        obj_battleCore.text[1] = "The S-word?&What's that?&Shakespeare doesn't react.";
        obj_battleCore.text[0] = "I guess he's not ready for #that yet, but his descendants #are gonna love it.";
        ++stage;
        break;
    default:
        obj_battleCore.text[1] = "He's got a sword!&You idiots, we've all got #swords!";
        break;
}
