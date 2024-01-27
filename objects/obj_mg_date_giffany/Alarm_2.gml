/// @description Next Question
instance_destroy(obj_mg_date_answerBox)
day++
hour = irandom(23)
charCount = 0
event_perform(ev_alarm,1)
sprite_index = spr_mg_date_giffany