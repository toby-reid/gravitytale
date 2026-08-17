name = string_concat("Number ", clone_number);
act = ["Check", "Fold", "Water", "WENDY"];
action = -1;
switch clone_number
{
    case 3:
    case 4:
        check = "You were warned about these.&Water should take care of them.";
        break;
    case 5:
    case 6:
    case 7:
        check = "These are cheaper prints.&They seem less wary of you.";
        break;
    case 8:
    case 9:
    case 10:
        check = "These are fresher prints.&They seem desperate to \"live\".";
        break;
    default:
        check = ""; // will be handled later
        break;
}
spare = false;
run = false;
hp = 36;
maxhp = hp;
at = 1;
papercuts = [];
m_cut = function()
{
    array_push(papercuts, [random(1), random(1), random(1), random(1)]);
    obj_enemy_tnt_clone.papercuts = papercuts;
}
if (instance_number(object_index) > 1)
{
    var _first = instance_find(object_index, 0);
    papercut_uniform_starts = _first.papercut_uniform_starts;
    papercut_uniform_ends = _first.papercut_uniform_ends;
    papercut_uniform_count = _first.papercut_uniform_count;
    max_papercuts = _first.max_papercuts;
}
else
{
    papercut_uniform_starts = shader_get_uniform(shd_papercut, "lineStarts");
    papercut_uniform_ends = shader_get_uniform(shd_papercut, "lineEnds");
    papercut_uniform_count = shader_get_uniform(shd_papercut, "lineCount");
    max_papercuts = 5;
}

lv = false; // set true if killing person increases LV
sb = 30;
area = AREA.TENT;
timer = 0;
bubble = noone;
deathx = 0;
stage = 0;

image_xscale = 2;
image_yscale = 2;
if (clone_number != 2)
{
    image_index = irandom(image_number);
}

obj_battleCore.text[0] = global.player.mabel ? "The resemblance is uncanny." : "It's like looking in a mirror.";

m_act_before_check = function(_attempted_action)
{
    obj_battleCore.text[1] = string_concat("You were about to ", _attempted_action, " #but you realised you know #nothing about these ", (clone_number == 2) ? "things" : "ones", ".");
    obj_battleCore.text[0] = global.player.mabel
        ? string_concat("In honor of your dear brother, #whose image ", (clone_number == 2) ? "this is" : "these are", ", #you should exercise caution.")
        : string_concat("You should exercise caution.&", (clone_number == 2) ? "He is" : "They are", " made in your own image, #after all.");
}
