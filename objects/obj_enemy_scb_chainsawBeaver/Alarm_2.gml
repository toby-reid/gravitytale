/// @description Picture
if !global.player[player.pic] obj_battleCore.text[1] = "You take a picture of a Beaver #with a chainsaw.&This may sell for big!"
else obj_battleCore.text[1] = "You take a picture of a Beaver #with a chainsaw.&You already had one."
obj_battleCore.text[0] = "You store the picture in your #vest pocket."
global.player[player.pic] = true