if (m_growRate != 0)
{
    image_xscale += m_growRate;
    image_yscale += m_growRate;
    if (m_growRate > 0 && image_xscale >= 2)
    {
        m_growRate = 0;
        image_xscale = 2;
        image_yscale = 2;
        m_process_page(page);
    }
    else if (m_growRate < 0 && image_xscale <= 0)
    {
        instance_destroy();
    }
}
else
{
    // TODO: Draw the stuff!
}
draw_self();
