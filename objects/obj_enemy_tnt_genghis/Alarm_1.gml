/// @desc Follow
switch stage
{
    case 0:
        obj_battleCore.text[1] = "You're gonna follow a guy you #just met?&What about stranger danger?";
        break;
    case 1:
        obj_battleCore.text[1] = string_concat(name, " refuses to #acknowledge your presence.");
        break;
    case 2:
        obj_battleCore.text[1] = "You agree to become his loyal #follower.&On Spacebook, that is.";
        obj_battleCore.text[0] = "He's not certain what that #means, so he resolves to learn #about the modern world.";
        ++stage;
        spare = true;
        break;
    default:
        obj_battleCore.text[1] = "You'll just foll for anyone who #gives you attention, huh?&That's a new (fol)low.";
        break;
}
