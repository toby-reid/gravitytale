stage = 0;
image_speed = 0;
if(!variable_global_exists("wendyne")) global.wendyne = 22;
else if(global.wendyne >= 23) instance_destroy();