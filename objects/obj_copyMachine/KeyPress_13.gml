if (is_interaction())
{
    with instance_create_layer(160, get_ybox(), layer, obj_textbox)
    {
        if (instance_exists(obj_dipperClone))
        {
            set_text([
                "(It's out of paper.)",
                string_concat(
                    "(You can switch to controlling #",
                    obj_dipperClone.is_dipper_classic ? "your clone" : string_concat(global.player.name, " Classic"),
                    " by pressing #@ffff00X@ffffff or @ffff00SHIFT@ffffff)."
                )
            ]);
        }
        else
        {
            set_text([
                string_concat("(It's ", global.player.mabel ? "Grunkle" : "Great Uncle", " Ford's #copying machine.)"),
                "(Make a copy?)"
            ]);
            set_choices(1, ["Me", "Nothing"], [other.make_clone, noop], skip_page);
        }
    }
}
