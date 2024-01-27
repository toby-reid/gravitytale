// Inherit the parent event
event_inherited();

if(!global.karen)
	if(stage == 1)
		if(choice[1] == 3) {
			armor++;
			if(armor == 2) {
				charCount = 0;
				stage = 0;
				text[0] = msg[0];
			}
			else if(armor == 3) {
				global.karen = true;
				audio_stop_sound(sfx_glass);
				stage = 5;
				dialogue = [
					"(...!)",
					"For the love of #BABBA, child, what #do you suppose you #are accomplishing?",
					"No matter how many #times you attempt to #purchase that armor, #it's too expensive #for you.",
					". . .",
					"No, the customer is #@ffff00not @ffffffalways right.",
					"The program is.",
					"And it seems the pro-#gram has prepared a #special hell for peo-#ple like you.",
					"Good luck with @ff69b4her@ffffff #when you reach the #@ffb6c1tent@ffffff, child."
				];
				buy = [buy[0],buy[1],buy[2]];
				text[0] = dialogue[0];
				audio_play_sound(sfx_select,0,false);
				charCount = 0;
			}
		}