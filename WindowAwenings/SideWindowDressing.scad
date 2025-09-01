include <BOSL2/std.scad>;
include <../Constants.scad>;

side_window_dressing_width = 21.8;
side_window_dressing_height = 24.4;
side_window_dressing_depth = 6.5;

module SideWindowDressing() {

    // Left Side
    ycopies(30, 2, sp=[0,40,0])
    up(base_height+base_distance_floor+27)
    xflip()
    SideWindowDressingRendered();

    // Right Side
    right(base_width-2)
    ycopies(28, 3, sp=[0,16,0])
    up(base_height+base_distance_floor+27)
    SideWindowDressingRendered();
}

module SideWindowDressingRendered() {
    color(COLOR_ROOF)
    import("SideWindowDressing.stl");
}

module side_window_dressing() {
    difference() {

        window_dressing_side_base();

        right(83.85)
        up(50.7)
        back(3.9)
        cube([19.5,26,39]);
    }   
}

module window_dressing_side_base() {

    right_half() 
    difference() {

    diff()
        color(COLOR_ROOF)
        cube([side_window_dressing_width,side_window_dressing_height,side_window_dressing_depth], anchor=BOTTOM+CENTER) {
            edge_mask(TOP)
            rounding_edge_mask(r=porch_size-12);
        }

        diff()
        color(COLOR_ROOF)
        down(2.6)
        cube([20.8,23.4,6.5], anchor=BOTTOM+CENTER) {
            edge_mask(TOP)
            rounding_edge_mask(r=porch_size-12);
        }
    }

    //up(-1)
    fwd(side_window_dressing_height/2-1.3+0.1)
    xcopies(3.8, 2, sp=[3,0,0])
    xrot(-90)
    back_half() {
        linear_extrude(1.3)
        circle(r=3);   
    }

    back(side_window_dressing_height/2-1.3*2+0.1)
    xcopies(3.8, 2, sp=[3,0,0])
    xrot(-90)
    back_half() {
        linear_extrude(1.3)
        circle(r=3);   
    }

    right(side_window_dressing_width/2-1.3*2+0.2)
    zrot(-90)
    xcopies(3.93, 5)
    xrot(-90)
    back_half() {
        linear_extrude(1.3)
        circle(r=3);   
    }

}