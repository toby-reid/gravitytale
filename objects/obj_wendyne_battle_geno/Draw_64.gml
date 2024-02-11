/// @description White
if(alpha > 0) {
	draw_set_alpha(alpha);
	draw_rectangle_color(0,0,639,479,c_white,c_white,c_white,c_white,false);
	draw_set_alpha(1);
}

draw_text(0,0,global.stage);
draw_text(0,30,hp);