name = "Pacifica";
act = ["Check", "Cough", "Pay", "Play"];
check = "It should be illegal for a #child to wear this much makeup.";
spare = false;
run = false;
hp = 45;
maxhp = hp;
at = 4;
lv = true; // set true if killing person increases LV
sb = 200;
area = AREA.UNKNOWN;
timer = 0;
deathx = 0;
bubble = noone; // for Spare

rounds_left = 18;
player_stuck_for = 9;
tried_shot = false;

max_yoffset = 2;
min_yoffset = -2;
offset_rate = (231 * (max_yoffset - min_yoffset)) / (2 * 60 * 60); // song is 231 bpm, 60 s/m, 60 frames per second, trigger twice per second
arms_going_up = false;
arms_yoffset = 0;
torso_going_up = false;
torso_yoffset = -0.5;

obj_battleCore.text[0] = "Apparently it's putt putt time.";
global.enemy = [id];
