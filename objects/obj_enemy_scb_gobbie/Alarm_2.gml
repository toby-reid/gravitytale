/// @description Hambone
if stage == 0 {
	obj_battleCore.text[1] = "You hambone a message...&You don't know what you said, #but it becomes friendlier."
	obj_battleCore.text[0] = "Gobblewonkie seems to trust you #now."
	stage++
}
else {
	obj_battleCore.text[1] = "You hambone a message...                   &What?&"+choose("You want 5 kg of raw seaweed?","You want to conquer France?","The porcupines have concubines?","You need sunscreen by sundown?","You like McGucket's smell?","You'll invade Russia in winter?")
	obj_battleCore.text[0] = "You don't know what you're #doing.&Maybe you should quit Hambone."
}