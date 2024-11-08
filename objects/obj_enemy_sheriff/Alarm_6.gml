/// @description Run
if !global.enemy_killed[ENEMY.DEPUTY] obj_battleCore.text[0] = "The sheriff and deputy are not #done with you yet."
else if !global.enemy_killed[ENEMY.SHERIFF] obj_battleCore.text[0] = "Sheriff Blubs will make sure #you pay for your evil."