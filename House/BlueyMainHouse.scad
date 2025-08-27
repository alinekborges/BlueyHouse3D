include <BOSL2/std.scad>;
include <../Constants.scad>;
include <../Roof/BlueyRoof.scad>;

house_path = [
    [0,23.4],
    [58.5,23.4],
    [58.5,0],
    [base_lenght,0],
    [base_lenght,house_cut_lenght],
    [0,house_cut_lenght],
];

trap = trapezoid(h=6.4, w1=18, w2=21.43, anchor=anchor);
trapezoid_path = offset(trap, delta=4);
tolerance = 0.2;

module BlueyHouseRendered() {
    color(COLOR_WALL)
    //main_house();
    import("BlueyHouse.stl");
}

module main_house() {
   difference() {
        intersection() {
            main_house_with_holes_and_trapezoid();
            positioned_filled_roof();
        }

        // down(2)
        //back(2)
        up(3)
        BlueyRoofRendered();
    }

    // up(2)
    // BlueyRoofRendered();
}

module main_house_with_holes_and_trapezoid() {
    main_house_with_holes();
    positioned_trapezoid_shell();
    //import("MainHouseWithHolesAndTrapezoid.stl");
}

module main_house_with_holes() {
    difference() {
        main_house_rendered();
        main_house_holes();
    }
   //import("MainHouseWithHoles.stl");
}

module main_house_rendered() {
    // up(base_distance_floor)
    // main_house_shape();
    import("MainHouseShape.stl");
}

module main_house_shape() {

    // Long horizontal bricks texture - more realistic
    texture = [for (i=[0:29])
    [for (j=[0:9])
        // Create long horizontal bricks with mortar lines
        (i % 20 < 19) ? 1 : 0.2 ]];

    inner_path = offset(house_path, delta=-2);

    intersection() {
        linear_sweep(
        inner_path, texture=texture, tex_size=[6.5,6.5],
        tex_depth=1, h=main_house_height+52);

        linear_extrude(main_house_height+65)
        stroke(inner_path, width=4, closed=true);
    }

    linear_extrude(1.3)
    polygon(inner_path);


    // stroke(inset_path, width=1.56, closed=true)  ;


    // color(COLOR_WALL)
    // up(main_house_height)
    // back(1.56)
    // right(58.5)
    // rotate([90,0,0])
    // triangle(extrude_height=1.56, base=base_lenght-58.5, height=26);


    // front_window_house 
    /*
        texture_tight = [for (i=[0:29])
    [for (j=[0:9])
        // Create long horizontal bricks with mortar lines
        (i % 10 < 9) ? 1 : 0.2 ]];

    trap = trapezoid(h=10.4, w1=21.84, w2=28.73, anchor=anchor);
    color(COLOR_WALL)
    up(3.38)
    // linear_extrude(30.68)
    right(70.2)
    fwd(10.4)
    linear_sweep(
    trap, texture=texture_tight, tex_size=[6.5,6.5],
    tex_depth=0.13, h=30.68);
*/
    
    
}

module main_house_holes() {
    tolerance = 0.2;

    up(base_distance_floor+base_height+door_height/2)
    right(48.1)
    fwd(-28.6)
    mirror([0,1,0])
    scale([1,4,1])
    xrot(-90)
    linear_extrude(13)
    rect([door_width+tolerance, door_height+tolerance], 0.39);

    
    up(base_distance_floor+base_height)
    right(13)
    fwd(-28)
    up(18.2)
    mirror([0,1,0])
    xrot(-90)
    linear_extrude(13)
    rect([win_width+tolerance, win_height+tolerance], 0.39);

    
    // trapezoid cutout
    up(base_distance_floor+base_height+14.5)
    right(77)
    fwd(13.1)
    scale([1.1,1,1])
    trapezoid_house_cutout();

    // RIGHT SIDE WINDOW POSITION
    ycopies(29.9, 3)
    up(base_distance_floor+base_height+19.5)
    back(45.5)
    right(base_width-6.5)
    xrot(90)
    yrot(90)
    linear_extrude(13)
    rect([8.06*2+tolerance, 18.33+tolerance], rounding=0.26); // outer rectangle
    
    // LEFT SIDE WINDOWS
    ycopies(29.9, 2)
    up(base_distance_floor+base_height+19.5)
    back(54.6)
    right(-6.5)
    xrot(90)
    yrot(90)
    linear_extrude(13)
    rect([8.06*2+tolerance, 18.33+tolerance], rounding=0.26); // outer rectangle
}

// Right trapezoid detail House

module trapezoid_with_holes() {
    all_right_windows_cut_base();
}

module positioned_trapezoid_shell() {
    up(base_distance_floor+base_height+3.38)
    right(72.5)
    fwd(7)
    difference() { 
        right_trapezoid_shell();

        up(12)
        fwd(4)
        right(5)
        trapezoid_with_holes();
    }
}

module right_trapezoid_shell() {

        texture_tight = [for (i=[0:29])
    [for (j=[0:9])
        // Create long horizontal bricks with mortar lines
        (i % 10 < 9) ? 1 : 0.2 ]];

    intersection() {
    
        linear_sweep(
        trapezoid_path, texture=texture_tight, tex_size=[6.5,6.5],
        tex_depth=0.3, h=30.68);

        linear_extrude(40)
        stroke(trapezoid_path, width=3, closed=true);
    }
    // linear_extrude(28.08)
    // stroke(trapezoid_path, width=2.5, closed=true);

    linear_extrude(1)
    polygon(trapezoid_path, closed=true);

    up(29.68)
    linear_extrude(1)
    polygon(trapezoid_path, closed=true);
}

module all_right_windows_cut_base() {

    // back(3.9)
    // xrot(90)
    // right_window_cut_base();

    // right(10.4)
    // back(3.9)
    // xrot(90)
    // right_window_cut_base();

    up(5)
    right(3.6)
    back(4)
    xcopies(11,2)
    xrot(90)
    right_window_cut_base();

    up(5)
    right(18)
    back(6.5)
    zrot(74.5)
    xrot(90)
    up(-3.9)
    right_window_cut_base();
    
    up(5)
    right(-10.15)
    back(6.5)
    zrot(-74.5)
    xrot(90)
    up(-3.9)
    right_window_cut_base();

    trapezoid_house_cutout();
}

module trapezoid_house_cutout() {
    back(14)
    down(10)
    left(5)
    linear_extrude(28)
    polygon(trapezoid_path, closed=true);
}

module right_window_cut_base() {
    linear_extrude(6.5)
    rect([8.8+tolerance, 18+tolerance], rounding=0.26); // outer rectangle
}