/// @description Override - Attack
if (image_alpha == 1 && !instance_exists(obj_textBubble) && global.stage[0] == 4)
{
    // TODO: Attack??
    ++timer;
    ++global.stage[0];
}

arms_yoffset += arms_going_up ? -offset_rate : offset_rate;
if (arms_yoffset > max_yoffset)
{
    arms_yoffset = max_yoffset;
    arms_going_up = !arms_going_up;
}
else if (arms_yoffset < min_yoffset)
{
    arms_yoffset = min_yoffset;
    arms_going_up = !arms_going_up;
}
torso_yoffset += torso_going_up ? -offset_rate : offset_rate;
if (torso_yoffset > max_yoffset)
{
    torso_yoffset = max_yoffset;
    torso_going_up = !torso_going_up;
}
else if (torso_yoffset < min_yoffset)
{
    torso_yoffset = min_yoffset;
    torso_going_up = !torso_going_up;
}
