/// @param {bool} _softload: Set to 'true' to avoid resetting certain variables, such as global.soos
function scr_load() {
    var _bin = file_bin_open(global.SAVE_FILES.SAVE_DATA, 0); // open in 'read' mode

    if (scr_readString(_bin) != global.ENCRYPTION_KEY)
    {
        file_bin_close(_bin);
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
    global.player.lv = scr_readInteger(1);
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
    global.costume = scr_readInteger(_bin);
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
        global.study = study_unicorn_hat[0];
        global.defeated_unicorn = study_unicorn_hat[1];
        global.hat = study_unicorn_hat[2];
    }

    // TODO: Update global.areaKills to be an array of objects
    for (var i = 0; i < AREA.TOTAL; i++)
    {
        global.areaKills[? i].killCount = scr_readInteger(_bin, 1);
    }

    {
        var _x = scr_readInteger(_bin, 4);
        var _y = scr_readInteger(_bin, 4);
        global.dip_pos = [_x, _y];
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
    global.toby   = scr_readInteger(_bin);
    global.wendy  = scr_readInteger(_bin);
    global.gideon = scr_readInteger(_bin);

    {
        var ham_fairy = scr_readBools(_bin, 2);
        global.hamstick = ham_fairy[0];
        global.fairydust = ham_fairy[1];
    }

    global.buttSwitch = scr_readArray(_bin, scr_readString);
    global.trashCan = scr_readArray(_bin, function(b) { return scr_readInteger(b, 8); });

    file_bin_close(_bin);
    return true;
}
