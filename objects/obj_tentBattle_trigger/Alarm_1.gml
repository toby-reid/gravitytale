with instance_create_layer(0, 0, layer, obj_toBattle)
{
    switch (other.battle_index)
    {
        case TENT_BATTLE.SEVRAL_TIMEZ_3:
        case TENT_BATTLE.SEVRAL_TIMEZ_2:
            // TODO: Sev'ral Timez
            break;
        case TENT_BATTLE.SHERLOCK_LARRY:
        case TENT_BATTLE.LIZZIE_GROUCHO:
        case TENT_BATTLE.SHAKESPEARE_GENGHIS:
            // TODO: Wax figures
            break;
        case TENT_BATTLE.TYRONE:
        case TENT_BATTLE.CLONE_3_4:
        case TENT_BATTLE.CLONE_5_6_7:
        case TENT_BATTLE.CLONE_8_9_10:
            goto = btl_ttn_clone;
            break;
        case TENT_BATTLE.PAPER_JAM:
            // TODO: Paper Jam
            break;
        case TENT_BATTLE.ALL_WIZARDS:
            // TODO: Oops! All Wizards
            break;
        default:
            with instance_create_layer(160, 192, layer, obj_textbox)
            {
                set_text("An error occurred.&Please report this!&Error code: @ff0000TNBTL");
            }
            break;
    }
    prevMusic = mus_core;
}
