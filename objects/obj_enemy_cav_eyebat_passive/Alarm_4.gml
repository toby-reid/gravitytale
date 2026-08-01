/// @description Text Bubble
bubble = instance_create_layer(x+40,y-120,layer,obj_textBubble_old)
bubble.text = ["(Out of sight, out of mind)"]
if global.stage[0] == 4 if global.stage[1] == 0 if global.stage[4] > 0 bubble.text = ["(Aren't you a sight for sore eye...)"]