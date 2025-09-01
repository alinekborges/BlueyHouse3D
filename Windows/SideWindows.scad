include <../Constants.scad>;
include <BOSL2/std.scad>;

side_window_width = 8.06*2;
side_window_height = 18.33;
tolerance = 0.2;

window_path = rect([side_window_width+tolerance, side_window_height+tolerance], rounding=0.26);

module SideWindow() {
    right_window();
    side_window_glass();
}

side_window_up_position=base_distance_floor+base_height+19.5;

module PositionedSideWindows() {
    right(0.4)
    back(54.6)
    ycopies(29.9, 2)
    up(side_window_up_position)
    rotate([90,0,90])
    right_window();

    // right windows
    right(base_width-0.6)
    back(43.5)
    ycopies(28.2, 3)
    up(side_window_up_position)
    rotate([90,0,-90])
    right_window();
}

module PositionedSideWindowGlass() {
    right(0.4)
    back(54.6)
    ycopies(29.9, 2)
    up(side_window_up_position)
    rotate([90,0,90])
    side_window_glass();


    // right windows
    right(base_width-0.6)
    back(43.5)
    ycopies(28.2, 3)
    up(side_window_up_position)
    rotate([90,0,-90])
    side_window_glass();
}

module side_window_glass() {

    
    color(COLOR_GLASS)
    up(0.8)
    linear_extrude(0.6)
    window_base();
}

module side_window() {
    right_window();
}

module right_window() {

    color(COLOR_TRIM)
    linear_extrude(0.6)
    stroke(window_path, width=0.6, closed=true);

    color(COLOR_TRIM)
    linear_extrude(0.8)
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