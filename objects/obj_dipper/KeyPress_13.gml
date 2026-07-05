if (!instance_exists(obj_textbox))
{
    if (m_menu == DIPPER_MENU.PRIMARY_SELECT)
    {
        switch m_menu_primary
        {
            case DIPPER_MENU_PRIMARY.ITEM:
                m_inventory = scr_get_inventory();
                if (array_length(m_inventory) == 0)
                {
                    with instance_create_layer(160, 192, layer, obj_textbox)
                    {
                        set_text("(You have no Items.&(Come back when you're a #little, `mmm, `richer.)");
                    }
                }
                else
                {
                    m_menu = DIPPER_MENU.ITEM_LIST;
                }
                break;
            case DIPPER_MENU_PRIMARY.JOURNAL:
                m_menu = DIPPER_MENU.JOURNAL;
                break;
            case DIPPER_MENU_PRIMARY.COMLINK:
                scr_call_soos(room);
                break;
        }
        audio_play_sound(sfx_select, 0, false);
    }
    else if (m_menu == DIPPER_MENU.ITEM_LIST)
    {
        m_menu = DIPPER_MENU.ITEM_ACTION;
        audio_play_sound(sfx_select, 0, false);
    }
    else if (m_menu == DIPPER_MENU.ITEM_ACTION)
    {
        var _item_name = m_inventory[m_menu_item];
        var _item = global.ITEM_INFO[? _item_name];
        m_consumed_item = false;
        switch m_menu_itemAction
        {
            case DIPPER_MENU_ITEM.USE:
                if (_item.usable)
                {
                    if (global.player.hp >= global.player.maxHp)
                    {
                        with instance_create_layer(160, 192, layer, obj_textbox)
                        {
                            set_text(string_concat("(You were going to use the #", _item.name, ", #but your HP was already full.)"));
                        }
                        audio_play_sound(sfx_select, 0, false);
                    }
                    else
                    {
                        if (_item.heal < 0)
                        {
                            global.player.hp = global.player.maxHp;
                        }
                        else
                        {
                            global.player.hp += min(_item.heal, global.player.maxHp - global.player.hp);
                        }
                        var _heal = (global.player.hp == global.player.maxHp) ? "All" : _item.heal;
                        with instance_create_layer(160, 192, layer, obj_textbox)
                        {
                            set_text(string_concat(_heal, " HP restored.&", _item.useResponse));
                        }
                        audio_play_sound((_item.heal == 0) ? sfx_select : sfx_heal, 0, false);
                        scr_remove_local_item(m_inventory, m_menu_item);
                        m_inventory = scr_get_inventory();
                        m_consumed_item = true;
                    }
                }
                else // Unusable item, such as in-battle only or an empty cookie jar
                {
                    with instance_create_layer(160, 192, layer, obj_textbox)
                    {
                        set_text(_item.useResponse);
                    }
                    audio_play_sound(sfx_select, 0, false);
                }
                break;
            case DIPPER_MENU_ITEM.INFO:
                var _heal = (_item.heal < 0) ? "all" : _item.heal;
                with instance_create_layer(160, 192, layer, obj_textbox)
                {
                    set_text(string_concat(_item.name, " - Restores ", _heal, " HP.&", _item.description));
                }
                audio_play_sound(sfx_select, 0, false);
                break;
            case DIPPER_MENU_ITEM.DROP:
                var _text;
                var _disposed = false;
                switch _item_name
                {
                    case ITEM_INDEX.PIZZA_INFINITE:
                        _disposed = true;
                        //fallthrough
                    case ITEM_INDEX.PIZZA_REFRESHING:
                        _text = ["(You tried tossing the pizza, #but it returned to your pocket.)", "(May the overwhelming guilt #destroy you.)"];
                        break;
                    case ITEM_INDEX.COOKIE_JAR_FULL:
                    case ITEM_INDEX.COOKIE_JAR_2:
                    case ITEM_INDEX.COOKIE_JAR_1:
                        _disposed = true;
                        _text = "(You threw away Slow's Cookie.&(Probably had coconut in it #or something.)";
                        break;
                    case ITEM_INDEX.COOKIE_JAR_EMPTY:
                        _text = ["(You were going to throw away #Slow's Cookie Jar,", "but you liked its articulate #designs too much.)"];
                        break;
                    case ITEM_INDEX.ONION_1:
                        _disposed = true;
                        _text = ["(You threw away the rest #of the onion.)", "(Left too long in the sunlight, #it will soon get brown and #hairy.)"];
                        break;
                    default:
                        _disposed = true;
                        if _item_name >= ITEM_INDEX.ONION_1 && _item_name <= ITEM_INDEX.ONION_MAX
                        {
                            _text = "(You peeled off a layer of the #onion and tossed it away.&(Now you're making me cry.)";
                        }
                        else
                        {
                            _text = [string_concat("(You threw away the #", _item.name, ".)"), "Whooh!&Whatever that was, it's gone #forever!"];
                        }
                        break;
                }
                with instance_create_layer(160, 192, layer, obj_textbox)
                {
                    set_text(_text);
                }
                if (_disposed)
                {
                    audio_play_sound(sfx_grass, 0, false);
                    scr_remove_local_item(m_inventory, m_menu_item);
                    m_inventory = scr_get_inventory();
                    m_consumed_item = true;
                }
                else
                {
                    audio_play_sound(sfx_select, 0, false);
                }
                break;
        }
        m_menu = DIPPER_MENU.ITEM_LIST;
    }
}
