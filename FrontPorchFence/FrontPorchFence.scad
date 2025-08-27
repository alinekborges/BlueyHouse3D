include <BOSL2/std.scad>;
include <../Constants.scad>;

module FrontPorchFenceRendered() {
    color(COLOR_TRIM)
    import("FrontPorchFence_Uncut.stl");
}

// module cut_house_front_fence() {
//     difference() {
//    house_front_fence(); 
//     down(1)
//     positioned_window_dressing();

//     // down(-0.9)
//     // positioned_window_dressing();
    

//     fwd(3)
    
//     up(base_distance_floor+base_height+window_dressing_height+6)
//     xrot(35)
//     cube([100,10,10], anchor=anchor);
//     }
// }

module house_front_fence() {
    up(base_distance_floor+base_height)
    color(COLOR_TRIM) {
        linear_extrude(window_dressing_height+5)
        rect([porch_colum_size, porch_colum_size], anchor=anchor);

        right(21.32)
        linear_extrude(window_dressing_height+5)
        rect([porch_colum_size, porch_colum_size], anchor=anchor);

        right(18.72 + porch_colum_size + 13.52)
        linear_extrude(window_dressing_height+5)
        rect([porch_colum_size, porch_colum_size], anchor=anchor);

        // Small items
        decor_front_fence();

    }

    
}

module decor_front_fence() {

    board_height=porch_colum_size*0.8;
    small_board_height=porch_colum_size*0.4;
    small_board_width=porch_colum_size;

    // FRONT
    //back(0.5)
    up(13)
    linear_extrude(board_height)
    rect([36.92, small_board_width], anchor=anchor);

    //back(0.5)
    up(3.25)
    linear_extrude(small_board_height)
    rect([36.92, small_board_width], anchor=anchor);


    right(27.95)
    //back(0.5)
    up(3.25+small_board_height)
    detail_front_fence();

    right(9.75)
    //back(0.5)
    up(3.25+small_board_height)
    detail_front_fence();

    right(17.55)
    //back(0.5)
    up(3.25+small_board_height)
    linear_extrude(10.4)
    rect([1.3, small_board_width], anchor=anchor);

    right(5.85)
    //back(0.5)
    up(3.25+small_board_height)
    linear_extrude(10.4)
    rect([1.3, small_board_width], anchor=anchor);

    // SIDE
    up(13)
    linear_extrude(board_height)
    rect([small_board_width, 24.4], anchor=anchor);

    //right(0.5)
    up(3.25)
    linear_extrude(small_board_height)
    rect([small_board_width, 24.4], anchor=anchor);

    // Side Boards
    for (i = [0 : 4]) {
        right(0.65)
        back(5.07*i)
        up(3.25+small_board_height)
        linear_extrude(10.4)
        rect([1.3, small_board_width], anchor=anchor);
    }
}

module detail_front_fence() {
    difference() {
        small_board_width=porch_colum_size-1;
        linear_extrude(10.4)
        rect([4.55, small_board_width], anchor=anchor);

        right(2.34)
        up(6.5)
        back(2.6)
        heart();

        right(2.34)
        up(2.08)
        back(2.6)
        mirror([0,0,1])
        heart();

        right(2.34)
        up(4.16)
        back(5.2)
        xrot(90)
        linear_extrude(13)
        circle(r=0.52);
    }

}

module heart() {
    bez = flatten([
        bez_begin([0,50], 40, 100),
        bez_joint([0,-50], 30, 150, 120, 120),
        bez_end  ([0,50], 140, 100)
    ]);

    path = bezpath_curve(bez, splinesteps = 64);
    xrot(90)
    scale([0.013,0.013,2])
    linear_sweep(h = 2, path);
}