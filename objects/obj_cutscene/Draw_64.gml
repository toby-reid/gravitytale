if image_alpha == 1 charCount += .25

if image_index < 7 {
	if charCount >= string_length(text[image_index])+34 image_alpha -= .02
	draw_set_font(fnt_basic_gui)
	draw_text_ext_color(110,310,string_copy(text[image_index],1,charCount),35,450,0xe5e5e5,0xe5e5e5,0xe5e5e5,0xe5e5e5,image_alpha)
}
else if image_index < 10 {if charCount >= 25 image_alpha -= .01}
else {
	if charCount >= 30 {
		if !instance_exists(obj_fadeWhite) {
			if charCount == 30 instance_create_layer(0,0,"Instances",obj_fadeWhite)
			else with instance_create_layer(0,0,"Instances",obj_title) goto = rm_menu
			audio_stop_sound(sfx_fadeWhite)
		}
	}
}

if image_alpha == 0 {charCount = 0; image_index++}
if charCount == 0 image_alpha += .01

draw_set_alpha(.4)
for(var i = 0; i < 480; i += 4) draw_rectangle_color(0,i,640,i+1,0,0,0,0,false)
draw_set_alpha(1)