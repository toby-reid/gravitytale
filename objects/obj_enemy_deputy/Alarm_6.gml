/// @description Run
if !global.enemy_killed[ENEMY.SHERIFF] obj_battleCore.text[0] = "The sheriff and deputy are not #done with you yet."
else if !global.enemy_killed[ENEMY.DEPUTY] obj_battleCore.text[0] = "Deputy Durland is lashing out #with everything he has left."