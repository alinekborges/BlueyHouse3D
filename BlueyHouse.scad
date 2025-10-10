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
include <Fence/BlueyFence.scad>;
include <HouseTrimm/HouseTrimm.scad>;
include <Windows/FrontRightWindows.scad>;
include <Door/Door.scad>;

BlueyBaseRendered();

BlueyHouseRendered();

up(base_height-3)
BlueyRoofRendered();

FrontPorchFenceRendered();

FrontStairsLeft();
FrontStairsRight();
FrontStairsRed();

PositionedSideWindows();
PositionedSideWindowGlass();

PositionedFrontLeftWindow();
PositionedFrontLeftWindowGlass();

BlueyFence();
BlueyPillars();

HouseTrimm();
RoofTrimm();

PositionedRightWindows();
PositionedRightWindowsGlass();

Positioned_Door();
Positioned_Door_Glass();


PorchWindowDressing();

PorchWindowDressingTrimm();

SideWindowDressing();

PositionedRightWindowAwening();

PositionedRightWindowAweningTrimm();