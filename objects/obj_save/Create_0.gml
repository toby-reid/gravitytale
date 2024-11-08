///@desc rmName,text,music,loc
rmName = "???"
text = global.player.mabel ? "(You unleash your #IMAGINATION.)" : "(You are filled with #DEDICATION.)";
music = silence
loc = AREA.UNKNOWN;
//Assign ^^^ at creation!

size = 0
save = 0//0 nothing; 1 "anticipation" (textbox), 1/2 Save/Return; 3 (brief) "Saved"; 4 shrinking
ybox = 0
time = "00:00:00";

//if variable_global_exists("load") if global.load scr_load()