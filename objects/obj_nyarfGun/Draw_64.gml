draw_self()
if alarm[0] > -1 {
	if global.stage[4] <= 10 and global.stage[4] != 9 draw_sprite(spr_battleDamage,global.stage[4],x,20)
	else {
		var drawx = x-15*(string_length(string(global.stage[4]))-1)
		for(var i = 0; i < string_length(string(global.stage[4])); i++) {
			draw_sprite(spr_battleDamage,9,drawx,20)
			drawx += 30
		}
	}
	draw_healthbar(other.x-50,40,other.x+50,55,100*(hp/target.maxhp),c_gray,c_lime,c_lime,0,true,true)
	if target.hp < hp hp -= (starthp-target.hp)/40
	if global.stage[4] > 0 target.image_alpha = .75
}
