/// @description Parent of all other ghosts
categories = [obj_enemy_cav_ghost_1,obj_enemy_cav_ghost_2,obj_enemy_cav_ghost_3,obj_enemy_cav_ghost_4,obj_enemy_cav_ghost_5,obj_enemy_cav_ghost_6,obj_enemy_cav_ghost_7,obj_enemy_cav_ghost_8,obj_enemy_cav_ghost_9,obj_enemy_cav_ghost_10]
name = "Haunted Painting"
act = ["Check","Mirror","Doodle","Picasso"]
check = "Can leap from image to image.&Weakness: Silver mirrors."
spare = false
run = true
hp = 0
maxhp = hp
at = 4
lv = false//set true if killing person increases LV
sb = 0
area = AREA.UNKNOWN;
timer = 0
bubble = noone

image_xscale = 2
image_yscale = 2
image_alpha = 0

paintings = []
for(var i = 0; i < 4; i++) {
	paintings[i] = instance_create_layer(x+lengthdir_x(100,i*90),y+lengthdir_y(100,i*90),layer,obj_ford_ow_1)
	with paintings[i] {
		sprite_index = spr_ghost_4_frame
		image_index = 2*irandom(1)
		image_xscale = 2
		image_yscale = 2
		image_angle = 90*i
		image_alpha = 0
		//direction = image_angle + 90
		//while direction >= 360 direction -= 360
		//speed = 4
		dir = image_angle
	}
}
painting = irandom(3)
with paintings[painting] {
	other.x = x
	other.y = y
}
image_index = painting%2
if painting >= 2 image_xscale *= -1

obj_battleCore.text[0] = "You've heard of paintings where #the \"eyes follow you\"?&This painting follows you."