stage = 0
image_speed = 0
killTime = 0
make_save = function(_music) {
    with instance_create_layer(1220,60,layer,obj_save) {
        rmName = "Forest - Grunkle Stans"
        text = "(Meeting such eccentric old men #fills you with anticipation.)"
        music = _music;
        music_nbs = _music;
        loc = AREA.FOREST
    }
}
if global.stans >= 1 {
    make_save(mus_snowy);
    instance_destroy(obj_ford_ow_1);
    instance_destroy();
}
