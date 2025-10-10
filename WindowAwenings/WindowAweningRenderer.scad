include <RightWindowAwening.scad>;
include <SideWindowDressing.scad>;
include <BOSL2/std.scad>;
include <../Constants.scad>;
include <PorchWindowDressing.scad>;

// difference() {
//     RightWindowAwening();
//     cube([100,100,100], anchor=BOTTOM+RIGHT);
// }

// difference() {
//     RightWindowAweningTrimm();
//     cube([100,100,100], anchor=RIGHT);
// }


//SideWindowDressing();


//PorchWindowDressing();

PorchWindowDressingTrimm();