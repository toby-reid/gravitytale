/// @description Stall
if act[3] == "Stall" {
	obj_battleCore.text[1] = "You try to stall for time.&It doesn't work, so you cry...&I guess that's a cry-stall."
	obj_battleCore.text[0] = "What, you think I did \"Stall\" #just for the pun?                                  &...you're correct."
	act[3] = "Song"
}
else if !spare {
	obj_battleCore.text[1] = "You listen to Geodite's tune.&Seems more are gathering around #your feet."
	obj_battleCore.text[0] = "Geodite has become pacified.&Its mates encourage it from #around your feet."
	spare = true
}
else if hp == 1 obj_battleCore.text[1] = "You were going to listen to #Geodite's tune, but it's too #weak to cry out."
else obj_battleCore.text[1] = "You were going to listen to #Geodite's tune, but it is done #chirping and humming."