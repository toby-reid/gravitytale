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
bubble = noone;
deathx = 0;
alpha = 0; // used for the fadewhite
geno = false;

image_xscale = 2;
image_yscale = 2;
head = noone; // used for our own head sprite_index
vspeed = .4;
obj_soul.image_index = 3;

global.enemy = [id];

obj_battleCore.text[0] = "Wendy Corduroy is here to end #this!&Let's end her first!";
trap = 5;

function makeaxe(_x,_y,_spd = 1,_at = at,_blend = c_orange,_xscale = 1,_yscale = 2*(irandom(0)-.5)) {
	var _axe = instance_create_layer(_x,_y,layer,obj_battleAttack);
	with _axe {
		sprite_index = spr_wendyne_axe_btl;
		image_xscale = _xscale;
		image_yscale = _yscale;
		image_blend = _blend;
		var _dir = 90*(y > 260) + 180*(x > 340) + 270*(y < 220);
		image_angle = _dir;
		direction = _dir;
		speed = _spd;
		at = _at;
	}
	return _axe;
}