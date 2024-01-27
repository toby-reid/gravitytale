/// @description Already pressed? - runs after Creation
for(var i = 0; i < array_length(global.buttSwitch); i++) {
	if global.buttSwitch[i] == room {
		for(var j = 0; j < array_length(order); j++) if instance_exists(order[j]) order[j].image_index++
		if instance_exists(obj_scb_barrier) obj_scb_barrier.size = 1
		if instance_exists(obj_swapButton) obj_swapButton.image_index = 1
		if instance_exists(obj_cav_barrier) with obj_cav_barrier {stage = 3; event_perform(ev_alarm,0)}
		instance_destroy(obj_fallingTree)
		done = true
		break
	}
}