stage++
with instance_create_layer(160,48,"Instances",obj_textbox) {
	text = [
		"Shandra Jimenez,#a real reporter.",
		"I'll pay 300 Stan Bucks for #that picture.",
		"Way better than whatever he's #got, I'd say.",
		"Wow, Shandra Jimenez, in *my* #shop!&Huh ray!",
		"Well, I'll let her have the #picture...&It's a glorious day!",
		"Alright then, boy...&Which will you take?",
		"His grimy who-knows-what #trade...",
		"Or the hefty sum of 300 Stan #Bucks?",
		"(Which offer?)#       Toby's      Shandra's#       trade       sum",
		"An excellent choice, of course.&Here you go.&(You got 300 Stan Bucks!)"
	]
	choice[8] = 1
	charRate[3] = 4
	charRate[4] = 4
}