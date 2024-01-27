audio_play_sound(mus_intro,0,false)
if !audio_is_playing(mus_intro) room_restart()//if audiogroup isn't loaded

charCount = 0
text = [//maxes at 26
	"Long ago, two races ruled \nover Earth:\nMONSTERS and HUMANS.",
	"One day, war broke out \nagainst beings from \nanother dimension.",
	"After a long battle, the \nEarthlings were victorious.",
	"They sealed the enemy in \nthe NIGHTMARE REALM using \nscientastic measures.",
	"Many years later...",
	"GRAVITY FALLS, OREGON\n201X",
	"Legends say summer has no \nend in this pocket of \nthe woods."
]
dipdex = 8
alarm[0] = 5