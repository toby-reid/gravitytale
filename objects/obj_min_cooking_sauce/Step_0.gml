if (self.isActive)
{
    if (instance_exists(obj_textbox_old))
    {
        with obj_textbox
        {
            if (page == 1)
            {
                if (charCount >= 40)
                {
                    if (keyboard_check_pressed(vk_enter))
                    {
                        obj_min_cookingDate.is_butter_dipped = (action[1] == 0);
                        obj_min_cookingDate.was_fried_first = obj_min_cookingDate.is_butter_fried;
                        other.isActive = false;
                    }
                }
                else if (charCount >= 17)
                {
                    charCount = 40;
                }
            }
        }
    }
    else
    {
        self.isActive = false;
    }
}
