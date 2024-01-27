image_speed = 0
for(var tilex = 0; tilex < room_width/20 - 16; tilex++) {
	for(var tiley = 0; tiley < room_height/20 - 12; tiley++) {
		var tile = tilemap_get(layer_tilemap_get_id("Tiles"),tilex,tiley)
		tile = tile_set_rotate(tile,irandom(1))
		tile = tile_set_mirror(tile,irandom(1))
		tile = tile_set_flip  (tile,irandom(1))
		if tilex < (room_width/20 - 16) and tiley < (room_height/20 - 12) {
			if tilex < 16 and tiley < 12 {
				for(var i = 0; i < 2; i++) for(var j = 0; j < 2; j++) 
					tilemap_set(layer_tilemap_get_id("Tiles"),tile,tilex+i*(room_width/20 - 16),tiley+j*(room_height/20 - 12))
			}
			else if tilex < 16 {
				tilemap_set(layer_tilemap_get_id("Tiles"),tile,tilex+(room_width/20 - 16),tiley)
			}
			else if tiley < 12 {
				tilemap_set(layer_tilemap_get_id("Tiles"),tile,tilex,tiley+(room_height/20 - 12))
			}
			tilemap_set(layer_tilemap_get_id("Tiles"),tile,tilex,tiley)
		}
	}
}