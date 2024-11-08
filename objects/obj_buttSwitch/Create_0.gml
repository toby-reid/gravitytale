/// @description Use CC to set obj_buttSwitch.order[]
active = 1//0 must reset; 1+ order numbering
done = false//True if we've completed the buttons
order = [noone]//List of different ids
pressed = noone//Reset every Step. Which button was just pressed?
if !variable_global_exists("buttSwitch") global.buttSwitch = [];
var room_name = room_get_name(room);
for(var i = 0; i < array_length(global.buttSwitch); i++) {
	if global.buttSwitch[i] == room_name {
		for(var j = 0; j < array_length(order); j++) if instance_exists(order[j]) order[j].image_index++
		if instance_exists(obj_scb_barrier) obj_scb_barrier.size = 1
		if instance_exists(obj_swapButton) obj_swapButton.image_index = 1
		if instance_exists(obj_cav_barrier) with obj_cav_barrier {stage = 3; event_perform(ev_alarm,0)}
		instance_destroy(obj_fallingTree)
		done = true
		break
	}
}