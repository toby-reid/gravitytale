var prev = choice[1]
if !confirm switch stage {
	case 0:
		choice[0]--
		if choice[0] < 0 choice[0] = 3
		break
	case 1:
		choice[1]--
		if choice[1] < 0 choice[1] = array_length(buy)
		break
	case 2://Sell pg 1
	case 3://Sell pg 2
		break;
	case 4:
		choice[1]--
		if choice[1] < 0 choice[1] = array_length(talk)
		break
}
else choice[2] = !choice[2]
if choice[1] != prev charCount = 0

if stage <= 4 audio_play_sound(sfx_beep,0,false)

event_user(1)