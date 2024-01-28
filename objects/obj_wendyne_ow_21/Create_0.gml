stage = 0;
alpha = 0;
image_speed = 0;
index = 0;
drawy = 620;

if(!variable_global_exists("wendyne")) global.wendyne = 20;
if(global.wendyne >= 22 or global.killed[enemy.wendy]) instance_destroy();
else if(global.wendyne == 21) stage = 8;