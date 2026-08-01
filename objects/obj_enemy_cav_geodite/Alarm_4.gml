/// @description Text Bubble
bubble = instance_create_layer(x+50,y+20,layer,obj_textBubble_old)
if hp > 1 bubble.text = ["(High-\npitched chirping and humming sounds)"]
else bubble.text = ["(Low-\npitched chirping and humming sounds)"]