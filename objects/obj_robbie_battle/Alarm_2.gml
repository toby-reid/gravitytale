/// @description Skinny Jeans
var response = irandom(4)
var text = ["Bully! Robbie's AT decreases 2!","Nice! Robbie's AT decreases 1!","Ignored! Robbie plays guitar.","Zoinks! Robbie's AT increases 1!","Triggered! Robbie's AT up 2!"]
obj_battleCore.text[1] = "You mock Robbie's overly-skinny #skinny jeans.&"+text[response]
at += response-2
if at < 1 at = 1