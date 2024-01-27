/// @description Suck Up
bubbleText = "trying too hard: -10 suck-up points"
index = spr_stans_head_sly
obj_battleCore.text[1] = "You try sucking up to Grunkle #Stans, but he's not buying it."
if stage == 3 {
	bubbleText = "trying *way* too hard: +100 suck-up points"
	index = spr_stans_head_joke
	obj_battleCore.text[1] = "You suck up to Grunkle Stans.&He is pleased with your #performance."
	obj_battleCore.text[0] = "Grunkle Stans is thinking of #doing one of those \"bonding-#type\" deals."
	stage++
}