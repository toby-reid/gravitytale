switch stage {
	case 0:
		switch choice[0] {
			case 0://Buy
				stage = 1
				text[0] = ""
				for(var i = 0; i < array_length(buy); i++) {
					text[0] += global.item_index[# buy[i],item_info.name] + "#"
				}
				text[0] += "Back..."
				audio_play_sound(sfx_shop_select,0,false)
				break
			case 1://Sell
				if array_length(inventory) > 0 {
					stage = 2 
					text[0] = ""
					for(var i = 0; i < array_length(inventory) and i < 4; i++) {
						text[0] += global.item_index[# inventory[i],item_info.name] + "#"
					}
					if array_length(inventory) == 5 text[0] += global.item_index[# inventory[4],item_info.name]
					else if array_length(inventory) > 5 text[0] += "More..."
				}
				else {
					text[0] = msg[1]
					charCount = 0
				}
				audio_play_sound(sfx_shop_select,0,false)
				break
			case 2:
				stage = 4
				text[0] = ""
				for(var i = 0; i < array_length(talk); i++) text[0] += talk[i] + "#"
				text[0] += "Back..."
				audio_play_sound(sfx_select,0,false)
				break
			case 3: {with obj_toRoom event_perform(ev_alarm,1); audio_play_sound(sfx_select,0,false)} break
		}
		choice[1] = 0
		break
	case 1://Buy
		if choice[1] < array_length(buy) {
			var itemCT = 0//Leave it like this since Pizza won't be in this.inventory
			for(var i = 0; i < 8; i++) if global.inventory[i] != item.none itemCT++
			if itemCT < 8 { 
				if !confirm {
					if global.player[player.money] >= global.item_index[# buy[choice[1]],item_info.price] {
						confirm = true
						choice[2] = 0
					}
				}
				else {
					if choice[2] == 0 {
						global.player[player.money] -= global.item_index[# buy[choice[1]],item_info.price]
						scr_get_item(buy[choice[1]],false)
						audio_play_sound(sfx_shop_purchase,0,false)
						if buy[choice[1]] == item.hamstick global.hamstick = true
						event_user(0)
					}
					else audio_play_sound(sfx_select,0,false)
					confirm = false
				}
			}
		}
		else {//"Back..."
			charCount = 0
			stage = 0
			text[0] = msg[0]
			audio_play_sound(sfx_select,0,false)
		}
		if !audio_is_playing(sfx_shop_purchase) if !audio_is_playing(sfx_select) audio_play_sound(sfx_shop_select,0,false)
		break
	case 2://Sell pg 1
		if (choice[1] == 4 and array_length(inventory) > 5) {//"More..."
			stage = 3
			text[0] = ""
			for(var i = 4; i < array_length(inventory); i++) text[0] += global.item_index[# inventory[i],item_info.name] + "#"
			text[0] += "Back..."
			audio_play_sound(sfx_select,0,false)
			choice[1] = 0
		}
		else {
			if !confirm choice[2] = 0
			else {
				if choice[2] == 0 {
					global.player[player.money] += floor(global.item_index[# inventory[choice[1]],item_info.price]/2)
					for(var i = 0; i < 8; i++) if global.inventory[i] == inventory[choice[1]] {
						global.inventory[i] = item.none
						break
					}
					audio_play_sound(sfx_shop_purchase,0,false)
					event_user(0)
					choice[1] = 0
				}
				else audio_play_sound(sfx_select,0,false)
				text[0] = ""
				for(var i = 0; i < array_length(inventory) and i < 4; i++) text[0] += global.item_index[# inventory[i],item_info.name] + "#"
				if array_length(inventory) == 5 text[0] += global.item_index[# inventory[4],item_info.name]
				else if array_length(inventory) > 5 text[0] += "More..."
			}
			confirm = !confirm
			if array_length(inventory) == 0 {
				stage = 0
				charCount = 0
				text[0] = msg[2]
			}
		}
		if !audio_is_playing(sfx_shop_purchase) if !audio_is_playing(sfx_select) audio_play_sound(sfx_shop_select,0,false)
		break
	case 3://Sell pg 2
		if choice[1] >= array_length(inventory)-4 {//"Back..."
			stage = 2
			text[0] = ""
			for(var i = 0; i < 4; i++) text[0] += global.item_index[# inventory[i],item_info.name] + "#"
			text[0] += "More..."
			choice[1] = 0
		}
		else {
			if !confirm choice[2] = 0
			else {
				if choice[2] == 0 {
					global.player[player.money] += floor(global.item_index[# inventory[choice[1]+4],item_info.price]/2)
					for(var i = 0; i < 8; i++) if global.inventory[i] == inventory[choice[1]+4] {
						global.inventory[i] = item.none
						i = 8
					}
					audio_play_sound(sfx_shop_purchase,0,false)
					event_user(0)
					choice[1] = 0
				}
				else audio_play_sound(sfx_select,0,false)
				text[0] = ""
				if array_length(inventory) > 5 {
					for(var i = 4; i < array_length(inventory); i++) text[0] += global.item_index[# inventory[i],item_info.name] + "#"
					text[0] += "Back..."
				}
				else {
					for(var i = 0; i < array_length(inventory); i++) text[0] += global.item_index[# inventory[i],item_info.name] + "#"
					stage = 2
				}
			}
			confirm = !confirm
			if array_length(inventory) == 0 {
				stage = 0
				charCount = 0
				text[0] = msg[2]
			}
		}
		if !audio_is_playing(sfx_shop_purchase) audio_play_sound(sfx_shop_select,0,false)
		break
	case 4://Talk menu
		if choice[1] >= array_length(talk) {//"Back..."
			stage = 0
			text[0] = msg[0]
		}
		else {
			stage = 5
			if global.player[player.runActive] == 2 dialogue = msg[8]
			else dialogue = msg[4+choice[1]]
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