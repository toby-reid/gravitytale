if !variable_global_exists("wendyne") global.wendyne = 3
if global.wendyne < 14 {
	for(var tilex = x/20; tilex < x/20+image_xscale; tilex++) for(var tiley = y/20; tiley < y/20+image_yscale; tiley++) {
		tilemap_set(layer_tilemap_get_id("Tiles_1"),5,tilex,tiley)
	}
	
}
else instance_destroy()