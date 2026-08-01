/// @desc text bubble
with instance_create_layer(x + 60, y - 100, layer, obj_textBubble_old)
{
    if (other.spare && global.stage[1] == 3 && global.stage[4] == 0)
    {
        text = ["Just don't freak out, okay?", "Keep an open mind, be cool..."];
        other.revealed = true;
    }
    else
    {
        text[0] = choose(
            global.player.mabel ? "So wanna #go hold #hands... #or what-#ever?" : "So are #you #like... #okay?",
            "It's... #jam.",
            "'Sup.",
            global.player.mabel ? "You #look... #shiny." : "What's #your... #color?"
        );
        style[0] = TEXT_STYLE.WAVE;
    }
}
