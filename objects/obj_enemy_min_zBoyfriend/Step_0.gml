/// @description Attack
if (image_alpha == 1 && !instance_exists(obj_textBubble) && global.stage[0] == 4)
{
    // TODO: Do something...
    ++timer;
    if (timer == 60)
    {
        ++global.stage[0];
    }
}
