/// @description Mold
if image_index == 0 or image_index == 3 {
    obj_battleCore.text[1] = "You mold Wax Stans back into #place."
    obj_battleCore.text[0] = "Soos appreciates the gesture."
    image_index = 1
    global.dummy = DUMMY_STATUS.STANS_FIXED;
}
else if image_index == 1 {
    obj_battleCore.text[1] = "You mold Wax Stans into #something else."
    obj_battleCore.text[0] = "Soos looks sad."
    image_index = 3
    global.dummy = DUMMY_STATUS.MODIFIED_FIXED;
}
else if image_index == 2 {
    obj_battleCore.text[1] = "You remold Wax Stans into its #reformed form."
    obj_battleCore.text[0] = "Soos seems hopeful."
    image_index = 3
}