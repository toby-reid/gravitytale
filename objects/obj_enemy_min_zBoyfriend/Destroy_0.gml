// Do not increment global player kills or spares; ZBoyfriend is not a real entity
if (hp <= 0)
{
    scr_killedEnemy(ENEMY.ZOMBIE_BOYFRIEND);
}
else
{
    scr_sparedEnemy(ENEMY.ZOMBIE_BOYFRIEND);
}
