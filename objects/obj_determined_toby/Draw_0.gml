draw_self()

if !instance_exists(obj_textbox_old) {
	if stage == 3 {
		if alarm[1] == -1 {
			alarm[1] = 60
			audio_play_sound(sfx_door,0,false)
		}
		if alpha < 1 alpha += .05
		else if !audio_is_playing(mus_thundersnail) {
			audio_stop_all()
			audio_play_sound(mus_thundersnail,0,true)
			audio_play_sound(mus_thundersnail,0,true)
			obj_dipper.dir = 3
		}
	} else if stage == 5 {
		if alpha > 0 {
			alpha -= .02
			audio_sound_gain(mus_thundersnail,audio_sound_get_gain(mus_thundersnail)-.1,0)
			audio_sound_gain(mus_thundersnail,audio_sound_get_gain(mus_thundersnail)-.1,0)
		}
		else {
			audio_stop_sound(mus_thundersnail)
			audio_stop_sound(mus_thundersnail)
			audio_sound_gain(mus_thundersnail,audio_sound_get_gain(mus_intro),0)
			audio_sound_gain(mus_thundersnail,audio_sound_get_gain(mus_intro),0)
			audio_play_sound(sfx_door,0,false)
			obj_dipper.dir = dir
			obj_dipper.canMove = true
			with instance_create_layer(160,48,"Instances",obj_textbox_old) {
				if global.player.genocide == RUN.ACTIVE {
					text = [
						". . .",
						"I've been holding my tongue like a #good boy this entire time...",
						"But...&You're not gonna kill me...&...are you...?",
						"I've tried cooperating with your #plans...&I stayed here for your trade...",
						"Hoarghoh...&I need to get out of here...",
						"Go away...&Please..."
					]
					for(var i = 0; i < array_length(text); i++) charRate[i] = 4
				} else if global.player.beaverPic == BEAVER_PIC.SOLD_NEWSPAPER {
					text = [
						"Hoarghoh...&I'm not sure how to feel about #this...",
						"I got the exclusive photo, #but now I have no chance with #Shandra Jimenez...",
						"Well, a trade is a trade, I #suppose.&Here's your prize...",
						"(Got the...&(...newspaper hat...?)",
						"That's reeeeeal old paper there, #see?",
						"So old, it's @ffff00rock-solid@ffffff...",
						"So solid, it might even @ffff00double #your Defence@ffffff, see?",
						"When you wear this, your enemies #will only deal @ffff00half damage@ffffff...",
						"Here, let me update your Journal #for you...",
						"There, see, all Enemies will be #listed at half AT now...",
						"Thanks for stopping by the #Gravity Falls Gossiper!",
						". . .&Now get out."
					]
					for(var i = 0; i < array_length(text); i++) if i != 3 charRate[i] = 4
				} else {
					text = [
						"Ooh...&Shandra Jimenez...&In my shop...",
						"Oh... you're still here...?",
						"Well, thanks for stopping by the #Gravity Falls Gossiper!",
						"Come again soon!"
					]
					for(var i = 0; i < array_length(text); i++) charRate[i] = 4
				}
			}
			stage++;
		}
	} else if stage == 6 {
		stage++;
		if global.player.beaverPic == BEAVER_PIC.SOLD_NEWSPAPER {
			global.player.df = AT_DF.UPGRADE;
		}
		if !audio_is_playing(mus_spooktune) {
			audio_play_sound(mus_spooktune, 0, true);
		}
	}
}
//else if stage == 5 if obj_textbox_old.page == 3 if obj_textbox_old.charCount == 1 audio_play_sound(sfx_itemGet,0,false)
draw_sprite_ext(spr_fst_jimenez,0,152,191,1,1,0,c_white,alpha);