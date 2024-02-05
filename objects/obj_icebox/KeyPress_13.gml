if(active) {
	with obj_textbox if(page == 0 and charCount >= string_length(text[0])) {
		if(action[0] == 0) {
			other.ice = true;
			text[1] = "(Ice job!&(...be careful around time #travelers.)";
		}
		other.active = false;
	}
}
else with obj_dipper if(canMove and place_meeting(x,y-2,other) and dir == 1) with other {
	if(!ice) {
		active = true;
		with instance_create_layer(160,192,layer,obj_textbox) {
			text = ["(It's an ice box.&(Take some ice?)&       Yes         No","(Indeed, who would take ice #that's been in an ice box?&(Gross.)"];
			choice = [1];
		}
	}
	else {
		with instance_create_layer(160,192,layer,obj_textbox) {
			text = ["(You already have some ice.&(Taking more is just cold.)"];
		}
	}
}