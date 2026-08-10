/// @description Override - Attack
if (image_alpha == 1 && !instance_exists(obj_textBubble) && global.stage[0] == 4)
{
    // TODO: Wizard attack
}
if (!revealed && obj_battleCore.enemies_glittered)
{
    m_reveal();
    revealed = true;
    sprite_index = spr_wizardOutline;
}
