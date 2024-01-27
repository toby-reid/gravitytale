if instance_exists(obj_buttSwitch) if obj_buttSwitch.done if stage < 5 if alarm[0] == -1 {
	//cam = [camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])]
	event_perform(ev_alarm,0)
	event_perform(ev_alarm,1)
}