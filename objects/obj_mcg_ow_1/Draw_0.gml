if (draw_y >= 0) {
	draw_sprite_part(sprite_index, image_index, 0, 0, sprite_width, draw_y, x - sprite_xoffset, y - sprite_yoffset);
} else {
	draw_self();
}
