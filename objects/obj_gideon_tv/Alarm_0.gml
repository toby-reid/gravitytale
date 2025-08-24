/// @description Retract arm

if (self.arm_index < sprite_get_number(self.arm) - 1)
{
	self.arm_index++;
	self.alarm[0] = self.alArm_speed;
}
