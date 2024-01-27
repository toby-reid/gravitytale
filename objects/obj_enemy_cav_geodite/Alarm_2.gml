/// @description RPS
if act[2] == "Paper" {
	obj_battleCore.text[1] = "Papers, please.&We'll see if Geodite is #a legal immigrant."
	obj_battleCore.text[0] = "Darn, seems everything's in #order.&Guess paper can't beat rock."
}
else if act[2] == "Scissors" {
	obj_battleCore.text[1] = "You pulled out the largest pair #of shears you've ever seen and #harvested some crystal."
	obj_battleCore.text[0] = "Darn, they're not real crystals.&Geodite is scarred for life now #though."
	spare = true
}
else {//rock
	if instance_number(obj_battleEnemy) < 2 or ((x == 128 or x == 512 or x == 320) and instance_number(obj_battleEnemy) < 3) {
		var ecks = 320
		if (x == 128 or x == 512 or x == 320) for(var i = 128; i <= 512; i += 192) {
			if !(obj_battleEnemy.x == i) {ecks = i; break}
		}
		else {
			if !(obj_battleEnemy.x == 192) ecks = 192
			else ecks = 448
		}
		for(var j = 0; j < array_length(global.enemy); j++) {
			if !instance_exists(global.enemy[j]) break
		}
		global.enemy[j] = instance_create_layer(ecks,y,layer,object_index)
		obj_battleCore.text[1] = "You grabbed a nearby rock, but #turns out it's just another #Geodite you angered."
	}
	else obj_battleCore.text[1] = "Yet, oddly enough, there was no #nearby rock to grab in this #stone cave."
}