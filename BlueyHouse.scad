include <BOSL2/std.scad>;

include <Base/BlueyBase.scad>;
include <House/BlueyMainHouse.scad>;
include <Roof/BlueyRoof.scad>;
include <FrontPorchFence/FrontPorchFence.scad>;
include <WindowAwenings/RightWindowAwening.scad>;
include <FrontStairs/FrontStairs.scad>;
include <WindowAwenings/SideWindowDressing.scad>;
include <WindowAwenings/PorchWindowDressing.scad>;
include <Windows/SideWindows.scad>;
include <Windows/FrontLeftWindow.scad>;

module BlueyHouse() {
    BlueyBaseRendered();

    BlueyHouseRendered();

    up(base_height-2)
    BlueyRoofRendered();
    
    FrontPorchFenceRendered();

    WindowDressing();

    FrontStairs();

    PositionedSideWindows();
    PositionedSideWindowGlass();

    PositionedFrontLeftWindow();
    PositionedFrontLeftWindowGlass();
}

module WindowDressing() {

    PorchWindowDressing();

    SideWindowDressing();

    right(81.5)
    up(34)
    zrot(-90)
    up(base_height+base_distance_floor)
    RightWindowAwening();

}

BlueyHouse();