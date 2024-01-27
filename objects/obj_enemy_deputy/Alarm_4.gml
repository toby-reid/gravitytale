/// @description Bubble
bubble = instance_create_layer(x+40,y-100,"Instances",obj_textBubble)
if global.killed[enemy.sheriff] bubble.text[0] = ". . ."
else bubble.text[0] = bubbleText