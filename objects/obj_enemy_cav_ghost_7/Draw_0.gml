draw_self()
for(var i = 0; i < instance_number(obj_battleAttack); i++) with instance_find(obj_battleAttack,i) {
	draw_set_font(fnt_battle)
	draw_text(x,y,char)
}