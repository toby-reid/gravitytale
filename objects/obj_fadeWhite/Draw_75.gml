draw_set_alpha(alpha)
draw_rectangle_color(0,0,639,479,c_white,c_white,c_white,c_white,false)
draw_set_alpha(1)

if alpha < 1 alpha += .003
else instance_destroy()