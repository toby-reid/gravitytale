/// @description Start the Bar
if (obj_battleCore.enemies_glittered)
{
    travel_time += travel_time; // go slower if we've been glittered
}
speed = total_distance_to_travel / travel_time;
alarm[1] = travel_time + 1; // since it's about to decrement
