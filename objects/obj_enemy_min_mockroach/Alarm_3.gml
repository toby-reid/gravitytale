/// @description Huckle

obj_battleCore.text[1] = "You lay out some huckleberries #for the Mockroach.&";
if (!self.huckled and instance_number(obj_battleEnemy) == 1)
{
    self.huckled = true;
    obj_battleCore.text[1] += "Another roach takes the bait!";
    self.x = 192;
    global.enemy = [id, instance_create_layer(448, y, layer, object_index)];
    global.enemy[1].huckled = true;
    obj_battleCore.text[0] = "These Mockroaches have probably #had enough chuckleberries for #today.";
}
else
{
    obj_battleCore.text[1] += "It seems unfazed.";
}
