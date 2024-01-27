/// @description Talk
talk++
switch talk {
	case 1:
		bubbleText = ["i'm supposed #to be #investigating #something..."]
		obj_battleCore.text[1] = "You ask Blendin why he's here."
		obj_battleCore.text[0] = "Blendin seems to want to keep #talking."
		break
	case 2:
		bubbleText = ["apparently, #there'll be a #bunch of time #anomalies here #soon...","something #about \"game #saving\" and #loading?"]
		obj_battleCore.text[1] = "You inquire further."
		obj_battleCore.text[0] = "Blendin is opening up more."
		break
	case 3:
		bubbleText = ["problem is, #i don't know #where, when, #or who..."]
		obj_battleCore.text[1] = "You take out a pen and paper."
		obj_battleCore.text[0] = "It seems Blendin isn't done #yet."
		break
	case 4:
		bubbleText = ["i don't know #if it's some #kind of #paradox..."]
		obj_battleCore.text[1] = "You start writing notes."
		obj_battleCore.text[0] = "Blendin wants to keep talking."
		break
	case 5:
		bubbleText = ["or maybe i'm #just really #tired..."]
		obj_battleCore.text[1] = "You ask if this will be on #the test."
		obj_battleCore.text[0] = "Blendin's still not done #talking."
		break
	case 6:
		bubbleText = ["hey, you seem #pretty #competant...","think you can #do me a favor?"]
		obj_battleCore.text[1] = "You fill out one notebook and #start writing in another."
		obj_battleCore.text[0] = "Blendin's starting to trust #you."
		break
	case 7:
		bubbleText = ["just tell me if #you see #anything, ok?"]
		obj_battleCore.text[1] = "You prepare to write his #request in your calendar."
		obj_battleCore.text[0] = "Blendin wants to show you #something."
		break
	case 8:
		bubbleText = ["here, let me #show you #something...","i call it #notso bland","hope you like #it..."]
		obj_battleCore.text[1] = "You wait patiently for #Blendin's big reveal."
		obj_battleCore.text[0] = "Blendin sees you as a friend."
		spare = true
		sprite_index = spr_blendin_battle_blank
		break
	default:
		obj_battleCore.text[1] = "It seems Blendin is done #talking."
		break
}