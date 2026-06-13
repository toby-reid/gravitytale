if (active)
{
    active = false;
    obj_dipper.canMove = true;
}
else
{
    if (instance_exists(obj_dipper) && obj_dipper.canMove)
    {
        var dir = obj_dipper.dir;
        if (
            (place_meeting(x-2,y,obj_dipper) and dir==0)
            or (place_meeting(x,y+2,obj_dipper) and dir==1)
            or (place_meeting(x+2,y,obj_dipper) and dir==2)
            or (place_meeting(x,y-2,obj_dipper) and dir==3)
        )
        {
            if (map == noone or recreate_map)
            {
                var _tilemap = layer_tilemap_get_id(tile_layer_name);
                var _tilemap_width = tilemap_get_width(_tilemap);
                var _tilemap_height = tilemap_get_height(_tilemap);

                var _map_width = _TILE_SCALE * _tilemap_width;
                var _map_height = _TILE_SCALE * _tilemap_height;
                var _map = surface_create(_map_width, _map_height);
                surface_set_target(_map);
                draw_clear_alpha(c_black, 0);

                for (var _tilemap_x = 0; _tilemap_x < _tilemap_width; ++_tilemap_x)
                {
                    var _map_x = _tilemap_x * _TILE_SCALE;
                    for (var _tilemap_y = 0; _tilemap_y < _tilemap_height; ++_tilemap_y)
                    {
                        var _map_y = _tilemap_y * _TILE_SCALE;
                        if (array_contains(_WALKABLE_TILES, tilemap_get(_tilemap, _tilemap_x, _tilemap_y)))
                        {
                            draw_rectangle_colour(
                                _map_x, _map_y, _map_x + _TILE_SCALE - 1, _map_y + _TILE_SCALE - 1,
                                walkable_color, walkable_color, walkable_color, walkable_color,
                                false
                            );
                        }
                    }
                }

                var _tile_width = tilemap_get_tile_width(_tilemap);
                var _tile_height = tilemap_get_tile_height(_tilemap);
                var _plate_count = instance_number(obj_min_faithPlate);
                for (var _plate_index = 0; _plate_index < _plate_count; ++_plate_index)
                {
                    var _plate = instance_find(obj_min_faithPlate, _plate_index);
                    var _egress_tilemap_x = floor(_plate.x / _tile_width);
                    var _egress_tilemap_y = floor(_plate.y / _tile_height);
                    var _egress_map_x = _egress_tilemap_x * _TILE_SCALE;
                    var _egress_map_y = _egress_tilemap_y * _TILE_SCALE;
                    
                    var _link_offset = floor(_TILE_SCALE / 2);
                    var _egress_link_x = _egress_map_x + _link_offset;
                    var _egress_link_y = _egress_map_y + _link_offset;
                    var _link_count = array_length(_plate.affected_plates);
                    for (var _link_index = 0; _link_index < _link_count; ++_link_index)
                    {
                        var _ingress_plate = _plate.affected_plates[_link_index];
                        var _ingress_tilemap_x = floor(_ingress_plate.x / _tile_width);
                        var _ingress_tilemap_y = floor(_ingress_plate.y / _tile_height);
                        var _ingress_map_x = _ingress_tilemap_x * _TILE_SCALE;
                        var _ingress_map_y = _ingress_tilemap_y * _TILE_SCALE;
                        var _ingress_link_x = _ingress_map_x + _link_offset;
                        var _ingress_link_y = _ingress_map_y + _link_offset;
                        
                        var _ingress_color = array_contains(_ingress_plate.affected_plates, _plate)
                            ? egress_color
                            : ingress_color;
                        draw_line_colour(
                            _egress_link_x, _egress_link_y, _ingress_link_x, _ingress_link_y,
                            egress_color, _ingress_color
                        );
                    }
                }
                for (var _plate_index = 0; _plate_index < _plate_count; ++_plate_index)
                {
                    var _plate = instance_find(obj_min_faithPlate, _plate_index);
                    var _egress_tilemap_x = floor(_plate.x / _tile_width);
                    var _egress_tilemap_y = floor(_plate.y / _tile_height);
                    var _egress_map_x = _egress_tilemap_x * _TILE_SCALE;
                    var _egress_map_y = _egress_tilemap_y * _TILE_SCALE;
                    
                    var _plate_blend = _plate.image_blend;
                    draw_rectangle_colour(
                        _egress_map_x, _egress_map_y, _egress_map_x + _TILE_SCALE - 1, _egress_map_y + _TILE_SCALE - 1,
                        _plate_blend, _plate_blend, _plate_blend, _plate_blend,
                        false
                    );
                    draw_rectangle_colour(
                        _egress_map_x + 1, _egress_map_y + 1, _egress_map_x + _TILE_SCALE - 2, _egress_map_y + _TILE_SCALE - 2,
                        c_black, c_black, c_black, c_black,
                        true
                    );
                }
                
                surface_reset_target();
                map = sprite_create_from_surface(_map, 0, 0, _map_width, _map_height, false, false, floor(_map_width / 2), floor(_map_height / 2));
                surface_free(_map);
            }
            
            active = true;
            obj_dipper.canMove = false;
        }
    }
}
