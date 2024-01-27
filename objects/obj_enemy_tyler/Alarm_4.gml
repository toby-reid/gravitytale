/// @description Bubble
bubble = instance_create_layer(x+30,y-40,"Instances",obj_textBubble)
if !global.killed[enemy.manlydan] {
	if distracted == 0 bubble.text[0] = "Gyit 'em...\nGyit 'em...!"
	else bubble.text[0] = "Oh, I've got to see this!"
}
else {bubble.text[0] = "Gyit 'im...\nGyit 'im..."; bubble.charRate[0] = .25}

if instance_exists(obj_enemy_manDan) if obj_enemy_manDan.hp < obj_enemy_manDan.maxhp attack = irandom(3)//0 support, 1 buff, 2+ heal
else attack = irandom(1)