if !instance_exists(obj_soos_ow_27) if !global.enemy_killed[ENEMY.SOOS] draw_sprite(spr_soos_d,0,x+image_xscale*60,y+30)
if instance_exists(obj_dipper) with obj_dipper draw_self()

if active if instance_exists(obj_textbox) with obj_textbox if variable_instance_exists(id,"charCount") if charCount > 25 charCount = string_length(text[0])