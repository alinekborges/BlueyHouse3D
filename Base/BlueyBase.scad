include <BOSL2/std.scad>;
include <../Constants.scad>;

module base() {
    
    color(COLOR_ROOF)
    linear_extrude(base_height)
    rect([base_width, house_cut_lenght], rounding=0.5, anchor=BOTTOM+LEFT);

    // Wooden floor pattern on top
    color(COLOR_ROOF)
    intersection() {
        up(base_height + 0.2) // Position slightly below the top surface
        right(base_width/3)
        back(house_cut_lenght/2)
        wooden_floor_pattern();

        linear_extrude(10)
        rect([base_width, house_cut_lenght], rounding=0.5, anchor=BOTTOM+LEFT);
    }   
}

module wooden_floor_pattern() {
    board_length = 8; // Length of each board
    board_width = 2; // Width of each board
    board_spacing = 0.2; // Gap between boards
    pattern_height = 0.2; // Thickness of the pattern
    
    // Calculate how many boards fit across the base
    num_boards_x = floor(base_width / (board_length + board_spacing)) + 4;
    num_boards_y = floor(house_cut_lenght / (board_width + board_spacing)) + 4;
    
    // Create staggered boards in rows
    for (i = [0:num_boards_y-1]) {
        for (j = [0:num_boards_x-1]) {
            // Offset every other row by half a board length
            row_offset = (i % 2 == 1) ? (board_length + board_spacing) / 2 : 0;
            
            translate([
                -base_width/2 + j * (board_length + board_spacing) + board_length/2 + row_offset,
                -house_cut_lenght/2 + i * (board_width + board_spacing) + board_width/2,
                0
            ])
            cube([board_length, board_width, pattern_height], anchor=BOTTOM+LEFT);
        }
    }
}