if (alarm[3] > -1) {
	draw_set_font(fnt_basic_gui);
	draw_set_halign(fa_right);
	var costume_text = string_concat("Selected Costume ", global.player.costume + 1);
	draw_text_color(636,0,costume_text,c_black,c_black,c_black,c_black,min(1,alarm[3]/10));
	draw_text_color(634,0,costume_text,c_white,c_white,c_white,c_white,min(1,alarm[3]/10));
	draw_set_halign(fa_left);
}
draw_self();
