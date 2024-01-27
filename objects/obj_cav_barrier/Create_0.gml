stage = 0
cam = [x+image_xscale/2-160,y+image_yscale/2-120]
if cam[0] < 0 cam[0] = 0
else while cam[0] > room_width-320 cam[0]--
if cam[1] < 0 cam[1] = 0
else while cam[1] > room_height-240 cam[1]--

tiledata = [20,5,15]//by default: path edges, walls, base

if !variable_global_exists("buttSwitch") global.buttSwitch = []
var butt = false;
for(var i = 0; i < array_length(global.buttSwitch); i++) {
	if global.buttSwitch[i] == room {
		stage = 4
		event_user(0)
		instance_destroy()
		butt = true
		break
	}
}
if !butt if global.player[player.runActive] == 2
	global.buttSwitch[array_length(global.buttSwitch)] = room