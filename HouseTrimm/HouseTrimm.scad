include <BOSL2/std.scad>;

include <../Constants.scad>;

module HouseTrimm() {
    color(COLOR_TRIM)
    //fwd(2)
    up(base_distance_floor+base_height)
    right(porch_width+1)
    house_trimm_base();
}

module house_trimm_base() {
    cube([2, 2, 46], anchor=BOTTOM+FWD+LEFT);
}