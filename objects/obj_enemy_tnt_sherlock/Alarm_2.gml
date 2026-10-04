/// @desc Challenge
switch stage
{
    case 0:
        obj_battleCore.text[1] = "Sherlock scoffs.&Surely even you can understand #the need to gather information.";
        break;
    case 1:
    case 2:
    case 3:
        obj_battleCore.text[1] = "Sherlock scoffs.&His intelligence is too extreme #to challenge a mere child.";
        obj_battleCore.text[0] = "If only there were a way #to get him to acknowledge #your aptitude.";
        break;
    case 4:
        obj_battleCore.text[1] = string_concat("Sherlock starts to laugh.&It seems your ", global.player.mabel ? "cheery demeanor" : "high intellect", " #has ", global.player.mabel ? "driven him to madness" : "caught his attention", ".");
        obj_battleCore.text[0] = global.player.mabel ? "Sherlock can't bring himself #to take you seriously." : "Sherlock is content with the #strong intellectual battle #that has taken place.";
        ++stage;
        spare = true;
        break;
    default:
        obj_battleCore.text[1] = "Sherlock just shakes his head.&Now is not the time to #continue.";
        break;
}
