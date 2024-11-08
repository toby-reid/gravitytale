// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_generate_enemy_indices(){
	enum ENEMY {
		BLENDIN, //from SCB
		BEAVER, //BONUS - with a chainsaw
		SOOS, //FINAL - SCB
		MANLY_DAN,
		TYLER, //paired with mDan
		ROBBIE,
		SHERIFF,
		DEPUTY, //paired with sheriff
		SALESMAN, //BONUS - in the mShack
		FORD, //FINAL - FST
		STANS_CAVE, //BONUS - req. for pacifist. Can be "killed," but only used for Stans's data
		LEADERAUR, //BONUS - in the mancave
		BLACK_MKT_GNOME, //black market gnome
		GHOSTS, //plural. Can only be spared. Likely to be unused, but that's ok
		TREMBLEY, //Quentin Trembley III, in place of ghosts on Geno. Can only be killed.
		WENDY, //FINAL - CAV
		ZOMBIE_BOYFRIEND, //zombie boyfriend - actually Gnomes. A single Gnome killed results in zbf killed; all spared results in zbf spared
		PACIFICA,
		PT_BROS, //BONUS - pterodactyl bros
		GIDEON_TV, //specifically the TV on wheels. Battled multiple times throughout the Tunnels
		ASSIMILATED_GNOMES, //Gnomezilla. A single Gnome killed results in asm killed; all spared results in asm spared.
		KAREN, //BONUS - if player.spares == 0, it'll be killed; else if player.kills == 0, it'll be spared; else it'll be both.
		GIDEON, //FINAL - TOT. Not encountered in geno.
		MCGUCKET, //FINAL - TOT. Geno only. Cannot be spared. Killing him results in gideon killed also.
		STANS_GENO, //Genocide only. Can be spared, but only for the gag. Spared will not last.
		SHMEBULOCK, //the ultimate Gnome. Fires almost impossible amount of Gnomes your way, but super weak.
		TIME_BABY, //FINAL - UFO
		BILL_NIGHTMARE, //neutral final boss. Probably unused, but I'll leave it in just in case
		BILL_PHYSICAL, //pacifist final boss. Probably unused, but I'll leave it in just in case
		SIBLING, //genocide only. Probably unused, but I'll leave it in just in case
		WAYMAN, //BONUS - found in many places.
		TOTAL //used for the below declaration for simplicity in array_length.
	}
	global.enemy_killed = array_create(ENEMY.TOTAL, false);
	global.enemy_spared = array_create(ENEMY.TOTAL, false);
}