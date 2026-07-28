if (global.gideon_tent >= 3)
{
    instance_destroy();
    if (global.enemy_killed[ENEMY.GIDEON_TV] || global.enemy_spared[ENEMY.GIDEON_TV])
    {
        // TODO: Create object to return to big size
    }
    exit;
}
event_inherited();
with instance_create_layer(120, 140, layer, obj_ford_ow_1)
{
    sprite_index = spr_cheekums;
    image_speed = 0;
}
{
    var _tilemap = layer_tilemap_get_id("Tiles");
    for (var _tile_row = 4; _tile_row <= 9; ++_tile_row)
    {
        tilemap_set(_tilemap, 2, 2, _tile_row);
        tilemap_set(_tilemap, 2, 3, _tile_row);
    }
}
stage = 0;

BEAT_TIME = floor(game_get_speed(gamespeed_fps)) div 3; // * 60 seconds per minute / 180 BPM
BEATS_PER_MEASURE = 4;
current_beat = 1;
current_measure = 1;

LYRICS = global.player.mabel ? [
    ["OH ", "MY ", "LOVE"],
    ["HAS ", "SHRUNK", "EN ", "DOWN"],
    ["TIL ", "SHE ", "TAKES"],
    ["WITH ", "ME ", "THE ", "CROWN"],
    ["NOW ", "MY ", "PET"],
    ["PER", "SUADES ", "HER ", "FORTH"],
    ["SO ", "SHE ", "SEES"],
    ["WHAT ", "I ", "AM ", "WORTH"],
    ["ALL ", "SHE ", "NEEDS"],
    ["IS ", "THIS ", "LI'L ", "GUY"],
    ["SO ", "I'LL ", "KEEP"],
    ["ON ", "TRY", ".", ".", ".", "...ING"]
] : [
    ["OH ", "MY ", "LOVE"],
    ["HER ", "BRO", "THER'S ", "SMALL"],
    ["HE'S ", "NO ", "GOOD"],
    ["FOR ", "HER ", "AT ", "ALL"],
    ["NOW ", "MY ", "PET"],
    ["WILL ", "STRIKE ", "HIM ", "DOWN"],
    ["SO ", "MY ", "LOVE"],
    ["CAN ", "WEAR ", "MY ", "CROWN"],
    ["WELL, ", "HE'S ", "DEAD"],
    ["WAS ", "A ", "GOOD ", "TRY"],
    ["SO, ", "MY ", "FRIEND,"],
    ["GOOD", "BYE."]
];
text_page = 0;
text_length = 0;
