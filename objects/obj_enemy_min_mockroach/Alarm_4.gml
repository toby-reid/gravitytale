/// @description Text Bubble

self.bubble = instance_create_layer(x + (self.spare ? 60 : 40), y + (self.spare ? 20 : 0), layer, obj_textBubble_old);
self.bubble.text[0] = choose(
    string_concat("so ", global.player.mabel ? "" : "s", "he #started #spraying #jesti-#cide!"),
    "there #was way #too much #sauce #on the #pizza!",
    string_concat("you #shoulda #seen ", global.player.mabel ? "his" : "her", " #face!"),
    "so I #said, #hold the #mayo!",
    "because #8 9 10!",
    "the #pilot #was a #loaf of #bread!",
    "to get #to your #house!"
);
self.bubble.style[0] = 1;
