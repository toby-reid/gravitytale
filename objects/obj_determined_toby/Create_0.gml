alarm[0] = irandom(59)+1
//global.player[player.pic]
stage = 0
alpha = 0
if !variable_global_exists("toby") global.toby = 0//1 if took his trade, 2 if took Jimenez's trade
else if global.toby > 0 stage = 7
if global.player[player.runActive] == 2 if global.toby > 0 or !global.player[player.pic] instance_destroy()

global.player[player.pic] = true