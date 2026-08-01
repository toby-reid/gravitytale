///@desc Bubble
bubble = instance_create_layer(x+20,y-60,"Instances",obj_textBubble_old)
var text = choose("WHO","WHAT","WHERE","WHEN","WHY","HOW")
bubble.text[0] = ""
repeat irandom(5)+1 bubble.text[0] += text+" "