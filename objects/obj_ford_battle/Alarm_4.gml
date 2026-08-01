/// @description Bubble
bubble = instance_create_layer(x+60,y,"Instances",obj_textBubble_old)
with bubble {
	headid = 0
	if other.hp <= 0 {
		other.hp = 0
		headid = -4
		text = [
			"...AH...",
			"IT SEEMS I \nHAVE BEEN \nBESTED IN \nBATTLE.",
			"MY EFFORTS TO STOP \nBILL'S RISE \nWERE ALL \nIN VAIN...",
			"WELL, CHILD, I HOPE YOU \nSOON SEE \nTHE TRUTH...",
			"TURN BACK \nNOW, \nBEFORE IT \nIS TOO \nLATE...",
			"GOODBYE."
		]
		charRate[5] = .25
		audio_stop_sound(mus_bonetrousle)
		audio_stop_sound(mus_bonetrousle)
	}
	else if (global.stage[1] == 0 and global.stage[4] != 0) or (!other.run and !other.spare) text = [choose("YOUR GUN IS NO MATCH FOR MY MATH, YOU IDIOT!","YOU SHOULDN'T HAVE DONE THAT.")]
	else {
		other.stage++
		//*temp*/if other.stage < 10 other.stage = 10
		headid = other.stage
		switch other.stage {
			case 1: text = ["THERE IS \nNOTHING \nYOU CAN DO TO STOP ME, CHILD.","I KNOW \nWHAT BILL \nIS CAPABLE \nOF."] break
			case 2: text = ["I WILL \nDEFINITELY \nCORK HIS \nPOWER IN \nTHIS \nDIMENSION!"] break
			case 3: text = ["SO WHY \nDO YOU \nPERSIST?"] break
			case 4: text = ["SURELY \nYOU, OF ALL \nPEOPLE, \nWOULDN'T \nBELIEVE \nBILL'S \nWORDS...","YET STILL, \nYOU \nCONTINUE \nTO FIGHT \nTOWARD \nTHE RIFT..."] break
			case 5: text = ["UNLESS...","NO, YOU \nCOULDN'T \nPOSSIBLY \nBE \nPLANNING \nTO @2341ffSEAL \n@000000THE RIFT..."] break
			case 6: text = ["BAH!\nI HAVE \nBECOME \nDISTRACTED!","GIVE UP \nNOW, CHILD, \nOR I WILL \nUNLEASH \nMY @2341FFSPECIAL \nATTACK@000000!"] break
			case 7: text = ["YOU'RE \nSTILL HERE?       \nI THOUGHT \nI WARNED \nYOU...","WELL, ONE \nMORE MOVE \nBEFORE I \nUNLEASH \nMY @2341FFSPECIAL \nATTACK@000000!"] break
			case 8: text = ["YOU ASKED \nFOR IT, KID!      \nPREPARE \nFOR MY \n@2341FFSPECIAL \nATTACK@000000!","NEXT MOVE, \nI WILL \nUNLEASH IT!"] break
			case 9: text = ["PRAY YOU \nALREADY \nHAD @888800BILL \n@000000SAVE, \nCHILD!","I'M ABOUT \nTO \nUNLEASH \nMY @2341FFSPECIAL \nATTACK@000000!"] break
			case 10:
				text = [
					"HERE IT IS, \nCHILD!       \nMY SPECIAL \nATTACK!",
					"BEHOLD: AN \nINFINITY-\nSIDED DIE!",
					"THESE \nTHINGS ARE \nOUTLAWED \nIN 9,000 \nDIMENSIONS. YOU WANNA \nKNOW WHY?",
					"INFINITE \nSIDES \nMEANS \nINFINITE \nOUTCOMES.",
					"IF I \nROLLED IT,   \nANYTHING \nCOULD \nHAPPEN.",
					"OUR FACES \nCOULD \nMELT INTO \nJELLY.",
					"THE WORLD \nCOULD \nTURN INTO \nAN EGG.",
					"WE COULD \nBRING A \nMATH \nDEMON INTO OUR WORLD.",
					"WHO \nKNOWS?",
					"NOW, LET'S \nSEE WHAT \nHAPPENS,   \nSHALL WE?"
				]
				charRate[1] = .2
				instance_create_layer(220,80,"Instances",obj_ford_infinityDie)
				break
			default: text = ["I HAVE ALREADY CHOSEN TO STOP FIGHTING, CHILD.","PLEASE SPARE ME SO WE CAN GET ON WITH IT."] break
		}
	}
	image_index = 1
	for(var i = 0; i < array_length(text); i++) {font[i] = fnt_papyrus_bubble; sound[i] = tlk_ford}
}