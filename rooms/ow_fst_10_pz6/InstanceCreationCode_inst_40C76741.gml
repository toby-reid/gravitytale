rmName = "Forest - Puzzle 6"
text = string_concat("(Victory",
					 global.enemy_killed[ENEMY.TYLER] ? "(?)" : "",
					 "in the Manliness #Competition ",
					 global.player.mabel
						 ? "excites your #imagination"
						 : "fills you with #dedication",
					 ".)");
music = mus_snowy
loc = AREA.FOREST;