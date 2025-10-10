include <../Constants.scad>;
include <BOSL2/std.scad>;

right_window_width = 8.8;
right_window_height = 18.33;
tolerance = 0.2;

right_window_path = rect([right_window_width, right_window_height], rounding=0.26); // outer rectangle

module FrontRightWindow() {
    right_window();
}

module FrontRightWindowGlass() {
    porch_right_window_glass();
}

right_window_up_position=base_distance_floor+base_height+20.5;

module PositionedRightWindows() {
    // right(0.4)
    // back(54.6)
    // ycopies(29.9, 2)
    fwd(10.6)
    right(72.5+8.5)
    up(right_window_up_position)
    rotate([90,0,0])
    xcopies(11,2)
    right_window();

    fwd(4.6)
    right(94.8)
    up(right_window_up_position)
    rotate([90,0,75.4])
    right_window();

    fwd(4.6)
    right(68.2)
    up(right_window_up_position)
    rotate([90,0,-75.4])
    right_window();
}

module PositionedRightWindowsGlass() {
    // right(0.4)
    // back(54.6)
    // ycopies(29.9, 2)
    fwd(10.6)
    right(72.5+8.5)
    up(right_window_up_position)
    rotate([90,0,0])
    xcopies(11,2)
    porch_right_window_glass();

    fwd(4.6)
    right(94.8)
    up(right_window_up_position)
    rotate([90,0,75.4])
    porch_right_window_glass();

    fwd(4.6)
    right(68.2)
    up(right_window_up_position)
    rotate([90,0,-75.4])
    porch_right_window_glass();

}

module porch_right_window_glass() {
    color(COLOR_GLASS)
    down(window_glass_thickness)
    linear_extrude(window_glass_thickness)
    right_window_base();
}

module side_window() {
    right_window();
}

module right_window() {

    border_size = 0.5;
    offset_border = offset(right_window_path, delta=border_size/2);

    color(COLOR_TRIM)
    up(1-0.4)
    linear_extrude(0.4)
    difference() {
        polygon(offset_border);
        rect([right_window_width-1, right_window_height-1], rounding=0.2);
    }

    color(COLOR_TRIM)
    linear_extrude(1)
    difference() {
        
        right_window_base();

        scale([1.55,1.4,1])
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

module right_window_base() {
    inset_tolerance = offset(right_window_path, delta=-tolerance);
    polygon(inset_tolerance);
}