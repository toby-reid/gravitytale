event_inherited();
if (instance_exists(stacked_gnome))
{
    stacked_gnome.y += (image_index % 2 == 0) ? -5 : 5;
}
