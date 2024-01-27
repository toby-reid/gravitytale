/// @description Remove
if image_index == 0 obj_battleCore.text[1] = "...but it wasn't attached to #your SOUL yet."
else if !spare {
	obj_battleCore.text[1] = "Careful not to remove the head, #you slowly peel the Cat. 5 off #of your SOUL."
	image_index = 0
}
else obj_battleCore.text[1] = "...but it was no longer #attached to your SOUL."