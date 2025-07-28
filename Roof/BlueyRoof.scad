include <BOSL2/std.scad>;
include <../Constants.scad>;

// module chamine_base() {
//     color(COLOR_WALL)
//     up(base_distance_floor+base_height+window_dressing_height+29.25)
//     back(house_cut_lenght-13)
//     right(15.6)
//     cube([6.5,6.5,13.0], anchor=BOTTOM);
// }

module roof_ready_to_render() {
    difference() {
        positioned_main_roof();

        up(base_distance_floor+base_height+window_dressing_height+8.45)
        back(roof_base/2+0.65)
        right(roof_base/2-9.1)
        down(0.65)
        prismoid(size1=[roof_base,base_lenght], size2=[1,base_lenght-54.6], xang=50, h=50.44, anchor=BOTTOM);
    }

    //chamine_base();
}

module positioned_filled_roof() {
    up(base_distance_floor+base_height+window_dressing_height+5.85)
    back(roof_base/2)
    right(roof_base/2-9.1)
    prismoid(size1=[roof_base,base_lenght], size2=[1,base_lenght-54.6], xang=50, h=50.44, anchor=BOTTOM);

    right(48.1)
    back(54.6)
    down(3.9)
    up(base_distance_floor+base_height+window_dressing_height+11.7)
    filled_roof_triangle([0, base_lenght]);

    cube([130,130, 66.3], anchor=BOTTOM+LEFT+FWD);
}

module positioned_main_roof() {
    difference() {
        up(base_distance_floor+base_height+window_dressing_height+9.1)
        // right(23.4)
        back(roof_base/2)
        right(roof_base/2-9.1)
        combined_roof();

        back(house_cut_lenght)
        left(13)
        cube([156,130, 130], anchor=BOTTOM+LEFT+FWD);
    }
}

module combined_roof() {
    difference() { 
        full_roof() tag("main_roof");

        down(3.9)
        scale([1,1.2,1.1])
        filled_roof_triangle([1, base_lenght]);

        right(104)
        cube([130,130, 130], center=true);
    }

    positioned_triangle_roof();
}

module full_roof() {
    color(COLOR_ROOF)
    intersection() {
        scale(1.015)
        prismoid_shell(size1=[roof_base,base_lenght], size2=[1,base_lenght-54.6], xang=50, h=50.44, shell_thickness=2.6, anchor=BOTTOM);

        fwd(roof_base/2)
        right(roof_base/2)
        roof_detail();
    }

    roof();
}

module positioned_triangle_roof() {
    color(COLOR_ROOF)
    right(33.15)
    fwd(5.2)
    roof_triangle_full();
}

module roof_detail() {
    board_size=7.8;
    board_gap=0.39;
    board_count=15;

    for (i=[0:board_count]) {
        left(i*board_size+board_gap*i)
        cube([board_size,130,130]);
    }
}

module roof() {
    color(COLOR_ROOF)
    intersection() {
        roof_base();
        cube([130,130,130], anchor=BOTTOM);
    }
}

module roof_base() {
    prismoid_shell(size1=[roof_base,base_lenght], size2=[1,base_lenght-54.6], xang=50, h=50.44, shell_thickness=2.6, anchor=BOTTOM);
    
    difference() {
        scale(1.06)
        down(1.56)
        prismoid(size1=[roof_base,base_lenght], size2=[1,base_lenght-54.6], xang=50, h=50.44, anchor=BOTTOM);
        
        scale([1,2,1])
        prismoid(size1=[roof_base,base_lenght], size2=[1,base_lenght-54.6], xang=50, h=50.44, anchor=BOTTOM);
        
        scale([2,1,1])
        prismoid(size1=[roof_base,base_lenght], size2=[1,base_lenght-54.6], xang=50, h=50.44, anchor=BOTTOM);
    }

    difference() {
        color(COLOR_ROOF)
        prismoid(size1=[roof_base+7.8,base_lenght+7.8], size2=[roof_base,base_lenght], xang=50, h=1.3, anchor=BOTTOM, rounding=7.8);
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
    h=27.3;
    size1=[-58.5+base_lenght, 2.6];
    size2=[0, 2.6];

    back(1.3)
    difference() {
        down(0.65)
        color(COLOR_TRIM)
        prismoid(
            size1=size1,
            size2=size2,
            h=h,
            anchor=BOTTOM
        );

        down(3.25)
        prismoid(
            size1=size1,
            size2=size2,
            h=h,
            anchor=BOTTOM
        );
    }
}

module roof_triangle_base() {
    size1=[-58.5+base_lenght, base_lenght];
    size2=[0, base_lenght];
    xang=0;
    h=28.6;
    anchor=BOTTOM;

    shell_thickness = 1.3;

    roof_triangle_base_shell();

    // difference() {
    //     scale(1.1)
    //     down(1.56)
    //     roof_triangle([1, base_lenght]);

    //     scale([1,2,1])
    //     roof_triangle([1, base_lenght]);

    //     //down(2)
    //     scale([2,0.96,0.94])
    //     prismoid(
    //         size1=size1,
    //         size2=[3.9, base_lenght],
    //         h=h,
    //         anchor=anchor
    //     );
    // }
}

module roof_triangle_base_shell() {
    roof_triangle([1.82, base_lenght]);
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
    size1=[base_lenght-58.5+6.5, base_lenght];
    //size2=[0, base_lenght];
    xang=0;
    h=31.2;
    anchor=BOTTOM;

    shell_thickness = 1.3;

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
        down(shell_thickness+1.3)
        prismoid(
            size1=[size1[0] - 2*shell_thickness, size1[1] - 2*shell_thickness],
            size2=[size2[0], size2[1] - 2*shell_thickness],
            h=h - shell_thickness,
            anchor=anchor
        );
    }
}

module filled_roof_triangle(size2) {
    size1=[base_lenght-58.5+6.5, base_lenght];
    //size2=[0, base_lenght];
    xang=0;
    h=28.6;
    anchor=BOTTOM;

    shell_thickness = 1.3;

    right(33.15)
    fwd(5.2)
    //down(10.4)
    up(1.69)
    prismoid(
        size1=size1,
        size2=size2,
        h=h,
        anchor=anchor
    );
}

module roof_trim() {
    shell_thickness = 1.82;
    color("white")
    right(44.2)
    fwd(19.5)
    down(10.4)
    difference() {
        // Outer shell
        prismoid(
            size1=[base_lenght-58.5+6.5, base_lenght],
            size2=[1.3, 1.56],
            h=28.6,
            anchor=anchor
        );
        // Inner cutout (offset inwards by shell_thickness)
        down(shell_thickness)
        prismoid(
            size1=[base_lenght-58.5+6.5 - 2*shell_thickness, base_lenght - 2*shell_thickness],
            size2=[1.3 + 2*shell_thickness, base_lenght - 2*shell_thickness],
            h=28.6 - shell_thickness,
            anchor=anchor
        );
    }
}