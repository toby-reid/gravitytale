name = "Soothsquito";
act = ["Check","Spellcheck","Spice","Punch"];
check = "Bites spell out dire futures, #but frequently misspelled.";
spare = false;
run = true;
hp = 1;
maxhp = hp;
at = 1;
lv = false;
sb = 8;
area = AREA.MINES;
timer = 0;
create = true;
bubble = noone;
deathx = 0;
spellcheck = false;
cilantro = false;

image_xscale = 1;
image_yscale = 1;
y -= 100;
ystart = y;

obj_battleCore.text[0] = "It was so small, you almost #didn't notice.&That's what you said, anyway.";
if instance_number(obj_battleEnemy) > 1
{
    ++self.image_index;
    switch instance_find(obj_battleEnemy,0).object_index
    {
        case obj_enemy_min_arachnimorph: obj_battleCore.text[0] = "Suddenly, a mosquito-bite #message appears on your arm:&SPOLLOW THE FIDERS"; break;
        case obj_enemy_min_leprecorn: obj_battleCore.text[0] = "Suddenly, a mosquito-bite #message appears on your arm:&NLOO PH SOHDVH"; break;
        case obj_enemy_min_mockroach: obj_battleCore.text[0] = "Suddenly, a mosquito-bite #message appears on your arm:&THE MEST BEDICINE"; break;
        case obj_enemy_min_soothsquito: obj_battleCore.text[0] = "Suddenly, a mosquito-bite #message appears on your arm:&BEWARB"; break;
        case obj_enemy_min_unicorn: obj_battleCore.text[0] = "Suddenly, a mosquito-bite #message appears on your arm:&NAVE ITS SHECK"; break;
        case obj_enemy_min_zombie: obj_battleCore.text[0] = "Suddenly, a mosquito-bite #message appears on your arm:&DID SOMEBODY SAY CROMBIE"; break;
    }
}