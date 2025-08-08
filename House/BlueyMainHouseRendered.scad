include <../Constants.scad>;
include <BlueyMainHouse.scad>;
include <BOSL2/std.scad>;

module BlueyMainHouseRendered() {
    color(COLOR_WALL)
    import("BlueyHouse.stl");
}

module BlueyMainHouse() {
    color(COLOR_WALL)
    main_house();
}

BlueyMainHouse();