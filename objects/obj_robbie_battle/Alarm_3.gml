/// @description WENDY
switch stage {
	case 0:
		obj_battleCore.text[1] = global.player.mabel
			? "Whimsical Empty Narcissistic #Dreamer Yammering is being #readied..."
			: "Whiny Eternal Needless Doofus #Yammering is being readied...";
		obj_battleCore.text[0] = "WENDY was successfully prepped.";
		stage++;
		break;
	case 1:
		stage++
		if global.player.mabel {
			obj_battleCore.text[1] = "You begin telling Robbie all the #potential matches you could set #him with."
			obj_battleCore.text[0] = "He's not interested in that, #but it reminds him of a song he #wrote for his beloved..."
			break;
		}
		// fallthrough
	default:
		if global.player.mabel {
			obj_battleCore.text[1] = "You try to distract Robbie with #other matches, but he's too #fixated on sharing his song."
			if spare obj_battleCore.text[0] = "Maybe we should just slink away #for now."
			else obj_battleCore.text[0] = "Maybe we should hear him out?"
		} else {
			var wendy = "wendy";
			for (var core_index = 0; core_index <= 1; core_index++) {
				var core_text = "";
				for (var row = 0, wendy_counter = 1; row < 3; row++) {
					for (var char = 0; char < 35; char++) {
						var character = string_char_at(wendy, wendy_counter);
						core_text += (irandom(1) == 0)
							? string_upper(character)
							: character;
						wendy_counter++;
						if (wendy_counter > string_length(wendy)) wendy_counter = 1;
					}
					core_text += "&";
				}
				obj_battleCore.text[core_index] = core_text;
			}
		}
		break
}