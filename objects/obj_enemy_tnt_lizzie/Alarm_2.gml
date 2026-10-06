/// @desc Axe/Hatchet
switch stage
{
    case 0:
        obj_battleCore.text[1] = "You should probably check #whether it's real first.";
        break;
    case 1:
        obj_battleCore.text[1] = "You were about to axe her a #question, but you realized it's #more of a hatchet.";
        obj_battleCore.text[0] = "Sorry, I'm not usually the type #to axe-centuate that kind of #nuance.";
        act[2] = "Hatchet";
        ++stage;
        break;
    case 2:
        obj_battleCore.text[1] = "Despite the misunderstanding, #you suggest you can hatchet #out together.";
        obj_battleCore.text[0] = "Lizzie agrees.&She is ready to bury the #hatchet.";
        ++stage;
        break;
    default:
        obj_battleCore.text[1] = "You were about to suggest a #quick game, but you weren't sure #you could catchet.";
        break;
}
