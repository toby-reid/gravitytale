image_speed = 0
text = ["Something's not #right."]
head = [spr_soos_face_contempt]
soos = 0///@desc change id.soos, dipx, dipy, direction in CC
dipx = 0
dipy = 0
active = false
ini_open("Reset.save")
if ini_read_real("D",enemy.soos,0) > 0 instance_destroy()
ini_close()