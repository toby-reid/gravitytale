if alarm[3] > -1 {
	draw_set_font(fnt_basic_gui)
	draw_set_halign(fa_right)
	draw_text_color(636,0,"Selected Costume "+string(global.costume+1),0,0,0,0,alarm[3]/10)
	draw_text_color(634,0,"Selected Costume "+string(global.costume+1),c_white,c_white,c_white,c_white,alarm[3]/10)
	draw_set_halign(fa_left)
}
draw_self()

if(variable_global_exists("music")) draw_text(0,0,global.music);