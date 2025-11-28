/// @description Suck blood

global.player.hp -= self.at;
audio_play_sound(sfx_slurp, 0, false);
if (self.host != noone)
{
    self.host.maxhp += self.at;
    self.host.hp += self.at;
}
instance_destroy();
