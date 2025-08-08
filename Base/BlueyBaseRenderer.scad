include <../Constants.scad>;
include <BlueyBase.scad>;
include <BOSL2/std.scad>;

module BlueyBaseRendered() {
    color(COLOR_WALL)
    import("BlueyBase.stl");
}

module BlueyBase() {
    color(COLOR_WALL)
    base();
}

base();