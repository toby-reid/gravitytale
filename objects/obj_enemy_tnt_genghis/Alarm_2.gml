/// @desc War
switch stage
{
    case 0:
        obj_battleCore.text[1] = "This guy doesn't really #seem that much into card #games.";
        obj_battleCore.text[0] = "And that one is the warst.&It's entirely luck based.&You actually like it?";
        break;
    case 1:
        obj_battleCore.text[1] = string_concat(name, " refuses to #acknowledge your presence.");
        break;
    case 2:
        obj_battleCore.text[1] = "You immediately declare war.&A thumb war, that is.";
        obj_battleCore.text[0] = "He beats you easily, but this #was new to him.&What a delight.";
        ++stage;
        spare = true;
        break;
    default:
        obj_battleCore.text[1] = "There is no need to make #things warse.&You'd best wartch yourself.";
        break;
}
