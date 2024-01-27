/// @description make dipstick fall
obj_dipper.dir++
if obj_dipper.dir == 4 obj_dipper.dir = 0
alarm[3] = 10