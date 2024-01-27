/// @description Feed
if sprite_index == spr_enemy_cav_scampfire {
	obj_battleCore.text[1] = choose("You toss a marshmallow into #the flames.&Scampfire wants s'more.","You set a can of beans into #the flames.&You're bean such a can-d host.")
	obj_battleCore.text[0] = "Scampfire has gotten slightly #stronger.&Way to fan the flames, buddy."
	at++
}
else obj_battleCore.text[1] = "To make fire, you need oxygen, #fuel, and flame.&Scampfire is out of flame."