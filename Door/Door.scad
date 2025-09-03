include <../Constants.scad>;

module Positioned_Door() {
    up(base_distance_floor+base_height+door_height/2)
    right(48)
    back(25.5)
    mirror([0,1,0])
    xrot(-90)
    Door();
}

module Positioned_Door_Glass() {
    up(base_distance_floor+base_height+door_height/2)
    right(48)
    back(25.5)
    mirror([0,1,0])
    xrot(-90)
    Door_Glass();
}


module Door() {
    color(COLOR_TRIM)
    difference() {
        
        door_base();
        
        linear_extrude(10)
        door_glass();
        
        door_circle_glass();
    }
    
    path = rect([door_width, door_height], 0.3);
    up(1.2)
    color(COLOR_TRIM)
    linear_extrude(0.6)
    stroke(path, width=0.6, closed=true);

    // fwd(4.5)
    // door_circle_window();
}

module Door_Glass() {
    color(COLOR_GLASS)
    door_glass_base();
}

module door_circle_glass() {
    fwd(6.5)
    linear_extrude(10)
    scale(1.3)
    circle(r=window_radius-0.2);
}

module door_glass_base() {
    down(window_glass_thickness)
    linear_extrude(window_glass_thickness)
    rect([door_width, door_height], 0.3);
}

module door_base() {
    // Door dimensions

    door_depth = 1; // Slightly protruding for printability

    // Main door shape
    linear_extrude(1.4)
    difference() {
        rect([door_width, door_height], 0.3);
    
        scale(1.3)
        back(1.74)
        rect([8.4, 21.3], rounding=[0,0,0.3,0.3]);
    }
    scale(1.3) {
        back(1.74)
        linear_extrude(0.8)
        rect([8.4, 21.3], rounding=[0,0,0.3,0.3]);
        
        up(0.8)
        right(2)
        back(2)
        prismoid(size1=[3,5.8], size2=[1.9,4.6], h=0.6);
        
        up(0.8)
        right(-2)
        back(2)
        prismoid(size1=[3,5.8], size2=[1.9,4.6], h=0.6);
        
        up(0.8)
        right(-2)
        back(9)
        prismoid(size1=[3,3.4], size2=[1.9,2], h=0.6);
        
        up(0.8)
        right(2)
        back(9)
        prismoid(size1=[3,3.4], size2=[1.9,2], h=0.6);
        
        up(1)
        right(5.3)
        back(9)
        prismoid(size1=[1.2,4.3], size2=[0.8,3.5], h=0.6);
        
        up(1)
        right(-5.3)
        back(9)
        prismoid(size1=[1.2,4.3], size2=[0.8,3.5], h=0.6);
    }
}

window_radius = 5.6/2;

module door_circle_window() {
    
    path = circle(r=window_radius-0.1);
    color(COLOR_TRIM)
    linear_extrude(1)
    stroke(path, width=0.3, closed=true);
    
    color(COLOR_TRIM)
    up(0.9)
    linear_extrude(0.05)
    intersection() {
        door_window_detail();
        circle(r=window_radius-0.2);

    }
}

module door_window_detail() {
    window_radius = 5.6/2;
    path2 = circle(r=window_radius);
    right(window_radius)
    stroke(path2, width=0.1);
    
    path3 = circle(r=window_radius);
    right(-window_radius)
    stroke(path3, width=0.1);
    
    path4 = circle(r=window_radius/2);
    right(-window_radius+0.5)
    back(1)
    stroke(path4, width=0.1);
    
    path5 = circle(r=window_radius/2);
    right(window_radius-0.5)
    back(1)
    stroke(path5, width=0.1);

}

module door_glass() {
    scale([1.3,1.3,3]) {
        fwd(1.4)
        right(5.3)
        rect([1.2, 14.7], rounding=0.3);
        
        fwd(1.4)
        right(-5.3)
        rect([1.2, 14.7], rounding=0.3);
        
        fwd(10.7)
        right(5.3)
        rect([1.2, 2.6], rounding=0.3);
        
        fwd(10.7)
        right(-5.3)
        rect([1.2, 2.6], rounding=0.3);
        
        fwd(10.7)
        rect([8.6, 2.6], rounding=0.3);
    
    }
}