function scr_hexdec(rrggbb) {
	//Converts RGB hex string into GML decimal format
	var bgr = string_copy(rrggbb,5,2)+string_copy(rrggbb,3,2)+string_copy(rrggbb,1,2)
	var dec = 0

	for(var i = 1; i <= 6; i++) switch string_lower(string_copy(bgr,i,1)) {
		case "f": dec += 15*power(16,-1*(i-6)) break
		case "e": dec += 14*power(16,-1*(i-6)) break
		case "d": dec += 13*power(16,-1*(i-6)) break
		case "c": dec += 12*power(16,-1*(i-6)) break
		case "b": dec += 11*power(16,-1*(i-6)) break
		case "a": dec += 10*power(16,-1*(i-6)) break
		default: dec += real(string_copy(bgr,i,1))*power(16,-1*(i-6)) break
	}

	return dec
}