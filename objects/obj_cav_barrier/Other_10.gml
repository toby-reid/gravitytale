/// @description build that wall
var set = layer_tilemap_get_id(layer_get_id("Tiles_1"))
for(var tilex = x/20; tilex < x/20+image_xscale; tilex++) {
	var tiley = y/20
	//tilemap_set(set,tiledata[0],tilex,tiley+4-stage)
	var data = tile_set_rotate(tiledata[0]/*tilemap_get(set,tilex,tiley+4-stage)*/,true)
	if tiledata[0] != 20 if tilex == x/20+image_xscale-1 data = tile_set_flip(data,true)
	tilemap_set(set,data,tilex,tiley+4-stage)
	data = tile_set_mirror(data,true)
	tilemap_set(set,data,tilex,tiley+5-stage)
	data = tiledata[1]
	if tiledata[1] != 5 if tilex == x/20+image_xscale-1 data = tile_set_mirror(data,true)
	tilemap_set(set,data,tilex,tiley+6-stage)
	tilemap_set(set,data,tilex,tiley+7-stage)
	data = tiledata[2]
	if tiledata[2] != 15 if tilex == x/20+image_xscale-1 data = tile_set_mirror(data,true)
	tilemap_set(set,data,tilex,tiley+8-stage)
	for(tiley = tiley+5; tiley < room_height/20; tiley++) tilemap_set(set,0,tilex,tiley)
}