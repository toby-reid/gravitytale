/// @desc Loads the latest save from the binary Save file.
/// @return {Bool}: Whether loading was successful
function scr_load()
{
    var _bin = file_bin_open(global.SAVE_FILES.SAVE_DATA.NAME, 0); // open in 'read' mode

    if (scr_readString(_bin) != global.ENCRYPTION_KEY)
    {
        file_bin_close(_bin);
        show_debug_message("Got invalid encryption key");
        return false;
    }
    room_goto(asset_get_index(scr_readString(_bin)));
    window_set_caption(scr_readString(_bin));

    global.player.name = scr_readString(_bin);
    global.player.mabel = scr_readBools(_bin, 1)[0];
    global.player.time = scr_readArray(_bin);
    global.player.kills = scr_readInteger(_bin, 2);
    global.player.spares = scr_readInteger(_bin, 2);
    global.player.hp = scr_readInteger(_bin, 1);
    global.player.maxhp = scr_readInteger(_bin, 1);
    global.player.money = scr_readInteger(_bin, 4);
    {
        var lv_costume = scr_readInteger(_bin, 1);
        global.player.lv = (lv_costume >> 3) & 0b11111;
		global.player.costume = lv_costume & 0b11;
	}
    {
        var at_df_bag_coupon = scr_readInteger(_bin);
        global.player.at = (at_df_bag_coupon >> 6) & 0b11;
        global.player.df = (at_df_bag_coupon >> 4) & 0b11;
        global.player.bag = (at_df_bag_coupon >> 2) & 0b11;
        global.player.coupon = (at_df_bag_coupon & 1) == 1;
    }
    {
        var geno_beaver_potty = scr_readInteger(_bin);
        global.player.genocide = (geno_beaver_potty >> 6) & 0b11;
        global.player.beaverPic = (geno_beaver_potty >> 3) & 0b111;
        global.player.portalPotty = geno_beaver_potty & 0b111;
    }

    global.inventory = scr_readArray(_bin);
    global.menu = scr_readArray(_bin);
    global.battleTimer = scr_readInteger(_bin, 2);

    global.enemy_killed = scr_readBools(_bin, ENEMY.TOTAL);
    global.enemy_spared = scr_readBools(_bin, ENEMY.TOTAL);

    {
        var dummy_ghost = scr_readInteger(_bin);
        global.dummy = (dummy_ghost >> 4) & 0b1111;
        global.ghost = dummy_ghost & 0b1111;
    }
    {
        var study_unicorn_hat = scr_readBools(_bin, 3);
        global.studied_hawktopus = study_unicorn_hat[0];
        global.defeated_unicorn = study_unicorn_hat[1];
        global.hat = study_unicorn_hat[2];
    }

    for (var i = 0; i < AREA.TOTAL; i++)
    {
        global.areaKills[i] = scr_readInteger(_bin, 1);
    }

    with instance_create_layer(0, 0, layer, obj_dipperLoader)
    {
        dipper_x = scr_readInteger(_bin, 4);
        dipper_y = scr_readInteger(_bin, 4);
    }

    {
        var _music = asset_get_index(scr_readString(_bin));
        if (_music != silence)
        {
            audio_group_stop_all(Music);
            audio_play_sound(_music, 0, true);
        }
    }

    global.soos   = scr_readInteger(_bin);
    global.stans  = scr_readInteger(_bin);
    global.wendy  = scr_readInteger(_bin);
    global.gideon = scr_readInteger(_bin);
    global.gideon_tent = scr_readInteger(_bin);

    global.completedPuzzleRooms = scr_readArray(_bin, scr_readString);
    global.oneTimeInstances = scr_readArray(_bin, function(b) { return scr_readInteger(b, 8); });

    file_bin_close(_bin);
    return true;
}

/// Reads the user's profile data from the Profile ini save file.
/// The file should already exist before invoking this function.
function scr_getSaveProfile()
{
    var profile = {};
    ini_open(global.SAVE_FILES.PROFILE.NAME);
    profile.name = ini_read_string(global.SAVE_FILES.PROFILE.KEYS.PRIMARY, global.SAVE_FILES.PROFILE.KEYS.PLAYER_NAME, "---");
    profile.lv = floor(ini_read_real(global.SAVE_FILES.PROFILE.KEYS.PRIMARY, global.SAVE_FILES.PROFILE.KEYS.LV, 0));
    profile.room_name = ini_read_string(global.SAVE_FILES.PROFILE.KEYS.PRIMARY, global.SAVE_FILES.PROFILE.KEYS.ROOM_NAME, "---");
    profile.play_time = ini_read_string(global.SAVE_FILES.PROFILE.KEYS.PRIMARY, global.SAVE_FILES.PROFILE.KEYS.PLAY_TIME, scr_format_time(0, 0, 0));
    ini_close();
    return profile;
}
