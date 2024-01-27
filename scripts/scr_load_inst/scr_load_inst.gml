// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_inst(){
	ini_open("Inst.save")
	for(var i = 0; i < instance_count; i++) {
		var inst = instance_find(all,i)
		if instance_exists(inst) {
			switch inst.object_index {
				case obj_scb_barrier:
					inst.size = ini_read_real(inst,"size",20)
				break
				case obj_buttSwitch:
					inst.active = ini_read_real(inst,"active",true)
					inst.done = ini_read_real(inst,"done",false)
					inst.pressed = ini_read_real(inst,"pressed",false)
					for(var j = 0; j < ini_read_real(inst,"order length",1); j++) inst.order[j] = ini_read_real(inst,"order["+string(j)+"]",noone)
				break
				case obj_core:
					inst.alarm[0] = ini_read_real(inst,"alarm[0]",60)
				break
				case obj_dipper:
					inst.canMove = ini_read_real(inst,"canMove",true)
					inst.menu[0] = ini_read_real(inst,"menu[0]",0)
					inst.menu[1] = ini_read_real(inst,"menu[1]",0)
					inst.dir = ini_read_real(inst,"dir",3)
					//inst.moving = ini_read_real(inst,"moving",false)
				break
				case obj_fallingTree:
					inst.rotAmt = ini_read_real(inst,"rotAmt",0)
					inst.rotDir = ini_read_real(inst,"rotDir",1)
					inst.stage = ini_read_real(inst,"stage",0)
				break
				case obj_portalPotty:
					inst.active = false
					inst.teleport = false
					//inst.drawx[320] = 0
					inst.loc = 0
				break
				case obj_randBattle:
					//inst.loc = ini_read_real(inst,"loc",area.unknown)
				break
				case obj_save:
					//inst.rmName = ini_read_string(inst,"rmName","Error code: SVRNM")
					//inst.text = ini_read_string(inst,"text","(Something went wrong.&(Error code: @ff0000SVTXT@ffffff)")
					//inst.music = ini_read_real(inst,"music",noone)
					inst.size = ini_read_real(inst,"size",0)
					inst.save = ini_read_real(inst,"save",0)
					inst.ybox = ini_read_real(inst,"ybox",196)
					inst.savedTime = ini_read_string(inst,"savedTime","Err:SVTIM")
				break
				case obj_sign:
					for(var j = 0; j < ini_read_real(inst,"text length",1); j++) {
						inst.text[j] = ini_read_string(inst,"text["+string(j)+"]","(Something went wrong.&(Error code: @ff0000SVSGN@ffffff)")
						inst.font[j] = ini_read_real(inst,"font["+string(j)+"]",0)
						inst.sound[j] = ini_read_real(inst,"sound["+string(j)+"]",0)
						inst.charRate[j] = ini_read_real(inst,"charRate["+string(j)+"]",.5)
						inst.choice[j] = ini_read_real(inst,"choice["+string(j)+"]",0)
					}
				break
				case obj_stans_ow_1:
					inst.stage = ini_read_real(inst,"stage",9)
					inst.killTime = ini_read_real(inst,"killTime",0)
				break
				case obj_toRoom:
					//inst.goto = ini_read_real(inst,"goto",room)
					inst.alpha = ini_read_real(inst,"alpha",0)
					//inst.dir = ini_read_real(inst,"dir",0)
					//inst.num = ini_read_real(inst,"num",0)
					//inst.music = ini_read_real(inst,"music",noone)
				break
			}
			inst.sprite_index = ini_read_real(inst,"sprite_index",inst.sprite_index)
			inst.image_index = ini_read_real(inst,"image_index",inst.image_index)
			inst.image_speed = ini_read_real(inst,"image_speed",inst.image_speed)
			inst.image_alpha = ini_read_real(inst,"image_alpha",inst.image_alpha)
			inst.image_blend = ini_read_real(inst,"image_blend",inst.image_blend)
			inst.x = ini_read_real(inst,"x",inst.x)
			inst.y = ini_read_real(inst,"y",inst.y)
			inst.xstart = ini_read_real(inst,"xstart",inst.xstart)
			inst.ystart = ini_read_real(inst,"ystart",inst.ystart)
		}
	}

	ini_close()
	global.load = false
}