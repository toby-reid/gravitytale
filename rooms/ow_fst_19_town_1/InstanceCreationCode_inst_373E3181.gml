sprite_index = spr_fst_tats
text = ["Sorry, we don't serve minors."]
//if we've defeated a minigame or somethingp, instance_destroy() so they can reach obj_toRoom
if global.player.genocide == RUN.ACTIVE 
	text = array_concat(text,
		[
			". . .&What, you mean your special #little murder spree?",
			"Yeah, kid, everyone knows.&Most the town's already been #evacuated.",
			"But not us.&We're the manliest of men.&We don't fear you, kid.",
			"Now, get out of here before we #real men pound you all at once."
		]);