text = [
	"hey, kid, wanna buy one of our #award-winning stanco(tm) #products?",
	"how about this one:&instant water(tm)&\"just add water!\"",
	"no?&something wrong?",
	"you think my awards are fake?",
	"look, see, here's one...",
	"(You got the #\"inSTANt water award\" award!&(Mother would be so proud!)",
	"(No, wait...&(It broke.)",
	". . .",
	". . .",
	"no refunds."
]
head = [
	spr_stans_head_neutral,
	spr_stans_head_sly,
	spr_stans_head_neutral,
	spr_stans_head_sly,
	spr_stans_head_joke,
	noone,
	noone,
	spr_stans_head_sly,
	spr_stans_head_content,
	spr_stans_head_neutral
]
for(var i = 0; i < array_length(text); i++) if head[i] != noone {font[i] = fnt_sans_gui; sound[i] = tlk_stans}
active = false
if !variable_global_exists("trashCan") global.trashCan = [];
else for(var i = 0; i < array_length(global.trashCan); i++) if global.trashCan[i] == id {image_index = 1; break}
if global.player.genocide == RUN.ACTIVE or global.enemy_killed[ENEMY.FORD] image_index = 1