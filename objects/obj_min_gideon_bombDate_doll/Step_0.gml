if (is_active)
{
    if (instance_exists(obj_textbox))
    {
        with obj_textbox
        {
            switch (page)
            {
                case 1:
                    if (charCount >= 13)
                    {
                        charCount = string_length(text[page]);
                    }
                    break;
                case 2:
                    if (action[page - 1] == 1)
                    {
                        if (array_length(text) > page + 1)
                        {
                            array_delete(text, page + 1, array_length(text) - page);
                            text[page] = "(You're right.&(We should just let it all #blow up.)";
                        }
                    }
                    else if (charCount >= 25)
                    {
                        charCount = string_length(text[page]);
                    }
                    break;
                case 3:
                    if (action[page - 1] == 1)
                    {
                        array_delete(text, page + 1, array_length(text) - page);
                        text[page] = "(Yeah, that sounds like a dumb #tool to use.&(Let's just give up.)";
                    }
                    else with other.flame
                    {
                        instance_destroy();
                        --obj_min_gideon_bombDate.doll_count;
                    }
                    break;
                case 4:
                    if (action[page - 2] == 1)
                    {
                        skippable = false;
                    }
                    break;
            }
        }
    }
    else
    {
        is_active = false;
    }
}