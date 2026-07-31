if (is_interaction())
{
    with instance_create_layer(160, get_ybox(), layer, obj_textbox)
    {
        set_text(
            string_concat(
                "(It's ",
                other.is_dipper_classic ? "your clone" : string_concat(global.player.name, " Classic"),
                ".",
                global.player.mabel ? "" : "&(Was your head always this #big?",
                ")"
            )
        );
    }
}
