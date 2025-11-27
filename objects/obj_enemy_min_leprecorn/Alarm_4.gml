/// @description Text Bubble

self.bubble = instance_create_layer(x + 60, y - 20, layer, obj_textBubble);
self.bubble.text[0] = choose(
    "TOP #O' THE #MORNIN' #TO YA!",
    "WHAT'S #THE #CRAIC?",
    "HAVIN' A #WHALE OF #A TIME",
    "YER #DOIN' #IT ALL #ARSEWAYS",
    "GREAT #DRYIN' #OUT, #INNIT?",
    "PINT OF #GAT? #ACH, #YER TOO #YOUNG",
    "THE #PIPES #ARE #CALLIN'"
);
self.bubble.style[0] = 5; // Shake & wave
