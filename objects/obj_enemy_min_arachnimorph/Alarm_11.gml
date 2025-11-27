/// @description Look around

self.image_index = (self.image_index + 1) mod self.image_number;
self.alarm[11] = irandom_range(20, 120);
