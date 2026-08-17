if (!scr_has_enum_flag(global.tent_battles, TENT_BATTLE.PAPER_JAM))
{
    instance_destroy();
    exit; // will error out
}
global.tent_battles = scr_remove_enum_flag(global.tent_battles, TENT_BATTLE.PAPER_JAM);

name = "Paper Jam";
act = ["Check", "Fold", "Water", "WENDY"];
check = "It's a misprint.&Put it out of its misery.";
spare = false;
run = false;
hp = 36;
maxhp = hp;
at = 2;
papercuts = [];
lv = false;
sb = 50;
area = AREA.TENT;
timer = 0;
bubble = noone;
deathx = 0;
stage = 0;

image_xscale = 2;
image_yscale = 2;
global.enemy = [id];

obj_battleCore.text[0] = global.player.mabel ? "The resemblance is uncanny.&If your brother got hooked #on drugs, that is." : "It's like looking in a mirrow:&A broken, crumbled mess.";
