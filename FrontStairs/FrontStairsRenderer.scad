include <FrontStairs.scad>;
include <BOSL2/std.scad>;
include <../Constants.scad>;

module FrontStairsRenderer() {
    FrontStairs();

}

// yrot(-90) {
//     FrontStairsLeft();
// }

// yrot(-90) {
//     FrontStairsRed();
// }

yrot(90) {
    FrontStairsRight();
}
