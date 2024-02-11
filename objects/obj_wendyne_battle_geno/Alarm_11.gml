/// @description Just changed, you're screwed.
bubble = instance_create_layer(x+60,y-120,layer,obj_textBubble);
with bubble {
	text = [
		"Never think you've outsmarted a Corduroy.",
		"See, I knew how easily you destroyed my friends.",
		"You think I'd come unprepared?",
		"No, I had the old kook make me a potion.",
		"With this... with my determina- tion...",
		"I will make sure you never leave these caves.",
		"I will make sure you        (ach)          never end another life.",
		"(Man, it hurts...)"
	];
	for(var i = 0; i < array_length(text); i++) sound[i] = tlk_wendy;
	image_index = 1;
}
geno = true;
timer = 120; // just to avoid resetting the battlebox