if (door_speed != 0)
{
    if (is_flipped)
    {
        self.image_yscale += door_speed;
        if (self.image_yscale >= 0) // only possible if opening the door
        {
            m_finish_open();
        }
    }
    else
    {
        self.image_yscale -= door_speed;
        if (self.image_yscale <= 0) // only possible if opening the door
        {
            m_finish_open();
        }
    }
}
