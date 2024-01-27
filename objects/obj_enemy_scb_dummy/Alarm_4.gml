/// @description Create textbubble
if hp > 0 if tries < 5 if !(global.stage[1]==3 and global.stage[4]==0) with instance_create_layer(x+120,140,"Instances",obj_textBubble) {
	text = [". . ."]
	sound = [silence]
	style = [4]
	charRate = [.2]
	other.bubble = id
}