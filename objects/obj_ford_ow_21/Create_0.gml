stage = 0
image_speed = 0
if !variable_global_exists("stans") global.stans = 0
if global.stans >= 21 stage = 5//Set to whatever it is if you've Run
if global.stans == 25 instance_destroy()
if global.player[player.runActive] == 2 geno = true
else geno = false

