/// @description Bubble
bubble = instance_create_layer(x+60,y-80,"Instances",obj_textBubble)
if global.enemy_killed[ENEMY.DEPUTY] bubble.text[0] = "Durland...!\nMy precious Deputy Durland!"
else bubble.text[0] = bubbleText

//Add more dialogue depending on Stage