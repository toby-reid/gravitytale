///@desc Feed
if at > 1 {
	at--
	obj_battleCore.text[1] = "You gave the Cat. 3 a light #morsel!&Its AT went down!"
	obj_battleCore.text[0] = "Too bad a Cat. 3 can never be #fully satiated."
}
else obj_battleCore.text[1] = "You gave the Cat. 3 a snack, #but no matter how much it eats, #it will never be satisfied."