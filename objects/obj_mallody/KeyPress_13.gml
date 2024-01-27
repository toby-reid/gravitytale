// Inherit the parent event
event_inherited();

if(!global.hamstick)
	if(stage >= 5)
		if(choice[1] == 0)
			if(page == 9)
				if(global.player[player.runActive] != 2) {
					if(scr_get_item(item.hamstick,true)) {
						global.hamstick = true;
						msg[4][8] = "Just... please...&Leave me alone...";
						msg[4][9] = "(This poor girl.&(Maybe we should back #off on this front.)";
					}
					else msg[4][9] = "(She tried to bribe #you not to complain #to management, but #your inventory was #full.)";
				}