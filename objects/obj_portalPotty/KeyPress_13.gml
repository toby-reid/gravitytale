if (obj_dipper.canMove && !instance_exists(obj_textbox))
{
    if (is_interaction())
    {
        if (!cantp)
        {
            cantp = scr_isWaymanDefeated();
        }
        with instance_create_layer(160, 192, layer, obj_textbox)
        {
            if (obj_dipper.dir == DIRECTION.UP)
            {
                set_text(other.cantp ? "(Go where?)" : "(You aren't sure how to use #the Potty...&(Here we go...)");
                if (other.cantp)
                {
                    var _choice_count = 0;
                    switch global.player.portalPotty
                    {
                        case PORTAL_POTTY.FOREST_START:
                            _choice_count = 1;
                            break;
                        case PORTAL_POTTY.CAVES_START:
                            _choice_count = 2;
                            break;
                        case PORTAL_POTTY.MINES_START:
                            _choice_count = 3;
                            break;
                        case PORTAL_POTTY.UFO_START:
                            _choice_count = 4;
                            break;
                    }
                    var _choices = ["Forest", "Caves", "Dump", "UFO"];
                    var _action_destinations = [PORTAL_POTTY.FOREST_START, PORTAL_POTTY.CAVES_START, PORTAL_POTTY.MINES_START, PORTAL_POTTY.UFO_START];
                    array_resize(_choices, _choice_count);
                    array_resize(_action_destinations, _choice_count);
                    if (_choice_count == 1)
                    {
                        array_push(_choices, "(Cancel)");
                    }
                    var _actions = array_create(_choice_count);
                    for (var i = 0; i < _choice_count; ++i)
                    {
                        _actions[i] = method({target: other.id, destination: _action_destinations[i]}, function() { target.teleport(destination); });
                    }
                    set_choices(0, _choices, _actions, method({target: id}, function() { next_page(); }));
                }
                else
                {
                    set_actions(0, method({target: other.id}, function() { target.teleport(PORTAL_POTTY.NONE); }));
                }
            }
            else
            {
                set_text([
                    "Some`BODY once told me--&(Wait...&(No, that's not right.)",
                    "(It's a Portal Potty.)",
                    "(More formally, one entry in a #mysterious system of space-#warping outhouses.)",
                    string_concat("(You ", other.cantp ? "feel like you know" : "have no idea", " how #to control the destination.")
                ]);
            }
        }
    }
}
