/// @desc Adds a kill tracker to the given enemy's timeline-based kill counter.
/// @param {Enum.ENEMY} enemy: The enemy (ENEMY enum) to check
function scr_killedEnemy(enemy)
{
    global.enemy_killed[enemy] = true;
    ini_open(global.SAVE_FILES.PERS_RESET.NAME);
    var kill_count = ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.KILLED_COUNT, enemy, 0);
    ini_write_real(global.SAVE_FILES.PERS_RESET.KEYS.KILLED_COUNT, enemy, kill_count + 1);
    ini_close();
}

/// @desc Determines how many times the given enemy has been killed in previous timelines.
/// @param {Enum.ENEMY} enemy: The enemy (ENEMY enum) to check
/// @return {Bool}: The number of times the enemy has been killed
function scr_getKillCount(enemy)
{
    ini_open(global.SAVE_FILES.PERS_RESET.NAME);
    var kill_count = ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.KILLED_COUNT, enemy, 0);
    ini_close();
    return kill_count;
}

/// @desc Adds a kill tracker to the given enemy's timeline-based spare counter.
/// @param {Enum.ENEMY} enemy: The enemy (ENEMY enum) to check
function scr_sparedEnemy(enemy)
{
    global.enemy_spared[enemy] = true;
    ini_open(global.SAVE_FILES.PERS_RESET.NAME);
    var spare_count = ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.SPARED_COUNT, enemy, 0);
    ini_write_real(global.SAVE_FILES.PERS_RESET.KEYS.SPARED_COUNT, enemy, spare_count + 1);
    ini_close();
}

/// @desc Determines how many times the given enemy has been spared in previous timelines.
/// @param {Enum.ENEMY} enemy: The enemy (ENEMY enum) to check
/// @return {Bool}: The number of times the enemy has been spared
function scr_getSpareCount(enemy)
{
    ini_open(global.SAVE_FILES.PERS_RESET.NAME);
    var spare_count = ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.SPARED_COUNT, enemy, 0);
    ini_close();
    return spare_count;
}

/// @desc Adds a death tracker to the given enemy's timeline-based death counter.
/// @param {Enum.ENEMY} enemy: The enemy (ENEMY enum) to check
function scr_diedToEnemy(enemy)
{
    ini_open(global.SAVE_FILES.PERS_RESET.NAME);
    var death_count = ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.DIED_TO_COUNT, enemy, 0);
    ini_write_real(global.SAVE_FILES.PERS_RESET.KEYS.DIED_TO_COUNT, enemy, death_count + 1);
    ini_close();
}

/// @desc Determines how many times the given enemy has killed the player in previous timelines.
/// @param {Enum.ENEMY} enemy: The enemy (ENEMY enum) to check
/// @return {Real}: The number of times the player has died to this enemy
function scr_getDeathCount(enemy)
{
    ini_open(global.SAVE_FILES.PERS_RESET.NAME);
    var death_count = ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.DIED_TO_COUNT, enemy, 0);
    ini_close();
    return death_count;
}
