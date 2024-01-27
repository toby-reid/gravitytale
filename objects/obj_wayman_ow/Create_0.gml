image_speed = 0
//Object created by obj_portalPotty at Creation if the Wayman has not been defeated this game
alarm[0] = 1200//20 seconds
stage = 0
alpha = 0
//instance_destroy()
//instance_destroy(obj_stans_ow_1)

ini_open("Reset.save")
if ini_read_real("C","W",false) prev = true
else prev = false
ini_close()