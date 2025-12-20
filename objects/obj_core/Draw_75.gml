if (alarm[3] > -1) {
	draw_set_font(fnt_basic_gui);
	draw_set_halign(fa_right);
	draw_text_color(636,0,string_concat("Selected Costume ",global.costume+1),c_black,c_black,c_black,c_black,min(1,alarm[3]/10));
	draw_text_color(634,0,string_concat("Selected Costume ",global.costume+1),c_white,c_white,c_white,c_white,min(1,alarm[3]/10));
	draw_set_halign(fa_left);
}
draw_self();
