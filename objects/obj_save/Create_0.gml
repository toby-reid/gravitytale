///@desc rmName,text,music,loc
rmName = "???"
text = "(You are filled with #DEDICATION.)"
if global.player[player.mabel] text = "(You unleash your #IMAGINATION.)"
music = silence
loc = area.unknown
//Assign ^^^ at creation!

size = 0
save = 0//0 nothing; 1 "anticipation" (textbox), 1/2 Save/Return; 3 (brief) "Saved"; 4 shrinking
ybox = 0

//if variable_global_exists("load") if global.load scr_load()