var _boss_effect = (hp <= 0) ? scr_killedEnemy : scr_sparedEnemy;
_boss_effect(enemy_index);
// do not inherit: do not increment save or killed stat
