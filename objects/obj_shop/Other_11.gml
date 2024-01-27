/// @description update text[1]
switch stage {
	case 0:
		text[1] = "Buy#Sell#Talk#Exit"
		break
	case 1:
		if choice[1] < array_length(buy) {
			var price = global.item_index[# buy[choice[1]],item_info.price]
			var heal = global.item_index[# buy[choice[1]],item_info.heal]
			if heal < 0 heal = "full"
			text[1] = "Heals " + string(heal) + ".#Buy for#$" + string(price) + "."
			if global.player[player.money] < price text[1] += "#Low funds!"
			var itemCT = 0//Leave it like this since Pizza won't be in local.inventory
			for(var i = 0; i < 8; i++) if global.inventory[i] != item.none itemCT++
			if itemCT >= 8 text[1] = string(heal) + " HP#$" + string(price) + "#Inventory#space low!"
			if confirm text[1] = "Buy for#$" + string(price) + "?#Yes#No"
		}
		else text[1] = "Return to#top menu"
		break
	case 2:
		if array_length(inventory) != 5 and choice[1] == 4 text[1] = "Page 2##Press X for#top menu"
		else text[1] = msg[9] + "#$" + string(floor(global.item_index[# inventory[choice[1]],item_info.price]/2)) + "."
		if confirm text[1] = "Sell for#$" + string(floor(global.item_index[# inventory[choice[1]],item_info.price]/2)) + "?#Yes#No"
		break
	case 3:
		if array_length(inventory) != 5 and choice[1] == array_length(inventory)-4 text[1] = "Page 1##Press X for#top menu"
		else text[1] = msg[9] + "#$" + string(floor(global.item_index[# inventory[choice[1]+4],item_info.price]/2)) + "."
		if confirm text[1] = "Sell for#$" + string(floor(global.item_index[# inventory[choice[1]+4],item_info.price]/2)) + "?#Yes#No"
		break
	case 4:
		text[1] = msg[3];
		if choice[1] == array_length(talk) text[1] = "Return to#top menu"
		break
	default:
		text[1] = ""
		break
}