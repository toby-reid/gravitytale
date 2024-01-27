/// @description There ya go, kid!
with instance_create_layer(x+40,y,"Instances",obj_textBubble) {
	text = [
		"There ya go, #kid! #That's the #ticket!",
		"But these are #some of my #slowest #attacks.",
		"You'll need to #be much better #than that to #survive on the #surface!",
		"Here, why #don't you have #a taste of #what's to #come?"
	]
	head = [
		spr_bill_face_smile,
		spr_bill_face_neutral_side,
		spr_bill_face_neutral,
		spr_bill_face_smile
	]
}
stage = 8