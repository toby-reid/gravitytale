/// @description Bill's message
with instance_create_layer(160,192,layer,obj_textbox) {
	var soul = global.player.mabel ? "@CC277AShooting Star@ffffff" : "@1970ffPine Tree@ffffff";
	var sibling = global.player.mabel ? "@1970ffbrother@ffffff" : "@CC277Asister@ffffff";
	if global.player.genocide == RUN.ACTIVE and scr_getRouteCompletions(ROUTES.GENOCIDE) > 0 {
		text = [
			"Ah hahahahaha!&Hahaha!",
			"Oh, it's beautiful...&Kid, you were beautiful #back there!",
			"We destroyed everything #in the last world, but #that just wasn't enough!",
			"No, you just had to do #it all again...&Over and over and over!",
			"Or, wait...",
			"Did you think something #would be different this #time?",
			"Did you think you could #still save your "+sibling+" #this way?",
			"Hah!&Time doesn't work that #way, kid!",
			"As long as everything #stays the same, every #factor stays in check...",
			"Everyone will say the #same stuff, die the #same way...",
			"I think we both know #where this is going!",
			"Keep it up, "+soul+"!&I look forward to it!",
			"This should be fun!",
			"Don't die out there, kid!"
		]
		head = [
			spr_bill_face_laugh,
			spr_bill_face_smile,
			spr_bill_face_neutral_side,
			spr_bill_face_smile,
			spr_bill_face_mad_side,
			spr_bill_face_neutral_side,
			spr_bill_face_hollowEye,
			spr_bill_face_mad,
			spr_bill_face_neutral,
			spr_bill_face_neutral_side,
			spr_bill_face_smile,
			spr_bill_face_laugh,
			spr_bill_face_neutral,
			spr_bill_face_neutral
		]
		charRate[8] = 3
		charRate[9] = 4
		sound[9] = tlk_bill_creepy
	} else if global.player.genocide == RUN.ACTIVE {
		text = [
			"Ah hahahahaha!&Hahaha!",
			"Kid, you're one in a #Bill-ion!",
			"That was absolutely #beautiful!",
			"You killed them all!",
			"They're dead - #every single one of them!",
			"And not just the men -``#but the women...``#and the children, too!",
			"They're only animals, #and you slaughtered them #like animals!",
			"Keep it up, #"+soul+"!",
			"You'll have our problem #solved in no time!",
			"This should be fun!",
			"Don't die out there, kid!"
		]
		if global.player.mabel text[6] = "You have a real gift #for doing what you want, #no regards for others!"
		head = [
			spr_bill_face_laugh,
			spr_bill_face_smile,
			spr_bill_face_smile_side,
			spr_bill_face_smile,
			spr_bill_face_neutral,
			spr_bill_face_hollowEye,
			spr_bill_face_smile,
			spr_bill_face_laugh,
			spr_bill_face_neutral_side,
			spr_bill_face_neutral,
			spr_bill_face_neutral
		]
	} else if global.enemy_spared[ENEMY.SOOS] and scr_getKillCount(ENEMY.SOOS) >= 1 {
		text = [
			"Well, howdy, #"+soul+"!",
			"So ya messed up.",
			"You killed the one guy #you weren't supposed to,",
			"and you came back just #to retry that.",
			"But hey, I'm glad you #understand the value #of my power!",
			"Isn't it nice to be able #to re-LOAD, to redo, #to retry your mistakes?",
			"Well, keep this up, kid!&It doesn't matter how #many times you Reset!",
			"You'll figure out our #problem eventually!",
			"I can't wait to see #where this ends up!",
			"Don't die out there, kid!"
		]
		head = [
			spr_bill_face_smile,
			spr_bill_face_disinterest_side,
			spr_bill_face_disinterest,
			spr_bill_face_disinterest,
			spr_bill_face_smile_side,
			spr_bill_face_smile,
			spr_bill_face_neutral,
			spr_bill_face_neutral_side,
			spr_bill_face_smile,
			spr_bill_face_neutral
		]
	} else if global.enemy_killed[ENEMY.SOOS] and scr_getKillCount(ENEMY.SOOS) > 1 {
		text = [
			"Well, hey there, #"+soul+"!",
			"You truly are the lowest #scum in history!",
			"I mean, even I have my #standards, and you've #gone way beyond that!",
			"But I won't lecture you -``#heck, that's exactly #what LOADing is for!",
			"Just don't get carried #away, kid.",
			"Looping gets old pretty #quickly.",
			"It should be interesting #to see what you do with #it though!",
			"Don't die out there, kid!"
		]
		head = [
			spr_bill_face_neutral_side,
			spr_bill_face_disinterest,
			spr_bill_face_neutral_side,
			spr_bill_face_neutral,
			spr_bill_face_disinterest,
			spr_bill_face_disinterest_side,
			spr_bill_face_neutral_side,
			spr_bill_face_neutral
		]
	} else if global.enemy_killed[ENEMY.SOOS] and scr_getSpareCount(ENEMY.SOOS) >= 1 {
		text = [
			"Well, howdy indeed, #"+soul+"!",
			"I gotta say, I was not #expecting that!",
			"I guess ya didn't mean #to Spare the @74B285big guy #@ffffffafter all, eh?",
			"Man, what a perfect use #of my power!",
			"I wouldn't have it any #other way, kid!",
			"Keep it up!&Throw in some chaos #along the way!",
			"This will be fun!",
			"Don't die out there, kid!"
		]
		head = [
			spr_bill_face_smile,
			spr_bill_face_smile_side,
			spr_bill_face_smile,
			spr_bill_face_neutral_side,
			spr_bill_face_smile,
			spr_bill_face_smile_side,
			spr_bill_face_smile,
			spr_bill_face_neutral
		]
	} else if global.player.kills == 0 {
		text = [
			"Well, hey there, #"+soul+"!",
			"That was some impressive #maneuvering out there!",
			"You got past a bunch of #tiny island animals #without killing any!",
			"I bet you feel very #proud!",
			"But they'll quickly get #more powerful, kid.",
			"You think @74B285Question Mark #@ffffffwas bluffing?",
			"He only wanted to #protect ya!",
			"And even now, for your #sake, he's taking you #straight to his @993D3Dboss@ffffff,",
			"so he can keep you safe.",
			"Oh, but you think you #can Spare them all, #don't you?",
			"You think you're some #hero who can save the #world yourself?",
			"Well...&We shall see.",
			"Don't die out there, kid!"
		]
		head = [
			spr_bill_face_neutral_side,
			spr_bill_face_disinterest_side,
			spr_bill_face_neutral,
			spr_bill_face_smile,
			spr_bill_face_disinterest,
			spr_bill_face_neutral,
			spr_bill_face_neutral_side,
			spr_bill_face_neutral,
			spr_bill_face_neutral,
			spr_bill_face_smile,
			spr_bill_face_smile,
			spr_bill_face_mad,
			spr_bill_face_neutral
		]
	} else if global.enemy_killed[ENEMY.SOOS] and global.player.kills == 1 {
		text = [
			"Ha...!&Hahahahahahaha!",
			"Oh, oh, that was #beautiful, kid!",
			"You really showed the @74B285big #guy @ffffffnot to mess with ya!",
			"He who saved your life, #who nursed you back to #health...",
			"He who wanted nothing #but to save you...",
			"You just did it without #second thoughts, eh?",
			"Point is, I like ya, kid!",
			"You'll do some great #things in life, ya know #that?",
			"I look forward to seeing #how this goes!",
			"Don't die out there, kid!"
		]
		head = [
			spr_bill_face_laugh,
			spr_bill_face_smile,
			spr_bill_face_smile_side,
			spr_bill_face_neutral_side,
			spr_bill_face_neutral,
			spr_bill_face_hollowEye,
			spr_bill_face_smile,
			spr_bill_face_smile_side,
			spr_bill_face_smile,
			spr_bill_face_neutral
		]
	} else if global.enemy_spared[ENEMY.SOOS] {
		text = [
			"Well, hey there, #"+soul+"!",
			"That was some reeeal #shonky business there!",
			"I mean, sure, you Spared #the guy who nursed you back to health...",
			"Eye for an eye and all #that...",
			"But what about those poor #innocent creatures you #mercilessly destroyed?",
			"How do you think @74B285Question #Mark @fffffffelt about that?",
			"Well, I guess it ain't #my place to say, eh, kid?",
			"I mean, you're still #holding up your end of #the deal, right?",
			"So I'll let you go for #now!",
			"I can't wait to see how #it all turns out!",
			"Don't die out there, kid!"
		]
		head = [
			spr_bill_face_neutral_side,
			spr_bill_face_disinterest,
			spr_bill_face_neutral_side,
			spr_bill_face_disinterest_side,
			spr_bill_face_hollowEye,
			spr_bill_face_neutral,
			spr_bill_face_neutral_side,
			spr_bill_face_disinterest,
			spr_bill_face_neutral,
			spr_bill_face_smile_side,
			spr_bill_face_neutral
		]
	} else if global.player.spares > 0 {
		text = [
			"Ah, the lazy route it is!",
			"You didn't even try, #did ya, kid?",
			"You just did whatever #was most convenient at #any given time!",
			"Oh, hey, I'm not judging!&I actually like the #attitude, kid!",
			"It's a cruel world.&Sometimes you gotta @ff0000kill #@ffffffor @ff0000be killed@ffffff.",
			"I look forward to seeing #how this goes!",
			"Don't die out there, kid!"
		]
		head = [
			spr_bill_face_neutral_side,
			spr_bill_face_smile,
			spr_bill_face_smile_side,
			spr_bill_face_neutral,
			spr_bill_face_disinterest_side,
			spr_bill_face_neutral,
			spr_bill_face_neutral
		]
	} else if global.player.spares == 0 {
		text = [
			"Ha ha...&Hahahahaha!",
			"It's funny how dumb #you are!",
			"You were going for #another route, weren't #you?",
			"But you couldn't even #figure out something as #simple as that!",
			"You gotta kill #@ff0000everything@ffffff, kid.",
			"But no, you just #destroyed what was placed #immediately before you!",
			"Well, lemme let you #in on a secret, #"+soul+".",
			"If you're strong enough, #Zodiac members will die #in a single hit!",
			"Do you get what I'm #saying, kid?",
			"Ya didn't have to make #the @74B285big guy @ffffffsuffer like #that,",
			"taking him down one #little hit at a time...",
			"See, that's what makes #me different from you:&It's a matter of @ffff00effort!",
			"You gotta @ffff00seek out @ffffffthe #creatures, kid!",
			"Keep killing 'til they #@ff0000stop coming@ffffff!",
			"Welp, I guess we'll just #see where this little #failure ends up.",
			"Don't die out there, kid!"
		]
		head = [
			spr_bill_face_laugh,
			spr_bill_face_smile,
			spr_bill_face_neutral_side,
			spr_bill_face_smile,
			spr_bill_face_hollowEye,
			spr_bill_face_disinterest,
			spr_bill_face_neutral_side,
			spr_bill_face_neutral,
			spr_bill_face_disinterest,
			spr_bill_face_smile,
			spr_bill_face_smile_side,
			spr_bill_face_smile,
			spr_bill_face_disinterest,
			spr_bill_face_disinterest_side,
			spr_bill_face_neutral_side,
			spr_bill_face_neutral
		]
	}
	sound[array_length(text)] = 0
	for(var i = 0; i < array_length(text); i++) {
		if sound[i] == 0 sound[i] = tlk_bill
		font[i] = fnt_bill_gui
		style[i] = 2
	}
}
audio_play_sound(mus_bestFriend,0,true)
stage++