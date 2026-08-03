obj_battleCore.text[0] = string_concat(name, " furiously seeks #through his ", global.player.mabel ? "" : "own ", "journal for #your entry.");
if (clone_number == 2) // i.e., Tyrone
{
    switch stage
    {
        case 0:
            check = string_concat("It's... you", global.player.mabel ? "r brother" : "", "...?&No, this one's ", global.player.mabel ? "too... flat" : "head is too big", ".");
            ++stage;
            break;
        case 1:
            check = string_concat("Looks identical to your", global.player.mabel ? " brother" : "self", ".&Seems to be made of paper.");
            obj_battleCore.text[0] = "It seems he has more to #say.";
            ++stage;
            break;
        case 2:
            check = string_concat("Has similar preferences (and #weaknesses) to your ", global.player.mabel ? "brother's" : "own", ".");
            obj_battleCore.text[0] = "You have reached an #understanding with the clone.";
            ++stage;
            break;
        default:
            check = string_concat("Your ", global.player.mabel ? "brother's " : "", "identical clone.&The first of ten, apparently.");
            obj_battleCore.text[0] = string_concat(name, " records your entry #in his ", global.player.mabel ? "" : "own ", "journal.&Just like you", global.player.mabel ? "r brother" : " do", "...");
            break;
    }
}
else if (stage == 0)
{
    obj_enemy_tnt_clone.stage = 1;
}
event_inherited();
action = 0;
