/// @description Gold/Fold

if (!self.collected_gold)
{
    obj_battleCore.text[1] = "You attempt to collect gold #coins from its beard, but #they're all plastic.";
    obj_battleCore.text[0] = "You clearly won't get rich #this way.&Might as well cut losses now.";
    self.collected_gold = true;
    self.act[event_number] = "Fold";
}
else if (!self.spare)
{
    obj_battleCore.text[1] = "You throw down the cards you've #actually had in your hands #this whole time.";
    obj_battleCore.text[0] = "The Leprecorn reveals its hand:&All aces.&5 of them, in fact.";
    self.spare = true;
}
else
{
    obj_battleCore.text[1] = "You were going to concede, but #you realised the Leprecorn has #already stopped fighting.";
}
