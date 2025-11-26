/// @description Nicker

if (self.sprite_index == spr_enemy_min_unicorn_shaved)
{
    obj_battleCore.text[1] = "You attempt to communicate, #but it's perceived as mocking.";
    obj_battleCore.text[0] = "Probably best just to leave #the creature be.";
}
else if (self.action_to_spare == event_number)
{
    switch self.stage
    {
        case 0:
            obj_battleCore.text[1] = "You make horse sounds at the #Unicorn.&It whinnies in protest.";
            obj_battleCore.text[0] = "Looks like it will react to #verbal abuse.&Keep going.";
            ++self.stage;
            break;
        case 1:
            obj_battleCore.text[1] = "You make donkey noises at the #Unicorn.&It rears up as a threat.";
            obj_battleCore.text[0] = "It's on the brink.&Do your worst!";
            ++self.stage;
            break;
        case 2:
            obj_battleCore.text[1] = "You cast Vicious Clip-Cloppery.&The Unicorn tears out its hair, #defeated.";
            obj_battleCore.text[0] = "You store the lock of hair for #safekeeping.";
            ++self.stage;
            self.sprite_index = spr_enemy_min_unicorn_shaved;
            self.spare = true;
            break;
    }
}
else
{
    obj_battleCore.text[1] = "You attempt to make horse #sounds, but the Unicorn #doesn't listen.";
    obj_battleCore.text[0] = "This Unicorn is confident in #its self-image.&It knows what it is.";
}
