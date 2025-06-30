/// @description Make it bright!

var _tile_size = 20;
// Why doesn't GML support unordered sets? or integer mappings?
// I swear, it gets worse every time I return
var _add_3 = [4, 5, 6, 19, 20, 21, 34, 35, 36, 52, 53, 54];
var _add_2 = [30, 31, 45, 46];
var _add_1 = [13, 28];

for (var i = 0; i < array_length(self.tile_layers); i++)
{
    var _layer = self.tile_layers[i];
    var _tilemap = layer_tilemap_get_id(_layer);
    for (var _tilex = 0; _tilex < room_width / _tile_size; _tilex++)
    {
        for (var _tiley = 0; _tiley < room_height / _tile_size; _tiley++)
        {
            var _tile_data = tilemap_get(_tilemap, _tilex, _tiley);
            var _new_tile_data = _tile_data;
            if (array_contains(_add_3, _tile_data))
            {
                _new_tile_data += 3;
            }
            else if (array_contains(_add_2, _tile_data))
            {
                _new_tile_data += 2;
            }
            else if (array_contains(_add_1, _tile_data))
            {
                _new_tile_data += 1;
            }
            if (_tile_data != _new_tile_data)
            {
                tilemap_set(_tilemap, _new_tile_data, _tilex, _tiley);
            }
        }
    }
}
