/// @desc Negotiate
if (global.dummy == DUMMY_STATUS.TALKED_TOO_MUCH)
{
    obj_battleCore.text[1] = string_concat(name, " recognizes #your aptitude for talking #way too much.");
    obj_battleCore.text[0] = string_concat(name, " realizes #this would be a waste of #time.");
    spare = true;
}
else
{
    switch stage
    {
        case 0:
            obj_battleCore.text[1] = "You thought about presenting #bargaining chips, but maybe #those aren't his favorite.";
            obj_battleCore.text[0] = "Maybe he prefers potato.&Did you even think to ask?";
            break;
        case 1:
            obj_battleCore.text[1] = string_concat(name, " refuses to #acknowledge your presence.");
            break;
        case 2:
            obj_battleCore.text[1] = string_concat("You attempt a peace deal.&", name, " has no need #for more ", global.player.mabel ? "successors" : "warriors", ".");
            obj_battleCore.text[0] = "You were right about one #thing, master:&The negotiations were short.";
            ++stage;
            spare = true;
            break;
        default:
            obj_battleCore.text[1] = string_concat("I really don't think he #needs more ", global.player.mabel ? "wives" : "sons", ".");
            break;
    }
}
