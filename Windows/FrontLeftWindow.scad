include <../Constants.scad>;
include <BOSL2/std.scad>;

module PositionedFrontLeftWindow() {
    up(base_distance_floor+base_height*2+win_height/2)
    right(13)
    back(24.6)
    xrot(90)
    zrot(180)
    FrontLeftWindow();
}

module PositionedFrontLeftWindowGlass() {
    up(base_distance_floor+base_height*2+win_height/2)
    right(13)
    back(24.6)
    xrot(90)
    zrot(180)
    FrontLeftWindowGlass();
}

module FrontLeftWindow() {
    //front_left_window();
    color(COLOR_TRIM)
    import("FrontLeftWindow.stl");
}

front_left_window_path = rect([win_width+tolerance, win_height+tolerance], 0.39);
front_left_window_path_with_tolerance = offset(front_left_window_path, delta=-tolerance);

module FrontLeftWindowGlass() {
    color(COLOR_GLASS)  
    down(glass_thickness)
    linear_extrude(glass_thickness)
    polygon(front_left_window_path_with_tolerance, closed=true);
}

module positioned_front_left_window() {
    up(base_distance_floor+base_height)
    right(10)
    fwd(-18)
    up(14)
    mirror([0,1,0])
    xrot(-90)
    front_left_window();
}

module front_left_window() {
    // Simple rectangular window


    difference() {
        color(COLOR_TRIM)
        left_window_base();
        
        color(COLOR_TRIM)
        linear_extrude(1)
        scale(1.3)
        left_window_glass();
    }
    
    color(COLOR_TRIM)
    up(0.6)
    linear_extrude(0.4)
    stroke(front_left_window_path_with_tolerance, width=0.6, closed=true);

    
}

module front_left_window_glass() {
    color(COLOR_GLASS)
    down(glass_thickness)
    linear_extrude(glass_thickness)
    left_window_glass();
}

module left_window_base() {
    // Door dimensions

    door_depth = 1; // Slightly protruding for printability

    linear_extrude(1)
    polygon(front_left_window_path_with_tolerance);
    
    up(1)
    back(9.2)
    xcopies(6.4,2)
    zrot(90)
    prismoid(size1=[4.5*1.3,4*1.3], size2=[3.6*1.3,3.2*1.3], h=0.6);
    
}

module left_window_glass() {
    fwd(0.8)
    right(2.5)
    rect([4.2, 10.2], rounding=0.3);
    
    fwd(0.8)
    right(-2.5)
    rect([4.2, 10.2], rounding=0.3);
    
    fwd(8)
    right(0)
    rect([9.5, 3.2], rounding=0.3);
}
