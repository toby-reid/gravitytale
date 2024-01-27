/// @description Text Bubble
bubble = instance_create_layer(x+90,y-120,layer,obj_textBubble)
bubble.text = [choose("I SMELL... EMOTIONAL ISSUES","MAN, I'M TIRED","MAN-Y THANKS","PREPARE TO BE MAN- HANDLED","NICE TO MEAT YOU")]
if global.stage[1] == 1 if global.enemy[global.stage[2]] == id if global.stage[5] == 2 bubble.text[0] = "JERKY!!"