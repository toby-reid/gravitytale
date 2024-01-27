/// @desc Bubble
bubble = instance_create_layer(x+40,y-60,"Instances",obj_textBubble)
if stage == 2 bubble.text[0] = "sad-\ndened \n"+choose("grunts","hambones")
else if spare and hp > 1 bubble.text[0] = "satis-\nfied \n"+choose("grunts","hambones")
else bubble.text[0] = "incomp-\nrehen-\nsible \n" + choose("grunts","hambones")