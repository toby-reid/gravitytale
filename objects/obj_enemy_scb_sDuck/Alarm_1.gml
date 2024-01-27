/// @description Quack
var quack = [
	"It wonders why you want a jar of #toothpaste.",
	"It excitedly tells you how its day #has been.",
	"It is angry at your comparison to #the famous crime-fighter Ducktective.",
	"It doesn't understand your gibberish."
]
var response = [
	"Stomach-Faced Duck has no toothpaste #to lend.",
	"Stomach-Faced Duck likes your #politeness.",
	"Stomach-Faced Duck is jealous of #Ducktective's face-faced nature.",
	"Stomach-Faced Duck thinks you are a #quack-case."
]
var i = irandom(array_length(quack)-1)
obj_battleCore.text = [response[i],"You quack at Stomach-Faced Duck.&"+quack[i]]

if i == 1 {at--; spare = true}
else if i == 2 at++
if at < 1 at = 1
else if at > 7 at = 7