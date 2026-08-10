if (revealed)
{
    bubble = instance_create_layer(x + 80, y - 60, layer, obj_textBubble);
    bubble.set_text("(Peeping and mutter-\ning)");
    bubble.set_styles(TEXT_STYLE.WAVE);
}
