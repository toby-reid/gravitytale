name = "Sherlock Holmes";
act = ["Check", "Discuss", "Challenge", "Perpostulate"];
check = "You seen his magnifying glass?&It's enormous!";
spare = false;
run = false;
hp = 56; // 56 short stories in Sherlock canon
maxhp = hp;
at = 4; // 4 full novels in Sherlock canon
lv = false;
sb = 87; // first Sherlock novel 1887
area = AREA.TENT;
timer = 0;
bubble = noone;
deathx = 0;

stage = 0;

image_xscale = 2;
image_yscale = 2;

obj_battleCore.text[0] = global.player.mabel ? "He's Sherlock bleeding Holmes!&...and some strange... #goblin man?" : "You really think you can #outwit him?&He's Sherlock bleeding Holmes!";
