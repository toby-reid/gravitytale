function scr_getTileLayers()
{
    var _tile_layers = [];
    var _layers = layer_get_all();
    for (var i = 0; i < array_length(_tile_layers); i++)
    {
        var _layer = _layers[i];
        var _tilemap = layer_tilemap_get_id(_layer);
        if (_tilemap != -1 and layer_tilemap_exists(_layer, _tilemap))
        {
            array_push(_tile_layers, _layer);
        }
    };
    return _tile_layers;
}
