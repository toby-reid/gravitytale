if (is_interaction())
{
    with instance_create_layer(160, get_ybox(), layer, obj_textbox)
    {
        if (instance_exists(obj_dipperClone))
        {
            set_text([
                "(You shouldn't make more clones #than needed.)",
                global.player.mabel ? "(Two of you is already plenty #of energy.)" : "(Who knows what would happen #if you had, say, 9 clones all #after the same girl?)",
                string_concat(
                    "(You can switch to controlling #",
                    other.dipper_classic_active ? "your clone" : string_concat(global.player.name, global.player.mabel ? "" : " Classic"),
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
