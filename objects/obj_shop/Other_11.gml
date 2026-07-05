/// @description update text[1]
switch stage {
	case 0:
		text[1] = "Buy#Sell#Talk#Exit";
		break;
	case 1:
		if choice[1] < array_length(buy) {
			var item_name = buy[choice[1]];
			var item = global.ITEM_INFO[? item_name];
			var price = (item_name == ITEM_INDEX.MAGIC_ARMOR) ? (global.player.money + 1) : item.price;
			var heal = item.heal;
			if heal < 0 heal = "full";
			text[1] = string_concat("Heals ", heal, ".#Buy for#$", price, ".");
			if global.player.money < price text[1] += "#Low funds!";
			var itemCt = 0; //Leave it like this since Pizza won't be in local.inventory
			for(var i = 0; i < array_length(global.inventory); i++) {
				if global.inventory[i] != ITEM_INDEX.NONE itemCt++;
			}
			if itemCt >= array_length(global.inventory) {
				text[1] = string_concat(heal, " HP#$", price, "#Inventory#space low!");
			}
			if confirm text[1] = string_concat("Buy for#$", price, "?#Yes#No");
		} else text[1] = "Return to#top menu";
		break;
	case 2://Sell pg 1
	case 3://Sell pg 2
		break;
	case 4:
		text[1] = msg.r_talkTopics;
		if choice[1] == array_length(talk) text[1] = "Return to#top menu";
		break;
	default:
		text[1] = "";
		break;
}