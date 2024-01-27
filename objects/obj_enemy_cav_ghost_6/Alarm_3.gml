/// @description Deny
if attention > 0 attention--
if attention == 0 {
	obj_battleCore.text[1] = "You firmly tell the Cat. 6's #that you did not, in fact, #summon them."
	obj_battleCore.text[0] = "They finally relent and agree #to back off."
	spare = true
}
else if attention == 1 {
	obj_battleCore.text[1] = "You insist you had nothing to #do with the Cat. 6's being in #this world."
	obj_battleCore.text[0] = "They back off until they can #figure out this dilemma."
}
else {
	obj_battleCore.text[1] = "You deny having summoned the #Cat 6's.&They give you a doubtful look."
	obj_battleCore.text[0] = "Keep denying it.&They'll figure it out #eventually."
}