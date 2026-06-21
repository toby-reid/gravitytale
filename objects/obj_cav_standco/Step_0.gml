if stage == 2 if !instance_exists(obj_toBattle) {//post-battle thing
	obj_dipper.canMove = false
	with instance_create_layer(160,48,layer,obj_textbox_old) {
		if global.enemy_killed[ENEMY.STANS_CAVE] {
			text = [
				"whoa, there, kiddo.",
				"in case it wasn't obvious, i #wasn't trying to fight.",
				"but if you wanna fight for #real...&well...",
				"i guess we're done here."
			]
			head = [
				spr_stans_head_content,
				spr_stans_head_sly,
				spr_stans_head_content,
				spr_stans_head_hollowEye
			]
		} else {
			text = [
				"heh, nice one, kid.",
				"alright, as i promised...",
				"here's your prize.",
				"(You got the Stancake!&(It's like a normal pancake, but #it has bits of his hair in it!)",
				". . .",
				"what, you don't like my #gracious offering?",
				"and after i spent so long #making it...",
				"well, then, kid, how about #this?",
				"(You got the Vending Machine #Code!&(Check in on Ford sometime.)",
				"there, happy now?",
				"great.",
				"now move along.&i can't make money with you #as my only customer, you know."
			]
			head = [
				spr_stans_head_sly,
				spr_stans_head_neutral,
				spr_stans_head_sly,
				noone,
				spr_stans_head_content,
				spr_stans_head_sly,
				spr_stans_head_joke,
				spr_stans_head_neutral,
				noone,
				spr_stans_head_sly,
				spr_stans_head_content,
				spr_stans_head_sly
			]
		}
		for(var i = 0; i < array_length(head); i++) if head[i] != noone {sound[i] = tlk_stans; font[i] = fnt_sans_gui}
	}
	stage++
}
if stage == 3 obj_dipper.canMove = false