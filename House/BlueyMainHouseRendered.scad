include <../Constants.scad>;
include <BlueyMainHouse.scad>;
include <BOSL2/std.scad>;
include <../Windows/SideWindows.scad>;

$fn=60;

module BlueyMainHouseRendered() {
    color(COLOR_WALL)
    import("MainHouseWithHoles.stl");
}

module BlueyMainHouse() {
    color(COLOR_WALL)
    main_house();
}

//BlueyMainHouse();

// 1. Render main shape
//main_house_rendered(); // => MainHouseShape.stl

// 2. Render with holes
color(COLOR_WALL)
//main_house_with_holes(); // MainHouseWithHoles.stl


// 3. Render with trapezoid
//main_house_with_holes_and_trapezoid(); // MainHouseWithHolesAndTrapezoid.stl

// 4. Render main house
main_house();
main_house_holes();


//BlueyMainHouse();