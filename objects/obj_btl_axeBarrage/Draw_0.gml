draw_set_font(fnt_battle)
draw_text(30,403,global.player.name+"  LV "+string(global.player.lv))
draw_sprite(spr_hpkr,0,250,405)
draw_healthbar(280,400,300+(4*global.player.lv),420,100*(global.player.hp/global.player.maxHp),c_red,c_yellow,c_yellow,0,true,false)
draw_text(315+(4*global.player.lv),403,string_concat(global.player.hp, " / ", global.player.maxHp));
