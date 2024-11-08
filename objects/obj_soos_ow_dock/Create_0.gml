// This object is for the approach to the dock, for each room leading up to it,
// while Soos gives his speech.
image_speed = 0
text = ["Something's not #right."]
head = [spr_soos_face_contempt]
soos = 0///@desc change id.soos, dipx, dipy, direction in CC
dipx = 0
dipy = 0
active = false
ini_open("Reset.save")
if ini_read_real("D",ENEMY.SOOS,0) > 0 instance_destroy() // If we've encountered Soos before on this run, we don't need to hear his speech again
ini_close()