if (!other.canMove && alarm[1] > -1)
{
    if (other.image_alpha > 0.1)
    {
        other.image_alpha -= 0.01;
    }
    else if (other.image_alpha > 0 && !other.canMove)
    {
        other.canMove = true;
    }
}
