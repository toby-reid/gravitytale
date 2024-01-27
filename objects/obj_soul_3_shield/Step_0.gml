if keyboard_check_pressed(vk_down)  image_angle = 180
if keyboard_check_pressed(vk_up)    image_angle = 0
if keyboard_check_pressed(vk_right) image_angle = 270
if keyboard_check_pressed(vk_left)  image_angle = 90

if global.stage[0] != 4 instance_destroy()