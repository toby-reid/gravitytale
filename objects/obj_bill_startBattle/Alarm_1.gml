/// @description Onslaught.
if timer < 20 {
	with instance_create_layer(x+38 - 74*(timer mod 2),y+8,"Instances",obj_bill_laser) {
		if other.timer < 6 dir = 180*(x<320)
		else if other.timer < 10  dir = irandom(90) -45 +180*(x<320)
		spd = 15
	}
	alarm[1] = 30
	timer++
	if timer == 20 alarm[1] = 300
}
else {
	with instance_create_layer(x+40,y,"Instances",obj_textBubble_old) {
		if global.player.hp == global.player.maxHp {
			text = [
				"Ha ha... #hahahahaha!",
				"You don't need #my guidance at #all, do you?",
				"You know #exactly what #you're doing #here.",
				"You've been #through all #this too many #times to #count.",
				"But don't get #cocky, kid.",
				"You wouldn't #last a day out #there without #@aa0000my @000000power.",
				"The only #reason you're #even alive #here is #because of me.",
				"But hey, my #usual deal #still stands!",
				"I'm sure you #know what to #do.",
				"Go get 'em, #Tiger!",
				"And remember -",
				"Reality is an #illusion!",
				"The universe #is a hologram!",
				"Buy gold!",
				"Byyyyyyyyyye!"
			]
			head = [
				spr_bill_face_laugh,
				spr_bill_face_smile,
				spr_bill_face_neutral,
				spr_bill_face_neutral_side,
				spr_bill_face_disinterest,
				spr_bill_face_hollowEye,
				spr_bill_face_hollowEye,
				spr_bill_face_smile,
				spr_bill_face_neutral,
				spr_bill_face_smile,
				spr_bill_face_neutral//and remember -
			]
			other.stage++
		}
		else {
			text = [
				"Do you #understand #yet, kid?",
				"This is @aa0000my #@000000domain.",
				"Against me, #you're #powerless.",
				"But hey, I'm #not just some #heartless #monster!",
				"...Just #insane!",
				"I'm willing #to offer you #a deal.",
				"See, I was #meant to #regain full #power with #a... certain #deal I made #recently.",
				"Unfortunately, #they didn't #hold up their #end of the #bargain,",
				"and they paid #the price for #it.",
				"So that, @1970FFPine #Tree@000000, is where #you come in!",
				"Somewhere in #this valley #lies a rip in #the inter-#dimensional #barrier.",
				"All you need #to do is find #it and destroy #its container!",
				"Seems easy #enough, eh, #kid?",
				"Follow #through, and #whatever you #want -",
				"Money, fame, #riches, #infinite #power... your #own galaxy, #even!",
				"- it's yours, #just like #that.",
				"I could even #bring back #your @CC277Asister@000000!",
				"You want that #more than #anything, #don't you?",
				"Seems like a #pretty good #deal, if you #ask me.",
				"And, if you #order now, #I'll throw in #a second perk, #absolutely #free!",
				"All you have #to pay for is #the shipping!",
				"That bonus #is... an #ability unlike #any other!",
				"Any time you #die or rest, #you can return #to a previous #point in time!",
				"You can start #over, retry, #Reset as many #times as you #want!",
				"How's that for #a prize, eh, #kid?",
				"Just look for #my little #yellow @aaaa00time #rifts@000000, and #you'll know #what to do.",
				"Anything #confuse your #tiny human #mind, @1970FFPine #Tree@000000?",
				"You're dumber #than you look, #kid!",
				"No, no, that's #an achieve-#ment! - I #didn't even #think that was #possible!",
				"Anyway, kid, #you just gotta #do some #exploring.",
				"Just follow #the main path #your lazy #programmer #was willing #to make!",
				"It probably #wouldn't hurt #to acquire #some allies #along the way #too, ya know?",
				"Some of them #are bound to #have some #useful #information.",
				"Just remember #to use my @aaaa00time #rifts @000000to SAVE #and LOAD your #progress.",
				"If you don't #do that, I'll #have to bring #you all the #way back to #now if you die #or quit.",
				"Well, then, #you should be #all set.",
				"Time to get #back out #there, kid.",
				"You've been #slipping in #and out of #your world for #a whole week!",
				"Question Mark #has been #worried sick!",
				"And remember -",
				"Reality is an #illusion!",
				"The universe #is a hologram!",
				"Buy gold!",
				"Byyyyyyyyyye!"
			]
			if (self.completed_routes > 0) {
				text[5] = "I'm still #willing to #offer you #that deal."
				text[6] = "Remember, I #was meant to #gain full power #with a... #certain deal."
			}
			if global.player.mabel {
				text[7] = "Unfortunately, #they failed #partway #through their #mission,"
				text[9] = "So that, #@CC277AShooting Star@000000, #is where you #come in!"
				text[14]= "Money, fame, #riches... #friends who dote #over your #every action, #even!"
				text[16]= "I could even #bring you to #your @1970FFbrother@000000!"
				text[26]= "Anything #confound your #hyperactive #mind, @CC277AShooting #Star@000000?"
			}
			head = [
				spr_bill_face_neutral,
				spr_bill_face_hollowEye,
				spr_bill_face_disinterest,
				spr_bill_face_neutral,
				spr_bill_face_smile,
				spr_bill_face_disinterest,
				spr_bill_face_neutral_side,
				spr_bill_face_disinterest,
				spr_bill_face_hollowEye,
				spr_bill_face_smile,
				spr_bill_face_neutral,
				spr_bill_face_neutral,
				spr_bill_face_smile,
				spr_bill_face_neutral,
				spr_bill_face_neutral,
				spr_bill_face_neutral,
				spr_bill_face_hollowEye,
				spr_bill_face_disinterest,
				spr_bill_face_neutral,
				spr_bill_face_smile_side,
				spr_bill_face_smile,
				spr_bill_face_disinterest,
				spr_bill_face_neutral,
				spr_bill_face_disinterest,
				spr_bill_face_smile,
				spr_bill_face_neutral,
				spr_bill_face_neutral,//Yes or no?
				spr_bill_face_smile_side,
				spr_bill_face_smile,
				spr_bill_face_neutral,
				spr_bill_face_neutral_side,
				spr_bill_face_neutral,
				spr_bill_face_neutral_side,
				spr_bill_face_neutral,
				spr_bill_face_disinterest,
				spr_bill_face_neutral_side,//all set!
				spr_bill_face_neutral,
				spr_bill_face_neutral,
				spr_bill_face_smile_side,
				spr_bill_face_neutral//and remember -
			]
			sound[10] = tlk_bill//needed to prevent breaking when skipping text
			charRate[10] = .5
			font[10] = fnt_bill_bubble
			style[10] = 2
		}
	}
	path_start(pth_float,.1,path_action_continue,false)
	audio_stop_sound(mus_bestFriend)
	stage++
}