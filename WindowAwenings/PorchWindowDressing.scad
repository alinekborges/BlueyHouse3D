include <BOSL2/std.scad>;

include <../Constants.scad>;

module PorchWindowDressing() {
    //left(20)
    //up(base_height+base_distance_floor+33)
    //window_rounded_dressing_full();
    color(COLOR_ROOF)
    import("PorchWindowDressing.stl");
}

module window_rounded_dressing_full() {

    //difference() {
        yscale(1.1)
        fwd(1.2)
        window_rounded_dressing();
        //fwd(2)
        //cube([10, porch_size+20, 20]);
    //}
    
    // right(5.2)
    // fwd(1.3)
    // scale([0.5,0.8,1])
    // intersection() {
    //     window_rounded_dressing();
    //     fwd(2)
    //     cube([10, porch_size+20, 20]);
    // }

}

module window_dressing_white_trim() {
        path=[
        [7,porch_size+10],
        [7,-1.2],
        [porch_width+11,-1.2]
    ];

    color(COLOR_TRIM)   
    path_extrude2d(path)
    circle(r=1.2);
}

module window_rounded_dressing() {

    shell_thickness = 1.5;
    color(COLOR_ROOF)
    difference() {
        // Outer shell
        window_rounded_dressing_base();
        // Inner cutout (offset inwards by shell_thickness)
        down(shell_thickness)
        right(1.5)
        scale([0.95, 0.95, 1])
        window_rounded_dressing_base();
    }
}

porch_side_width = 11;

module side_window_rounded_dressing_base() {
    intersection() {
        right(10)
        diff()
        scale([0.7,1.3,1.05])
        cube([83,83,porch_size-12]) {
            edge_mask(TOP)
            rounding_edge_mask(r=porch_size-12);
        }


        
         cube([21,27,20], anchor=BOTTOM+LEFT+FWD);
    }
}

module front_window_rounded_dressing_base() {
        intersection() {
        diff()
        scale([1.3,1.3,1.05])
        cube([83,83,porch_size-12]) {
            edge_mask(TOP)
            rounding_edge_mask(r=porch_size-12);
        }


        right(21)
        cube([porch_width,porch_size,15], anchor=BOTTOM+LEFT+FWD);
    }
}

module window_rounded_dressing_base() {
    front_window_rounded_dressing_base();

    side_window_rounded_dressing_base();
}