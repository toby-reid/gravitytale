/// @description Medium / Pizza Time

if (self.is_spider)
{
    obj_battleCore.text[1] = "Pizza time.";
    obj_battleCore.text[0] = "The Arachnimorph claims it's #not paying for those, but its #mouth is watering.";
    if (self.acts_to_spare > 0)
    {
        --self.acts_to_spare;
    }
    if (self.acts_to_spare == 0)
    {
        self.spare = true;
        obj_battleCore.text[0] = "Remember, with great power #comes great pizza time.";
    }
}
else
{
    obj_battleCore.text[1] = "You try Another Medium for #communication, but the approach #puts you in jeopardy.";
    event_user(0);
}
