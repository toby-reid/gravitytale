/// @desc Talk
if (global.dummy == DUMMY_STATUS.TALKED_TOO_MUCH)
{
    obj_battleCore.text[1] = string_concat(name, " actually #conducted an interview with #Wax Stans after his defeat.");
    obj_battleCore.text[0] = string_concat("You evidently aren't an enemy #of the wax figures, so #", name, " lets you go.");
    spare = true;
}
else
{
    switch stage
    {
        case 0:
            obj_battleCore.text[1] = "You were about to attempt first #contact, but you weren't sure #if he speaks English or Goblin.";
            break;
        case 1:
            obj_battleCore.text[1] = string_concat("You begin delivering a sermon, #but ", name, " stops you.");
            obj_battleCore.text[0] = "This is not the time #or place for that.";
            break;
        case 2:
            obj_battleCore.text[1] = "You introduce yourself.&Larry nods and presents #the first topic for today.";
            obj_battleCore.text[0] = string_concat(name, " patiently #awaits your response.");
            ++stage;
            break;
        case 3:
            obj_battleCore.text[1] = "You begin a recount of your #adventures to this point.&He takes a few notes.";
            obj_battleCore.text[0] = string_concat(name, " asks for #elaboration on a couple points.");
            ++stage;
            break;
        case 4:
            obj_battleCore.text[1] = string_concat("You tell a tear-jerking tale #of ", global.player.mabel ? "happiness and despair" : "heroism and cowardice", ".");
            obj_battleCore.text[0] = string_concat(name, " suddenly notices #the time.&It's about time to wrap it up.");
            ++stage;
            break;
        case 5:
            obj_battleCore.text[1] = string_concat("You read out the outro cards.&", name, " nods and adds #his own ending.");
            obj_battleCore.text[0] = string_concat(name, " switches off #his mic.");
            ++stage;
            spare = true;
            break;
        default:
            obj_battleCore.text[1] = "His mic is off.&You think he wants to hear #you for some reason?";
            break;
    }
}
