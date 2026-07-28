if (global.enemy_killed[battle] or global.enemy_spared[battle]) {
	instance_destroy();
}
else if (obj_dipper.canMove) {
	with instance_create_layer(0,0,"Instances",obj_toBattle) {
		goto = other.goto;
		music = other.music;
		prevMusic = other.prevMusic;
		dest = other.dest;
	}
	instance_destroy();
}
