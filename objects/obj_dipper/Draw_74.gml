///@desc in-game menu
if (m_menu != DIPPER_MENU.CLOSED)
{
    draw_sprite(spr_menu, 0, 30, 60);
    var _soul = global.player.mabel ? spr_soulM : spr_soul;
    draw_set_font(fnt_basic_bubble);
    draw_text_ext(46, 106, string_concat("LV ", global.player.lv, "\nHP  ", global.player.hp, "/", global.player.maxHp, "\n$   ", global.player.money), 18, 200);
    draw_set_font(fnt_basic_gui);
    draw_text(43, 69, global.player.name);
    draw_sprite_ext(spr_menuIcons, global.player.mabel ? 1 : 0, 142, 72, 2, 2, 0, c_white, 1);
    
    for (var i = 0, _max = (global.player.df == AT_DF.NONE) ? 2 : 3; i < _max; ++i)
    {
        draw_text(55, 197 + (36 * i), m_MENU_PRIMARY[i]);
    }
    var _inventory_size = array_length(m_inventory);
    if (m_menu == DIPPER_MENU.PRIMARY_SELECT)
    {
        if (instance_exists(obj_textbox))
        {
            draw_text_colour(55, 197 + (36 * m_menu_primary), m_MENU_PRIMARY[m_menu_primary], c_yellow, c_yellow, c_yellow, c_yellow, 1);
        }
        else
        {
            draw_sprite(_soul, 0, 46, 209 + (36 * m_menu_primary));
        }
    }
    else
    {
        draw_text_colour(55, 197 + (36 * m_menu_primary), m_MENU_PRIMARY[m_menu_primary], c_yellow, c_yellow, c_yellow, c_yellow, 1);
        if (m_menu == DIPPER_MENU.ITEM_LIST || m_menu == DIPPER_MENU.ITEM_ACTION)
        {
            if (_inventory_size == 0)
            {
                m_menu = DIPPER_MENU.PRIMARY_SELECT;
                exit;
            }
            if (m_menu_item >= _inventory_size)
            {
                m_menu_item = _inventory_size - 1;
            }
            var _max_inventory = 8;
            var _inventory_page_count = ((_inventory_size - 1) div _max_inventory) + 1;
            draw_sprite(spr_menu, (_inventory_page_count > 1) ? 2 : 1, 30, 60);
            var _page = m_menu_item div _max_inventory;
            for (var i = 0, _page_base = _max_inventory * _page, _max = min(_max_inventory, _inventory_size - _page_base); i < _max; ++i)
            {
                var _item_name = m_inventory[_page_base + i];
                draw_text(212, 78 + (32 * i), global.ITEM_INFO[_item_name].name);
            }
            var _button_offset = 0;;
            if (_inventory_page_count > 1)
            {
                draw_text_colour(212, 340, scr_pad_string(string_concat("Pg ", _page + 1, " / ", _inventory_page_count), string_length("USE   INFO  DROP"), fa_right), c_ltgrey, c_ltgrey, c_ltgrey, c_ltgrey, 1);
                _button_offset = 32;
            }
            draw_text(212, 340 + _button_offset, "USE   INFO  DROP");
            
            var _page_index = m_menu_item % _max_inventory;
            if (m_menu == DIPPER_MENU.ITEM_LIST)
            {
                if (instance_exists(obj_textbox))
                {
                    // implies we've just interacted with an item, so we should draw the colors
                    if (!m_consumed_item)
                    {
                        draw_text_colour(212, 78 + (32 * _page_index), global.ITEM_INFO[m_inventory[m_menu_item]].name, c_yellow, c_yellow, c_yellow, c_yellow, 1);
                    }
                    var _text;
                    switch m_menu_itemAction
                    {
                        case DIPPER_MENU_ITEM.USE: _text = "USE"; break;
                        case DIPPER_MENU_ITEM.INFO: _text = "INFO"; break;
                        case DIPPER_MENU_ITEM.DROP: _text = "DROP"; break;
                    }
                    draw_text_colour(212 + (m_menu_itemAction * string_width("USE   ")), 340 + _button_offset, _text, c_yellow, c_yellow, c_yellow, c_yellow, 1);
                }
                else
                {
                    draw_sprite(_soul, 0, 202, 92 + (32 * _page_index));
                }
            }
            else
            {
                draw_text_colour(212, 78 + (32 * _page_index), global.ITEM_INFO[m_inventory[m_menu_item]].name, c_yellow, c_yellow, c_yellow, c_yellow, 1);
                draw_sprite(_soul, 0, 202 + (m_menu_itemAction * string_width("USE   ")), 352 + _button_offset);
            }
        }
        else // journal
        {
            draw_sprite(spr_menu, 3, 30, 60);
            draw_text_ext(208, 78, string_concat(
                "\"", global.player.name, "\"\n",
                "\n",
                "LV ", global.player.lv, "\n",
                "HP ", global.player.hp, " / ", global.player.maxHp, "\n",
                "Stan Bucks ", global.player.money
            ), 30, 640);
            
            var _color = c_white;
            if (global.player.genocide == RUN.ACTIVE) _color = c_red;
            else if (global.player.genocide == RUN.ABORTED) _color = c_fuchsia;
            draw_text_colour(208, 258, string_concat("KILLED: ", global.player.kills), _color, _color, _color, _color, 1);
            _color = (global.player.kills == 0 && global.enemy_spared[ENEMY.SOOS]) ? c_lime : c_white;
            draw_text_colour(208, 288, string_concat("SPARED: ", global.player.spares), _color, _color, _color, _color, 1);
            
            var _weapon;
            var _defence;
            if (instance_exists(obj_bill_overworld))
            {
                _weapon = "Imagination";
                _defence = "Dreams";
            }
            else if (global.player.mabel)
            {
                if (global.player.at == AT_DF.NONE) _weapon = "Creativity";
                else if (global.player.at == AT_DF.BASE) _weapon = "Grapple Hook";
                else _weapon = "Cannon in Dm";
                if (global.player.df == AT_DF.NONE) _defence = "Stern Look";
                else if (global.player.df == AT_DF.BASE) _defence = "SStar Sweater";
                else _defence = "Mothy Sweater";
            }
            else
            {
                if (global.player.at == AT_DF.NONE) _weapon = "Strong Will";
                else if (global.player.at == AT_DF.BASE) _weapon = "NYARF Gun";
                else _weapon = "MAN o' War";
                if (global.player.df == AT_DF.NONE) _defence = "Curiosity";
                else if (global.player.df == AT_DF.BASE) _defence = "PTree Hat";
                else _defence = "News Hat";
            }
            draw_text_ext(208, 348, string_concat(
                "AT: ", _weapon, "\n",
                "DF: ", _defence
            ), 30, 640);
            
            draw_sprite_ext(spr_menuIcons, (global.player.at == AT_DF.UPGRADE) ? 3 : 2, 492, 351, 2, 2, 0, c_white, 1);
            draw_sprite_ext(spr_menuIcons, (global.player.df == AT_DF.UPGRADE) ? 5 : 4, 492, 381, 2, 2, 0, c_white, 1);
            draw_sprite_ext(spr_menuIcons, scr_has_enum_flag(global.player.bag, BAG.SHOULDER_BAG) ? 7 : 6, 462, 411, 2, 2, 0, c_white, 1);
            draw_sprite_ext(spr_menuIcons, scr_has_enum_flag(global.player.bag, BAG.PIGGER_BAG)   ? 9 : 8, 492, 411, 2, 2, 0, c_white, 1);
            draw_sprite_ext(spr_menuIcons, global.player.coupon ? 11 : 10, 492, 201, 2, 2, 0, c_white, 1); // line up with Stan Bucks, above
            
            draw_text(208, 408, scr_format_time());
        }
    }
}
