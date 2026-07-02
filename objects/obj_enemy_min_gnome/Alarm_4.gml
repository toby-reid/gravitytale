if (stacked_gnome == noone)
{
    event_inherited();
    if (!revealed)
    {
        bubble.text = [
            "So, uh...",
            "We're gnomes.",
            "Get that one outta the way...",
            "Anyway, we gnomes have been looking for a queen.",
            "So whaddya say?",
            global.player.mabel ? "Will you join us in holy matri-\ngnome-\ny?" : "Will you give your sister your blessing?"
        ];
        bubble.image_index = 1;
        revealed = true;
    }
}
