///@desc Shovel
image_yscale = -2
if flipped == 0 {
    obj_battleCore.text[1] = "You used a shovel to flip over #Gnome.&He can't attack for 2 turns!"
    flipped = 2
    spare = true
}
else {
    obj_battleCore.text[1] = "You used a shovel to flip over #Gnome again.&He can attack again!"
    flipped = 0
    if hp > 1 spare = false
}