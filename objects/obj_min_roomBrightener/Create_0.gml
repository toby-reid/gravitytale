self.tile_layers = scr_getTileLayers();

self.make_bright = function() {event_user(0)};
self.make_dark = function() {event_user(1)};

if (variable_global_exists("gideon") and global.gideon >= 3 and !global.killed[ENEMY.GIDEON])
{
    self.make_bright();
}
