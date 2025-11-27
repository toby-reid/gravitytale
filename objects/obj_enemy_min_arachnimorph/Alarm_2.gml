/// @description SmallTalk / Sand

if (self.is_spider)
{
    obj_battleCore.text[1] = "You throw sand in the #Arachnimorph's many eyes.";
    obj_battleCore.text[0] = "The Arachnimorph attempts to #blink it away.&It's not very effective...";
    if (self.acts_to_spare > 0)
    {
        --self.acts_to_spare;
    }
    if (self.acts_to_spare == 0)
    {
        self.spare = true;
        obj_battleCore.text[0] = "Suddenly, the Arachnimorph is #calling you \"sandman\" and #lets you live.";
    }
}
else
{
    obj_battleCore.text[1] = "You ask the normal man about #the weather, but the approach #puts you in jeopardy.";
    event_user(0);
}
