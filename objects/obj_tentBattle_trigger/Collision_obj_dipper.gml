if (other.canMove)
{
    audio_group_stop_all(Music);
    other.canMove = false;
    alarm[0] = 30;
}
