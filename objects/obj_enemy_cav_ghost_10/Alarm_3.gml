/// @description Dream
obj_battleCore.text[1] = "You dreamed with your might...&It's not strong, but you found #some respite."
global.player.hp += 5
if global.player.hp > global.player.maxHp global.player.hp = global.player.maxHp
audio_play_sound(sfx_heal,0,false)