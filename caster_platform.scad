//$fa=1;
//$fs=0.01;

$fa = 1;
$fs = 0.1;

include <caster_post.scad>

platform_length = 1.298;
platform_width = 1.495;
platform_height = 0.065;

screw_hole_offset = 0.22;
screw_length_seperation = 0.848;
screw_width_seperation = 1.094;

module caster_platform() {
    difference() {
        cube([platform_width, platform_length, platform_height], center = true);
        
        // screw hole
        translate(
        [
            platform_width / 2 - screw_hole_offset, 
            platform_length / 2 - screw_hole_offset, 
            -platform_height
        ])
        cylinder(h = platform_height * 2, r = screw_hole);
    
        // screw hole
        translate(
        [
            -platform_width / 2 + screw_hole_offset, 
            platform_length / 2 - screw_hole_offset, 
            -platform_height
        ])
        cylinder(h = platform_height * 2, r = screw_hole);
    
        // screw hole
        translate(
        [
            platform_width / 2 - screw_hole_offset, 
            -platform_length / 2 + screw_hole_offset, 
            -platform_height
        ])
        cylinder(h = platform_height * 2, r = screw_hole);
    
        // screw hole
        translate(
        [
            -platform_width / 2 + screw_hole_offset, 
            -platform_length / 2 + screw_hole_offset, 
            -platform_height
        ])
        cylinder(h = platform_height * 2, r = screw_hole);

        // side cutout
        translate([0, 2.42, 0])
        sphere(d = platform_width * 2.5);

        // side cutout
        translate([0, -2.42, 0])
        sphere(d = platform_width * 2.5);
    }
    
    translate(
    [
        platform_width / 2 - screw_hole_offset, 
        platform_length / 2 - screw_hole_offset, 
        -platform_height - post_height
    ])
    caster_post();

    translate(
    [
        -platform_width / 2 + screw_hole_offset, 
        platform_length / 2 - screw_hole_offset, 
        -platform_height - post_height
    ])
    caster_post();
 
    translate(
    [
        platform_width / 2 - screw_hole_offset, 
        -platform_length / 2 + screw_hole_offset, 
        -platform_height - post_height
    ])
    caster_post();
 
    translate(
    [
        -platform_width / 2 + screw_hole_offset, 
        -platform_length / 2 + screw_hole_offset, 
        -platform_height - post_height
    ])
    caster_post();
    
    
 }
caster_platform();