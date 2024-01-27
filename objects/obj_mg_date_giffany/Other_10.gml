/// @description Reset Game
lovePoints = 0
charisma = 0//randomizes itself via alarm[0]
hp = 100//Subtracts when damage == 99 or when wrong question. When reaches 0, lose a life.
damage = 0//Increases as you click .GIFfany. When damage == 99, health-- instead
baggage = false//Changes to "Yes" after Day 1
day = 1//questions[day-1,0]
hour = irandom(23)//Yeah... it's just randomized with each new Day
//question = 0 We'll use Day to determine question
feedback = "> Oh... h... hi there!"