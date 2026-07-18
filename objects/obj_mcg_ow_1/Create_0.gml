if (global.gideon >= 1)
{
    instance_destroy();
    exit;
}

draw_y = 21;
image_alpha = 0;
image_speed = 0;
stage = 0;

alpha = 0;

car = inst_mcg_car;
car.image_speed = 0;
car.image_xscale = -1;
car.sprite_index = spr_trash_car;
if (global.player.genocide == RUN.ACTIVE) {
	car.image_index = 1;
}
