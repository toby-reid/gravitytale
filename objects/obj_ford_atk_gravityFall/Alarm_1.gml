/// @description Textbubble
with obj_ford_battle {
	bubble = instance_create_layer(x+60,y+20,"Instances",obj_textBubble)
	with bubble {
		image_index = 1
		text = [
			"WAH HAH \nHAH HAH!",
			"I'VE TURNED \nYOU @2341FFBLUE@000000, \nKID!",
			"ER...\nBLUER!",
			"NOW \nGRAVITY \nWILL ACT \nUPON YOU!",
			"YOU CAN \nPRESS @888800UP \n@000000TO JUMP!",
			"AND HOLD \n@888800UP @000000OR @888800DOWN \n@000000TO \nCONTROL \nHEIGHT!"
		]
		font = [fnt_papyrus_bubble,fnt_papyrus_bubble,fnt_papyrus_bubble,fnt_papyrus_bubble,fnt_papyrus_bubble,fnt_papyrus_bubble]
		sound = [tlk_ford,tlk_ford,tlk_ford,tlk_ford,tlk_ford,tlk_ford]
		headid = -3
	}
	timer = 30
}