if (variable_global_exists("gideon") and global.gideon > 8)
{
    instance_destroy();
}
sprite_index = spr_gideonDate_cooking_backdrop;
text = [
    "(It's rather impressive Gideon #managed to bring an entire #working kitchen down here.)",
    "(No, wait...&(It's fake.)",
    "(So it's impressive Gideon #managed to keep the cardboard #from combusting down here.)"
];
