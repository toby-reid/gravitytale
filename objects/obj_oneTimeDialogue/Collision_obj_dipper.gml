if (other.canMove)
{
    var _ybox = (y > camera_get_view_y(view_camera[0]) + 140) ? 48 : 192;
    with instance_create_layer(160, _ybox, layer, obj_textbox)
    {
        set_text(other.text);
        set_heads(other.heads);
        set_sounds(other.sounds);
        set_styles(other.styles);
    }
    array_push(global.trashCan, id);
    instance_destroy();
}
