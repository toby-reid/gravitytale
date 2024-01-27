if instance_number(obj_bill_overworld) > 1 {
	draw_set_alpha(instance_find(obj_bill_overworld,1).image_alpha)
	draw_rectangle_color(obj_dipper.x-160,obj_dipper.y-120,obj_dipper.x+160,obj_dipper.y+120,c_white,c_white,c_white,c_white,false)
	draw_set_alpha(1)
	draw_self()
	with obj_dipper if y < other.y draw_self()
	with instance_find(obj_bill_overworld,1) draw_self()
	with obj_dipper if y >= other.y draw_self()
}