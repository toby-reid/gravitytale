// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_genoMusic(){
	///@desc Sets music slower or normal for geno or not geno route
	if global.player[player.runActive] == 2 {
		//Music
		audio_sound_pitch(mus_birds,.2)
		audio_sound_pitch(mus_karsong,.5)
		audio_sound_pitch(mus_mansong,.2)
		audio_sound_pitch(mus_sharkstart,.5)
		audio_sound_pitch(mus_waterfall,.15)
		audio_sound_pitch(mus_waterquiet,.4)
		audio_sound_pitch(mus_wind,.3)
		
		//Music_Beatswap
		//mus_anticipation and mus_tension only play before geno
		audio_sound_pitch(mus_battle,.2)
		audio_sound_pitch(mus_birdsong,.1)//not used anywhere
		audio_sound_pitch(mus_bonetrousle,.2)
		//mus_date shouldn't play if Fordsy is dead
		audio_sound_pitch(mus_dummy,.1)//not used anywhere
		//mus_fallen and mus_home not needed as soos will always be there for you
		audio_sound_pitch(mus_ghostFight,.2)
		audio_sound_pitch(mus_heartache,.3)
		//mus_intro and mus_menu don't play during gameplay
		//mus_mewmew is a special case
		//mus_ngahhh won't play in geno
		audio_sound_pitch(mus_nyeh,.2)
		audio_sound_pitch(mus_ruins,.2)
		audio_sound_pitch(mus_sans,.2)
		audio_sound_pitch(mus_shop,.2)
		audio_sound_pitch(mus_snowy,.2)
		//mus_songMightPlay won't play if Fordsy is dead
		//mus_spearjustice won't play in geno
		audio_sound_pitch(mus_spider,.2)
		audio_sound_pitch(mus_spooktune,.5)
		audio_sound_pitch(mus_strongerMonsters,.2)
		audio_sound_pitch(mus_temmie,.6)
		audio_sound_pitch(mus_thundersnail,.4)
		audio_sound_pitch(mus_town,.2)

		audio_sound_pitch(sfx_atkAlert,.7)
		audio_sound_pitch(sfx_alert,.7)
	}
	else {
		audio_sound_pitch(mus_birds,1)
		audio_sound_pitch(mus_karsong,1)
		audio_sound_pitch(mus_mansong,1)
		audio_sound_pitch(mus_sharkstart,1)
		audio_sound_pitch(mus_waterfall,1)
		audio_sound_pitch(mus_waterquiet,1)
		audio_sound_pitch(mus_wind,1)
		
		audio_sound_pitch(mus_battle,1)
		audio_sound_pitch(mus_birdsong,1)
		audio_sound_pitch(mus_bonetrousle,1)
		audio_sound_pitch(mus_dummy,1)
		audio_sound_pitch(mus_ghostFight,1)
		audio_sound_pitch(mus_heartache,1)
		audio_sound_pitch(mus_nyeh,1)
		audio_sound_pitch(mus_ruins,1)
		audio_sound_pitch(mus_sans,1)
		audio_sound_pitch(mus_shop,1)
		audio_sound_pitch(mus_snowy,1)
		audio_sound_pitch(mus_spider,1)
		audio_sound_pitch(mus_spooktune,1)
		audio_sound_pitch(mus_strongerMonsters,1)
		audio_sound_pitch(mus_temmie,1)
		audio_sound_pitch(mus_thundersnail,1)
		audio_sound_pitch(mus_town,1)
		
		audio_sound_pitch(sfx_alert,1)
		audio_sound_pitch(sfx_atkAlert,1)
	}
}