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
global.battleTimer = 0; // I would do an alarm, but I only want it going down when not in battle rooms

scr_generate_enemy_indices();

scr_generate_item_index();
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
	global.inventory = array_create(bag_size, ITEM_NAME.NONE);
}
order = 0; // marks the GRAVITYTALE cheat code order

global.SAVE_FILES = {
    PERS_RESET: "Rset.save", // C,N/P/G/W/L,timesCompleted/waymanDefeated?/lastRun0none1neut2pac3geno; K/S/D,ENEMY.#,killed?/spared?/diedTo?
    PROFILE: "Prof.save", // Profile,Name/LV/Hours/Minutes/Seconds/RoomName
    SAVE_DATA: "Save.save" // Binary save data
};
/*
Files used:
Reset.save - "C","N"/P/G/W,#timesCompleted/WaymanDefeated?; "R","R",0none/1neut/2pac/3geno just reset; "K",ENEMY.#,T/F killed; "S",ENEMY.#,T/F spared; "D",ENEMY.#,# died
Info.save  - "Profile","NM"/LV/HR/MN/SC/RM/MS,string except for MS name/lv/hour/minute/second/room/music
Save.save  - game save file
*/

scr_generate_area_kills();
