if (self.isActive)
{
    if (instance_exists(obj_textbox))
    {
        with obj_textbox
        {
            if (page == 1)
            {
                if (charCount >= 38)
                {
                    if (keyboard_check_pressed(vk_enter))
                    {
                        obj_min_cookingDate.has_butter = (action[1] == 0);
                        other.isActive = false;
                    }
                }
                else if (charCount >= 15)
                {
                    charCount = 38;
                }
            }
        }
    }
    else
    {
        self.isActive = false;
    }
}
