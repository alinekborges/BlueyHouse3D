include <BOSL2/std.scad>;
include <../Constants.scad>;

// module chamine_base() {
//     color(COLOR_WALL)
//     up(base_distance_floor+base_height+window_dressing_height+22.5)
//     back(house_cut_lenght-10)
//     right(12)
//     cube([5,5,10.0], anchor=BOTTOM);
// }

module roof_ready_to_render() {
    difference() {
        positioned_main_roof();

        up(base_distance_floor+base_height+window_dressing_height+6.5)
        back(roof_base/2+0.5)
        right(roof_base/2-7)
        down(0.5)
        prismoid(size1=[roof_base,base_lenght], size2=[1,base_lenght-42], xang=50, h=38.8, anchor=BOTTOM);
    }

    //chamine_base();
}

module positioned_filled_roof() {
    up(base_distance_floor+base_height+window_dressing_height+4.5)
    back(roof_base/2)
    right(roof_base/2-7)
    prismoid(size1=[roof_base,base_lenght], size2=[1,base_lenght-42], xang=50, h=38.8, anchor=BOTTOM);

    right(37)
    back(42)
    down(3)
    up(base_distance_floor+base_height+window_dressing_height+9)
    filled_roof_triangle([0, base_lenght]);

    cube([100,100, 51], anchor=BOTTOM+LEFT+FWD);
}

module positioned_main_roof() {
    difference() {
        up(base_distance_floor+base_height+window_dressing_height+7)
        // right(18)
        back(roof_base/2)
        right(roof_base/2-7)
        combined_roof();

        back(house_cut_lenght)
        left(10)
        cube([120,100, 100], anchor=BOTTOM+LEFT+FWD);
    }
}

module combined_roof() {
    difference() { 
        full_roof() tag("main_roof");

        down(3)
        scale([1,1.2,1.1])
        filled_roof_triangle([1, base_lenght]);

        right(80)
        cube([100,100, 100], center=true);
    }

    positioned_triangle_roof();
}

module full_roof() {
    color(COLOR_ROOF)
    intersection() {
        scale(1.015)
        prismoid_shell(size1=[roof_base,base_lenght], size2=[1,base_lenght-42], xang=50, h=38.8, shell_thickness=2, anchor=BOTTOM);

        fwd(roof_base/2)
        right(roof_base/2)
        roof_detail();
    }

    roof();
}

module positioned_triangle_roof() {
    color(COLOR_ROOF)
    right(25.5)
    fwd(4)
    roof_triangle_full();
}

module roof_detail() {
    board_size=6;
    board_gap=0.3;
    board_count=15;

    for (i=[0:board_count]) {
        left(i*board_size+board_gap*i)
        cube([board_size,100,100]);
    }
}

module roof() {
    color(COLOR_ROOF)
    intersection() {
        roof_base();
        cube([100,100,100], anchor=BOTTOM);
    }
}

module roof_base() {
    prismoid_shell(size1=[roof_base,base_lenght], size2=[1,base_lenght-42], xang=50, h=38.8, shell_thickness=2, anchor=BOTTOM);
    
    difference() {
        scale(1.06)
        down(1.2)
        prismoid(size1=[roof_base,base_lenght], size2=[1,base_lenght-42], xang=50, h=38.8, anchor=BOTTOM);
        
        scale([1,2,1])
        prismoid(size1=[roof_base,base_lenght], size2=[1,base_lenght-42], xang=50, h=38.8, anchor=BOTTOM);
        
        scale([2,1,1])
        prismoid(size1=[roof_base,base_lenght], size2=[1,base_lenght-42], xang=50, h=38.8, anchor=BOTTOM);
    }

    difference() {
        color(COLOR_ROOF)
        prismoid(size1=[roof_base+6,base_lenght+6], size2=[roof_base,base_lenght], xang=50, h=1, anchor=BOTTOM, rounding=6);
        cube([roof_base,base_lenght,roof_base], anchor=BOTTOM);
    }
    //roof_triangle();
}

module roof_triangle_full() {
    roof_triangle_base();

    color(COLOR_ROOF)
    intersection() {
        xscale(1.03)
        zscale(1.03)
        roof_triangle_base_shell();

        zrot(90)
        fwd(roof_base/2)
        right(roof_base/2)
        roof_detail();
    }
}

module roof_white_trim() {
    h=21;
    size1=[-45+base_lenght, 2];
    size2=[0, 2];

    back(1)
    difference() {
        down(0.5)
        color(COLOR_TRIM)
        prismoid(
            size1=size1,
            size2=size2,
            h=h,
            anchor=BOTTOM
        );

        down(2.5)
        prismoid(
            size1=size1,
            size2=size2,
            h=h,
            anchor=BOTTOM
        );
    }
}

module roof_triangle_base() {
    size1=[-45+base_lenght, base_lenght];
    size2=[0, base_lenght];
    xang=0;
    h=22;
    anchor=BOTTOM;

    shell_thickness = 1;

    roof_triangle_base_shell();

    // difference() {
    //     scale(1.1)
    //     down(1.2)
    //     roof_triangle([1, base_lenght]);

    //     scale([1,2,1])
    //     roof_triangle([1, base_lenght]);

    //     //down(2)
    //     scale([2,0.96,0.94])
    //     prismoid(
    //         size1=size1,
    //         size2=[3, base_lenght],
    //         h=h,
    //         anchor=anchor
    //     );
    // }
}

module roof_triangle_base_shell() {
    roof_triangle([1.4, base_lenght]);
}

module prismoid_shell(size1, size2, xang, h, shell_thickness, anchor=CENTER) {
    difference() {
        // Outer shell
        prismoid(
            size1=size1,
            size2=size2,
            xang=xang,
            h=h,
            anchor=anchor
        );
        // Inner cutout (offset inwards by shell_thickness)
        down(shell_thickness)
        prismoid(
            size1=[size1[0] - 2*shell_thickness, size1[1] - 2*shell_thickness],
            size2=[size2[0] + 2*shell_thickness, size2[1] - 2*shell_thickness],
            xang=xang,
            h=h - shell_thickness,
            anchor=anchor
        );
    }
}

module roof_triangle(size2) {
    size1=[base_lenght-45+5, base_lenght];
    //size2=[0, base_lenght];
    xang=0;
    h=24;
    anchor=BOTTOM;

    shell_thickness = 1;

    difference() {
        // Outer shell
        prismoid(
            size1=size1,
            size2=size2,
            h=h,
            anchor=anchor
        );
        // Inner cutout (offset inwards by shell_thickness)
        scale([1,1.1,1])
        down(shell_thickness+1)
        prismoid(
            size1=[size1[0] - 2*shell_thickness, size1[1] - 2*shell_thickness],
            size2=[size2[0], size2[1] - 2*shell_thickness],
            h=h - shell_thickness,
            anchor=anchor
        );
    }
}

module filled_roof_triangle(size2) {
    size1=[base_lenght-45+5, base_lenght];
    //size2=[0, base_lenght];
    xang=0;
    h=22;
    anchor=BOTTOM;

    shell_thickness = 1;

    right(25.5)
    fwd(4)
    //down(8)
    up(1.3)
    prismoid(
        size1=size1,
        size2=size2,
        h=h,
        anchor=anchor
    );
}

module roof_trim() {
    shell_thickness = 1.4;
    color("white")
    right(34)
    fwd(15)
    down(8)
    difference() {
        // Outer shell
        prismoid(
            size1=[base_lenght-45+5, base_lenght],
            size2=[1, 1.2],
            h=22,
            anchor=anchor
        );
        // Inner cutout (offset inwards by shell_thickness)
        down(shell_thickness)
        prismoid(
            size1=[base_lenght-45+5 - 2*shell_thickness, base_lenght - 2*shell_thickness],
            size2=[1 + 2*shell_thickness, base_lenght - 2*shell_thickness],
            h=22 - shell_thickness,
            anchor=anchor
        );
    }
}