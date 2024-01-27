/// @description Melt
switch image_index {
	case 0://already melted
		obj_battleCore.text[1] = "You try to melt the wax, but #it just ends up getting all #over your hands."
		obj_battleCore.text[0] = "You feel like the lowest scum #in history."
		break
	case 1://Normal
		obj_battleCore.text[1] = "You re-melt Wax Stans."
		obj_battleCore.text[0] = "Soos looks disappointed."
		image_index = 0
		global.dummy = 0
		break
	case 2://melted dummy
		obj_battleCore.text[1] = "You try to melt the wax, but #it just ends up getting all #over your hands."
		obj_battleCore.text[0] = "Soos is having a meltdown...&Much like the wax..."
		break
	case 3://Normal dummy
		obj_battleCore.text[1] = "You re-melt the reformed wax #figure."
		obj_battleCore.text[0] = "Soos looks like he might cry."
		image_index = 2
		global.dummy = 5
		break
}