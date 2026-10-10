name = "Bespectacled Jokester";
act = ["Check", "Quip", "Roast", "Joke"];
check = "Expert comedian and wordsmith.&Master of one-liners.";
spare = false;
run = false;
hp = 69; // funny number??
maxhp = hp;
at = 3; // number of wives, I guess
lv = false;
sb = 86; // age at death
area = AREA.TENT;
timer = 0;
bubble = noone;
deathx = 0;

image_xscale = 2;
image_yscale = 2;

enum GROUCHO_STAGE
{
    NONE = 0,
    CHECK = 1 << 0,
    QUIP = 1 << 1,
    ROAST = 1 << 2,
    JOKE = 1 << 3,
    ALL = 0b1111
}
stage = GROUCHO_STAGE.NONE;

obj_battleCore.text[0] = "Conquest is no laughing matter.&Khan-quest? Maybe.&Con-jest? Sounds stuck up.";

m_dummy_talk = function()
{
    obj_battleCore.text[1] = "Groucho interrupts with a quip #about talking to wax figures #because you have no friends.";
    obj_battleCore.text[0] = "The emotional damage enables #easy escape.";
    spare = true;
}
