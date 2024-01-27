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
				event_user(1);
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
					"No, the customer is #not always right.",
					"The program is.",
					"And it seems the pro-#gram has prepared a #special hell for peo-#ple like you.",
					"Good luck with her #when you reach the #tent, child."
				];
				buy = [buy[0],buy[1],buy[2]];
				talk = [talk[0],talk[1],talk[2]];
				text[0] = dialogue[0];
				audio_play_sound(sfx_select,0,false);
				charCount = 0;
			}
		}