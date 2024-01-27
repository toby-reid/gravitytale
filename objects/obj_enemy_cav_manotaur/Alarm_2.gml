/// @description Jerky
if !spare {
	obj_battleCore.text[1] = "You offer Manotaur some jerky.&He eagerly wolfs it down.&...er, mans it down?"
	obj_battleCore.text[0] = "Jerky."
	spare = true
}
else obj_battleCore.text[1] = "Before you can offer the jerky, #he snatches it from you.&What a jerk(y)."