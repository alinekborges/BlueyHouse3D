include <BOSL2/std.scad>;
include <../Constants.scad>;

module WindowAweningsRendered() {
    color(COLOR_ROOF)
    RightWindowAwening();
    //import("WindowAwenings.stl");
}

module PositionedRightWindowAwening() {
    right(81.5)
    up(34)
    zrot(-90)
    up(base_height+base_distance_floor)
    zscale(1.1)
    RightWindowAwening();
}

module PositionedRightWindowAweningTrimm() {
    right(81.5)
    up(34)
    //fwd(40)
    zrot(-90)
    up(base_height+base_distance_floor)
    RightWindowAweningTrimm();
}

module RightWindowAwening() {
    color(COLOR_ROOF)
    scale([1.5,1.4,1])
    window_awning();
}

module RightWindowAweningTrimm() {
    path=[
        [-0.5,-12],
        [8.4,-9.4],
        [8.4,9.4],
        [-.5,12]
    ];

    color(COLOR_TRIM)   
    scale([1.5,1.4,1.2])
    path_extrude2d(path)
    circle(r=0.8);
}

module window_awning() {
    scale(1.15)
    color(COLOR_ROOF)
    right_half() {
        union() {
        window_awning_piece();

        rotated_awaning_piece();  
    
        mirror([0,1,0])
        rotated_awaning_piece();  

        up(15.5)
        zscale(0.7)
        cuboid([1,2,1.8], rounding=0.5);

        up(17)
        //zscale(0.7)
        cuboid([2.2,3.4,2.5], rounding=1);

        up(18)
        cuboid([1,1,2.8], rounding=0.5);

        up(18)
        fwd(0.6)
        xrot(35)
        cuboid([1,1,2.8], rounding=0.5);

         up(18)
        fwd(-0.6)
        xrot(-35)
        cuboid([1,1,2.8], rounding=0.5);
        }
    }
}

module window_awning_piece() {
    // Position above the window group
    
    // Define bezier curve control points for the awning shape
    // [x, y] coordinates - adjust these to change the curve shape
    control_points = [
        [0, 5.5],      // Start point
        [10, 5],      // First control point
        [5, 0],     // Second control point  
        [18, -2]      // End point
    ];
    
    // Create the bezier curve path
    bezier_path = bezpath_curve(control_points, splinesteps=32);
    
    // Debug: Show control points as small spheres
    // color("red") {
    //     for (i = [0:len(control_points)-1]) {
    //         translate(control_points[i]) 
    //             sphere(r=0.5);
    //     }
    // }
    
    // Debug: Show bezier curve path as a thin line
    // color("blue") {
    //     for (i = [0:len(bezier_path)-2]) {
    //         hull() {
    //             translate(bezier_path[i]) sphere(r=0.1);
    //             translate(bezier_path[i+1]) sphere(r=0.1);
    //         }
    //     }
    // }
    
    // Main awning shape using the bezier curve
    intersection() {
    color(COLOR_ROOF) {
        back(-10)
        right(1.5)
        rotate([0,-90,-90])
        linear_extrude(20) {
            // Create a closed path by adding bottom line
            path = concat(
                bezier_path,
                [[20, -2], [0, -2]]  // Bottom line to close the shape
            );

            polygon(path);
        }
    }

        right(-0.8)
        linear_extrude(18)
        zrot(90)
        trapezoid(h=8.4, w1=16.8, w2=0, anchor=TOP);
    }

}

module rotated_awaning_piece() {

    // difference() {
    //     zrot(71.5)
    //     right(0)
    //     back(1)
    //     right_half() top_half() {
    //         scale([1.25,1,1])
    //         teardrop(r=8, h=11.8, ang=30);
    //     }

    //     scale([1,1,10])
    //     window_awning_piece();
    // }

    difference() {
        zrot(72.5)
        back(0.1)
        right(0.1)
        scale([1.35,1,1])
        window_awning_piece();


        scale([1,1,10])
        window_awning_piece();

        down(1)
        right(6.95)
        cube([10,10,10]);
    }



}