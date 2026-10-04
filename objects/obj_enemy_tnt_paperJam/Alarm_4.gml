bubble = instance_create_layer(
    x + ((irandom(2) == 0) ? irandom_range(-240, -140) : irandom_range(40, 240)),
    y + irandom_range(-120, 40),
    layer,
    obj_textBubble
);
bubble.set_text(choose("NYAH#NYAH#NYAH", "(incomp-#rehen-#sible)"));
bubble.set_charRates(4);
bubble.set_sounds(tlk_default);
bubble.set_styles(scr_add_enum_flag(TEXT_STYLE.SHAKE, TEXT_STYLE.WAVE));
