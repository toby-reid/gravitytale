x = obj_soul.x;
y = obj_soul.y;
switch (stage)
{
    case 0:
        if (biggerize)
        {
            if (image_xscale < 1)
            {
                image_xscale += grow_rate;
                if (image_xscale >= 1)
                {
                    image_xscale = 1;
                }
                image_yscale = image_xscale;
            }
        }
        else
        {
            if (image_xscale > 2)
            {
                image_xscale -= grow_rate;
                image_alpha += grow_rate;
                if (image_xscale <= 2)
                {
                    image_xscale = 2;
                    image_alpha = 1;
                }
                image_yscale = image_xscale;
            }
        }
        break;
    case 1:
        if (biggerize)
        {
            if (image_xscale < 2)
            {
                image_xscale += grow_rate;
                if (image_xscale >= 2)
                {
                    image_xscale = 2;
                }
                image_yscale = image_xscale;
                obj_soul.image_xscale = image_xscale;
                obj_soul.image_yscale = image_xscale;
            }
        }
        else
        {
            if (image_xscale > 1)
            {
                image_xscale -= grow_rate;
                if (image_xscale <= 1)
                {
                    image_xscale = 1;
                }
                image_yscale = image_xscale;
                obj_soul.image_xscale = image_xscale;
                obj_soul.image_yscale = image_xscale;
            }
        }
        break;
    case 2:
        if (biggerize)
        {
            if (image_xscale < 3)
            {
                image_xscale += grow_rate;
                image_alpha -= grow_rate;
                if (image_xscale >= 3)
                {
                    instance_destroy();
                    exit;
                }
                image_yscale = image_xscale;
            }
        }
        else
        {
            if (image_xscale > 0)
            {
                image_xscale -= grow_rate;
                if (image_xscale <= 0)
                {
                    ++global.stage[0];
                    instance_destroy();
                    exit;
                }
                image_yscale = image_xscale;
            }
        }
        break;
}