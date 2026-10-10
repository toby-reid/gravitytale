/// @desc Text bubble
bubble = instance_create_layer(x + 40, y - 60, layer, obj_textBubble);
bubble.set_text(choose(
    "Why is there nothing in my hand?",
    "Joke's on you, kid",
    global.player.mabel ? "Mabel?\nWhy not Junebel?" : "Dipper?\nI hardly know 'er",
    string_concat(global.player.mabel ? "Sweaters" : "Hats", " are out this season, kid"),
    "I look well with glasses",
    "I also look good with glasses",
    "The outfit suits me",
));
