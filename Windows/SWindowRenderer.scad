include <../Constants.scad>;
include <../Windows/SideWindows.scad>;
include <../Windows/FrontLeftWindow.scad>;

module SideWindowRenderer() {
    SideWindow();
}

//SideWindowRenderer();

FrontLeftWindow();
FrontLeftWindowGlass();