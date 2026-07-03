/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
    if (timer % attack_on == 0) {
        if flipped == 0 {
            var dir = irandom(359)
            instance_create_layer(320+lengthdir_x(120,dir),320+lengthdir_y(120,dir),layer,obj_atk_gnome)
        }
        if timer == 540 or (timer == 120 && m_all_enemies_flipped()) global.stage[0]++
    }
    timer++
}