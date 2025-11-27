/// @description Chuckle

switch self.laughter
{
    case 0:
        obj_battleCore.text[1] = "You find yourself laughing at #the Mockroach's jokes.&It laughs harder.";
        obj_battleCore.text[0] = "Mockroach's jokes get even #ruder.";
        ++self.laughter;
        break;
    case 1:
        obj_battleCore.text[1] = "You give the Mockroach a #polite chuckle.&It laughs even harder.";
        obj_battleCore.text[0] = "Mockroach's jokes get even #cruder.";
        ++self.laughter;
        break;
    case 2:
        obj_battleCore.text[1] = "You nervously laugh again.&The Mockroach entirely loses #itself to its laughter.";
        obj_battleCore.text[0] = "Mockroach seems to be more #vulnerable.";
        ++self.laughter;
        self.sprite_index = spr_enemy_min_mockroach_side;
        if (irandom(1) == 0) self.image_xscale = -self.image_xscale;
        self.spare = true;
        break;
    default:
        obj_battleCore.text[1] = "You were going to laugh, but #you thought better.";
        break;
}
