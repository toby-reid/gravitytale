/// @description build that wall
var set = layer_tilemap_get_id(layer_get_id("Tiles_1"))
for(var tilex = x/20; tilex < x/20+stage; tilex++) {
	tilemap_set(set,67,tilex,y/20)
	tilemap_set(set,67,tilex,y/20+1)
	//if tilex == x/20 or tilex == x/20+image_xscale-1 tilemap_set(set,77,tilex,y/20+2)
}