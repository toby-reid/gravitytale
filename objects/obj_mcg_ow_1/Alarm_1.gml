/// @description Look around
if (sprite_index == spr_mcg_l) {
	with instance_create_layer(160, 192, layer, obj_textbox) {
		text = [
			"I seen it!&I seen it again!",
			"It's the Gravity Falls #Grompelslumper!",
			"Come quick before it #scrabdoodles away!",
			". . .",
			"NOOO!&You're all in grave #DANGER!",
			"It had a big head like a #dino-saurus!",
			"And short, stubbly legs #like...",
			"well, like this young " + ((global.player.mabel) ? "lady" : "boy") + " #over here!",
			"It vanishified a bald #gentleman on Scuttlebutt #Island,",
			"then shim-shammed on over #into this forest!&You gotta believe me!",
			". . .",
			"Well, now that I take a #closer look...",
			"It's you who's them #Grompelslumper!&We're DOOMED!",
			"There's only one thing #left to do!",
			"I'll have to call out my #@99D9EAsecret weapon @ffffffbefore #it's ready!",
			"Quickly, to arms!"
		];
		head = [
			spr_mcg_head_crazy,
			spr_mcg_head_crazy,
			spr_mcg_head_ohcrap,
			spr_mcg_head_uncertain,
			spr_mcg_head_crazy,
			spr_mcg_head_ohcrap,
			spr_mcg_head_uncertain,
			spr_mcg_head_happy,
			spr_mcg_head_uncertain,
			spr_mcg_head_ohcrap,
			spr_mcg_head_uncertain,
			spr_mcg_head_uncertain,
			spr_mcg_head_ohcrap,
			spr_mcg_head_uncertain,
			spr_mcg_head_crazy,
			spr_mcg_head_crazy
		];
		for (var i = 0; i < array_length(text); i++) {
			sound[i] = tlk_mcg;
		}
	}
} else {
	switch (sprite_index) {
		case spr_mcg_d: sprite_index = spr_mcg_u; break;
		case spr_mcg_u: sprite_index = spr_mcg_r; break;
		case spr_mcg_r: sprite_index = spr_mcg_l; break;
	}
	alarm[1] = 45 + irandom(30);
}
