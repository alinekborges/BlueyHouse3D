include <../Constants.scad>;

Column_Height = base_distance_floor-2;
Column_Width = 11;

Fence_Height = base_distance_floor-2;
Board_Width = 4;
Board_Thickness = 2;
Min_Spacing = 1.5;
Fence_Lip_Left=true;
Fence_Lip_Right=true;

module BlueyFence() {
    //color(COLOR_FENCE)
    //import("Fence.stl");

    front_fence_width = base_width-Column_Width;
    back(Column_Width/4)
    right(Column_Width/2+front_fence_width/2)
    zrot(-90)
    color(COLOR_FENCE)
    Fence(front_fence_width);

    side_fence_width = house_cut_lenght-Column_Width;
    right(Column_Width/4)
    back(Column_Width/2+side_fence_width/2)
    zrot(180)
    color(COLOR_FENCE)
    Fence(side_fence_width);

    side_fence_width = house_cut_lenght-Column_Width;
    right(base_width-Column_Width/4)
    back(Column_Width/2+side_fence_width/2)
    color(COLOR_FENCE)
    Fence(side_fence_width);
}

module BlueyPillars() {
    // Front Left
    right(Column_Width/2)
    back(Column_Width/2)
    color(COLOR_FENCE)
    Column_With_Holes(Column_Hole_Right=1, Column_Hole_Back=1);

    // Front Right
    right(base_width - Column_Width/2)
    back(Column_Width/2)
    color(COLOR_FENCE)
    Column_With_Holes(Column_Hole_Left=1, Column_Hole_Back=-1);

    // Side Left
    right(Column_Width/2)
    back(house_cut_lenght - Column_Width/2)
    color(COLOR_FENCE)
    Column_With_Holes(Column_Hole_Front=1);

    // Side Right
    right(base_width - Column_Width/2)
    back(house_cut_lenght - Column_Width/2)
    color(COLOR_FENCE)
    Column_With_Holes(Column_Hole_Front=-1);
}

module Fence(width) {

    copies = floor(width/(Board_Width+Min_Spacing));
    spacing = max((width - copies*Board_Width) / (copies), Min_Spacing);

    ycopies(spacing+Board_Width,copies)
    rounded_fence_board();

    right(Board_Thickness/4)
    Fence_Board(Width=width);

    if (Fence_Lip_Left) {
        right(Board_Thickness/4)
        fwd(width/2+Column_Width/6)
        Fence_Board(Width=Column_Width/3);
    }

    if (Fence_Lip_Right) {
        right(Board_Thickness/4)
        back(width/2+Column_Width/6)
        Fence_Board(Width=Column_Width/3);
    }
}

// BlueyFence();
// BlueyPillars();

module Base_Column() {
    linear_extrude(Column_Height)
    rect([Column_Width, Column_Width], rounding=0.5);

    up(Column_Height)
    diff() {
        scale([1.3,1.3,1])
        cube([Column_Width,Column_Width,2], anchor=CENTER+BOTTOM) {
            edge_mask(TOP)
            rounding_edge_mask(r=2);
        }
    }
}

module Column_With_Holes(Column_Hole_Left=0, Column_Hole_Right=0, Column_Hole_Front=0, Column_Hole_Back=0) {
    difference() {
        Base_Column();  

        if (Column_Hole_Left) {
            fwd((Column_Width/2-Board_Thickness/2-1)*Column_Hole_Left)
            left(Column_Width/3)
            zrot(90)
            Fence_Board(tolerance=0.4, Width=Column_Width);
        }

        if (Column_Hole_Right) {
            fwd((Column_Width/2-Board_Thickness/2-1)*Column_Hole_Right)
            right(Column_Width/3)
            zrot(90)
            Fence_Board(tolerance=0.4, Width=Column_Width);
        }

        if (Column_Hole_Front) {
            left((Column_Width/2-Board_Thickness/2-1)*Column_Hole_Front)
            fwd(Column_Width/3)
            Fence_Board(tolerance=0.4, Width=Column_Width);
        }

        if (Column_Hole_Back) {
            left((Column_Width/2-Board_Thickness/2-1)*Column_Hole_Back)
            back(Column_Width/3)
            Fence_Board(tolerance=0.4, Width=Column_Width);
        }
    }
}

module Fence_Board(tolerance=0, Width) {
    up(Fence_Height/3)
    cube([Board_Thickness/2+tolerance, Width+tolerance, Fence_Height/10+tolerance], anchor=CENTER+BOTTOM);

    up(Fence_Height/3*2)
    cube([Board_Thickness/2+tolerance, Width+tolerance, Fence_Height/10+tolerance], anchor=CENTER+BOTTOM);
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
    cube([depth,width, height - radius], anchor=BOTTOM+LEFT+FWD);
    
    // Rounded top (half cylinder)
    //translate([width/2, depth, height - radius])
    up(height - radius)
    yrot(90)

    cylinder(h=depth, r=radius, anchor=CENTER+BOTTOM);
}