include <BOSL2/std.scad>;

include <Base/BlueyBase.scad>;
include <House/BlueyMainHouse.scad>;
include <Roof/BlueyRoof.scad>;

module BlueyHouse() {
    BlueyBaseRendered();
    BlueyHouseRendered();
    BlueyRoofRendered();
}

BlueyHouse();