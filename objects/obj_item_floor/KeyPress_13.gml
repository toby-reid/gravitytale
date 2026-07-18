if get != ITEM_INDEX.NONE {
	if !instance_exists(obj_textbox_old) and instance_exists(obj_dipper) {
		if obj_dipper.canMove {
			var dir = obj_dipper.dir
			var ybox = (y > 140) ? 48 : 192;
			if (place_meeting(x-2,y,obj_dipper) and dir==0) or (place_meeting(x,y+2,obj_dipper) and dir==1) or (place_meeting(x+2,y,obj_dipper) and dir==2) or (place_meeting(x,y-2,obj_dipper) and dir==3) {
				if scr_get_item(get, true) {//script plays audio
					var item = global.ITEM_INFO[get];
					with instance_create_layer(160,ybox,"Instances",obj_textbox_old) {
						text = [string_concat("Got ", item.name, " - Heals ", item.heal, ".&", item.description)];
					}
					array_push(global.oneTimeInstances, id);
					instance_destroy()
				} else with instance_create_layer(160,ybox,"Instances",obj_textbox_old) {
					text = ["(Whoops!&(Looks like your inventory is #already full.)"];
				}
			}
		}
	}
}