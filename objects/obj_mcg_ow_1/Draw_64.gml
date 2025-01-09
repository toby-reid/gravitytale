/// @description Fade to black
if (alpha > 0) {
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, 639, 479, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
