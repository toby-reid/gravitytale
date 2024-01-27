/// @description textBubble
bubble = instance_create_layer(x+40,y,"Instances",obj_textBubble)
if !spare bubble.text[0] = "(aggres-\nsive quacking)"
else bubble.text[0] = "(pacified quacking)"