/// @description after-battle dialogue
with instance_create_layer(160,192,layer,obj_textbox) {
	if global.spared[enemy.sheriff] and global.spared[enemy.deputy] {
		var slang = "city boy"
		if global.player[player.mabel] slang = "little missy"
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
	}
	else if global.spared[enemy.sheriff] {
		text = [
			"You...",
			"Why...",
			"You monster...",
			"You just couldn't stand seein' #happiness, could you?",
			"You have to disrupt it wherever #you go...",
			"I'll destroy you, kid...&You just wait..."
		]
	}
	else if global.spared[enemy.deputy] {
		text = [
			"WHAT...",
			"WHY...",
			"oh no...",
			"i...&i cant do this..."
		]
	}
}