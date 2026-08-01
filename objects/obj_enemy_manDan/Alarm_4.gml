/// @description Bubble
if instance_exists(obj_textBubble_old) or !instance_exists(obj_enemy_tyler) {
	bubble = instance_create_layer(x+120,y-120,"Instances",obj_textBubble_old)
	attack = irandom(3)//0 axe, 1 fists, 2 bad meat, 3 pancakes
	if instance_exists(obj_enemy_tyler) if obj_enemy_tyler.attack == 0 attack = irandom(2)+1
	switch attack {
		case 0: bubble.text[0] = "THE MANLY AXE FOR THE MANLY HAND" break
		case 1: bubble.text[0] = "IN YOUR FACE!" break
		case 2: bubble.text[0] = "THESE KEGS ARE FULL OF MEAT!" break
		case 3: bubble.text[0] = "MANCAKES FOR EVERYONE!" break
	}
}
else alarm[4] = 1