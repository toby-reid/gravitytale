//temp
//draw_text(0,0,alarm[0])

draw_set_alpha(alpha)
draw_rectangle_color(0,0,639,479,0,0,0,0,false)
draw_set_alpha(1)
draw_sprite_ext(sprite_index,image_index,2*(x-camera_get_view_x(view_camera[0])),2*(y-camera_get_view_y(view_camera[0])),2,2,0,image_blend,image_alpha)
if alpha > 0 with obj_dipper draw_sprite_ext(sprite_index,image_index,2*(x-camera_get_view_x(view_camera[0])),2*(y-camera_get_view_y(view_camera[0])),2,2,0,image_blend,image_alpha/4)