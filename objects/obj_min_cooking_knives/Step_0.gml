if (self.isActive)
{
    if (instance_exists(obj_textbox_old))
    {
        with obj_textbox
        {
            if (page == 1)
            {
                if (charCount >= string_length(text[page]))
                {
                    if (keyboard_check_pressed(vk_enter))
                    {
                        if (action[1] == 0)
                        {
                            if (obj_min_cookingDate.is_butter_fried && obj_min_cookingDate.is_butter_dipped && obj_min_cookingDate.was_fried_first)
                            {
                                ++obj_min_cookingDate.correct_count;
                            }
                            else
                            {
                                ++obj_min_cookingDate.failed_count;
                            }
                            obj_min_cookingDate.has_butter = false;
                            setMove = false;
                            other.ready_for_completion = true;
                        }
                        other.isActive = false;
                    }
                }
                else if (charCount >= 18)
                {
                    charCount = string_length(text[page]);
                }
            }
        }
    }
    else
    {
        self.isActive = false;
    }
}
else if (ready_for_completion && !instance_exists(obj_textbox_old))
{
    alarm[0] = 30;
    ready_for_completion = false;
}
