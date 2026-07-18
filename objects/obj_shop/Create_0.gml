buy = []//up to 4 items
talk = []//up to 4 topics
text = ["Error","Buy#Sell#Talk#Exit"]//left and right
sprite = [noone,noone]//default sprite & talking sprite

msg = {
    l_greeting: "Welcome to my shop!",
    l_cantBuy: "I can't buy any of your crap",
    l_thanks: "pleasure doing business with ya",
    r_talkTopics: "what do you want to talk about?",
    l_talk: [], // Arrays of strings representing the dialogue to be presented for talk[0-3] respectively
    l_talkGenocide: [], // array of string representing the dialogue for when you are a bad boy
    r_sellFor: "I'll buy#that for" // will append the price in code
};

page = 0//used to traverse dialogue arrays
dialogue = []//used for more simplicity in code

alarm[0] = 2
charCount = 0
choice = [0,0,0]//BuySellTalkExit,submenu choice (talk topic, purchasing item, etc.),yes/no
stage = 0//0 BuySellTalkExit, 1 Buy, 2 Sell, 3 Sellpg2, 4+ Talk
confirm = false//set to true to Confirm a purchase/sale