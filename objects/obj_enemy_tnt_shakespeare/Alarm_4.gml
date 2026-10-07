/// @desc Text bubble
bubble = instance_create_layer(x + 40, y - 50, layer, obj_textBubble);
bubble.set_text(choose(
    "To be wax, or not to be wax",
    "A scented candle by any other name would smell as sweet",
    "All the world's a candelabra",
    "All that glisters is not flame",
    "The fool doth think he is wise",
    (global.player.genocide == RUN.ACTIVE) ? "Perhaps there is something that is bad" : "There is nothing either good or bad",
    scr_name_matches() ? "What's in a name?" : string_concat("Wherefore art thou ", global.player.name, ", and not some other name?")
));
bubble.image_index = 1;
