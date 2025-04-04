//$fa=1;
//$fs=0.01;

$fa = 1;
$fs = 0.01;

include <caster_post.scad>

platform_length = 1.5;
platform_width = 1.305;
platform_height = 0.065;

screw_hole_offset = 0.1;
screw_length_seperation = 0.848;
screw_width_seperation = 1.094;

module caster_platform() {
    difference() {
        cube([platform_width, platform_length, platform_height], center = true);

        // four screw holes
        for(i = [0:3]) {
            modifier1 = (i == 1 || i == 3) ? -1 : 1;
            modifier2 = (i == 2 || i == 3) ? -1 : 1;
            
            translate(
            [
                modifier1 * (platform_width / 2 - screw_hole_offset), 
                modifier2 * (platform_length / 2 - screw_hole_offset), 
                -platform_height
            ])
            cylinder(h = platform_height * 2, r = screw_hole);            
        }
        
        // side cutout
        for(i = [0:1]) {
            modifier = i == 0 ? 1 : -1;
            translate([0, modifier * 2.32, 0])
            sphere(d = platform_width * 2.5);
        }
    }

    // track for ball bearings
    difference() {
        translate([0, 0, platform_height / 2])
        cylinder(h = .05, r = platform_width / 2);
        
        translate([0, 0, platform_height / 2 + .01])
        cylinder(h = .6, r = platform_width / 2 - .28); 
    }
    translate([0, 0, platform_height  / 2 + .01])
    cylinder(h = .05, r = .277);

    // ball bearings
    count = 15;
    radius = platform_width / 2 - .33;
    for (i = [0:count-1]) {
        angle = i * 360 / count;
        x = radius * cos(angle);
        y = radius * sin(angle);
        translate([x, y, platform_height / 2 + .03])
            sphere(r=.055);
    }
    
    // rotable disk
    difference() {
        difference() {
            translate([0,0, platform_height / 2 + .03 + .055])
            cylinder(h = .816, r = .9875 / 2);
            translate([0, 0, platform_height / 2 + .03 + .065])
            cylinder(h = .816, r = .9345 / 2);
        }
        translate([0, 0, .84])
        cube([.7, 2, 1], center = true);
        translate([0, 1.15, 1.7])
        sphere(d = platform_width * 2.5);
        translate([-.5, -.9, .13])
        cube([1, platform_length / 2, 1]);
    }
    
    // side support for axle
    translate([-.49, -.2, .13]) {
        rotate([15, 0, 0]) {
            cube([.05, .25, .8]);
        }
    }

    // side support for axle
    translate([.44, -.2, .13]) {
        rotate([15, 0, 0]) {
            cube([.05, .25, .8]);
        }
    }

    // rivit top
    translate([0 ,0, platform_height / 2 + .03 + .085])
    cylinder(h = .05, r = .4165 / 2);
    
    // rivit bottom
    translate([0, 0, -.06])
    cylinder(h = .1, r = .1);

    // four posts
    for(i = [0:3]) {
        modifier1 = (i == 1 || i == 3) ? -1 : 1;
        modifier2 = (i == 2 || i == 3) ? -1 : 1;
        
        translate(
        [
            modifier1 * (platform_width / 2 - screw_hole_offset), 
            modifier2 * (platform_length / 2 - screw_hole_offset), 
            -platform_height - post_height
        ])
        caster_post();           
    }
    
    // axle
    translate([-.55, -.22, .8]) {
        rotate([0, 90, 0])
        cylinder(h = 1.1, r = .05);
    }
    
    // wheel
    difference() {
        translate([-.23, -.2, .8]) {
            rotate([0, 90, 0])
            cylinder(h = .5, r = .983 / 2);
        }
        translate([-.25, -.2, .8]) {
            rotate([0, 90, 0])
            cylinder(h = .22, r = .4);
        }        
        translate([.08, -.2, .8]) {
            rotate([0, 90, 0])
            cylinder(h = .22, r = .4);
        }        
    }
    translate([-.3, -.22, .8])
    rotate([0, 90, 0])
    cylinder(h = .6, r = .08);
}
rotate([0,180,0])
caster_platform();