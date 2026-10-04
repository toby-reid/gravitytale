if global.stage[0] == 4 if !instance_exists(obj_textBubble_old) if hp>0 if tries<5 global.stage[0]++
else {
    if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
    image_alpha -= .05
    if image_alpha == 0 instance_destroy()
}
if instance_exists(obj_nyarfGun) obj_nyarfGun.x = 320