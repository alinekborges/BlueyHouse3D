include <BOSL2/std.scad>

Total_Width = 28 * 1.3;
Fence_Height = 13;
Board_Width = 4;
Board_Thickness = 2;
Min_Spacing = 1.5;
Fence_Lip_Left=true;
Fence_Lip_Right=true;

Column_Width=6*1.3;
Column_Height=14*1.3;

Column_Hole_Left=true;
Column_Hole_Right=true;
Column_Hole_Front=true;
Column_Hole_Back=true;

// Puts a lip on the first and last board, to attach to the column.
Fence_Lip = true;

$fn=100;

/* [Hidden] */

copies = floor(Total_Width/(Board_Width+Min_Spacing));
spacing = max((Total_Width - copies*Board_Width) / (copies), Min_Spacing);
anchor = BOTTOM+LEFT+FWD;

module Fence() {
    ycopies(spacing+Board_Width,copies)
    rounded_fence_board();

    Fence_Board();

    if (Fence_Lip_Left) {
        fwd(Total_Width/2+Column_Width/6)
        Fence_Board(Width=Column_Width/3);
    }

    if (Fence_Lip_Right) {
        back(Total_Width/2+Column_Width/6)
        Fence_Board(Width=Column_Width/3);
    }
}

module Fence_Board(tolerance = 0, Width=Total_Width, Height=Fence_Height) {
    up(Fence_Height/3)
    cube([Board_Thickness/2+tolerance, Width+tolerance, Height/10+tolerance], anchor=CENTER);

    up(Fence_Height/3*2)
    cube([Board_Thickness/2+tolerance, Width+tolerance, Height/10+tolerance], anchor=CENTER);
}

module rounded_fence_board() {
    // Create a rounded fence board
    // Board dimensions
    width = Board_Width;
    depth = Board_Thickness;
    height = Fence_Height;
    radius = width / 2; // Radius for the rounded top
    
    // Main rectangular part
    fwd(width/2)
    cube([depth,width, height - radius], anchor=anchor);
    
    // Rounded top (half cylinder)
    //translate([width/2, depth, height - radius])
    up(height - radius)
    yrot(90)

    cylinder(h=depth, r=radius, anchor=CENTER+BOTTOM);
}

module Base_Column() {
    linear_extrude(Column_Height)
    rect([Column_Width, Column_Width], rounding=0.5);

    up(Column_Height)
    diff() {
        scale([1.3,1.3,1])
        cube([Column_Width,Column_Width,2], anchor=CENTER) {
            edge_mask(TOP)
            rounding_edge_mask(r=2);
        }
    }
}

module Column_With_Holes() {
    difference() {
        Base_Column();

        if (Column_Hole_Left) {
            left(Total_Width/2+Column_Width/3)
            zrot(90)
            Fence_Board(tolerance=0.2);
        }

        if (Column_Hole_Right) {
            right(Total_Width/2+Column_Width/3)
            zrot(90)
            Fence_Board(tolerance=0.2);
        }

        if (Column_Hole_Front) {
            fwd(Total_Width/2+Column_Width/3)
            Fence_Board(tolerance=0.2);
        }

        if (Column_Hole_Back) {
            back(Total_Width/2+Column_Width/3)
            Fence_Board(tolerance=0.5);
        }
    }
}

//Column_With_Holes();

Fence();