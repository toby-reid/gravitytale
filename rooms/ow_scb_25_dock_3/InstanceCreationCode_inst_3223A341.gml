sprite_index = spr_soos_l
direction = 180
dipx = 180
soos = 25
if global.player[player.mabel] var col = "CC277A"
else var col = "1970FF"
text = [
	"Don't you get it, #@"+col+global.player[player.name]+"@ffffff?",
	"You aren't leaving this #island.",
	"Go back to my cabin.&Play a game or #something..."
]
head = [
	spr_soos_face_disappoint_side,
	spr_soos_face_disappoint,
	spr_soos_face_disappoint_side
]