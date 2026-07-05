// Inherit the parent event
event_inherited();

sprite = [spr_multiware,spr_multiware_talking];
buy = [ITEM_INDEX.POPSICLE, ITEM_INDEX.SMILE_DIP, ITEM_INDEX.PITT_COLA, ITEM_INDEX.MAGIC_ARMOR];
talk = ["Multibear","Manotaurs","Heads","Magic Armor"];
msg = {
	l_greeting: "Greetings, child, and #welcome to my lair.",
	l_cantBuy: "Hm.&Child, where are your #wares with no wear?&Bring those forth for #purchasing.",
	l_thanks: "A fine deal indeed.&Please, stay as long #as you'd like.",
	r_talkTopics: "And what is#it you'd#like to#discuss?",
	l_talk: [
		[ // 0 - Multibear
			"Yes, I am what you'd call the Multibear.",
			"We are many, yet we #are one.",
			"I wish I could tell #you more, but I'm not #truly certain myself.",
			"Together, we have #created a shop for #travelers like #yourself.",
			"We call it the Multi-#bear's Multiwares.&Quite clever, if I #must say so myself.",
			"Speaking of the shop, #though, I fail to see #how small talk earns #us money.",
			"Please, child, buy #something or move on."
		],[ // 1 - Manotaurs
			"The Manotaurs and I #do not have the best #of relationships, I'm #afraid.",
			"They all made fun of #me because I know all #the words to the song #\"Disco Girl.\"",
			"Ah, I see you, too #are familiar with the #Icelandic pop group #BABBA.",
			"That pleases me #greatly, child.&You have earned my #respect.",
			"Now, then, what is it #you wanted to buy?"
		],[ // 2 - Heads
			"Then I call tails, #child.&Ahah, eheh...&Just a small joke, #of course.",
			"My name is Bearnard.&Of my other six heads, #this is Bearandon, #Robearto, #Bearry the Chopper,",
			"Bearadley, #Bearian, #and, of course, #Jerry.",
			"No, unfortunately, #I was not the one to #name us.&It does help to #remember them though.",
			"Now, then, what is it #you wanted to buy?"
		],[ // 3 - Magic Armor
			"Hm...&Truly, I am uncertain #as to what, exactly, #it does.",
			"I discovered it many #years ago, when a #mute cross-dressing #child wandered #through here.",
			"Being an RPG shop-#keeper, I was com-#pelled to purchase #all his useless junk.",
			"I would dearly love #to part with it, but #it seems to be truly #magic...&Or cursed.",
			"As you may have #noticed, it adjusts #its own prices.",
			"I can't ever sell it #for less than what #it's listed for.",
			"So, child, the only #thing I can say is #that it is pointless #to look into.",
			"Now, then, what is it #you actually wanted #to buy?"
		]],
	l_talkGenocide: [
		"Oh, the small human #wishes to speak?",
		"I find it quite #ironic, child, that #between you and me, #they would likely #still consider me #the monster.",
		"But, of course, such is life.",
		"Now, then, I think we both know you're not here to chat.&What is it you wanted to buy?" ],
	r_sellFor: "I can buy#that for"
};
text[0] = msg.l_greeting;
if(!variable_global_exists("karen")) global.karen = false;//set to 'true' if Karen *can* be encountered.
armor = 0;
if (global.karen) {
	buy = [buy[0],buy[1],buy[2]];
	talk = [talk[0],talk[1],talk[2]];
}