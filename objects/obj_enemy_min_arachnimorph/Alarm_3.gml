/// @description BigTalk / Boot

if (self.is_spider)
{
    obj_battleCore.text[1] = "You attempt to stomp on the #Arachnimorph.";
    obj_battleCore.text[0] = "Despite your small shoe size, #it still reels back in fear.";
    if (self.acts_to_spare > 0)
    {
        --self.acts_to_spare;
    }
    if (self.acts_to_spare == 0)
    {
        self.spare = true;
        obj_battleCore.text[0] = "Arachnimorph can't stand it.&You can, though, with those #shoes.";
    }
}
else
{
    obj_battleCore.text[1] = "You try to talk yourself up, #but it's seen as a challenge, #putting you in jeopardy.";
    event_user(0);
}
