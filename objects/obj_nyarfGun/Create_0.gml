target = global.enemy[global.stage[2]]
x = target.x
starthp = target.hp
hp = starthp
y -= 1

image_xscale = 2
image_yscale = 2
image_speed = 0
if global.player.mabel {
	sprite_index = global.player.at == AT_DF.UPGRADE
				   ? spr_confetti
				   : spr_grapplingHook;
} else if global.player.at == AT_DF.UPGRADE {
	sprite_index = spr_slash
	image_xscale = 4
	image_yscale = 4
}