include <BOSL2/std.scad>;

include <Base/BlueyBase.scad>;
include <House/BlueyMainHouse.scad>;
include <Roof/BlueyRoof.scad>;
include <FrontPorchFence/FrontPorchFence.scad>;

module BlueyHouse() {
    BlueyBaseRendered();
    BlueyHouseRendered();
    BlueyRoofRendered();
    FrontPorchFenceRendered();
}

BlueyHouse();