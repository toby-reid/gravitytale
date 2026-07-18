if global.wendy < 16
{
    var _tilemap_layer = layer_tilemap_get_id("Tiles_1");
	for (var tilex = x div 20, _max_tilex = (x div 20) + image_xscale, _max_tiley = (y div 20) + image_yscale; tilex < _max_tilex; tilex++)
    {
        for (var tiley = y div 20; tiley < _max_tiley; tiley++)
        {
		    tilemap_set(_tilemap_layer, 5, tilex, tiley);
        }
	}
}
else instance_destroy();
