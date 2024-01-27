if stage == 2 {
	if hithere if !audio_is_playing(sfx_giffany_hithere) {hithere = false; event_perform(ev_alarm,1)}
	
	if charCount >= string_length(questions[day-1,0]) if !instance_exists(obj_mg_date_answerBox) {
		var dest = [60,100,140]
		for(var i = 0; i < 3; i++) {
			var dest = 60+40*irandom(2)
			while position_meeting(200,dest,obj_mg_date_answerBox) dest = 60+40*irandom(2)
			var inst = instance_create_layer(200,dest,layer,obj_mg_date_answerBox)
			inst.answer = i//0 correct, 1 false, 2 squid
			inst.text = questions[day-1,1+i]
		}
		feedback = "> Select the best answer to#  .GIFfany's question!"
	}
	if charCount < string_length(questions[day-1,0]) or audio_is_playing(sfx_giffany_hithere) or audio_is_playing(sfx_giffany_thatsok) image_speed = 1
	else {image_speed = 0; image_index = 0}
}

//if hp <= 0 {stage = 3/*You lose!*/}