sprite_index = spr_scb_chair
text = [
	"(It's Soos's precious chair.)",
	"(He calls it \"Abuelita\" and #avoids sitting on it...)",
	"(Perhaps this is a topic you #shouldn't bring up.)"
]
if global.killed[enemy.soos] {
	text = ["(It was Soos's precious chair.&(I guess it's yours now though.)"]
	image_index = 1
}