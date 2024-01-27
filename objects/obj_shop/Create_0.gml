buy = []//up to 4 items
talk = []//up to 4 topics
text = ["Error","Buy#Sell#Talk#Exit"]//left and right
sprite = [noone,noone]//default sprite & talking sprite

msg = ["Error","Error","Error","Error",["Error"],["Error"],["Error"],["Error"],["Error"],"Error"]
//0 - "Welcome to my shop!" - LHS
//1 - "I can't buy any of your crap" - LHS
//2 - "pleasure doing business with ya" - LHS
//3 - "what do you want to talk about?" - RHS
//4-7 - Arrays of strings representing the dialogue to be presented for choice[1] 0-3, 4-7 respectively - LHS
//8 - genologue array of string representing the dialogue for when you are a bad boy - LHS
//9 - "I'll buy that for" (+ "#$" + price + ".") - RHS

page = 0//used to traverse dialogue arrays
dialogue = []//used for more simplicity in code

inventory = []
event_user(0)
alarm[0] = 2
charCount = 0
choice = [0,0,0]//BuySellTalkExit,submenu choice (talk topic, purchasing item, etc.),yes/no
stage = 0//0 BuySellTalkExit, 1 Buy, 2 Sell, 3 Sellpg2, 4+ Talk
confirm = false//set to true to Confirm a purchase/sale