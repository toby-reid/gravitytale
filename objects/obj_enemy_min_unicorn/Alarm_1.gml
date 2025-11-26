/// @description Lick

if (self.sprite_index == spr_enemy_min_unicorn_shaved)
{
    obj_battleCore.text[1] = "...but there was nothing to consume.";
    obj_battleCore.text[0] = "Rero rero rero rero #rero rero rero rero";
}
else if (self.action_to_spare == event_number)
{
    switch self.stage
    {
        case 0:
            obj_battleCore.text[1] = "Unfortunately, a chunk of hair #comes off in your mouth.&Why would you lick a horse?";
            obj_battleCore.text[0] = "On closer inspection, it seems #you took out quite the sizable #chunk.";
            ++self.stage;
            break;
        case 1:
            obj_battleCore.text[1] = "You reach in and bite out #another chunk of hair.&Makes for good floss too.";
            obj_battleCore.text[0] = "Just a little more to go.#&...gross.";
            ++self.stage;
            break;
        case 2:
            obj_battleCore.text[1] = "You grab the last chunk of hair #and stuff it in your bag.&Could be useful later.";
            obj_battleCore.text[0] = "The unicorn, fully humiliated, #finally admits defeat.";
            ++self.stage;
            self.sprite_index = spr_enemy_min_unicorn_shaved;
            self.spare = true;
            break;
    }
}
else
{
    obj_battleCore.text[1] = "You just end up with a mouthful #of hair.&It's surprisingly soft.";
    obj_battleCore.text[0] = "Looks like this Unicorn uses #heavy moisturizers.";
}
