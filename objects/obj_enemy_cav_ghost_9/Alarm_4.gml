/// @description Bubble
bubble = instance_create_layer(x+60,y-40,layer,obj_textBubble)
if at == 0 bubble.text[0] = "All my #puns'll #just go #to waste #now..."
else bubble.text[0] = choose("Looks #like you #need a #HANNNDD!","KNIFE #job so #far!","DREAM-#ember #me??","Ya #SNOOZE, #ya lose!","DisARM-#ing and #ALARM-#ing!","Officer, #I'd like #to report #a kid #NAPPING!")
bubble.style[0] = 4