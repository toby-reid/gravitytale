if get != item.none if !instance_exists(obj_textbox) if instance_exists(obj_dipper) if obj_dipper.canMove {
	var dir = obj_dipper.dir
	if y > 140 var ybox = 48
	else var ybox = 192
	if (place_meeting(x-2,y,obj_dipper) and dir==0) or (place_meeting(x,y+2,obj_dipper) and dir==1) or (place_meeting(x+2,y,obj_dipper) and dir==2) or (place_meeting(x,y-2,obj_dipper) and dir==3) {
		if scr_get_item(get, true) {//script plays audio lol
			with instance_create_layer(160,ybox,"Instances",obj_textbox)
				text[0] = "Got "+global.item_index[# other.get,item_info.name]+" - Heals "+string(global.item_index[# other.get,item_info.heal])+".&"+global.item_index[# other.get,item_info.desc]
			global.trashCan[array_length(global.trashCan)] = trashCan;
			instance_destroy()
		}
		else with instance_create_layer(160,ybox,"Instances",obj_textbox) text = ["(Whoops!&(Looks like your inventory is #already full.)"]
	}
}