if !instance_exists(obj_toBattle) {
    draw_self()
    draw_set_font(fnt_basic_gui)
    var enemyExists = false
    for(var i = 0; i < array_length(global.enemy); i++) {
        if instance_exists(global.enemy[i]) {
            enemyExists = true;
            break;
        }
    }
    if enemyExists battle = true
    if enemyExists switch global.stage[0] {
        case 0:
            if !instance_exists(global.enemy[global.stage[2]]) select_enemy();
            if keyboard_check_pressed(vk_right) {global.stage[1]++; audio_play_sound(sfx_beep,0,false)}
            if keyboard_check_pressed(vk_left)  {global.stage[1]--; audio_play_sound(sfx_beep,0,false)}
            if global.stage[1] == -1 global.stage[1] = 3
            if global.stage[1] ==  4 global.stage[1] = 0
            if keyboard_check_pressed(vk_enter) {
                audio_play_sound(sfx_select,0,false)
                if global.stage[1] == 2 {
                    var _inventory_size = array_length(inventory);
                    if (_inventory_size > 0) // do nothing if our inventory is empty
                    {
                        global.stage[0]++;
                        if (global.stage[3] >= _inventory_size)
                        {
                            global.stage[3] = 0;
                        }
                    }
                }
                else global.stage[0]++
            }
            { // scoped this block to eliminate the "warning" about already-defined var drawx later
                var drawx = 55
                var drawy = 269
                draw_text(drawx,drawy,"*")
                drawx += string_width("* ")
                for(var j = 1; j <= charCount and j <= string_length(text[0]); j++) {
                    var char = string_copy(text[0],j,1)
                    if char == "&" {
                        drawx = 55
                        drawy += 35
                        draw_text(drawx,drawy,"*")
                        drawx += string_width("* ")
                    }
                    else if char == "#" {
                        drawx = 55+string_width("* ")
                        drawy += 35
                    }
                    else if char == "@" {
                        j += 6
                    }
                    else {
                        draw_text(drawx,drawy,char)
                        drawx += string_width(char)
                    }
                }
            }
            charCount += .5
            if keyboard_check_pressed(vk_shift) charCount = string_length(text[0])
        break
        case 1:
            switch global.stage[1] {
                case 0:
                case 1://Enemy select
                    if keyboard_check_pressed(vk_right) select_enemy(DIRECTION.RIGHT);
                    if keyboard_check_pressed(vk_up) select_enemy(DIRECTION.UP);
                    if keyboard_check_pressed(vk_left) select_enemy(DIRECTION.LEFT);
                    if keyboard_check_pressed(vk_down) select_enemy(DIRECTION.DOWN);
                    if keyboard_check_pressed(vk_enter) if instance_exists(global.enemy[global.stage[2]]) {
                        global.stage[0]++
                        if global.stage[1] == 0 {
                            instance_create_layer(x, y, layer, obj_battleTarget);
                            global.stage[4] = -1;
                        }
                        audio_play_sound(sfx_select,0,false)
                    }
                    var _first_col = 55;
                    var _second_col = _first_col + 272;
                    var _first_row = 269;
                    var _row_height = 35;
                    var _bullet_offset = string_width("* ");
                    for (var i = 0, _enemy_count = array_length(global.enemy); i < _enemy_count; i++)
                    {
                        var _enemy = global.enemy[i];
                        if (instance_exists(_enemy))
                        {//name list. battleEnemy should have spare t/f and name ""
                            var _draw_x = (i < 3) ? _first_col : _second_col;
                            var _draw_y = _first_row + ((i % 3) * _row_height);
                            if (_enemy.spare)
                            {
                                draw_text_color(_draw_x + _bullet_offset, _draw_y, _enemy.name, c_yellow, c_yellow, c_yellow, c_yellow, 1);
                            }
                            else
                            {
                                draw_text(_draw_x + _bullet_offset, _draw_y, _enemy.name);
                            }
                            if (global.stage[1] == 0) // Fight; draw healthbar
                            {
                                var _name_width = _bullet_offset + string_width(" " + _enemy.name);
                                draw_healthbar(_draw_x + _name_width, _draw_y + 3, _draw_x + _name_width + 80, _draw_y + 20, 100 * (_enemy.hp / _enemy.maxhp), c_red, c_lime, c_lime, 0, true, false);
                            }
                            if (global.stage[2] != i) // not currently selected
                            {
                                draw_text(_draw_x, _draw_y, "*");
                            }
                        }
                    }
                break
                case 2://inventory. 0 > 2 \n 1 > 3; 4 > 6 \n 5 > 7
                    if keyboard_check_pressed(vk_down) m_select_item(DIRECTION.DOWN) ;
                    if keyboard_check_pressed(vk_up) m_select_item(DIRECTION.UP);
                    if keyboard_check_pressed(vk_right) m_select_item(DIRECTION.RIGHT);
                    if keyboard_check_pressed(vk_left) m_select_item(DIRECTION.LEFT);
                    var item_index = global.stage[3];
                    var item_name = inventory[item_index];
                    if keyboard_check_pressed(vk_enter) {
                        var item = global.ITEM_INFO[item_name];
                        if item_name != ITEM_INDEX.HOLY_WATER {
                            var heal = item.heal;
                            if (item.usable) {
                                global.player.hp += (heal >= 0) ? heal : global.player.maxHp;
                                if (global.player.hp > global.player.maxHp) {
                                    global.player.hp = global.player.maxHp;
                                }
                                if (heal != 0) {
                                    audio_play_sound(sfx_heal, 0, false);
                                }
                                var restore = (heal >= 0) ? string(heal) : "All";
                                text[1] = restore + " HP restored.";
                                scr_remove_local_item(inventory, item_index);
                                inventory = scr_get_inventory();
                            } else {
                                text[1] = item.name + " can't be used here!";
                            }
                            text[1] = string_concat(text[1], "&", item.useResponse);
                            if (!audio_is_playing(sfx_heal)) {
                                audio_play_sound(sfx_select, 0, false);
                            }
                        } else {
                            var enemies = [
                                obj_enemy_scb_beaver,
                                obj_enemy_scb_sDuck,
                                obj_enemy_scb_merman,
                                obj_enemy_scb_hawktopus,
                                obj_enemy_scb_gobbie,
                                obj_enemy_fst_plaidypus,
                                obj_enemy_cav_scampfire,
                                obj_enemy_cav_geodite,
                                obj_enemy_cav_gobber,
                                obj_enemy_min_mockroach,
                                obj_enemy_min_zombie,
                                obj_enemy_tnt_clone,
                                obj_enemy_scb_chainsawBeaver,
                                obj_enemy_cav_ghost,
                                obj_enemy_min_zBoyfriend
                            ];
                            audio_play_sound(sfx_glass,0,false)
                            text[1] = "You threw the bottle at the enemy.&Nothing happened.&Seems it only works on certain types."
                            for(var i = 0; i < array_length(enemies); i++) {
                                if instance_exists(enemies[i]) {
                                    enemies[i].hp = 0;
                                    text[1] = "You threw the bottle at the enemy.&Undead, Water, and Abomination #types were dispelled!";
                                    // Do not break from loop; all enemies should be checked and killed
                                }
                            }
                            scr_remove_local_item(inventory, item_index);
                            inventory = scr_get_inventory();
                        }

                        global.stage[0] = 3;
                        charCount = 0;
                    }
                    for (var i = 0, item_page = 4 * (global.stage[3] div 4), inventory_length = array_length(inventory); i < 4; i++) {
                        var draw_item_index = item_page + i;
                        if (draw_item_index >= inventory_length)
                        {
                            break;
                        }
                        var draw_item_name = inventory[draw_item_index];
                        if (draw_item_name != ITEM_INDEX.NONE) {
                            var draw_item = global.ITEM_INFO[draw_item_name];
                            draw_text(
                                55 + (272 * (i div 2)) + string_width("* "),
                                269 + (35 * (i % 2)),
                                string_copy(draw_item.name, 1, 14));
                            if draw_item_index != global.stage[3] { // we'll want to draw the player's SOUL here instead
                                draw_text(55 + 272*floor(i/2), 269 + 35*(i%2), "*");
                            }
                        }
                    }

                    var pages = ((array_length(inventory) - 1) div 4) + 1;
                    if (pages > 1)
                    {
                        var this_page = (global.stage[3] div 4) + 1;
                        draw_text(407, 339, string_concat("Page ", this_page, " of ", pages));
                    }
                break;
                case 3:
                    global.stage[4] = 0;
                    global.stage[0]++;
                break;
            }
            if keyboard_check_pressed(vk_shift) and !keyboard_check(vk_enter) {
                global.stage[0]--;
                audio_play_sound(sfx_beep,0,false);
                charCount = 0;
            }
        break
        case 2:
            switch global.stage[1] {
                case 0://Fight bar. nothing needed here.
                break
                case 1://Action list
                    if keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_up) {
                        if global.stage[5]%2 == 0 global.stage[5]++;
                        else global.stage[5]--;
                        audio_play_sound(sfx_beep,0,false)
                    }
                    if keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_left) {
                        global.stage[5] += 2;
                        if global.stage[5] > 3 global.stage[5] -= 4;
                        audio_play_sound(sfx_beep,0,false)
                    }
                    if keyboard_check_pressed(vk_enter) {
                        var e = global.enemy[global.stage[2]]
                        e.alarm[global.stage[5]] = 1
                        charCount = 0
                        global.stage[0]++
                        audio_play_sound(sfx_select,0,false)
                    } else if keyboard_check_pressed(vk_shift) {
                        global.stage[0]--;
                        audio_play_sound(sfx_beep,0,false);
                    }
                    for(var i = 0; i < 4; i++) {
                        draw_text(55+272*floor(i/2)+string_width("* "),269+70*(i%2),global.enemy[global.stage[2]].act[i])
                        if i != global.stage[5] draw_text(55+272*floor(i/2),269+70*(i%2),"*")
                    }
                break
                case 2://Items should skip global.stage[0] == 2.
                break
                case 3://Spare or run
                    if keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_up) {global.stage[4]=1-global.stage[4]; audio_play_sound(sfx_beep,0,false)}
                    if keyboard_check_pressed(vk_enter) {//alarm[5] and [6] are for Spare / Run
                        for(var i = 0; i < array_length(global.enemy); i++) if instance_exists(global.enemy[i]) global.enemy[i].alarm[global.stage[4]+5] = 1
                        if global.stage[4] == 1 global.stage[0] = 3
                        else {
                            global.stage[0] = 4
                            obj_soul.x = 320
                            obj_soul.y = 320
                            obj_soul.xstart = 320
                            obj_soul.ystart = 320
                            for(var i = 0; i < array_length(global.enemy); i++) if instance_exists(global.enemy[i]) global.enemy[i].alarm[4] = 1//alarm[4] is textbubble
                        }
                        audio_play_sound(sfx_select,0,false)
                    }
                    else if keyboard_check_pressed(vk_shift) {global.stage[0] = 0; audio_play_sound(sfx_beep,0,false)}
                    draw_text_ext(55+string_width("* "),269,"Spare\nRun",35,1500)
                    for(var i=0;i<array_length(global.enemy);i++) if instance_exists(global.enemy[i]) if global.enemy[i].spare {draw_text_color(55+string_width("* "),269,"Spare",c_yellow,c_yellow,c_yellow,c_yellow,1); break}
                    draw_text(55,269+35*abs(global.stage[4]-1),"*")
                break
            }
        break
        case 3:
            if global.stage[1] != 3 {
                charCount += .5
                if global.stage[1] != 0 {
                    var drawx = 55
                    var drawy = 269
                    draw_text(drawx,drawy,"*")
                    drawx += string_width("* ")
                    for(var j = 1; j <= charCount and j <= string_length(text[1]); j++) {
                        var char = string_copy(text[1],j,1)
                        if char == "&" {
                            drawx = 55
                            drawy += 35
                            draw_text(drawx,drawy,"*")
                            drawx += string_width("* ")
                        }
                        else if char == "#" {
                            drawx = 55+string_width("* ")
                            drawy += 35
                        }
                        else if char == "@" {
                            j += 6
                        }
                        else {
                            draw_text(drawx,drawy,char)
                            drawx += string_width(char)
                        }
                    }
                    charCount += .5
                    if keyboard_check_pressed(vk_enter) if charCount >= string_length(text[1]) {
                        global.stage[0]++
                        for(var i = 0; i < array_length(global.enemy); i++) if instance_exists(global.enemy[i]) global.enemy[i].alarm[4] = 1
                    }
                    if keyboard_check_pressed(vk_shift) charCount = string_length(text[1])
                }
            } else with obj_soul {
                if !audio_is_playing(sfx_rocket) and vspeed < 0 {
                    audio_play_sound(sfx_rocket,0,true);
                    run = (variable_instance_exists(global.enemy[global.stage[2]], "canAlwaysRun")
                        ? global.enemy[global.stage[2]].canAlwaysRun
                        : bool(irandom(2)));
                }
                sprite_index = global.player.mabel ? spr_soulM_run_0 : spr_soul_run_0;
                vspeed -= .1
                if y <= 264 and (!global.enemy[global.stage[2]].run or !run) {
                    vspeed *= -1;
                    sprite_index = global.player.mabel ? spr_soulM : spr_soul;
                    audio_stop_sound(sfx_rocket);
                    audio_play_sound(sfx_ding,0,false);
                }
                if vspeed > 0 { // failed to run - see above block
                    if y >= 300 {
                        x = 320
                        y = 320
                        xstart = 320
                        ystart = 320
                        vspeed = 0
                        sprite_index = global.player.mabel ? spr_soulM : spr_soul;
                        for(var i = 0; i < array_length(global.enemy); i++) global.enemy[i].alarm[4] = 1
                        global.stage[0]++
                    }
                }
                if y <= 0 {
                    audio_group_stop_all(Music);
                    audio_stop_sound(sfx_rocket);
                    audio_group_unload(Battle);
                    audio_play_sound(other.music, 0, true);
                    room_goto(other.goto);
                }
            }
        break
        case 4:
            if !instance_exists(obj_battleBox) {
                image_xscale -= .2
                if image_xscale == .6 {
                    image_alpha = 0;
                    instance_create_layer(320,320,"Instances",obj_battleBox);
                }
            }
        break
        case 5:
        default://if it's anything else, somehow
            instance_destroy(obj_battleBox);
            image_alpha = 1;
            image_xscale += .2;
            if image_xscale >= 2 {
                global.stage[0] = 0;
                image_xscale = 2;
            }
            charCount = 0;
        break
    }
    else {//Either Genocide "no one came" or all enemies are done
        if global.player.genocide == RUN.ACTIVE and !battle {//Genocide
            instance_destroy(obj_soul)
            draw_text_color(55, 269, "* But there was no one to fight.", c_red, c_red, c_red, c_red, 1)
        } else if !battle {//Not geno, but a lot of deaths in this area
            instance_destroy(obj_soul)
            draw_text(55, 269, "* But no one wanted to fight.")
        } else {//Everyone's gone
            audio_group_stop_all(Music)
            if instance_exists(obj_soul) if lv > 0 {
                global.player.lv += lv;
                if global.player.maxHp > 1 { // i.e., we're not in "hard mode"
                    global.player.maxHp += 5 * lv;
                    global.player.hp += 5 * lv;
                    if (global.player.maxHp > 99) {
                        global.player.maxHp = 99;
                    }
                    if (global.player.hp > global.player.maxHp) {
                        global.player.hp = global.player.maxHp;
                    }
                }
                audio_play_sound(sfx_lvup,0,false);
                for(var i = 0; i < array_length(global.inventory); i++) {
                    if global.inventory[i] == ITEM_INDEX.PIZZA_REFRESHING {
                        global.inventory[i] = ITEM_INDEX.PIZZA_INFINITE;
                        break;
                    }
                }
            }
            instance_destroy(obj_soul);
            instance_destroy(obj_battleBox);
            image_alpha = 1;
            if image_xscale == 2 {
                draw_text_ext(
                    55, 269,
                    string_concat("* YOU WON!\n* You earned ", sb, " Stan Bucks.", lv ? "\n* Your LV and HP increased." : ""),
                    35, 1500);
            }
        }
        if keyboard_check_pressed(vk_enter) {
            if (battle or global.player.genocide != RUN.ACTIVE) {
                audio_play_sound(music, 0, true);
            }
            audio_group_unload(Battle);
            global.player.money += sb;
            room_goto(goto);
        }
        global.stage[0] = 5;
        instance_destroy(obj_battleAttack);
        if image_xscale < 2 image_xscale += .2;
    }

    draw_set_font(fnt_battle);
    draw_text(30, 403, string_concat(global.player.name, "  LV ", global.player.lv));
    draw_sprite(spr_hpkr, 0, 250, 405);
    draw_healthbar(280, 400, 300 + 4*global.player.lv, 420, 100 * (global.player.hp/global.player.maxHp), c_red, c_yellow, c_yellow, 0, true, false);
    draw_text(315 + 4*global.player.lv, 403, string_concat(global.player.hp, " / ", global.player.maxHp));
    //if instance_exists(obj_stans_battle) we'll move that text, add a second healthbar, draw hpkr,1, and calculate Karma
}