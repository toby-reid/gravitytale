if (draw_y >= 0) {
	draw_sprite_part(sprite_index, image_index, 0, 0, sprite_width, draw_y, x - sprite_xoffset, y - sprite_yoffset);
} else {
	draw_self();
}

if (instance_exists(obj_ford_ow_1)) with obj_ford_ow_1 {
	draw_sprite(arm, arm_index, x - 4, y + 6);
	if (other.stage == 6) {
		draw_sprite(spr_gideon_tv_static, irandom(sprite_get_number(spr_gideon_tv_static) - 1), x, y);
	} else if (other.stage > 6) {
		draw_sprite(face, 0, x, y);
	}
}

if (stage >= 8) {
	draw_sprite(spr_min_hole, 0, 260, 120);
}
