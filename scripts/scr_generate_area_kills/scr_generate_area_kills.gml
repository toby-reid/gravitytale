// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_generate_area_kills(){
	enum AREA {
		UNKNOWN,
		SCUTTLEBUTT,
		FOREST,
		CAVES,
		MINES,
		TENT,
		TOTAL
	}
	global.areaKills = ds_map_create();
	global.areaKills[? AREA.UNKNOWN] = {
		killCount: 0,
		MAX_KILLS: 0
	};
	global.areaKills[? AREA.SCUTTLEBUTT] = {
		killCount: 0,
		MAX_KILLS: 18
	};
	global.areaKills[? AREA.FOREST] = {
		killCount: 0,
		MAX_KILLS: 25
	};
	global.areaKills[? AREA.CAVES] = {
		killCount: 0,
		MAX_KILLS: 30
	};
	global.areaKills[? AREA.MINES] = {
		killCount: 0,
		MAX_KILLS: 20 // change as needed
	};
	global.areaKills[? AREA.TENT] = {
		killCount: 0,
		MAX_KILLS: 20 // change as needed
	};
}