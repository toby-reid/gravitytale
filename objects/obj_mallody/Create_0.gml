// Inherit the parent event
event_inherited();

sprite = [spr_mallody,spr_mallody_talking];
buy = [ITEM_INDEX.PITT_COLA, ITEM_INDEX.POPSICLE, ITEM_INDEX.CHIPACKERZ, ITEM_INDEX.HAMSTICK];
talk = ["Meat Cute","Magicians","Hoo-Ha Owl's","Melody"];
msg = {
	l_greeting: "Hi!&Welcome to Meat Cute, #home of the original #Ham-on-a-Stick!",
	l_cantBuy: "Hey, I don't think I #can buy anything you #have...&Sorry about that...",
	l_thanks: "Thanks for visiting!",
	r_talkTopics: "What do you#want to#talk about?",
	l_talk: [
		[ // 0 - Meat Cute
			"Oh, this shop?&It's only the best #place in the whole #mall!",
			"Behold, Meat Cute!&Extreme lunch meats #are the food of the #future, you know.",
			"But...&Unfortunately, not #everyone feels the #same way...",
			"So recently, we've #been forced to sell #this other stuff...",
			"But you gotta try #our meat!&Trust me, it's to #die for!",
			"Look, it even comes #on a convenient #stick...&Just look at that #ingenuity...",
			"Unfortunately, we're #not allowed to give #out samples, but it's #so reasonably priced!",
			"I bet it's even in #your budget!&...not that I'm #calling you poor or #anything, of course!",
			"Um...&I'm just going to #stop talking while #I'm behind."
		],[ // 1 - Magicians
			"Never date a #magician.&I shouldn't have to #tell you why."
		],[ // 2 - Hoo-Ha Owl's
			"Oh, you mean the #best restaurant of #all time??&Of course I've #heard of it!",
			"(Suddenly, her entire #persona brightened up #dramatically...)",
			"I loved going there #as a kid!&But...&Now, as an adult...",
			"I'd just feel kinda #weird on my own, #you know?",
			"Hey, if you know #anyone who loves #Hoo-Ha Owl's as much #as I do, give me a #call.",
			"But he's gotta be a #nice guy, of course.",
			"(Hey, maybe Soos #would be interested, #you know?&(He probably likes #creepy robots...)",
			"(That wasn't a hint, #by the way...&(Don't go #backtracking for no #reason.)",
			"Wait...&You haven't ever been #to Hoo-Ha Owl's #Pizzamatronic #Jamboree, huh...",
			"(Uh-oh...&(Looks like she's #plotting something.)",
			"(Let's end this line #of questioning #before we get roped #into something, #shall we?)"
		],[ // Melody
			"Oh, you wanna talk #about me...?&Well, uh...&I'm Melody...",
			"I work here at Meat #Cute...&But it's only #temporary, #unfortunately...",
			"I'm going back home #to Portland in a few #weeks.",
			"...you wanna know #more...?&Okay...&I'm... single, #I guess...",
			"(Poor Mall-ody is #struggling to find #something to say.&(Let's back off.)"
		]],
	l_talkGenocide: [
		"Ha ha ha...&But what would I ever #have to say to #you...?",
		"Nope...&Everyone else is gone.&You know why?",
		"You, sir, have #killed every creature #in the forest.",
		"Mr. Pines - the #eccentric one - says #he has a plan to stop #you...&So prepare yourself.",
		"...&Who, me?&Try to stop you?&Ha...&No.",
		"We both know you'd #destroy me in an #instant, like #everyone else...",
		"Now, please, either #buy something or #leave me alone.",
		"(I guess she had #quite a bit to say #to you after all...)" ],
	r_sellFor: "I'd buy#that for"
};
if (global.enemy_killed[ENEMY.SOOS]) msg.l_topic2[6]       = "(What a shame...&(Soos probably loved #that place...)";
if (global.enemy_killed[ENEMY.FORD]) msg.l_talkGenocide[3] = "Mr. Pines - the #tricky one - has #already evacuated #everyone else...";
text[0] = msg.l_greeting;
if(!variable_global_exists("hamstick")) global.hamstick = false;
if(!global.hamstick) {
	msg.l_topic0[6] = "Oh, but you probably #can't afford it, #huh...?";
	msg.l_topic0[7] = "Not that I'm calling #you poor or anything, #of course!!";
	msg.l_topic0[8] = "...&Just...&Take a sample and #go... please.";
	msg.l_topic0[9] = "(Got the Ham-on-a-#Stick for free!&(Probably shouldn't #push your luck for #more.)";
}