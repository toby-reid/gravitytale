/// @description Flirt / Girl talk
if(global.player[player.mabel]) {
	obj_battleCore.text[1] = "You ask Wendy about her dating #history.&She starts listing every name.";
	obj_battleCore.text[0] = "Wendy declines a call from Mark #Epston.&You decide not to ask."
}
else {
	obj_battleCore.text[1] = choose("Hey, are you free tonight?&Because I don't have any money.","If I could change the alphabet, #I'd put U and me together.&Grammar is important.","Are you a parking ticket?&Because you're undesirable.&Wait...","Are you from Tennessee?&We might be related.","Feel my shirt.&Know what it's made of?&Probably a cotton-poly blend.","I'm trying to find the perfect #date.&So far, I think it's April 25.","Did it hurt when you fell from #heaven?&'Cause you look seriously hurt.","You must be tired from running #through my mind all night.");
	obj_battleCore.text[0] = "Perhaps we should hold off #on the flirting until we've #practiced a little more.";
}