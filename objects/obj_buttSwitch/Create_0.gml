/// @description Use CC to set obj_buttSwitch.order[]
active = 1//0 must reset; 1+ order numbering
done = false//True if we've completed the buttons
order = [noone]//List of different ids
pressed = noone//Reset every Step. Which button was just pressed?
alarm[1] = 1
if !variable_global_exists("buttSwitch") global.buttSwitch = []