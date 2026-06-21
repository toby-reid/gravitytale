/// @description after-battle dialogue
with instance_create_layer(160,192,layer,obj_textbox_old) {
	if global.enemy_spared[ENEMY.SHERIFF] and global.enemy_spared[ENEMY.DEPUTY] {
		var slang = global.player.mabel ? "little missy" : "city boy";
		text = [
			"Well, "+slang+", I gotta say, #I'm almost impressed.",
			"You've managed to avoid the #mighty arm of the law...```#this time.",
			"Now, we got...`` other places #to be, so you can go fah now.",
			"But you betta believe we'll be #watchin' you, "+slang+".",
			"Don't go tryin' anything funny, #you heah?",
			"WOOO!&WE GOT 'EM!",
			"LET'S GO RUN SHIRTLESS AROUND A #FIRE HYDRANT!",
			"Quit readin' my mind!"
		]
	} else if global.enemy_spared[ENEMY.SHERIFF] {
		text = [
			"You...",
			"Why...",
			"You monster...",
			"You just couldn't stand seein' #happiness, could you?",
			"You have to disrupt it wherever #you go...",
			"I'll destroy you, kid...&You just wait..."
		]
	} else if global.enemy_spared[ENEMY.DEPUTY] {
		text = [
			"WHAT...",
			"WHY...",
			"oh no...",
			"i...&i cant do this..."
		]
	}
}