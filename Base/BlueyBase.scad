include <BOSL2/std.scad>;
include <../Constants.scad>;

module BlueyBaseRendered() {
    color(COLOR_WALL)
    import("Base.stl");
}

board_length = 30; // Length of each board
board_width = 4; // Width of each board
board_spacing = 0.3; // Gap between boards
pattern_height = 0.4; // Thickness of the pattern

module base() {
    up(base_height+base_distance_floor) {
        color(COLOR_ROOF)
        linear_extrude(base_height-pattern_height)
        rect([base_width, house_cut_lenght], rounding=0.5, anchor=BOTTOM+LEFT);

        // Wooden floor pattern on top
        color(COLOR_ROOF)
        intersection() {
            up(base_height-pattern_height) // Position slightly below the top surface
            //right(base_width/3)
            //back(house_cut_lenght)
            wooden_floor_pattern();

            linear_extrude(10)
            rect([base_width, house_cut_lenght], rounding=0.5, anchor=BOTTOM+LEFT);
        }   
    }
}

module wooden_floor_pattern() {
    
    // Calculate how many boards fit across the base
    num_boards_x = floor(base_width / (board_length + board_spacing))*2;
    num_boards_y = floor(house_cut_lenght / (board_width + board_spacing))*2;
    
    // Create staggered boards in rows
    for (i = [0:num_boards_y-1]) {
        for (j = [0:num_boards_x-1]) {
            // Offset every other row by half a board length
            row_offset = (i % 2 == 1) ? (board_length + board_spacing) / 2 : 0;
            
            right(j * (board_length + board_spacing) + row_offset - board_length / 2 - board_spacing)
            back( i * (board_width + board_spacing) + board_width/2 - board_width- board_spacing)
            cube([board_length, board_width, pattern_height], anchor=BOTTOM+LEFT);
        }
    }
}