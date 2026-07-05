switch stage {
	case 0:
		switch choice[0] {
			case 0://Buy
				stage = 1
				text[0] = ""
				for(var i = 0; i < array_length(buy); i++) {
					text[0] += global.ITEM_INFO[? buy[i]].name + "#";
				}
				text[0] += "Back..."
				audio_play_sound(sfx_shop_select,0,false)
				break
			case 1://Sell
				text[0] = msg.l_cantBuy;
				charCount = 0;
				audio_play_sound(sfx_shop_select,0,false);
				break
			case 2://Talk
				stage = 4
				text[0] = ""
				for(var i = 0; i < array_length(talk); i++) text[0] += talk[i] + "#"
				text[0] += "Back..."
				audio_play_sound(sfx_select,0,false)
				break
			case 3://Exit
				with obj_toRoom event_perform(ev_alarm,1);
				audio_play_sound(sfx_select,0,false);
				break;
		}
		choice[1] = 0
		break
	case 1://Buy
		if choice[1] < array_length(buy) {
			var itemCt = 0//Leave it like this since Pizza won't be in this.inventory
			for(var i = 0; i < array_length(global.inventory); i++) {
				if global.inventory[i] != ITEM_INDEX.NONE itemCt++
			}
			if itemCt < array_length(global.inventory) {
				var item_name = buy[choice[1]];
				var item = global.ITEM_INFO[? item_name];
				if !confirm {
					if global.player.money >= item.price {
						confirm = true
						choice[2] = 0
					}
					else audio_play_sound(sfx_glass,0,false,.5);
				} else {
					if choice[2] == 0 {
						global.player.money -= item.price
						scr_get_item(item_name,false)
						audio_play_sound(sfx_shop_purchase,0,false)
						if item_name == ITEM_INDEX.HAMSTICK global.hamstick = true
					}
					else audio_play_sound(sfx_select,0,false)
					confirm = false
				}
			}
		} else {//"Back..."
			charCount = 0
			stage = 0
			text[0] = msg.l_greeting;
			audio_play_sound(sfx_select,0,false)
		}
		if !audio_is_playing(sfx_shop_purchase) if !audio_is_playing(sfx_select) audio_play_sound(sfx_shop_select,0,false)
		break
	case 2://Sell pg 1
	case 3://Sell pg 2
		break;
	case 4://Talk menu
		if choice[1] >= array_length(talk) {//"Back..."
			stage = 0
			text[0] = msg.l_greeting;
		} else {
			stage = 5
			dialogue = (global.player.genocide == RUN.ACTIVE) ? msg.l_talkGenocide : msg.l_talk[choice[1]];
			text[0] = dialogue[0];
		}
		audio_play_sound(sfx_select,0,false)
		charCount = 0
		break
	default:
		if charCount >= string_length(text[0]) {
			page++
			charCount = 0
			audio_play_sound(sfx_select,0,false)
			if (page < array_length(dialogue)) {
				text[0] = dialogue[page];
			}
			else {
				stage = 4;
				text[0] = "";
				for(var i = 0; i < array_length(talk); i++) text[0] += talk[i] + "#";
				text[0] += "Back...";
				page = 0;
			}
		}
		break
}
event_user(1)