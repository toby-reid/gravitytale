set_dmg = function(_dmg, _is_mirror = false)
{
    damage = _dmg;
    switch (_dmg)
    {
        case 1:
            sprite_index = spr_battleTarget_1;
            break;
        case 2:
            sprite_index = spr_battleTarget_2;
            break;
        case 3:
            sprite_index = spr_battleTarget_3;
            break;
        case 5:
            sprite_index = spr_battleTarget_5;
            break;
        default:
            show_debug_message("Invalid damage value");
            break;
    }
    if (_is_mirror)
    {
        image_xscale = -image_xscale;
    }
    else
    {
        with instance_create_layer(x, y, layer, obj_battleTarget_dmg)
        {
            set_dmg(_dmg, true);
        }
    }
}

image_xscale = 2;
image_yscale = 2;
