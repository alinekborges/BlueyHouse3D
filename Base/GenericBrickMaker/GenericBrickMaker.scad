include <BOSL2/std.scad>;

Width = 160; // Width of the base in mm
Length = 160; // Length of the base in mm
Height = 8; // Height of the base in mm
Brick_Length = 7; // Length of each board
Brick_Width = 4; // Width of each board
Brick_Spacing = 0.3; // Gap between boards
Pattern_Height = 0.4; // Thickness of the pattern
Rounding = 1; // Rounding of the base

Texture_Color = "#AAAAAA"; // Color of the texture
Base_Color = "#000000"; // Color of the base

$fn=100;

module base() {
    color(Base_Color)
    linear_extrude(Height-Pattern_Height)
    rect([Width, Length], rounding=Rounding, anchor=BOTTOM+LEFT);

    // Brick or wood pattern on top
    color(Texture_Color)
    intersection() {
        up(Height-Pattern_Height)
        GenericBrickMaker();

        linear_extrude(10)
        rect([Width, Length], rounding=Rounding, anchor=BOTTOM+LEFT);
    } 
}

module GenericBrickMaker() {
    
    // Calculate how many boards fit across the base
    num_boards_x = floor(Width / (Brick_Length + Brick_Spacing))*2;
    num_boards_y = floor(Length / (Brick_Width + Brick_Spacing))*2;
    
    // Create staggered boards in rows
    for (i = [0:num_boards_y-1]) {
        for (j = [0:num_boards_x-1]) {
            // Offset every other row by half a board length
            row_offset = (i % 2 == 1) ? (Brick_Length + Brick_Spacing) / 2 : 0;
            
            right(j * (Brick_Length + Brick_Spacing) + row_offset - Brick_Length / 2 - Brick_Spacing)
            back( i * (Brick_Width + Brick_Spacing) + Brick_Width/2 - Brick_Width- Brick_Spacing)
            cube([Brick_Length, Brick_Width, Pattern_Height], anchor=BOTTOM+LEFT);
        }
    }
}

base();