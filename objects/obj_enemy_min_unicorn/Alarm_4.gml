/// @description Text bubble

self.bubble = instance_create_layer(x + 100, y - 80, layer, obj_textBubble)
if (self.spare) self.bubble.text[0] = "NAYYYYYY";
else self.bubble.text[0] = choose(
    "NEIGHHHH",
    "YOU ARE #NOT PURE #OF HEART",
    "YOU'RE #CRUSHING #10 #FLOWERS #AND MY #HEART",
    "YOUR BAD #DEEDS #MAKE ME #CRY",
    "COME #BACK #WHEN YOU #ARE PURE #OF HEART",
    "NOT MY #FAULT #YOU'RE #A BAD #PERSON",
    "I'VE A #3:00 #POSING #IN FRONT #OF A #RAINBOW"
);
bubble.style[0] = 4;
