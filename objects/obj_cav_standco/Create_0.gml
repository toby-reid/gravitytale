text = [
	"hey, kid, wanna buy one of our #award-winning stanco(tm) #products?",
	"how about this one:&canned laughter(tm)&\"you @ffff00can @ffffffmake 'em laugh!\"",
	"look, see...&when you open the lid...",
	". . .",
	". . .",
	"well, maybe your negative #energy is stopping my perfect #product from working.",
	"hey, don't look so sour, kid...",
	"here, how about this?",
	"let's have a quick battle.",
	"if you win, i'll give you #something really useful.",
	"what do you say?# let's             i'd rather# battle           not",
	"well, that's a shame, kid.&i had something really good #for you..."
]
head = [
	spr_stans_head_neutral,
	spr_stans_head_sly,
	spr_stans_head_joke,
	spr_stans_head_sly,
	spr_stans_head_content,
	spr_stans_head_neutral,
	spr_stans_head_sly,
	spr_stans_head_neutral,
	spr_stans_head_neutral,
	spr_stans_head_sly,
	spr_stans_head_neutral,
	spr_stans_head_content,
	spr_stans_head_hollowEye
]
stage = 0
if (array_contains(global.oneTimeInstances, id) || global.player.genocide == RUN.ACTIVE || global.enemy_killed[ENEMY.FORD])
{
    image_index = 1;
}
