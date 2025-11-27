name = "Leprecorn";
act = ["Check","Luck","Gold","Charms"];
check = "A disappointment to leprechaun #and unicorn hunters alike.";
spare = false;
run = true;
hp = 25;
maxhp = hp;
at = 3;
lv = false;
sb = 21;
area = AREA.MINES;
timer = 0;
create = true;
bubble = noone;
deathx = 0;
collected_gold = false;

image_xscale = 2;
image_yscale = 2;

self.alarm[11] = 5;
self.sparkle_range_x = [self.x - self.sprite_xoffset - 10, self.x + (self.sprite_width - self.sprite_xoffset) + 10];
self.sparkle_range_y = [self.y - self.sprite_yoffset - 10, self.y + (self.sprite_height - self.sprite_yoffset)];

obj_battleCore.text[0] = "You hear the clinking of gold #coins falling to the ground.&Wait, no, they're plastic.";
if instance_number(obj_battleEnemy) > 1 switch instance_find(obj_battleEnemy,0).object_index
{
    case obj_enemy_min_arachnimorph: obj_battleCore.text[0] = "Pay no attention to that man #behind the legendary creature."; break;
    case obj_enemy_min_leprecorn: obj_battleCore.text[0] = "You can smell sugary marsh-#mallow cereal nearby.&Also rainbows somehow."; break;
    case obj_enemy_min_mockroach: obj_battleCore.text[0] = "Pain is hilarious!   #- you, probably"; break;
    case obj_enemy_min_soothsquito: obj_battleCore.text[0] = "Suddenly, a mosquito-bite #message appears on your arm:&NLOO PH SOHDVH"; break;
    case obj_enemy_min_unicorn: obj_battleCore.text[0] = "One horn plays rave music, #the other \"Danny Boy\".&How dreadful."; break;
    case obj_enemy_min_zombie: obj_battleCore.text[0] = "Fortunately for you, Leprecorns #are immune to the undead.&Just thought you should know."; break;
}
