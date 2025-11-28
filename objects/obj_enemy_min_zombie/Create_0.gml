name = "Zombie";
act = ["Check","Sniff","Feed","Sing"];
check = "Their skulls can be shattered #by perfect 3-part harmony.";
spare = false;
run = true;

var type = irandom(2);
self.hp = 15 + (10 * type);
self.maxhp = self.hp;
self.at = 6 - (2 * type);
self.cone = (type == 1);
self.bucket = (type == 2);
self.hat_alpha = 1;

lv = false;
sb = 10 + (6 * type);
area = AREA.MINES;
timer = 0;
create = true;
bubble = noone;
deathx = 0;

stench = 0;
singing = 0;

image_xscale = 2;
image_yscale = 2;
self.alarm[11] = irandom_range(60, 600);
self.image_speed = 0;

obj_battleCore.text[0] = "Hide your kids, #hide your plant life.";
if instance_number(obj_battleEnemy) > 1 switch instance_find(obj_battleEnemy,0).object_index
{
    case obj_enemy_min_arachnimorph: obj_battleCore.text[0] = "This man must be careful of #the Zombie, because he is very #infectable!"; break;
    case obj_enemy_min_leprecorn: obj_battleCore.text[0] = "Fortunately for you, Leprecorns #are immune to the undead.&Just thought you should know."; break;
    case obj_enemy_min_mockroach: obj_battleCore.text[0] = "It's hard to say which is #preferable.&...but it's the Zombie."; break;
    case obj_enemy_min_soothsquito: obj_battleCore.text[0] = "Suddenly, a mosquito-bite #message appears on your arm:&DID SOMEBODY SAY CROMBIE"; break;
    case obj_enemy_min_unicorn: obj_battleCore.text[0] = "Believe it or not, this Zombie #is actually pure of heart.&It doesn't have one to soil."; break;
    case obj_enemy_min_zombie: obj_battleCore.text[0] = "The stench reaches you before #the Zombies do.&No wonder they lack noses."; break;
}
