draw_rectangle_color(x+1,y+1,x+20*image_xscale-2,y+20*image_yscale-2,c_black,c_black,c_black,c_black,0)
draw_rectangle_color(x+1,y+1,x+20*image_xscale-2,y+20*image_yscale-2,c_white,c_white,c_white,c_white,1)

if global.stage[0] == 5 instance_destroy()