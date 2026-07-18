// Inherit the parent event
event_inherited();

if (!given_hamstick)
{
    if (stage >= 5 && choice[1] == 0 && page == 9 && global.player.genocide != RUN.ACTIVE)
    {
        if (scr_get_item(ITEM_INDEX.HAMSTICK, true))
        {
            given_hamstick = true;
            array_push(global.oneTimeInstances, id);
            msg.l_topic0[8] = "Just... please...&Leave me alone...";
            msg.l_topic0[9] = "(This poor girl.&(Maybe we should back #off on this front.)";
        }
        else
        {
            msg.l_topic0[9] = "(She tried to bribe #you not to complain #to management, but #your inventory was #full.)";
        }
    }
    else if (array_contains(global.inventory, ITEM_INDEX.HAMSTICK))
    {
        given_hamstick = true;
        array_push(global.oneTimeInstances, id);
    }
}
