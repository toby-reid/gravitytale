/// @desc Perpostulate
switch stage
{
    case 0:
        obj_battleCore.text[1] = "Sherlock scoffs.&Surely even you can understand #the need to gather information.";
        break;
    case 1:
        obj_battleCore.text[1] = "You present a simple logic #puzzle about identifying #aliens.";
        obj_battleCore.text[0] = "Sherlock solves it quickly, #but warms up to you a little.";
        ++stage;
        break;
    case 2:
        obj_battleCore.text[1] = "You present a more complex #puzzle involving 5 boxes in a #circular ice region.";
        obj_battleCore.text[0] = "Sherlock thinks for a moment, #then solves in just 22 moves.&Why couldn't you do that?";
        ++stage;
        break;
    case 3:
        obj_battleCore.text[1] = "You present an NP-complete #problem.&Sherlock thinks for a while.";
        obj_battleCore.text[0] = "Finally, he presents a O(n) #solution.&You can go no further upward.";
        ++stage;
        break;
    default:
        obj_battleCore.text[1] = "You can think of nothing more #complex.&You were bested intellectually.";
        break;
}
