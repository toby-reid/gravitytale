/// @desc Play
if (global.dummy == DUMMY_STATUS.TALKED_TOO_MUCH)
{
    obj_battleCore.text[1] = "You feel no need to play #Shakespeare's game.&You're a waxpert, after all.";
    obj_battleCore.text[0] = "Shakespeare can always enjoy a #witty joust of words, but that #won't come from you, it seems.";
    spare = true;
}
else
{
    switch stage
    {
        case 0:
            obj_battleCore.text[1] = "You press Play, but nothing #happens.&He's already moving, after all.";
            break;
        case 1:
        case 2:
            obj_battleCore.text[1] = "You suggest your favorite game, #but Shakespeare is not inter-#ested in duck-duck-goose.";
            break;
        case 3:
            obj_battleCore.text[1] = "You try to pick out something #\"family-friendly\".&Oh, not that one... Not that...";
            obj_battleCore.text[0] = "Shakespeare is... surprised by #your fan fiction.&He wants to leave.";
            ++stage;
            spare = true;
            break;
        default:
            obj_battleCore.text[1] = "Shakespeare wants nothing to do #with your \"original works\".&Please leave him alone.";
            break;
    }
}
