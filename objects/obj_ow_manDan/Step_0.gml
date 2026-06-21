if instance_exists(obj_dipper) switch stage {
	case 0: if obj_dipper.canMove if obj_dipper.x >= 300 {
		obj_dipper.canMove = false
		audio_stop_all()
		with instance_create_layer(160,192,"Instances",obj_textbox_old) {
			text = global.player.mabel
				? [
					"WHOA THERE, GIRLY.&BACK UP A MINUTE.",
					"WHAT DO YOU THINK YOU'RE DOING #HERE?",
					"THESE ARE SOME PRETTY COMPLEX #PUZZLES, NOT FOR LITTLE GIRLS #LIKE YOU.",
					"I DON'T BELIEVE FOR A SECOND #THAT YOU'VE SOLVED THEM ON YOUR #OWN.",
					". . .",
					"FINE THEN, GIRLY.&GUESS YOU NEED A LITTLE LESSON.",
					"LET ME TEACH YOU HOW A REAL MAN #BRAWLS!"
				] : [
					"WHOA THERE, BOY.&BACK UP A MINUTE.",
					"I SEE WHAT YOU'RE DOING HERE.",
					"SOLVE A COUPLE IMPOSSIBLE #PUZZLES, AND YOU THINK YOU'RE #ALL THAT, EH, BOY?",
					"DON'T JUST WALTZ AROUND HERE #UNLESS YOU'RE MAN ENOUGH TO #STAND AGAINST ME.",
					"SO, HOW ABOUT IT, BOY?",
					"LET ME TEACH YOU HOW A REAL MAN #BRAWLS!"
				];
			for(var i = 0; i < array_length(text); i++) charRate[i] = 4
		}
		stage++
	} break
	case 1: if !instance_exists(obj_textbox_old) {
		with instance_create_layer(0,0,"Instances",obj_toBattle) {
			music = mus_mansong
			goto = btl_fst_9_manDan
		}
		stage++
	} break
	case 2: if !instance_exists(obj_toBattle) {
		with instance_create_layer(160,192,"Instances",obj_textbox_old) {
			if global.enemy_spared[ENEMY.MANLY_DAN] and global.enemy_spared[ENEMY.TYLER] {
				var slang = global.player.mabel ? "GIRLY" : "BOY";
				text = [
					"WELL, "+slang+", YOU DEFEATED US #WITHOUT MANLY VIOLENCE...",
					"IT IS... ACCEPTABLE.",
					"YOU MAY PASS, BUT BE WARNED:",
					"ONE DAY, YOU WILL ENCOUNTER AN #ENEMY WHO CANNOT BE SPARED.",
					"BECAUSE OF YOUR TRUE MANLINESS, #I WILL PROVIDE A HINT TO YOU...",
					"@ffff00MOVE CHAIRS @FFFFFFTO FIND THE BOSS #OF ALL MEN.&KILLING HIM WILL DOUBLE YOUR AT.",
					"NOW, GO, \"MANLY "+string_upper(global.player.name)+"\".&LIVE IN HONOR AND GLORY."
				]
			}
			else if global.enemy_spared[ENEMY.MANLY_DAN] {
				text = global.player.mabel
					? [
						"AH, I SEE WHAT YOU'RE DOING #HERE, GIRLY.",
						"YOU THINK THIS IS THE PATH OF A #REAL MAN?",
						"NO, YOU ARE THE ONE TRUE #FAILURE.",
						"YOU LEAD ME ON JUST TO MURDER A #FAR WEAKER BEING?",
						". . .",
						"GET OUT OF HERE BEFORE I SNAP #YOUR SPINE."
					] : [
						"FOR SHAME, BOY...&FOR SHAME...",
						"YOU DEFEATED ME WITHOUT #VIOLENCE, BUT YOU MURDER A #BEING FAR WEAKER?",
						"YOU WILL NEVER BE A MAN, BOY.",
						"HOW CAN YOU EVEN LIVE WITH YOUR #FAILURE?",
						"GET OUT OF HERE BEFORE I SNAP #YOUR SPINE."
					];
			} // It shouldn't be possible to spare Tyler only/first
			else instance_destroy()
		}
		stage++
	} break
	case 3:
		if !instance_exists(obj_textbox_old) instance_destroy()
		else obj_dipper.canMove = false
		break
}
