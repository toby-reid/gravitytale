name = "Human";
act = ["Check","Medium","Small Talk","Big Talk"];
check = "A perfectly normal human.&Nothing more to be found here.";
spare = false;
run = true;
hp = 12;
maxhp = hp;
at = 2;
lv = false;
sb = 16;
area = AREA.MINES;
timer = 0;
create = true;
bubble = noone;
deathx = 0;
is_spider = false;
acts_to_spare = 2;

image_xscale = 2;
image_yscale = 2;
self.image_speed = 0;
self.alarm[11] = irandom_range(20, 120);

obj_battleCore.text[0] = "A very kind and polite human #invites you over for dinner.&How benevolent!";
if (instance_number(obj_enemy) > 1)
{
    ++self.image_index;
    switch instance_find(obj_enemy,0).object_index
    {
        case obj_enemy_min_arachnimorph: obj_battleCore.text[0] = "Both are insistent that the #other is a doppelganger.&Curious."; break;
        case obj_enemy_min_leprecorn: obj_battleCore.text[0] = "Pay no attention to that man #behind the legendary creature."; break;
        case obj_enemy_min_mockroach: obj_battleCore.text[0] = "You see, it's funny because of #how normal he is.&Just like you."; break;
        case obj_enemy_min_soothsquito: obj_battleCore.text[0] = "Suddenly, a mosquito-bite #message appears on your arm:&SPOLLOW THE FIDERS"; break;
        case obj_enemy_min_unicorn: obj_battleCore.text[0] = "A legendary magical creature #stands to judge a very normal #guy!"; break;
        case obj_enemy_min_zombie: obj_battleCore.text[0] = "This man must be careful of #the Zombie, because he is very #infectable!"; break;
    }
}
