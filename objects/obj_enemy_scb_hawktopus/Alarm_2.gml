/// @description Feed
if !global.study {
	obj_battleCore.text[1] = "You try to feed Hawktopus, but #you don't know what it eats."
	obj_battleCore.text[0] = "Perhaps you should look into #Hawktopus's diet."
}
else if !spare {
	obj_battleCore.text[1] = "You feed Hawktopus some "+choose("beef #jerkey","#toffee peanuts")+".&Hawktopus is full already."
	obj_battleCore.text[0] = "Hawktopus likes your habit of #(illegally) feeding wildlife."
	spare = true
}
else {
	obj_battleCore.text[1] = "You try to feed Hawktopus, but #it doesn't want to eat anymore."
	obj_battleCore.text[0] = "Hawktopus is ready to leave."
}