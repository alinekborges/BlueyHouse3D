include <BOSL2/std.scad>;
include <../Constants.scad>;

module FrontStairsWhite() {

    right(36)
    scale(1.3) {
        color(COLOR_TRIM)
        front_stair_railing();

        color(COLOR_TRIM)
        front_stair_steps();

        color(COLOR_TRIM)
        right(19.5)
        front_stair_railing();
    }
}

module FrontStairsLeft() {
    color(COLOR_TRIM)
    right(36)
    scale(1.3) {
        
        front_stair_railing();

        front_stair_steps_left();
    }
}

module FrontStairsRight() {
    color(COLOR_TRIM)
    right(36)
    scale(1.3) {
        right(19.5)
        front_stair_railing();

        front_stair_steps_right();
    }
}

module FrontStairsRed() {
    right(36)
    scale(1.3) {
        color(COLOR_ROOF)
        front_stair_steps_red();
    }
}

// ********************
// FRONT STAIRS
module front_stair_railing() {
    
    difference() {
        union() {
            up(base_distance_floor+base_height+5)
            back(1)
            xrot(30.5)
            xrot(90)
            linear_extrude(30)
            rect([2, 2], anchor=anchor);

            fwd(23.8)
            xrot(30.5)
            linear_extrude(2)
            rect([2, 30], anchor=anchor);

            fwd(20.8)
            up(3)
            linear_extrude(13.5)
            rect([2, 2], anchor=anchor);

            fwd(15.8)
            up(6)
            linear_extrude(13.5)
            rect([2, 2], anchor=anchor);

            fwd(10.8)
            up(9)
            linear_extrude(13.5)
            rect([2, 2], anchor=anchor);

            fwd(5.8)
            up(12)
            linear_extrude(13.5)
            rect([2, 2], anchor=anchor);

            fwd(26)
            front_stair_pilar();
        }

        up(10)
        cube([2, 2, 50], anchor=anchor);
    }
}

module front_stair_steps_left() {

    // middle
    fwd(15)
    up(7.6)
    right(1.8)
    stair_step_left();

    // top
    fwd(8)
    up(12)
    right(1.8)
    stair_step_left();

    // bottom
    fwd(23)
    up(3)
    right(1.8)
    stair_step_left();
}

module front_stair_steps_right() {

    // middle
    fwd(15)
    up(7.6)
    right(1.8)
    stair_step_right();

    fwd(8)
    up(12)  
    right(1.8)
    stair_step_right();

    // bottom
    fwd(23)
    up(3)
    right(1.8)
    stair_step_right();
}

module front_stair_steps_red() {

    // middle
    fwd(15)
    up(7.6)
    right(1.8)
    front_stair_step_red();

    // top
    fwd(8)
    up(12)
    right(1.8)
    front_stair_step_red();

    // bottom
    fwd(23)
    up(3)
    right(1.8)
    front_stair_step_red();
}

module front_stair_step_red() {
    color(COLOR_ROOF)
    right(4)
    linear_extrude(2)
    rect([17.8-8, 7], anchor=anchor);
}


module stair_step_left() {
    color(COLOR_WALL)
    linear_extrude(2)
    rect([4, 7], anchor=anchor);
}

module stair_step_right() {
    color(COLOR_WALL)
    right(17.8-4)
    linear_extrude(2)
    rect([4, 7], anchor=anchor);
}

module front_stair_pilar() {

    linear_extrude(15)
    rect([2, 2], anchor=anchor);

    up(15.5)
    linear_extrude(2.5)
    rect([2, 2], anchor=anchor);

    up(15)
    right(0.25)
    fwd(-0.25)
    linear_extrude(1)
    rect([2-0.5, 2-0.5], anchor=anchor);
}