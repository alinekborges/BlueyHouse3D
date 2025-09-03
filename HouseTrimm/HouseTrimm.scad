include <BOSL2/std.scad>;

include <../Constants.scad>;

module HouseTrimm(tolerance=0) {
    color(COLOR_TRIM)
    up(base_distance_floor+base_height)
    right(porch_width+1)
    house_trimm_base(tolerance);

    color(COLOR_TRIM)
    up(base_distance_floor+base_height)
    right(base_width-3)
    house_trimm_base(tolerance);

    right(81.4)
    color(COLOR_TRIM)
    up(base_distance_floor+base_height+44.9)
    scale([1,0.03,1])
    roof_triangle();
}

module house_trimm_base(tolerance=0) {
    cube([2+tolerance, 2+tolerance, 44.8+tolerance], anchor=BOTTOM+FWD+LEFT);
}

module roof_triangle(size2) {
    size2=[2, base_lenght];
    size1=[base_lenght-59.6, base_lenght];
    xang=0;
    h=27;
    anchor=BOTTOM;

    shell_thickness = 1;

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
        down(shell_thickness+2)
        prismoid(
            size1=[size1[0] - 2*shell_thickness, size1[1] - 2*shell_thickness],
            size2=[0, size2[1] - 2*shell_thickness],
            h=h - shell_thickness,
            anchor=anchor
        );
    }
}