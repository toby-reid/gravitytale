/// @description Anim
draw_self()
arm += dir
draw_sprite_ext(spr_btl_robbie_arms,0,x,y+round(arm),2,2,0,c_white,image_alpha)
if global.stage[0] != 4 or instance_exists(obj_textBubble) draw_sprite_ext(spr_btl_robbie_arms,1,x,y+round(arm),2,2,0,c_white,image_alpha)
draw_set_alpha(image_alpha)
draw_rectangle(x-6,y-82,x+3,y-81,false)//Eye
draw_rectangle_color(x-6+2*round(arm),y-82,x-5+2*round(arm),y-81,0,0,0,0,0)//Pupil
draw_set_alpha(1)
if arm == 4 dir *= -1
else if arm == 0 dir *= -1
if arm%2 == 0 if stage != 3 or global.stage[1] != 1 or global.stage[5] != 1 or global.stage[0] != 4 instance_create_layer(x+40,y-64+arm,"Instances",obj_robbie_music)