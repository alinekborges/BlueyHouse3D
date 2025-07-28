include <BOSL2/std.scad>;
include <../Constants.scad>;

house_path = [
    [0,18],
    [45,18],
    [45,0],
    [base_lenght,0],
    [base_lenght,house_cut_lenght],
    [0,house_cut_lenght],
];

module main_house() {
    //difference() {
        main_house_rendered();
        main_house_holes();
    //}
}

module main_house_rendered() {
    //main_house_shape();
    import("MainHouseShape.stl");
}

module main_house_shape() {

    // Long horizontal bricks texture - more realistic
    texture = [for (i=[0:29])
    [for (j=[0:9])
        // Create long horizontal bricks with mortar lines
        (i % 20 < 19) ? 1 : 0.2 ]];

    
    intersection() {
        linear_sweep(
        house_path, texture=texture, tex_size=[5,5],
        tex_depth=0.5, h=main_house_height+40);

        inner_path = offset(house_path, delta=0);
        linear_extrude(main_house_height+50)
        stroke(inner_path, width=4, closed=true);
    }

    linear_extrude(1)
    polygon(house_path);


    // stroke(inset_path, width=1.2, closed=true)  ;


    // color(COLOR_WALL)
    // up(main_house_height)
    // back(1.2)
    // right(45)
    // rotate([90,0,0])
    // triangle(extrude_height=1.2, base=base_lenght-45, height=20);


    // front_window_house 
    /*
        texture_tight = [for (i=[0:29])
    [for (j=[0:9])
        // Create long horizontal bricks with mortar lines
        (i % 10 < 9) ? 1 : 0.2 ]];

    trap = trapezoid(h=8, w1=16.8, w2=22.1, anchor=anchor);
    color(COLOR_WALL)
    up(2.6)
    // linear_extrude(23.6)
    right(54)
    fwd(8)
    linear_sweep(
    trap, texture=texture_tight, tex_size=[5,5],
    tex_depth=0.1, h=23.6);
*/
    
    
}

module main_house_holes() {
    trap = trapezoid(h=8, w1=16.8, w2=21.1, anchor=anchor);

    up(base_distance_floor+base_height+door_height/2)
    right(37)
    fwd(-22)
    mirror([0,1,0])
    scale([1,4,1])
    xrot(-90)
    linear_extrude(10)
    rect([door_width, door_height], 0.3);

    
    up(base_distance_floor+base_height)
    right(10)
    fwd(-20)
    up(14)
    mirror([0,1,0])
    xrot(-90)
    linear_extrude(10)
    rect([win_width, win_height], 0.3);

    
    // trapezoid cutout
    up(base_distance_floor+base_height+2.6)
    right(54)
    fwd(7)
    linear_extrude(21.6)
    stroke(trap, width=1.2, closed=true);

    // RIGHT SIDE WINDOW POSITION
    ycopies(23, 3)
    up(base_distance_floor+base_height+15)
    back(35)
    right(base_width-5)
    xrot(90)
    yrot(90)
    linear_extrude(10)
    rect([6.2*2, 14.1], rounding=0.2); // outer rectangle
    
    // LEFT SIDE WINDOWS
    ycopies(23, 2)
    up(base_distance_floor+base_height+15)
    back(42)
    right(-5)
    xrot(90)
    yrot(90)
    linear_extrude(10)
    rect([6.2*2, 14.1], rounding=0.2); // outer rectangle
}

// Right window porch detail

module all_right_windows_cut_base() {

    back(3)
    xrot(90)
    right_window_cut_base();

    right(8)
    back(3)
    xrot(90)
    right_window_cut_base();

    right(15.5)
    back(4)
    zrot(71.5)
    xrot(90)
    up(-3)
    right_window_cut_base();

    
    right(-5.5)
    back(5)
    zrot(-71.5)
    xrot(90)
    up(-3)
    right_window_cut_base();
}

module right_window_cut_base() {
    linear_extrude(5)
    rect([6.2, 14.1], rounding=0.2); // outer rectangle
}