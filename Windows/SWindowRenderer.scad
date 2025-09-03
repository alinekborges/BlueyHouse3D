include <../Constants.scad>;
include <../Windows/SideWindows.scad>;
include <../Windows/FrontLeftWindow.scad>;
include <../Windows/FrontRightWindows.scad>;

module SideWindowRenderer() {
    SideWindow();
}

color(COLOR_TRIM)
// SideWindow();
// SideWindowGlass();

// FrontLeftWindow();
// FrontLeftWindowGlass();

FrontRightWindow();
FrontRightWindowGlass();