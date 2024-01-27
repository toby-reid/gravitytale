///@desc Create text bubble
bubble = instance_create_layer(x+40,y-32,"Instances",obj_textBubble)
if image_alpha == 1 if hug < 0 or obj_enemy_scb_beaver.hp<=0 bubble.text[0] = "(sad Beaver noises)"
else if instance_number(obj_enemy_scb_beaver) > 1 {
	if global.enemy[0] == id bubble.text[0] = "We're still beavers"
	else bubble.text[0] = "That deserves a hug"
}
else bubble.text[0] = "(happy Beaver noises)"