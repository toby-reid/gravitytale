/// @desc Set active/inactive

self.is_active = !self.is_active;
self.image_blend = self.is_active ? c_white : c_dkgrey;
self.alarm[3] = 15;
