/// Text bubble
bubble = instance_create_layer(x + 40, y - 80, layer, obj_textBubble);
bubble.set_text(choose(
    "Spot of tea?",
    "Can I axe you a question?",
    "Maggie, come quick!",
    "Pigeons pigeons pigeons brawling",
    "Borden-\nline insanity"
));
