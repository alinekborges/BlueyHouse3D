include <BOSL2/std.scad>;

include <Base/BlueyBase.scad>;
include <House/BlueyMainHouse.scad>;
include <Roof/BlueyRoof.scad>;
include <FrontPorchFence/FrontPorchFence.scad>;
include <WindowAwenings/RightWindowAwening.scad>;

module BlueyHouse() {
    BlueyBaseRendered();
    BlueyHouseRendered();
    BlueyRoofRendered();
    FrontPorchFenceRendered();

    WindowDressing();
}

module WindowDressing() {

    right(81.5)
    up(34)
    zrot(-90)
    up(base_height+base_distance_floor)
    RightWindowAwening();

}

BlueyHouse();