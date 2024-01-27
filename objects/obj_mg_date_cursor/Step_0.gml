if mouse_x != mouse[0] or mouse_y != mouse[1] {x = mouse_x; y = mouse_y}
else {
	if keyboard_check(vk_down)  {y += 2; if y > 240 y = 240}
	if keyboard_check(vk_up)    {y -= 2; if y < 0 y = 0}
	if keyboard_check(vk_right) {x += 2; if x > 320 x = 320}
	if keyboard_check(vk_left)  {x -= 2; if x < 0 x = 0}
}
mouse = [mouse_x,mouse_y]

if mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_enter) audio_play_sound(sfx_mouseClick,0,false)
if mouse_check_button(mb_left) or keyboard_check(vk_enter) image_index = 1
else image_index = 0