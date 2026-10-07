/// @desc Pen
switch stage
{
    case 0:
        obj_battleCore.text[1] = "You reached for his quill, #but he has a surprisingly #tight grip.";
        break;
    case 1:
        obj_battleCore.text[1] = "But then you realized that a #sword must be mightier, right?";
        break;
    case 2:
        obj_battleCore.text[1] = "You do something very cool, #knowing it is your #penultimate action.";
        obj_battleCore.text[0] = "I show no penance for the pun.&I shall face my penishment.&Not an inkling of a doubt.";
        ++stage;
        break;
    default:
        obj_battleCore.text[1] = "Don't you love puns?&I give them a pen out of pen.";
        break;
}
