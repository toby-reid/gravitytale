text = [
    "@00ffff@ffffffThis is a more #complex order.",
    "@ff0000Red at the start@ffffff@0000ff&@00ff00Gree@00aa00n at the end",
    "123456789012345678901234567890",
    "(Go where?)   Dump#       Forest      Caves#              UFO"
];
fonts = fnt_bill_gui;
styles = scr_flag_enum([TEXT_STYLE.FONT_SWAP, TEXT_STYLE.SHAKE, TEXT_STYLE.WAVE]);
choiceCounts = [0, 0, 0, 4];
autoskips = [0, 0, 0, 11];
choiceActions = [
    [],
    [],
    [],
    [
        function() { show_debug_message("Selected Forest"); },
        function() { show_debug_message("Selected Caves"); },
        function() { show_debug_message("Selected Dump"); },
        function() { show_debug_message("Selected UFO"); },
    ]
]
