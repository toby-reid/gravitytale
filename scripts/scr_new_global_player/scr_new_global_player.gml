// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum TIME {
	HOURS,
	MINUTES,
	SECONDS
}
enum AT_DF {
	NONE,
	BASE,
	UPGRADE
}
enum BAG {
	NONE,
	SHOULDER_BAG,
	PIGGER_BAG,
	BOTH
}
enum RUN {
	UNSTARTED,
	ACTIVE,
	ABORTED
}
enum PORTAL_POTTY {
	NONE,
	FOREST_START,
	CAVES_START,
	MINES_START,
	UFO_START
}
enum BEAVER_PIC {
	NONE,
	GENERIC_BEAVER,
	CHAINSAW_BEAVER,
	SOLD_CASH,
	SOLD_NEWSPAPER
}
enum COSTUME {
	DEFAULT,
	NO_DF, // No hat / no sweater
	DF_NORMAL, // Pine tree hat / SS sweater
	DF_UPGRADE // Newspaper hat / Moth sweater
}

/// @description Resetting global.player{}
function scr_new_global_player() {
    /// If anything here is changed, scr_save and scr_load will also need updates
	global.player = {
		name: "Dipper",
		mabel: variable_global_exists("player") ? bool(global.player.mabel) : false,
		time: [0, 0, 0], // use enum TIME for indices
		kills: 0,
		spares: 0,
		hp: 20,
		maxHp: 20,
		money: 0,
		lv: 1,
		costume: COSTUME.DEFAULT,
		at: AT_DF.NONE,
		df: AT_DF.NONE,
		bag: BAG.NONE,
		coupon: false,
		genocide: RUN.UNSTARTED,
		beaverPic: BEAVER_PIC.NONE,
		portalPotty: PORTAL_POTTY.NONE
	};
}
