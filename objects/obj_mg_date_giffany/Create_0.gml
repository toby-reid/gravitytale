lives = 3
stage = 1//0 Title screen, 1 Story, 2 Gameplay, 3 You Win/Lose (gameover)
timer = 0//Used for the Story bit
alpha = 0
event_user(0)
layer_set_visible(layer_get_id("Assets_1"),false)
audio_group_load(Minigames)
if !audio_group_is_loaded(Minigames) room_restart()
audio_sound_pitch(tlk_default,1.5)

letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ.!?>,'"; // matches spr_mg_date_letters

image_speed = 0

charCount = 0
questions = [
	["Will you help me carry my#books?","Yes of course","I am impatient!\nDate me now!","Hey look a squid!"],
	["What would you like to talk#about?","Your interests","Samurai","Squids"],
	["What do you do in your free#time?","Listen to music or read","Talk with my girlfriend","Pretend I'm a squid"],
	["What is your favorite color?","Green","Not green","Squid-ink black"],
	["How would you describe#yourself?","Someone safe","Someone unsafe","Squid breeder"],
	["Do you like me?","Absolutely","Definitely","Yes but I like squids more"],
	["Do you have any dreams?#life goals?","Success in life","Only you","Squids"],
	["What is your dream vacation?","Anywhere you want","Florida","Farming squids in Ourscraft"],
	["Do you like this game?","Yes","Not sure","I'd prefer squids"],
	["Please take a moment to rate it#on the Crapp Store.","Don't ask again","Yes master","Squids"],
	["Would you please be my#boyfriend?","Yes of course","I'm not interested","I'm already taken (by a squid)"]
]
feedback = "";