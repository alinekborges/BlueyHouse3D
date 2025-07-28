include <../Roof/BlueyRoof.scad>;

module BlueyRoof() {
    roof_ready_to_render();
}

module BlueyRoofRendered() {
    color(COLOR_ROOF)
    import("HouseRoof.stl");
}

BlueyRoofRendered();