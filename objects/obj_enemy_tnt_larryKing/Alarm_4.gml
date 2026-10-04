/// @desc text bubble
bubble = instance_create_layer(x + 40, y - 40, layer, obj_textBubble);
bubble.set_text(choose(
    "Let's talk about that",
    "My beauti-\nful neck",
    "Llamas are nature's greatest warriors",
    "I never learned anything while I was talking",
    "Use use",
    "I have to visit the restroom",
    global.player.mabel ? "Rescue yourself from the castle" : "She rescued herself from the castle"
));
