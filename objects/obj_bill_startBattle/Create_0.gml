hp = 1
stage = 0
timer = 0;
wheel = [0,25,0]//Size, frame speed, frame
completed_routes = scr_getRouteCompletions();
with instance_create_layer(x+40,y,"Instances",obj_textBubble) {
	var col = (global.player.mabel) ? "@CC277A" : "@1970FF"; 
	var soul = (global.player.mabel) ? "pink star" : "blue tree";
	switch completed_routes
    {
		case 0://first playthrough
			text = [//Make sure to adjust Draw GUI stage 1 to reflect array_length
				"Welcome back, #kid!",
				"You see that #" + col + soul + " #@000000there?",
				"Yeah, the one #right there in #the middle of #the battlebox!",
				"Well, that's #what we like #to call a #" + col + "SOUL@000000.",
				"It's the #physical #manifestation #of your true #being!",
				"Not everyone #has one like #yours, #ya know!&You should #feel special!",
				"Say, let's see #what your #" + col + "special SOUL #@000000can do!"
			]
			head = [
				spr_bill_face_neutral,
				spr_bill_face_neutral,
				spr_bill_face_neutral_side,
				spr_bill_face_neutral,
				spr_bill_face_neutral,
				spr_bill_face_smile,
				spr_bill_face_smile_side
			]
			break
		case 1://done it once
			text = [
				"Welcome back, #kid!",
				"I'm sure #you're aware #of what we're #doing here.",
				"Say, I bet #you're curious #why your " + col + "SOUL #@000000is different, #eh?",
				"See, not #everyone knows #the true power #they possess!",
				"I'm sure you #saw it last #time:",
				"They just #stand there #and take the #beating!",
				"They don't #even try to #dodge!",
				"Hilarious, #isn't it?",
				"Oh yeah, #speaking of #dodging..."
			]
			head = [
				spr_bill_face_neutral,
				spr_bill_face_neutral_side,
				spr_bill_face_smile_side,
				spr_bill_face_neutral,
				spr_bill_face_neutral_side,
				spr_bill_face_neutral_side,
				spr_bill_face_smile_side,
				spr_bill_face_smile,
				spr_bill_face_neutral_side
			]
			break
		default://multiple completions
			text = [
				"Welcome back, #kid!",
				"I'm sure you #know exactly #where this is #going, so I'll #just skip #straight #to it."
			]
			head = [
				spr_bill_face_neutral,
				spr_bill_face_disinterest
			]
			break
	}
	//for(var i = 0; i < array_length(text); i++) {font[i] = fnt_bill_bubble; style[i] = 2}
	//image_index = 1
}
path_start(pth_float,.1,path_action_continue,false)

image_xscale = 2
image_yscale = 2
x = 320
y = 128
instance_destroy(obj_battleButtons)
global.stage[0] = 4
obj_soul.x = 320
obj_soul.y = 320