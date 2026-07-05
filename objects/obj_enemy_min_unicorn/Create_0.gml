name = "Unicorn";
act = ["Check","Lick 'er","Kick 'er","Nicker"];
check = "Allegedly, its neck tastes #like your favorite flavor.";
spare = false;
run = true;
hp = 28; // Perfect number
maxhp = hp;
at = 6; // Another perfect number
lv = false;
sb = 28;
area = AREA.MINES;
timer = 0;
create = true;
bubble = noone;
deathx = 0;
stage = 0;
action_to_spare = irandom(2) + 1;

image_xscale = 2;
image_yscale = 2;

obj_battleCore.text[0] = "It's a legendary magical #creature, perfect in every way!&Just look at those stats!";
if (instance_number(obj_enemy) > 1)
{
    ++self.image_index;
    switch instance_find(obj_enemy,0).object_index
    {
    	case obj_enemy_min_arachnimorph: obj_battleCore.text[0] = "A legendary magical creature #stands to judge a very normal #guy!"; break;
        case obj_enemy_min_leprecorn: obj_battleCore.text[0] = "One horn plays rave music, #the other \"Danny Boy\".&How dreadful."; break;
        case obj_enemy_min_mockroach: obj_battleCore.text[0] = "You prepare yourself for the #ridicule at never being truly #pure of heart."; break;
        case obj_enemy_min_soothsquito: obj_battleCore.text[0] = "Suddenly, a mosquito-bite #message appears on your arm:&NAVE ITS SHECK"; break;
        case obj_enemy_min_unicorn: obj_battleCore.text[0] = "Good, twice the annoyance, #double the rave music."; break;
        case obj_enemy_min_zombie: obj_battleCore.text[0] = "Believe it or not, this Zombie #is actually pure of heart.&It doesn't have one to soil."; break;
    }
}
