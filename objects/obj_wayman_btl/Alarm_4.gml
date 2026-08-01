/// @description Text Bubble
bubble = instance_create_layer(x+60,y-128,layer,obj_textBubble_old)
if stageRepeating bubble.text = ["Havin' tae go #again, eh, lad?","Right, then.&Here ye go."]
else switch stage {
	case 0:
		bubble.text = ["'Ere's 'ow this #works, lad.","Jest get outta #me mazes, #right?","'Tis remarkably #simple.&Even ye can dae #this much."]
		break
	case 1:
		bubble.text = ["Well done, lad!&Well done #indeed...","Now, let's step #it up a notch, #eh?"]
		break
	case 2:
		bubble.text = ["Brilliant, lad!&Keep it up!"]
		break
	case 3:
		bubble.text = ["Wazzat, laddy?",". . .","Ach, I mustae #fergotten me #manners in me #excitement.","Well, I'll give #ye me name in #a few more #rounds."]
		break
	case 4:
		bubble.text = ["Keep it movin', #lad!","Ye're so close #tae unlockin' #me name!"]
		break
	case 5:
		bubble.text = ["Ye're almost #there, lad!","Ye're about tae #unlock me #beautiful name!"]
		break
	case 6:
		bubble.text = ["Prepare #yerself, lad!","Here it comes!"]
		break
	case 7:
		bubble.text = ["Have ye #prepared #yerself?","Ye don't seem #tae be #prepared..."]
		break
	case 8:
		bubble.text = ["@444400William D. #Crypter III",". . .","What?&'Tis me name, #lad.&Somethin' wrong #with ye?"]
		bubble.charRate[0] = .2
		break
	case 9:
		bubble.text = ["What?&Ye thought #that'd be the #last of 'em?","Jest because #ye know me name #now, eh?","Well, ye were #wrong, lad!","Ye're not even #'alfway done!"]
		break
	case 10://or however many mazes we have
		bubble.text = [
			"Aighty, lad, I #may 'ave lied #just a tad #there...",
			"Ye've reached #the end of yer #trials just #now.",
			"Ye've defeated #me.&Ye win, lad.",
			". . .",
			"Ye...&ye thought #ye'd get some #grand prize?",
			"That's a good #'un there!",
			"'Ave ye even #looked at me?&I'm a creepy #smile man!",
			"Nah, yer prize #is far better'n #anythin' #material, lad.",
			"Course, I only #appear'n fronta #the Portal-#Potties, right?",
			"Well...&now ye can #control where #ye end up, lad!",
			"Jest try't out #sometime!",
			"'S long as #ye've seen yer #destination #Potty before, #ye can teleport #between 'em!",
			"And, what's #better, lad...",
			". . .",
			"Ye'll keep this #ability...&#even across #resets...",
			"Now, I've 'ad #me fun, lad.&It's time for #ye to get #movin' again.",
			"And remember:",
			"Reality is a #mirage;&the universe is #a projection;&purchase aurum!",
			"Cheerio, lad!"
		]
		bubble.charRate[14] = .1
		bubble.style[14] = 1
		break
}
with bubble {
	style[array_length(text)] = 0
	for(var i = 0; i < array_length(text); i++) {style[i] += 6; font[i] = fnt_bill_bubble}
	image_index = 1
}
obj_soul.active = false