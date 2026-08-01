/// @description Text Bubble

if (self.is_spider)
{
    self.bubble = instance_create_layer(x + 40, y - 40, layer, obj_textBubble_old);
    self.bubble.text[0] = choose(
        "I missed the part where that's my problem.",
        "Gonna cry?",
        "I'm gonna put some dirt in your eye.",
        "You want Mercy? Get reli-\ngion.",
        "See ya, chump.",
        "Now dig on this.",
        "I'll take the staff job.",
        string_concat("You're trash, ", global.player.name, "."),
        "Stings, doesn't it?",
        "I had to beat an old lady with a stick.",
        (global.player.mabel ? "Sh" : "H") + "e despised you."
    );
}
else
{
    self.bubble = instance_create_layer(x + 20, y - 70, layer, obj_textBubble_old);
    self.bubble.text[0] = choose(
        "Pumpkin spice is the spice of life.",
        "TGIF",
        "Vinyl records sound better.",
        "Pine-\napple belongs on pizza.",
        "Rat dogs are the best kind.",
        "Apple makes better tech.",
        "You need a VPN.",
        "Shou Tucker did nothing wrong."
    );
}
