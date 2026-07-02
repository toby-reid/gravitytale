image_speed = 0
alarm[0] = 10
if irandom(1) == 0 {
	x = 601
	image_xscale = -1
}

instance_create_layer(320,249,layer,obj_nyarfGun)

stop_the_bar = function()
{
    alarm[0] = -1;
    alarm[1] = -1;
    hspeed = 0;
    image_speed = 1;
    // TODO: At some point, make these collision detectors, to avoid all these magic numbers.
         if (alarm[1] >= 61) global.stage[4] = 1;
    else if (alarm[1] >= 47) global.stage[4] = 2;
    else if (alarm[1] >= 38) global.stage[4] = 3;
    else if (alarm[1] >= 32) global.stage[4] = 5;
    else if (alarm[1] >= 23) global.stage[4] = 3;
    else if (alarm[1] >=  9) global.stage[4] = 2;
    else if (alarm[1] >=  1) global.stage[4] = 1;
    else global.stage[4] = 0;
    if (global.player.at == AT_DF.UPGRADE) global.stage[4] *= 2;
}
