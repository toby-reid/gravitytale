/// @desc Head
switch stage
{
    case 0:
        obj_battleCore.text[1] = "No thanks, I'd rather keep #mine.";
        break;
    case 1:
    case 2:
        obj_battleCore.text[1] = "You slowly approach, but Lizzie #makes an intimidating gesture #toward your neck.";
        break;
    case 3:
        obj_battleCore.text[1] = "You break off the handle from #the hatchet's head.&This will be easier to hide.";
        obj_battleCore.text[0] = "Coincidentally, it's also more #difficult to swing threateningly.";
        ++stage;
        spare = true;
        break;
    default:
        obj_battleCore.text[1] = "You've already broken off the #hatchet's head.&Or... are you offering yours?"
        break;
}
