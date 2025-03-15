module body(width=20, base_length=60, top_length=30, base_height=10, top_height=10, top_offset=5, front_bumper, rear_bumper) {
    
    // Car body base 
    cube([base_length,width,base_height],center=true); 
    
    // Car body top 
    translate([top_offset,0,base_height/2+top_height/2 - 0.001])
        cube([top_length,width,top_height],center=true); 
    
    if (front_bumper){
        // Front bumper
        color("blue") {
            translate([-base_length/2,0,0])rotate([90,0,0]) {
                cylinder(h=width - base_height,r=base_height/2,center=true);
                translate([0,0,(width - base_height)/2])
                    sphere(r=base_height/2);
                translate([0,0,-(width - base_height)/2])
                    sphere(r=base_height/2);
            }
        }
    }

    if (rear_bumper) {
        // Rear bumper
        color("blue") {
            translate([base_length/2,0,0])rotate([90,0,0]) {
                cylinder(h=width - base_height,r=base_height/2,center=true);
                translate([0,0,(width - base_height)/2])
                    sphere(r=base_height/2);
                translate([0,0,-(width - base_height)/2])
                    sphere(r=base_height/2);
            }
        }
    }
}


module simple_wheel(wheel_radius=10, wheel_width=6) {
    rotate([90,0,0])
        cylinder(h=wheel_width,r=wheel_radius,center=true);
}

module complex_wheel(wheel_radius=10, side_spheres_radius=50, hub_thickness=4, cylinder_radius=2) {
    cylinder_height=2*wheel_radius; 
    difference() { 
        // Wheel sphere
        sphere(r=wheel_radius); 
        // Side sphere 1 
        translate([0,side_spheres_radius + hub_thickness/2,0])
            sphere(r=side_spheres_radius); 
        // Side sphere 2 
        translate([0,- (side_spheres_radius + hub_thickness/2),0])
            sphere(r=side_spheres_radius); 
        // Cylinder 1
        translate([wheel_radius/2,0,0])
            rotate([90,0,0])
            cylinder(h=cylinder_height,r=cylinder_radius,center=true); 
        // Cylinder 2 
        translate([0,0,wheel_radius/2])
            rotate([90,0,0])
            cylinder(h=cylinder_height,r=cylinder_radius,center=true); 
        // Cylinder 3 
        translate([-wheel_radius/2,0,0])
            rotate([90,0,0])
            cylinder(h=cylinder_height,r=cylinder_radius,center=true); 
        // Cylinder 4 
        translate([0,0,-wheel_radius/2])
            rotate([90,0,0])
            cylinder(h=cylinder_height,r=cylinder_radius,center=true); 
    }
}

module axle(track=30, radius=2) {
    rotate([90,0,0])
    cylinder(h=track,r=radius,center=true); 
}

module spoked_wheel(radius=12, width=5, thickness=7, number_of_spokes=7, spoke_radius=1.5){
    
    rotate([90,0,0]) {
        difference() {
            cylinder(r = radius, h = width, center = true);
            cylinder(r = radius - thickness/2, h = width + 1, center = true);
        }
        
        spoke_length = radius - thickness/4;
        step = 360 / number_of_spokes;
        for (i=[0:step:359]) {
            angle = i;
            rotate([0, 90, angle])
                cylinder(h=spoke_length, r=spoke_radius);
        }
    }
}
spoked_wheel();