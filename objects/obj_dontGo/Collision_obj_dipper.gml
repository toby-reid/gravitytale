if other.canMove {
	other.x += lengthdir_x(2,set_dir*90)
	other.y += lengthdir_y(2,set_dir*90)
	with instance_create_layer(160,192-144*(other.y > 140),"Instances",obj_textbox) {
		text = other.text
		head = other.head;
	}
	other.dir = set_dir
}