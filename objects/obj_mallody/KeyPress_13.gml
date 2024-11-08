// Inherit the parent event
event_inherited();

if(!global.hamstick)
	if(stage >= 5)
		if(choice[1] == 0)
			if(page == 9)
				if(global.player.genocide != RUN.ACTIVE) {
					if(scr_get_item(ITEM_NAME.HAMSTICK, true)) {
						global.hamstick = true;
						msg.l_topic0[8] = "Just... please...&Leave me alone...";
						msg.l_topic0[9] = "(This poor girl.&(Maybe we should back #off on this front.)";
					}
					else msg.l_topic0[9] = "(She tried to bribe #you not to complain #to management, but #your inventory was #full.)";
				}