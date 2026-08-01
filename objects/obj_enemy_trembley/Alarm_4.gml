/// @description Bubble
bubble = instance_create_layer(x+80,60,layer,obj_textBubble_old)
with bubble {
	text[0] = choose("This is going #to take the #silliest #plan ever #conceived!","I ate a #salamander #and jumped out #the window!","Let's reset #the puzzle #and try #again!","Is that my #third wife?     #Sandy?","Put up your #dukes, you #bald fiend!","This is a #dark day for #America!")
	style[0] = 4
	image_index = 1
}