if (is_interaction())
{
    with instance_create_layer(160, get_ybox(), layer, obj_textbox)
    {
        if (instance_exists(obj_dipperClone))
        {
            set_text([
                "(You shouldn't make more clones #than needed.)",
                global.player.mabel ? "(Two of you is already plenty #of energy.)" : "(Who knows what would happen #if you had, say, 9 clones all #after the same girl?)"
            ]);
        }
        else
        {
            set_text([
                string_concat("(It's ", global.player.mabel ? "Grunkle" : "Great Uncle", " Ford's #copying machine.)"),
                "(Make a copy?)"
            ]);
            set_choices(1, ["Me", "Nothing"], [method({target: other.id}, function() { target.make_clone(); }), noop], method({target: id}, function() { target.next_page(); }));
        }
    }
}
