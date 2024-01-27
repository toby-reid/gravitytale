/// @description Hair
if instance_number(obj_enemy_cav_ghost) == 1 {
	if !spare {
		obj_battleCore.text[1] = "You crack a joke about the #Cat. 2's hair.&It is not amused."
		obj_battleCore.text[0] = "What did you say about my #hair??"
		spare = true
	}
	else {
		obj_battleCore.text[1] = "Seems like a touchy subject.&Let's not dig deeper."
	}
}
else if instance_find(obj_enemy_cav_ghost,0) == id {
	obj_battleCore.text[1] = "You tried to make a comment on #the Cat. 2's hair, but it was #too busy combing it."
}
else {
	obj_battleCore.text[1] = "???&What hair?"
}