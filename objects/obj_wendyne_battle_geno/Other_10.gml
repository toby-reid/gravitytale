/// @description Flash! Cool, huh??
sprite_index = spr_wendyne_geno_dying;
alarm[11] = 60;
alpha = 0;
maxhp = 100000;
hp = maxhp;
at = 9;
check = "The strongest person in town.&Can chop anything, even you.";
obj_battleCore.text[0] = "The true battle begins.&The wend is howling.";
audio_stop_all();
instance_destroy(obj_textBubble);