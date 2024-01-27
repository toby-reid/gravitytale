switch stage {
	case 0: if obj_dipper.x >= 480 {
		obj_dipper.canMove = false
		obj_dipper.x -= 2
		audio_group_stop_all(Music)
		audio_play_sound(mus_nyeh,0,true)
		with instance_create_layer(160,192,"Instances",obj_textbox) {
			ini_open("Reset.save")
			if ini_read_real("D",enemy.ford,0) > 0 var died = true;
			else var died = false
			ini_close()
			if global.player[player.runActive] == 2 and global.areaKilled[area.forest] >= global.areaMax[area.forest] {
				text = [
					"CHILD!",
					"YOU HAVE FINALLY #REACHED THE FINAL #BOSS!",
					"...IS WHAT YOU #THOUGHT I'D SAY, EH, #KID?",
					"BUT NO...&YOU DON'T HAVE TIME #FOR THAT, HUH?",
					". . .",
					"I'VE BEEN ANALYZING #YOUR MOVES, KID...",
					"AND I HAVE REACHED A #CONCLUSION.",
					"YOU'VE BEEN WORKING #FOR @FFFF00BILL@FFFFFF, HAVEN'T YOU?",
					". . .",
					"BUT I DON'T BELIEVE #YOU ARE A BAD #HUMAN, CHILD...",
					"I, TOO, HAVE FALLEN FOR #@ffff00BILL@ffffff'S EASY FLATTERY #BEFORE.",
					"BUT THERE IS ALWAYS #A CHANCE FOR #REDEMPTION!",
					"I BELIEVE THERE IS #GOOD IN EVERY HUMAN...",
					"COME ON, KID...&WHAT DO YOU SAY WE #END THIS?",
					"WE CAN STOP @ffff00BILL #@ffffffTOGETHER..."
				]
				head = [
					spr_ford_head_mad,
					spr_ford_head_neutral,
					spr_ford_head_neutral,
					spr_ford_head_bashful,
					spr_ford_head_neutral,
					spr_ford_head_neutral,
					spr_ford_head_neutral,
					spr_ford_head_mad,
					spr_ford_head_neutral,
					spr_ford_head_bashful,
					spr_ford_head_bashful,
					spr_ford_head_neutral,
					spr_ford_head_bashful,
					spr_ford_head_bashful,
					spr_ford_head_neutral,
					spr_ford_head_bashful
				]	
			}
			else if global.player[player.runActive] == 2 {//Genocide, but not enough kills to continue
				if died {
					text = [
						"WAH HAH HAH!",
						"YOU WERE KILLED AND #CAME BACK...",
						"BUT YOU STILL DON'T #HAVE ENOUGH KILLS TO #CONTINUE THIS ROUTE!",
						"LET'S GO AGAIN THEN, #BOY!",
						"YOUR FAILURES ARE #HILARIOUS TO ME!"
					]
					head = [
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_mad,
						spr_ford_head_mad,
						spr_ford_head_neutral
					]
				}
				else {
					text = [
						"WAH HAH HAH!",
						"SO @FFFF00BILL@FFFFFF'S HAVING YOU #DO HIS DIRTY WORK, EH, #KID?",
						"BUT YOU'RE SO #INCOMPETENT...",
						"YOU HAVEN'T EVEN #GOTTEN ENOUGH KILLS #HERE TO CONTINUE!",
						"I MEAN, OBVIOUSLY YOU #STILL NEED TO BE #STOPPED...",
						"BUT BILL'S FAILURES #ARE HILARIOUS TO ME!",
						"LET'S GO, BOY!",
						"LET'S SEE IF YOU'LL #CONTINUE THIS #WORTHLESS TREND!"
					]
					head = [
						spr_ford_head_mad,
						spr_ford_head_neutral,
						spr_ford_head_mad,
						spr_ford_head_neutral,
						spr_ford_head_bashful,
						spr_ford_head_neutral,
						spr_ford_head_mad,
						spr_ford_head_neutral
					]
				}
			}
			else if global.player[player.kills] > 0 {
				if died {
					text = [
						"CHILD!",
						"YOU HAVE REACHED #WHAT YOU MIGHT CALL #THE FINAL BOSS!",
						". . .",
						"WAIT...",
						"YOU'VE HEARD THIS ALL #BEFORE, HAVEN'T YOU?",
						"SO ANOTHER \"ME\" HAS #MANAGED TO STOP #YOU...",
						"LET US HOPE I CAN TOO.",
						"MAYBE I CAN BE THE #END OF YOUR TIMELINE #HOPPING..."
					]
					head = [
						spr_ford_head_mad,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_bashful,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_mad,
						spr_ford_head_neutral
					]
				}
				else {
					text = [
						"CHILD!",
						"YOU HAVE REACHED #WHAT YOU MIGHT CALL #THE FINAL BOSS!",
						"AT LEAST, THE LAST #ONE FOR THIS AREA!",
						". . .",
						"LET ME BE STRAIGHT #WITH YOU, KID...",
						"I'VE BEEN WATCHING #YOUR ACTIONS #CLOSELY.",
						"I KNOW YOU HAVE #ENDED LIVES.",
						"AND THOUGH YOU MAY #NOT CARE...",
						"I CARE FOR THE WELL-#BEING OF YOUR SOUL, #KID, AS ALL OTHERS.",
						"I KNOW YOU'RE WORKING #FOR @FFFF00BILL@FFFFFF.",
						"BUT PLEASE, KID, #LISTEN TO ME WHEN I #SAY:",
						"@FFFF00BILL @FFFFFFWILL BETRAY YOU.",
						"I, TOO, HAVE FALLEN FOR #HIS EASY FLATTERY #BEFORE.",
						"DO NOT REPEAT MY #PAST MISTAKES.",
						"THERE IS STILL TIME, #CHILD...",
						"TURN BACK NOW.&PLEASE, FOR THE SAKE #OF THIS UNIVERSE...",
						". . .",
						"I SEE.",
						"ONLY A NIGHTMARE #DEMON DEALS IN #ABSOLUTES.",
						"I WILL DO WHAT I MUST."
					]
					head = [
						spr_ford_head_mad,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_bashful,
						spr_ford_head_neutral,
						spr_ford_head_bashful,
						spr_ford_head_neutral,
						spr_ford_head_bashful,
						spr_ford_head_mad,
						spr_ford_head_neutral,
						spr_ford_head_mad,
						spr_ford_head_bashful,
						spr_ford_head_bashful,
						spr_ford_head_bashful,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_bashful,
						spr_ford_head_neutral,
						spr_ford_head_mad
					]
					charRate[11] = .2
				}
			}
			else {
				if died {
					text = [
						"CHILD!",
						"YOU HAVE REACHED #WHAT YOU MIGHT CALL #THE FINAL BOSS!",
						". . .",
						"WAIT...",
						"YOU'VE HEARD THIS #ALL BEFORE, #HAVEN'T YOU?",
						"SO ANOTHER \"ME\" #HAS MANAGED TO #STOP YOU...",
						"LET US HOPE I CAN TOO.",
						"MAYBE I CAN BE THE #END OF YOUR TIMELINE #HOPPING..."
					]
					head = [
						spr_ford_head_mad,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_bashful,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_mad,
						spr_ford_head_neutral
					]
				}
				else {
					text = [
						"CHILD!",
						"YOU HAVE REACHED #WHAT YOU MIGHT CALL #THE FINAL BOSS!",
						"AT LEAST, THE LAST #ONE FOR THIS AREA!",
						"YOU HAVE BEATEN ALL #MY PUZZLES!",
						"YOU HAVE EVEN SNUCK #PAST MANY ENEMIES #WITHOUT KILLING THEM!",
						"BUT IT DOES NOT #MATTER, KID...",
						"I'VE BEEN WATCHING.&I KNOW YOU'RE WORKING #FOR @FFFF00BILL@FFFFFF.",
						"AND I KNOW YOU WILL #NOT GIVE IN TO #PERSUASION.",
						"SO I KNOW YOU WON'T #LISTEN IF I TELL YOU #NOT TO FALL FOR ",
						"HIS EASY FLATTERY.",
						"THUS, I HAVE NO #CHOICE.",
						"I MUST STOP YOU NOW #BEFORE BILL TAKES #OVER THIS WORLD.",
						"WHATEVER HAPPENS #NEXT, CHILD, JUST #KNOW...",
						"I'M DOING THIS FOR THE #SAKE OF HUMANITY.",
						"I WILL DO WHAT I MUST."
					]
					head = [
						spr_ford_head_mad,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_mad,
						spr_ford_head_bashful,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_bashful,
						spr_ford_head_mad,
						spr_ford_head_neutral,
						spr_ford_head_bashful,
						spr_ford_head_mad
					]
				}
			}
			for(var i = 0; i < array_length(text); i++) {font[i] = fnt_papyrus_gui; sound[i] = tlk_ford}
		}
		stage++
	} break
	case 1: if !instance_exists(obj_textbox) {
		with instance_create_layer(0,0,"Instances",obj_toBattle) {
			goto = btl_fst_21_ford
			dest = 1
			music = mus_nyeh
			music_nbs = mus_nyeh
		}
		if global.stans < 21 global.stans = 21
		stage++
	} break
	case 2: if !instance_exists(obj_toBattle) {
		if global.killed[enemy.ford] instance_destroy()
		else if global.spared[enemy.ford] {
			obj_dipper.canMove = false
			with instance_create_layer(160,192,"Instances",obj_textbox) {
				if other.geno {//Ran genocide, but stopped
					text = [
						"THANK YOU, CHILD...",
						"I KNEW THERE WAS #STILL GOOD IN #YOU...",
						"I WILL BEGIN FORMING A #COUNTERATTACK PLAN.",
						"COME VISIT ME IN THE #SHACK'S BASEMENT #SOMETIME.",
						"ASK MY IDIOT BROTHER #FOR THE CODE.",
						"NOW, FARE WELL, KID...&GOOD LUCK IN YOUR #ADVENTURE."
					]
					head = [
						spr_ford_head_bashful,
						spr_ford_head_neutral,
						spr_ford_head_mad,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_neutral
					]
				}
				else {//Weren't in Genocide
					text = [
						"WELL, UH...",
						"I'M...&UH...",
						"THERE EXISTS A VERY #SLIGHT POSSIBILITY,",
						"EXTREMELY MINISCULE,",
						"THAT MY INITIAL #JUDGEMENT OF YOU...",
						"PLAUSIBLY COULD HAVE #BEEN MINUTELY #INCORRECT.",
						"I WASN'T WRONG, #MIND YOU.",
						"I WAS SIMPLY LESS #CORRECT THAN I #PREFER TO BE.",
						"BUT IT SEEMS YOU #AREN'T ENTIRELY EVIL...",
						"SO I WILL LET YOU GO #FOR NOW.",
						"COME VISIT ME IN THE #SHACK'S BASEMENT #SOMETIME.",
						"YOU CAN GET THE #CODE FROM MY IDIOT #BROTHER.",
						"NOW, FARE WELL, KID...&NO...&@ffff00"+string_upper(global.player[player.name])+"@ffffff...",
						"GOOD LUCK IN YOUR #ADVENTURE."
					]
					head = [
						spr_ford_head_bashful,
						spr_ford_head_bashful,
						spr_ford_head_bashful,
						spr_ford_head_bashful,
						spr_ford_head_bashful,
						spr_ford_head_neutral,
						spr_ford_head_mad,
						spr_ford_head_bashful,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_neutral,
						spr_ford_head_neutral
					]
				}
				for(var i = 0; i < array_length(text); i++) {font[i] = fnt_papyrus_gui; sound[i] = tlk_ford}
			}
			stage++
		}
		else {//Ran
			obj_dipper.canMove = true//The textbox will make him move after it's done
			with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = [
					"AN EXCELLENT CHOICE, #KID!",
					"PERHAPS YOU TRULY #ARE MILDLY #INTELLIGENT...",
					"I WILL GUARD HERE #UNTIL YOU HAVE LEFT #GRAVITY FALLS.",
					"I HOPE YOU #UNDERSTAND..."
				]
				head = [
					spr_ford_head_neutral,
					spr_ford_head_neutral,
					spr_ford_head_mad,
					spr_ford_head_neutral
				]
				font = [fnt_papyrus_gui,fnt_papyrus_gui,fnt_papyrus_gui,fnt_papyrus_gui]
				sound = [tlk_ford,tlk_ford,tlk_ford,tlk_ford]
			}
			stage = 5
		}
	} break
	case 3:
		if !instance_exists(obj_textbox) {
			path_start(pth_ford,1.5,path_action_stop,false)
			alarm[0] = 1
			image_speed = 2
			stage++
		}
		obj_dipper.canMove = false
		break
	case 4:
		if x < 280 instance_destroy()
		//for(var i = 0; i < instance_number(obj_ford_ow_1); i++) with instance_find(obj_ford_ow_1,i) {if y >= 140 {vspeed = 0; image_alpha -= .1; if image_alpha <= 0 instance_destroy();}}
	break
	case 5: if !instance_exists(obj_textbox) {
		if obj_dipper.x >= 480 {
			obj_dipper.canMove = false
			obj_dipper.x -= 2
			with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = [
					"AH, I SEE...",
					"SO YOU HAVE CHANGED #YOUR MIND AGAIN?",
					"VERY WELL, KID...",
					"I SHALL TRY AGAIN TO #STOP YOU."
				]
				head = [
					spr_ford_head_bashful,
					spr_ford_head_neutral,
					spr_ford_head_bashful,
					spr_ford_head_mad
				]
				font = [fnt_papyrus_gui,fnt_papyrus_gui,fnt_papyrus_gui,fnt_papyrus_gui]
				sound = [tlk_ford,tlk_ford,tlk_ford,tlk_ford]
			}
			if global.stans < 22 global.stans = 22
			stage = 1
		}
		if !audio_is_playing(mus_snowy) if !audio_is_playing(mus_town) {
			audio_group_stop_all(Music)
			audio_play_sound(mus_snowy,0,true)
		}
	} break
}