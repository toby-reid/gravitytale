/// @description Text Bubble

self.bubble = instance_create_layer(x + 20, y, layer, obj_textBubble_old);
self.bubble.text[0] = choose(
    "BATCH OUT FOR WILL",
    "SHEAR THE FAPE\nSHIFTER",
    string_concat("HE'S NOT ", global.player.mabel ? "Y" : "H", "IGHT FOR R", global.player.mabel ? "OU" : "ER"),
    "CHAN-\nOTAURS LOVE MAIRS",
    "CHEEP ON THE SLOUCH",
    "BEREN-\nSTAIN",
    "THE CHECRET LIES WITH SARLOTTE"
);
