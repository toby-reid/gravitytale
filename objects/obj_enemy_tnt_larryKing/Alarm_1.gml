/// @desc Feed
switch stage
{
    case 0: // goblin man!
        obj_battleCore.text[1] = string_concat("You reach in your pack for #snacks, but the ", name, " #rejects them.");
        obj_battleCore.text[0] = string_concat("It seems the ", name, " #does not, in fact, want num-nums.");
        break;
    case 1:
        obj_battleCore.text[1] = "You check your news feed.&Apparently this guy is really #popular among many audiences.";
        obj_battleCore.text[0] = "It seems he's most famous for #being a talk show host, #conducting interviews.";
        ++stage;
        break;
    default:
        obj_battleCore.text[1] = "You shouldn't eat during an #interview.&Unless it's a sponsorship.";
        obj_battleCore.text[0] = "Is big grain sponsoring you?&I thought not.";
        break;
}
