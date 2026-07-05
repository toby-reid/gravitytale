name = "Gnome"
act = ["Check","Shovel","Leaf Blower","Queen"]
spare = false
run = true
hp = 5
maxhp = hp
at = 3
lv = false
sb = 8
area = AREA.FOREST;
timer = 0
bubble = noone
check = "Common Gnome. Seeks a queen.&Very weak on its own."
bubbleText = "..."
stage = 0
deathx = 0
flipped = 0

attack_on = 50;

image_xscale = 2
image_yscale = 2
image_speed = 0
alarm[11] = 20
image_index = irandom((image_number div 2) - 1); // randomize Gnome type

obj_battleCore.text[0] = "Common Gnome enters the scene;&this common Gnome, he seeks a #queen."
if instance_number(obj_enemy) > 1 {
    switch instance_find(obj_enemy,0).object_index {
        case obj_enemy_fst_bCub:        obj_battleCore.text[0] = "I've never been a beast of #bearden...&er, burden." break
        case obj_enemy_fst_gnome:        obj_battleCore.text[0] = "Two Gnomes have teamed up!&Their AT have increased by 2!&(Gnomes together strong)"; obj_enemy_fst_gnome.at += 2 break
        case obj_enemy_fst_gremloblin:    obj_battleCore.text[0] = "Gnome has been running from #Gremloblin!&Gremloblin doesn't know why!" break
        case obj_enemy_fst_kBilly:        obj_battleCore.text[0] = "Kill Billy will eat anything!&Gnome does not want to be #\"anything\"!" break
        case obj_enemy_fst_plaidypus:    obj_battleCore.text[0] = "Plaidypus may or may not be #investigating Dr. Shmebulock's #next evil -inator." break
        case obj_enemy_fst_qQuail:        obj_battleCore.text[0] = "Question Quail arrives to #question why Gnomes must kidnap #to marry." break
    }
    image_index++
}

m_all_enemies_flipped = function()
{
    for (var i = 0, _enemy_count = array_length(global.enemy); i < _enemy_count; ++i)
    {
        var _enemy = global.enemy[i];
        if (!instance_exists(_enemy))
        {
            continue;
        }
        if (_enemy.object_index != object_index || _enemy.flipped == 0)
        {
            return false;
        }
    }
    return true;
}
