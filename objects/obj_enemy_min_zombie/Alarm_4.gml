/// @description Text bubble or forceful spare

if (self.singing >= 3)
{
    event_perform(ev_alarm, 5); // artificial spare
}
else
{
    self.bubble = instance_create_layer(x + 60, y - 100, layer, obj_textBubble);
    self.bubble.text[0] = choose(
        "i like #your #tricycle",
        self.bucket ? "there's #bucket #on my #head" : (self.cone ? "road #cones #protect #my head" : "there's #nothing #on my #head"),
        "we are #the #undead",
        "i used #to play #football",
        "returned #from the #grave to #give the #living #haircuts", // max line count is 6
        "it's not #original #but it's #true: #i love #brains",
        "erm... #brians?",
        "hello, #i'm #Rob #Armoury"
    );
    self.bubble.style[0] = 1;
}
