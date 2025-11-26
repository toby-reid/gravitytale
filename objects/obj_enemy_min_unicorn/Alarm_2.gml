/// @description Kick

if (self.sprite_index == spr_enemy_min_unicorn_shaved)
{
    obj_battleCore.text[1] = "To add further insult, #you kick the humiliated #creature.";
    obj_battleCore.text[0] = "Perhaps you truly are #impure of heart.";
}
else if (self.action_to_spare == event_number)
{
    switch self.stage
    {
        case 0:
            obj_battleCore.text[1] = "You kick one of the Unicorn's #legs.&It fails to kick you away.";
            obj_battleCore.text[0] = "Looks like that hurt its #feelings more than its body.";
            ++self.stage;
            break;
        case 1:
            obj_battleCore.text[1] = "You kick its opposite leg.&It looks like it could cry.";
            obj_battleCore.text[0] = "The Unicorn is looking #highly stressed.&One more kick oughta do it.";
            ++self.stage;
            break;
        case 2:
            obj_battleCore.text[1] = "With an expert combo move, you #kick one leg, slide under the #Unicorn, and kick the other.";
            obj_battleCore.text[0] = "The pure stress from its #humiliation causes it to #lose all its hair.";
            ++self.stage;
            self.sprite_index = spr_enemy_min_unicorn_shaved;
            self.spare = true;
            break;
    }
}
else
{
    obj_battleCore.text[1] = "You tried to beat the dead #horse, but then remembered #it's alive.";
    obj_battleCore.text[0] = "This one seems a little too #lively to kick, anyway.&It stares at you intensely.";
}
