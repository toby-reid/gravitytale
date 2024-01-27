/// @description Joke
obj_battleCore.text[1] = "You pull out 1001 Yuk 'Em Ups...&"+choose(
	"Why did the plane crash?&The pilot was a loaf of bread.",
	"It's bad to make vaccine jokes.&But I'll give it a shot.",
	"My thesaurus is awful.&Not just that--it's also awful.",
	"Spanish magician: \"uno...dos...\" #and vanishes without a tres.",
	"This cheese is my cheese.&This cheese is nacho cheese.",
	"Everything in the universe #matters.&Except energy.",
	"A limbo champ walks into a bar.&He loses.",
	"Stan is afraid of ladders.&He's taken steps to avoid them."
)
index = spr_stans_head_sly
switch stage {
	case 1:
		bubbleText = "heh, nice one, kiddo."
		index = spr_stans_head_joke
		obj_battleCore.text[0] = "Grunkle Stans appreciates your #uncle-approved jokes."
		stage++
		break
	case 2:
		bubbleText = "not bad, kid...\nnot bad at all..."
		index = spr_stans_head_content
		obj_battleCore.text[0] = "Grunkle Stans has heard enough.&He's satisfied."
		stage++
		break
	default:
		bubbleText = "heh, heh.\nnice."
		break
}
