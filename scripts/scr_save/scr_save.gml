/// @param {string} rmName: The name of the current room, to be used in Prof.save
function scr_save(rmName="Unknown", _music=silence, _playsound=true) {
	file_delete(global.SAVE_FILES.PROFILE); // ini for obj_startMenu info
	file_delete(global.SAVE_FILES.SAVE_DATA); // bitfile for in-game global variables
	// Rest.save is the information that stays between Resets & Saves, like how many times a person has killed you

// TODO: Include global.dummy, global.ghost
// global.study, global.defeated_unicorn, global.hat, global.costume

	ini_open(global.SAVE_FILES.PROFILE.NAME);
	ini_write_string(global.SAVE_FILES.PROFILE.KEYS.PRIMARY,global.SAVE_FILES.PROFILE.KEYS.PLAYER_NAME,global.player.name);
	ini_write_real(global.SAVE_FILES.PROFILE.KEYS.PRIMARY,global.SAVE_FILES.PROFILE.KEYS.LV,global.player.lv);
	ini_write_string(global.SAVE_FILES.PROFILE.KEYS.PRIMARY,global.SAVE_FILES.PROFILE.KEYS.ROOM_NAME,rmName);
	ini_write_string(global.SAVE_FILES.PROFILE.KEYS.PRIMARY,global.SAVE_FILES.PROFILE.KEYS.PLAY_TIME,scr_format_time());
	ini_close();

	var _bin = file_bin_open(global.SAVE_FILES.SAVE_DATA.NAME, 1); // opens new binary file in write mode

	// The following must be read/written in order.
	scr_writeString(_bin, global.ENCRYPTION_KEY);
	scr_writeString(_bin, room_get_name(room));
	scr_writeString(_bin, window_get_caption());

	scr_writeString(_bin, global.player.name);
	scr_writeBools(_bin, [global.player.mabel]);
    // Assuming the player hasn't been playing for 256 hours, 1 byte should be plenty for each unit of time
    scr_writeArray(_bin, global.player.time);
    // Depending on how it goes, the player may have a lot of kills/spares... so allocate 2 bytes for each
    scr_writeInteger(_bin, global.player.kills, 2);
    scr_writeInteger(_bin, global.player.spares, 2);
    scr_writeInteger(_bin, global.player.hp, 1); // This should never exceed 99 normally
    scr_writeInteger(_bin, global.player.maxhp, 1); // Same
    scr_writeInteger(_bin, global.player.money, 4); // Absurdly large, but ya never know!
    scr_writeInteger(_bin, global.player.lv, 1); // This should never exceed 20 normally
    var at_df_bag_coupon = (
        (global.player.at << 6) // 0-2 (2 bits)
        + (global.player.df << 4) // 0-2 (2 bits)
        + (global.player.bag << 2) // 0-3 (2 bits)
        + (global.player.coupon ? 1 : 0) // 0-1 (1 bit)
    );
    scr_writeInteger(_bin, at_df_bag_coupon, 1);
    var geno_beaver_potty = (
        (global.player.genocide << 6) // 0-2 (2 bits)
        + (global.player.beaverPic << 3) // 0-4 (3 bits)
        + global.player.portalPotty // 0-4 (3 bits)
    );
    scr_writeInteger(_bin, geno_beaver_potty, 1);

    scr_writeArray(_bin, global.inventory);
    scr_writeInteger(_bin, global.costume);
    scr_writeArray(_bin, global.menu);
    scr_writeInteger(_bin, global.battleTimer, 2);

    scr_writeBools(_bin, global.enemy_killed);
    scr_writeBools(_bin, global.enemy_spared);

    if (!variable_global_exists("dummy")) global.dummy = 0;
    if (!variable_global_exists("ghost")) global.ghost = 0;
    scr_writeInteger(_bin, (global.dummy << 4) + global.ghost);
    if (!variable_global_exists("study"))            global.study = false;
    if (!variable_global_exists("defeated_unicorn")) global.defeated_unicorn = false;
    if (!variable_global_exists("hat"))              global.hat = false;
    scr_writeBools(_bin, [global.study, global.defeated_unicorn, global.hat]);

    // TODO: Update global.areaKills to be an array of objects, not this DS crap
	for (var i = 0; i < AREA.TOTAL; i++) {
		scr_writeInteger(_bin, global.areaKills[? i].killCount, 1);
	}

	if (instance_exists(obj_dipper)) {
		scr_writeInteger(_bin, round(obj_dipper.x), 4);
		scr_writeInteger(_bin, round(obj_dipper.y), 4);
	}
    else scr_writeInteger(_bin, irandom(0xffff_ffff_ffff_ffff), 8); // doesn't matter; just write garbage data

	scr_writeString(_bin, audio_get_name(_music));

	if (!variable_global_exists("soos"))   global.soos   = 0;
	if (!variable_global_exists("stans"))  global.stans  = 0;
	if (!variable_global_exists("toby"))   global.toby   = 0;
	if (!variable_global_exists("wendy"))  global.wendy  = 0;
	if (!variable_global_exists("gideon")) global.gideon = 0;
	scr_writeInteger(_bin, global.soos);
	scr_writeInteger(_bin, global.stans);
	scr_writeInteger(_bin, global.toby);
	scr_writeInteger(_bin, global.wendy);
	scr_writeInteger(_bin, global.gideon);

	if (!variable_global_exists("hamstick"))  global.hamstick  = false;
	if (!variable_global_exists("fairydust")) global.fairydust = false;
	scr_writeBools(_bin, [global.hamstick, global.fairydust]);

	if (!variable_global_exists("buttSwitch")) global.buttSwitch = [];
    scr_writeArray(_bin, global.buttSwitch, scr_writeString);

	if (!variable_global_exists("trashCan")) global.trashCan = [];
    scr_writeArray(_bin, global.trashCan, function(b, e) { scr_writeInteger(b, int64(e), 8); });

	file_bin_close(_bin);

	if (_playsound) audio_play_sound(sfx_save,0,false);
}
