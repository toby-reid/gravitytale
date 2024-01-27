/// @description Dream
obj_battleCore.text[1] = "You dreamed with your might...&It's not strong, but you found #some respite."
global.player[player.hp] += 5
if global.player[player.hp] > global.player[player.maxhp] global.player[player.hp] = global.player[player.maxhp]
audio_play_sound(sfx_heal,0,false)