with instance_create_layer(0,0,layer,obj_toBattle) {
	music = mus_thundersnail
	goto = btl_cav_11_bmgnome
}
stage++
if instance_exists(obj_textbox_old) obj_textbox_old.grow = -.25