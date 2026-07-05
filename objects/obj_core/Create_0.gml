image_alpha = 0;
image_speed = 0;
image_yscale = 2;
image_xscale = 2;
alarm[0] = 60;

scr_setmap();

scr_new_global_player();

audio_group_load(Music);
audio_group_load(Talk);
audio_group_load(SFX);
global.menu = [0, 0];
global.dir = DIRECTION.DOWN;
global.battleTimer = 0; // I would do an alarm, but I only want it going down when not in battle rooms

scr_generate_enemy_indices();

global.ITEM_INFO = scr_generate_item_info();
{
	var bag_size = 8;
	switch global.player.bag {
		case BAG.SHOULDER_BAG:
		case BAG.PIGGER_BAG:
			bag_size = 12;
			break;
		case BAG.BOTH:
			bag_size = 16;
			break;
		default:
			break;
	}
	global.inventory = array_create(bag_size, ITEM_INDEX.NONE);
}
order = 0; // marks the GRAVITYTALE cheat code order

global.SAVE_FILES = {
    PERS_RESET: {
        NAME: "Rset.save", // C,N/P/G/W/L,timesCompleted/waymanDefeated?/lastRun0none1neut2pac3geno; K/S/D,ENEMY.#,killed?/spared?/diedTo?
        KEYS: {
            COMPLETED_COUNT: "C", // second key is ROUTE
            WAYMAN_BOOL: "W", // double up
            LAST_ROUTE: "L", // double up
            KILLED_COUNT: "K", // second key is ENEMY
            SPARED_COUNT: "B", // second key is ENEMY
            DIED_TO_COUNT: "D", // second key is ENEMY
            IS_MABEL: "M" // double up
        }
    },
    PROFILE: {
        NAME: "Prof.save", // Profile,Name/LV/Hours/Minutes/Seconds/RoomName
        KEYS: {
            PRIMARY: "P", // top-level key; others are second-level
            PLAYER_NAME: "N",
            IS_MABEL: "M",
            LV: "L",
            PLAY_TIME: "T",
            ROOM_NAME: "R"
        }
    },
    SAVE_DATA: {
        NAME: "Save.save" // Binary save data
    }
};
global.ENCRYPTION_KEY = scr_xorEncrypt("GravityTale", GM_version);
global.BITS_PER_BYTE = 8;

enum TEXT_STYLE
{
    NONE = 0,
    SHAKE = 1 << 1,
    FONT_SWAP = 1 << 2,
    WAVE = 1 << 3
}
global.TEXT_FLAGS = {
    NEWLINE: "#",
    NEWLINE_BUTTON: "&",
    PAUSE: "`",
    COLOR: "@",
    ESCAPE: "\\",
    HARD_PUNCTUATION: [
        ".",
        "!",
        "?"
    ],
    SOFT_PUNCTUATION: [
        ",",
        ";",
        ":"
    ]
}

scr_generate_area_kills();
