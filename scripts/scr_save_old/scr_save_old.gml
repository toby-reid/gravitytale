// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_save_old(rmName,music) {
	file_delete("Info.save");//Holds all necessary global variable values
	file_delete("Prof.save");//Holds information for obj_startMenu to use
	file_delete("Inst.save");//Holds all information for Instances in the room
	//game_save("Save.save");
	
	ini_open("Prof.save");
		ini_write_string("Profile","NM",global.player[player.name])
		ini_write_string("Profile","LV",global.player[player.lv])
		var time = string(global.player[player.hours])
		if string_length(time) < 2 time = "0"+time
		ini_write_string("Profile","HR",time)
		if instance_exists(obj_save) obj_save.savedTime = time+":"
		time = string(global.player[player.minutes])
		if string_length(time) < 2 time = "0"+time
		ini_write_string("Profile","MN",time)
		if instance_exists(obj_save) obj_save.savedTime += time+":"
		time = string(global.player[player.seconds])
		if string_length(time) < 2 time = "0"+time
		ini_write_string("Profile","SC",time)
		if instance_exists(obj_save) obj_save.savedTime += time
		ini_write_string("Profile","RM",rmName)
	ini_close()
	ini_open("Info.save")
		ini_write_string("Save","WARNING","\n! WARNING !\nEditing ANY of these values will break the game!\n")
		ini_write_string("Save","VS",GM_version)
		ini_write_string("Save","WC",window_get_caption())
		ini_write_real("Save","RM",room)
		//global.player[0] shouldn't ever change.... //You idiot! You need the global.player[player.name] for that too!
		ini_write_string("Save","PL0",global.player[0])//player.name
		for(var i = 1; i < player.total; i++) ini_write_real("Save","PL"+string(i),global.player[i])
		ini_write_real("Save","MN0",global.menu[0])
		ini_write_real("Save","MN1",global.menu[1])
		ini_write_real("Save","BTLTM",global.battleTimer)
		for(var i = 0; i < enemy.total; i++) {
			ini_write_real("Save","K"+string(i),global.killed[i])
			ini_write_real("Save","S"+string(i),global.spared[i])
		}
		for(var i = 0; i <= 7; i++) ini_write_real("Save","IV"+string(i),global.inventory[i])
		for(var i = 0; i < area.total; i++) ini_write_real("Save","AK"+string(i),global.areaKilled[i])
		if variable_global_exists("soos") ini_write_real("Save","soos",global.soos)
		if variable_global_exists("stans") ini_write_real("Save","stans",global.stans)
		if variable_global_exists("toby") ini_write_real("Save","toby",global.toby)
		if variable_global_exists("wendy") ini_write_real("Save","wendy",global.wendy)
		if variable_global_exists("hamstick") ini_write_real("Save","hamstick",global.hamstick)
		if variable_global_exists("fairydust") ini_write_real("Save","fairydust",global.fairydust)
		if variable_global_exists("runemy") {
			ini_write_real("Save","RUNL",array_length(global.runemy))
			for(var i = 0; i < array_length(global.runemy); i++) ini_write_real("Save","RUN"+string(i),global.runemy[i])
		}
		if variable_global_exists("buttSwitch") {
			ini_write_real("Save","BUTTL",array_length(global.buttSwitch))
			for(var i = 0; i < array_length(global.buttSwitch); i++) ini_write_real("Save","BUTT"+string(i),global.buttSwitch[i])
		}
		if variable_global_exists("trashCan") {
			ini_write_real("Save","TRASHL",array_length(global.trashCan))
			for(var i = 0; i < array_length(global.trashCan); i++) ini_write_real("Save","TRASH"+string(i),global.trashCan[i])
		}
		ini_write_real("Save","MS",music)
		ini_write_string("Save","WARNING0","\n! WARNING !\nEditing ANY of these values will break the game!\n")
	ini_close()
	
	ini_open("Inst.save")
	
	ini_write_string("WARNING","WARNING","\n! WARNING !\nEditing ANY of these values will break the game!\n")
	for(var i = 0; i < instance_count; i++) {
		var inst = instance_find(all,i)
		switch inst.object_index {
			case obj_scb_barrier:
				ini_write_real(inst,"size",inst.size)
			break
			case obj_buttSwitch:
				ini_write_real(inst,"active",inst.active)
				ini_write_real(inst,"done",inst.done)
				ini_write_real(inst,"pressed",inst.pressed)
				ini_write_real(inst,"order length",array_length(inst.order))
				for(var j = 0; j < array_length(inst.order); j++) ini_write_real(inst,"order["+string(j)+"]",inst.order[j])
			break
			case obj_core:
				ini_write_real(inst,"alarm[0]",inst.alarm[0])
			break
			case obj_dipper:
				ini_write_real(inst,"canMove",inst.canMove)
				ini_write_real(inst,"menu[0]",inst.menu[0])
				ini_write_real(inst,"menu[1]",inst.menu[1])
				ini_write_real(inst,"dir",inst.dir)
				ini_write_real(inst,"moving",inst.moving)
			break
			case obj_fallingTree:
				ini_write_real(inst,"rotAmt",inst.rotAmt)
				ini_write_real(inst,"rotDir",inst.rotDir)
				ini_write_real(inst,"stage", inst.stage)
			break
			case obj_portalPotty:
				ini_write_real(inst,"active",false)
				ini_write_real(inst,"teleport",false)
				ini_write_real(inst,"drawx[320]",0)
				ini_write_real(inst,"loc",0)
			break
			case obj_randBattle:
				ini_write_real(inst,"loc",inst.loc)
				ini_write_real(inst,"image_alpha",0)
			break
			case obj_save:
				ini_write_string(inst,"rmName",inst.rmName)
				ini_write_string(inst,"text",inst.text)
				ini_write_real(inst,"music",inst.music)
				ini_write_real(inst,"size",inst.size)
				ini_write_real(inst,"save",inst.save)
				ini_write_real(inst,"ybox",inst.ybox)
				ini_write_string(inst,"savedTime",inst.savedTime)
			break
			case obj_sign:
				ini_write_real(inst,"text length",array_length(inst.text))
				for(var j = 0; j < array_length(inst.text); j++) ini_write_string(inst,"text["+string(j)+"]",inst.text[j])
				for(var j = 0; j < array_length(inst.font); j++) ini_write_real(inst,"font["+string(j)+"]",inst.font[j])
				for(var j = 0; j < array_length(inst.sound);j++) ini_write_real(inst,"sound["+string(j)+"]",inst.sound[j])
				for(var j = 0; j < array_length(inst.charRate); j++) ini_write_real(inst,"charRate["+string(j)+"]",inst.charRate[j])
				for(var j = 0; j < array_length(inst.choice);j++)ini_write_real(inst,"choice["+string(j)+"]",inst.choice[j])
			break
			case obj_stans_ow_1:
				ini_write_real(inst,"stage",inst.stage)
				ini_write_real(inst,"killTime",inst.killTime)
				ini_write_real(inst,"image_speed",inst.image_speed)
			break
			case obj_toRoom:
				ini_write_real(inst,"goto",inst.goto)
				ini_write_real(inst,"alpha",inst.alpha)
				ini_write_real(inst,"dir",inst.dir)
				ini_write_real(inst,"music",inst.music)
				ini_write_real(inst,"num",inst.num)
			break
		}
		ini_write_real(inst,"sprite_index",inst.sprite_index)
		ini_write_real(inst,"image_index",inst.image_index)
		ini_write_real(inst,"image_speed",inst.image_speed)
		ini_write_real(inst,"image_alpha",inst.image_alpha)
		ini_write_real(inst,"image_blend",inst.image_blend)
		ini_write_real(inst,"x",inst.x)
		ini_write_real(inst,"y",inst.y)
		ini_write_real(inst,"xstart",inst.xstart)
		ini_write_real(inst,"ystart",inst.ystart)
	}
	ini_write_string("WARNING0","WARNING0","\n! WARNING !\nEditing ANY of these values will break the game!\n")
	
	ini_close()

	audio_play_sound(sfx_save,0,false)
}