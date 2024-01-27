/// @description WENDY
switch stage {
	case 0:
		if global.player[player.mabel] {
			obj_battleCore.text[1] = "Whimsical Empty Narcissistic #Dreamer Yammering is being #readied..."
		}
		else {
			obj_battleCore.text[1] = "Whiny Eternal Needless Doofus #Yammering is being readied..."
		}
		obj_battleCore.text[0] = "WENDY was successfully prepped."
		stage++
		break
	case 1://No break.
		if global.player[player.mabel] {
			obj_battleCore.text[1] = "You begin telling Robbie all the #potential matches you could set #him with."
			obj_battleCore.text[0] = "He's not interested in that, #but it reminds him of a song he #wrote for his beloved..."
		}
		stage++
	default:
		if global.player[player.mabel] {
			obj_battleCore.text[1] = "You try to distract Robbie with #other matches, but he's too #fixated on sharing his song."
			if spare obj_battleCore.text[0] = "Maybe we should just slink away #for now."
			else obj_battleCore.text[0] = "Maybe we should hear him out?"
		}
		else {
			obj_battleCore.text[1] = "wendywendywendywendywendywendywendy&wendywendywendywendywendywendywendy&wendywendywendywendywendywendywendy"
			obj_battleCore.text[0] = obj_battleCore.text[1]
			for(var j = 0; j <= 1; j++) for(var i = 1; i <= string_length(obj_battleCore.text[1]); i++) if irandom(2) == 0 obj_battleCore.text[j] = string_copy(obj_battleCore.text[j],1,i-1)+string_upper(string_copy(obj_battleCore.text[j],i,1))+string_copy(obj_battleCore.text[j],i+1,string_length(obj_battleCore.text[j]))
		}
		break
}