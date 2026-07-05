name = "Mockroach"
act = ["Checkle","Heckle","Chuckle","Huckle"];
check = "A more sadistic (and durable) #relative of the Funnybee.";
spare = false;
run = true;
hp = 1;
maxhp = hp;
at = 1;
lv = false;
sb = 16;
area = AREA.MINES;
timer = 0;
create = true;
bubble = noone;
deathx = 0;
laughter = 0;
huckled = false;

image_xscale = 2;
image_yscale = 2;

obj_battleCore.text[0] = "Loud laughter fills the room.&You instantly feel bad about #yourself.";
if instance_number(obj_enemy) > 1
{
    ++self.image_index;
    switch instance_find(obj_enemy,0).object_index
    {
        case obj_enemy_min_arachnimorph: obj_battleCore.text[0] = "You see, it's funny because of #how normal he is.&Just like you."; break;
        case obj_enemy_min_leprecorn: obj_battleCore.text[0] = "Pain is hilarious!   #- you, probably"; break;
        case obj_enemy_min_mockroach: obj_battleCore.text[0] = "You feel yourself developing #katsaridiculaphobia."; break;
        case obj_enemy_min_soothsquito: obj_battleCore.text[0] = "Suddenly, a mosquito-bite #message appears on your arm:&THE MEST BEDICINE"; break;
        case obj_enemy_min_unicorn: obj_battleCore.text[0] = "You prepare yourself for the #ridicule at never being truly #pure of heart."; break;
        case obj_enemy_min_zombie: obj_battleCore.text[0] = "It's hard to say which is #preferable.&...but it's the Zombie."; break;
    }
}
