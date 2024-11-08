image_xscale = 0
image_yscale = 0
if(x < 320) x *= 2
if(y < 240) y *= 2
grow = .2
if instance_exists(obj_dipper) {
	setMove = obj_dipper.canMove
	obj_dipper.canMove = false
}

text = ["An error has occurred.&Please report this!&Error code: @ff0000TBXDF"]//change
charRate = []//default .5
head = []//default noone
font = []//default fnt_basic_gui
style = []//default 0 no effect; 1 shake; 2 fontswap; 3 shake/fontswap; 4 wave; 5 shake/wave; 6 swap/wave; 7 all
sound = []//default tlk_default
choice = []//default 0; 1 two choices; 2 three; 3 four choices
charCount = 0;
swapTime = [];

action = []//set when choice[page] > 0
face = 0//used to specify frame of a talking animation
arrow = 0//image_index for Continue arrow
alarm[1] = 4
page = -1//used to note which item in text[] we are accessing; increases by 1 in initial setup

segText = []
segColor = []
alarm[2] = 1//pageSetup. Must be an alarm or the event fires before CreationCodes impact