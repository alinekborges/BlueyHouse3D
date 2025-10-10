include <../Constants.scad>;
include <BOSL2/std.scad>;

side_window_width = 8.06*2;
side_window_height = 18.33;
tolerance = 0.2;

window_path = rect([side_window_width+tolerance, side_window_height+tolerance], rounding=0.26);

module SideWindow() {
    side_right_window();
}

module SideWindowGlass() {
    right_side_window_glass();
}

module PositionedSideWindows() {
    // Left Side Windows
    right(1.4)
    back(54.6)
    ycopies(29.9, 2)
    up(side_window_up_position)
    rotate([90,0,-90])
    side_right_window();

    // right windows
    right(base_width-1.6)
    back(43.5)
    ycopies(28.2, 3)
    up(side_window_up_position)
    rotate([90,0,90])
    side_right_window();
}

module PositionedSideWindowGlass() {
    right(3.2)
    back(54.6)
    ycopies(29.9, 2)
    up(side_window_up_position)
    rotate([90,0,90])
    right_side_window_glass();


    // right windows
    left(3.2)
    right(base_width-0.6)
    back(43.5)
    ycopies(28.2, 3)
    up(side_window_up_position)
    rotate([90,0,-90])
    right_side_window_glass();
}

module right_side_window_glass() {

    down(window_glass_thickness)
    color(COLOR_GLASS)
    linear_extrude(window_glass_thickness)
    window_base();
}

module side_right_window() {

    border_size = 1;
    offset_border = offset(window_path, delta=0.6);

    color(COLOR_TRIM)
    up(1-0.4)
    linear_extrude(0.4)
    difference() {
        polygon(offset_border);
        rect([14.7, 16.4], rounding=0.2);
    }

    color(COLOR_TRIM)
    linear_extrude(1)
    difference() {
        
        window_base();

        xcopies(7.6,2)
        scale([1.5,1.3,1])
        right_window_glass();
    }
}

module right_window_glass() {

    fwd(4.6)
    right(1.2)
    rect([2, 2.9], rounding=0.2);
    
    fwd(4.6)
    right(-1.2)
    rect([2, 2.9], rounding=0.2);
    
    fwd(-4.6)
    right(1.2)
    rect([2, 2.9], rounding=0.2);
    
    fwd(-4.6)
    right(-1.2)
    rect([2, 2.9], rounding=0.2);
    
    rect([4.4, 5.2], rounding=0.2);

}

module window_base() {
    inset_tolerance = offset(window_path, delta=-tolerance);
    polygon(inset_tolerance);
}