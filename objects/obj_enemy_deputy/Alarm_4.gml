/// @description Bubble
bubble = instance_create_layer(x+40,y-100,"Instances",obj_textBubble_old)
if global.enemy_killed[ENEMY.SHERIFF] bubble.text[0] = ". . ."
else bubble.text[0] = bubbleText