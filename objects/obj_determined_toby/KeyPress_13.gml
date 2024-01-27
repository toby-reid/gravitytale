if !instance_exists(obj_textbox) { if instance_exists(obj_dipper) if obj_dipper.canMove {
	dir = obj_dipper.dir
	if y > camera_get_view_y(view_camera[0])+140 var ybox = 48
	else var ybox = 192
	if (place_meeting(x-2,y,obj_dipper) and dir==0) or (place_meeting(x,y+2,obj_dipper) and dir==1) or (place_meeting(x+2,y,obj_dipper) and dir==2) or (place_meeting(x,y-2,obj_dipper) and dir==3)
		with instance_create_layer(160,ybox,"Instances",obj_textbox) {
			switch other.stage {
				case 0:
					text = [
						"Toby Determined,#Gravity Falls Gossiper.",
						"Our paper is small, #but our smiles are big, see?",
						"(You try to be polite, but this #goblin man is very frightening.&(Let's not talk.)"
					]
					other.stage++
					break
				case 1:
					text = [
						"Hm...&I'll be honest with you...",
						"Our paper has been dropping in #popularity since Shandra Jimenez #started broadcasting on TV...",
						"We're always looking for #exclusive content to stay #ahead, see?",
						"So if you have any @ffff00interesting #pictures@ffffff, I'd be glad to buy #them off you..."
					]
					if global.player[player.pic] text[4] = "(Don't we have something like #that?&(Let's try showing him...)"
					other.stage++
					break
				case 2:
					if global.player[player.pic] {
						text = [
							"(You reach into your vest #pocket, but the photo isn't #there.)",
							"Wow, this is a great photo!",
							"(...&(Looks like he stole it #anyway...)",
							"Are you willing to sell this #photo to me?#       Yes         No",
							"Aww...&I guess I'll try again later..."
						]
						choice[3] = 1
						choice[5] = 1
						charRate[5] = 4
						charRate[6] = 4
						charRate[7] = 1
					}
					else {
						text = [
							"We're always looking for #exclusive content to stay #ahead, see?",
							"So if you have any @ffff00interesting #pictures@ffffff, I'd be glad to buy #them off you...",
							"We're looking for exclusive #pics...",
							"Like... I dunno...&beavers with dangerous tools, #for example..."
						]
					}
					break
				case 7:
					if global.player[player.nyarf] == 3 or global.player[player.nyarf] == 5 {
						text = [
							"That petrified newspaper will #protect you, dropping damage #taken by half...",
							"For your convenience, I've #changed enemies' AT values in #your Journal...",
							"Now please go away...&I need to ponder my actions, #see?"
						]
						for(var i = 0; i < array_length(text); i++) charRate[i] = 4
					}
					else {
						text = [
							"Ohhh, Shandra Jimenez...!&How your presence makes my #heart ooze various liquids...!",
							"(...&(Let's get out of here...)"
						]
						charRate[0] = 4
					}
					break
			}
			for(var i = 0; i < array_length(text); i++) if string_copy(text[i],1,1) != "(" charRate[i] = 4
		}
}}
else if obj_textbox.charCount >= string_length(obj_textbox.segText[array_length(obj_textbox.segText)-1])-10 {
	if stage == 2 and array_length(obj_textbox.choice) > 3 if obj_textbox.choice[3] == 1 {
		if obj_textbox.page == 3 {
			if obj_textbox.action[3] == 0 {
				obj_textbox.text[4] = "Great!&...&I don't have much moneywise..."
				obj_textbox.text[5] = "How about a trade instead?##       Yes         No"
				obj_textbox.text[6] = "Aww...&I guess I'll try again later..."
			}
		}
		if obj_textbox.page == 5 {
			if obj_textbox.action[5] == 0 {
				obj_textbox.text[6] = "Oh, thank you, sir!&I'll go and--"
				obj_textbox.text[7] = "Hold it right there!!"
				obj_textbox.setMove = false
				stage++
			}
		}
	}
	if stage == 4 and array_length(obj_textbox.choice) > 8 if obj_textbox.choice[8] == 1 {
		if obj_textbox.page == 8 {
			if obj_textbox.action[8] == 0 {//Toby's trade
				//global.player[player.nyarf]++//don't put it here!
				obj_textbox.text[9] = "Hmph.&I suppose the allure of mystery #weighs more than gold, hm?"
				obj_textbox.text[10] = "Well, then, I'll be off.&Congratulations on your prize, #Mr. Determined."
				global.toby = 1
			}
			else {
				global.player[player.money] += 300
				global.toby = 2
			}
			stage++
		}
	}
}