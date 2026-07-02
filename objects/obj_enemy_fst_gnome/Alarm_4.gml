/// @description Text Bubble
bubble = instance_create_layer(x+40,y,"Instances",obj_textBubble)
bubble.text[0] = choose(string_concat("Seeking the Queen of ", choose("Spades","Hearts","Diamonds","Clubs")),"I am a: Gnome","Inter-#ested #in: #Queens");