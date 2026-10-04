name = "???";
act = ["Check"];
check = "You almost think there's #something else here...";
spare = false;
run = false;
hp = 16;
maxhp = hp;
at = 3;
lv = false;
sb = 40;
area = AREA.TENT;
timer = 0;
bubble = noone;
deathx = 0;

image_xscale = 2;
image_yscale = 2;

enum CAST
{
    MAGIC,
    FISHING,
    PERFORMANCE
}
casts = array_shuffle([CAST.MAGIC, CAST.FISHING, CAST.PERFORMANCE]);
m_reveal = function()
{
    revealed = true;
    name = "Invisible Wizard";
    act = ["Check", "Cast", "Cast", "Cast"];
    check = "Supposedly highly attractive.&So, hear me out...";
    casts = array_shuffle([CAST.MAGIC, CAST.FISHING, CAST.PERFORMANCE]);
    sprite_index = spr_wizardOutline;
}
if (revealed)
{
    m_reveal();
}
else
{
    sprite_index = -1;
}
m_enemy_exists = function()
{
    for (var i = 0, enemy_count = array_length(global.enemy); i < enemy_count; ++i)
    {
        if (instance_exists(global.enemy[i]))
        {
            return true;
        }
    }
    return false;
}

m_act = function(_action)
{
    if (_action == 0)
    {
        return;
    }
    var _casts_index = _action - 1;
    var _cast = casts[_casts_index];
    switch (_cast)
    {
        case CAST.MAGIC:
            obj_battleCore.text[1] = "You begin chanting a spell, #but the wizard beats you to it.";
            obj_battleCore.text[0] = global.player.mabel ? "That spell requires a level of #Concentration you simply don't #have." : "You should have taken the #War Caster feat.";
            break;
        case CAST.FISHING:
            obj_battleCore.text[1] = "You fling your line in the #Perfect Cast, but it launches #too far, missing the Wizard.";
            obj_battleCore.text[0] = "The Wizards just aren't biting #today.&Have you checked your bait?";
            break;
        case CAST.PERFORMANCE:
            obj_battleCore.text[1] = "You inform the Wizard that #they're doing auditions for #High School Promsical 6.";
            obj_battleCore.text[0] = "The Wizard chooses to preserve #his stunningly good looks #for the big screen.";
            spare = true;
            break;
    }
}

restore_soul = function()
{
    if (!instance_exists(obj_atk_wizard_biggerizer))
    {
        instance_create_layer(0, 0, layer, obj_atk_wizard_biggerizer, {biggerize: false});
    }
}
