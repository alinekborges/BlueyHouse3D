include <../Constants.scad>;
include <BlueyBase.scad>;
include <BOSL2/std.scad>;

module BlueyBaseRendered() {
    color(COLOR_ROOF)
    import("BlueyBase.stl");
}

module BlueyBase() {
    color(COLOR_ROOF)
    base();
}

base();