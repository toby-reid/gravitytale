if !instance_exists(obj_textbox_old) {
	if instance_exists(obj_dipper) if obj_dipper.canMove {
		var dir = obj_dipper.dir
		var ybox = (y > (camera_get_view_y(view_camera[0]) + 140)) ? 48 : 192;
		if (place_meeting(x-2,y,obj_dipper) and dir==0) or (place_meeting(x,y+2,obj_dipper) and dir==1) or (place_meeting(x+2,y,obj_dipper) and dir==2) or (place_meeting(x,y-2,obj_dipper) and dir==3) {
			with instance_create_layer(160,ybox,"Instances",obj_textbox_old) {
				switch other.stage {
					case 0:
						text = [
							"Toby Determined,#Gravity Falls Gossiper.",
							"Our paper is small, #but our smiles are big, see?",
							"(You try to be polite, but this #goblin man is very frightening.&(Let's not talk.)"
						];
						other.stage++;
						break;
					case 1:
						text = [
							"Hm...&I'll be honest with you...",
							"Our paper has been dropping in #popularity since Shandra Jimenez #started broadcasting on TV...",
							"We're always looking for #exclusive content to stay #ahead, see?",
							"So if you have any @ffff00interesting #pictures@ffffff, I'd be glad to buy #them off you..."
						];
						if (global.player.beaverPic == BEAVER_PIC.CHAINSAW_BEAVER) {
							text[4] = "(Don't we have something like #that?&(Let's try showing him...)";
						}
						other.stage++;
						break;
					case 2:
						if (global.player.beaverPic == BEAVER_PIC.CHAINSAW_BEAVER) {
							text = [
								"(You reach into your vest #pocket, but the photo isn't #there.)",
								"Wow, this is a great photo!",
								"(...&(Looks like he stole it #anyway...)",
								"Are you willing to sell this #photo to me?#       Yes         No",
								"Aww...&I guess I'll try again later..."
							];
							choice[3] = 1;
							choice[5] = 1;
							charRate[5] = 4;
							charRate[6] = 4;
							charRate[7] = 1;
						} else {
							text = [
								"We're always looking for #exclusive content to stay #ahead, see?",
								"So if you have any @ffff00interesting #pictures@ffffff, I'd be glad to buy #them off you...",
								"We're looking for exclusive #pics...",
								"Like... I dunno...&beavers with dangerous tools, #for example..."
							];
						}
						break;
					case 7:
						if (global.player.beaverPic == BEAVER_PIC.SOLD_NEWSPAPER) {
							text = [
								"That petrified newspaper will #protect you, dropping damage #taken by half...",
								"For your convenience, I've #changed enemies' AT values in #your Journal...",
								"Now please go away...&I need to ponder my actions..."
							];
							for(var i = 0; i < array_length(text); i++) charRate[i] = 4;
						} else {
							text = [
								"Ohhh, Shandra Jimenez...!&How your presence makes my #heart ooze various liquids...!",
								"(...&(Let's get out of here...)"
							];
							charRate[0] = 4;
						}
						break
				}
				for (var i = 0; i < array_length(text); i++) {
					if string_copy(text[i],1,1) != "(" {
						charRate[i] = 4;
					}
				}
			}
		}
	}
} else if (obj_textbox_old.charCount >= string_length(obj_textbox_old.segText[array_length(obj_textbox_old.segText)-1])-10) {
	if (stage == 2 and array_length(obj_textbox_old.choice) > 3) if (obj_textbox_old.choice[3] == 1) {
		if obj_textbox_old.page == 3 {
			if obj_textbox_old.action[3] == 0 {
				obj_textbox_old.text[4] = "Great!&...&I don't have much moneywise...";
				obj_textbox_old.text[5] = "How about a trade instead?##       Yes         No";
				obj_textbox_old.text[6] = "Aww...&I guess I'll try again later...";
			}
		}
		if obj_textbox_old.page == 5 {
			if obj_textbox_old.action[5] == 0 {
				obj_textbox_old.text[6] = "Oh, thank you, sir!&I'll go and--";
				obj_textbox_old.text[7] = "Hold it right there!!";
				obj_textbox_old.setMove = false;
				stage++;
			}
		}
	}
	if stage == 4 and array_length(obj_textbox_old.choice) > 8 if obj_textbox_old.choice[8] == 1 {
		if obj_textbox_old.page == 8 {
			if obj_textbox_old.action[8] == 0 {//Toby's trade
				//don't add new DF item yet
				obj_textbox_old.text[9] = "Hmph.&I suppose the allure of mystery #weighs more than gold, hm?";
				obj_textbox_old.text[10] = "Well, then, I'll be off.&Congratulations on your prize, #Mr. Determined.";
				global.player.beaverPic = BEAVER_PIC.SOLD_NEWSPAPER;
			} else {
				global.player.money += 300;
				global.player.beaverPic = BEAVER_PIC.SOLD_CASH;
			}
			stage++;
		}
	}
}