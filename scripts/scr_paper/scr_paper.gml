function PaperFold(_sprite_left, _sprite_top, _sprite_width, _sprite_height, _fold_edge) constructor
{
    sprite_seg_left = _sprite_left;
    sprite_seg_top = _sprite_top;
    sprite_seg_width = _sprite_width;
    sprite_seg_height = _sprite_height;
    fold_edge = _fold_edge;

    subfold_static = undefined;
    subfold_dynamic = undefined;
    is_subfold_vertical = false;
    subfold_at = 0;
    subfold_scale = 1;

    static draw = function(_sprite, _sprite_image, _origin_x, _origin_y, _base_xscale, _base_yscale)
    {
        if (is_undefined(subfold_static) or is_undefined(subfold_dynamic))
        {
            draw_sprite_part_ext(
                _sprite,
                _sprite_image,
                sprite_seg_left,
                sprite_seg_top,
                sprite_seg_width,
                sprite_seg_height,
                _origin_x,
                _origin_y,
                _base_xscale,
                _base_yscale,
                c_white,
                1
            );
        }
        else
        {
            var _sub_origin_x = _origin_x;
            var _sub_origin_y = _origin_y;
            switch fold_edge
            {
                case DIRECTION.RIGHT:
                    if (is_subfold_vertical)
                    {
                        _sub_origin_x += (_base_xscale < 0) ? -subfold_at : subfold_at;
                    }
                    break;
                case DIRECTION.UP:
                case DIRECTION.LEFT:
                    break;
                case DIRECTION.DOWN:
                    if (!is_subfold_vertical)
                    {
                        _sub_origin_y += (_base_yscale < 0) ? subfold_at : subfold_at;
                    }
                    break;
            }
            subfold_static.draw(_sprite, _sprite_image, _sub_origin_x, _sub_origin_y, _base_xscale, _base_yscale);
            subfold_dynamic.draw(_sprite, _sprite_image, _sub_origin_x, _sub_origin_y, is_subfold_vertical ? (subfold_scale * _base_xscale) : _base_xscale, is_subfold_vertical ? _base_yscale : (subfold_scale * _base_yscale));
        }
    }

    static fold = function(_is_vertical, _fold_at, )
    {
        
    }
}
