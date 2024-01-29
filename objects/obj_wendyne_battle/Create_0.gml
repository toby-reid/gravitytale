name = "Wendy Corduroy";
act = ["Check","Chill out","Struggle","Flirt"];
if(global.player[player.mabel]) act[3] = "Girl talk";
check = "The coolest person in town.&Can climb and/or chop anything.";
spare = false;
run = false;
hp = 60;
maxhp = hp;
at = 5;
lv = true;//set true if killing person increases LV
sb = 100;
zone = area.unknown;
timer = 0;
deathx = 0;

image_xscale = 2;
image_yscale = 2;
vspeed = .4;
obj_soul.image_index = 3;

global.enemy = [id];
//global.stage[0] = 4;
//global.stage[1] = 4;

bubble = noone//instance_create_layer(x+80,y-100,layer,obj_textBubble);
//bubble.sound = [tlk_wendy];
if(!variable_global_exists("wendyne")) global.wendyne = 20;
if(global.wendyne < 21) {
	obj_battleCore.text[0] = "Wendy Corduroy has arrived to #administer the final test!";
	//bubble.text = ["En garde!"];
	trap = 5;
}
else {
	obj_battleCore.text[0] = "Once again, you've been caught #in a trap.&The nachos are quite tricky.";
	//bubble.text = ["You can't escape that easily!"];
	trap = 1+irandom(3);
}