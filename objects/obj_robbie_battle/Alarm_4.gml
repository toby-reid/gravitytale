/// @description Bubble
bubble = instance_create_layer(x+60,y-80,"Instances",obj_textBubble)
if stage == 3 and global.stage[1] == 1 and global.stage[5] == 1 bubble.text[0] = "weeeeen\ndyyyyy"
else {
	if global.player[player.mabel] bubble.text[0] = "go awy kid, im not intrstd in lil grls"
	else bubble.text[0] = "keep movin so i can hit u squirt"
}
audio_sound_pitch(tlk_robbie,1)
bubble.sound[0] = tlk_robbie