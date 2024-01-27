/// @description Pun
var pun = [
	"You ask Cowl how it #en-cow-ntered you.",
	"You tell Cowl you're egg-cited #to meet it.",
	"I forgot all my pun ideas.&Owl have to think of one later.",
	"You've never seen anything #like this thing...&Holy cowl!",
	"You tell Cowl his presence is #a-moo-sing."
]
var response = [
	"Cowl doesn't even know hoo you #are.",
	"Cowl knows you're winging it.",
	"Cowl wonders how long you'll #milk this joke.",
	"Cowl just wants to moove on.",
	"Cowl thinks that one was a #hoot."
]
var i = irandom(array_length(pun)-1)
obj_battleCore.text = [response[i],pun[i]]