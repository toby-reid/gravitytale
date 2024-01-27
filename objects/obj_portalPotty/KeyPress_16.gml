/// @description Cancel
if instance_exists(obj_textbox) if active with obj_textbox if charCount >= string_length(text[0])+5 event_perform(ev_alarm,2)