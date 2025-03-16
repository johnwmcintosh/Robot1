$fa=1;
$fs=0.01;

use <pegs_and_supports.scad>

breadboard_width = 2.12;
breadboard_length = 3.25;
space_around = 1.25;
peg_cutout_offset = .25;

module breadboard_support() {
    difference() {
        cube([breadboard_width + space_around, breadboard_length + space_around, .25],center = true);
        //color("green")
        //cube([breadboard_width, breadboard_length, 1], center = true);

        translate(
        [
        (breadboard_width / 2 + peg_cutout_offset),
        (breadboard_length / 2 + peg_cutout_offset),
        -.25
        ])
        support_peg();
        
        translate(
        [
        -(breadboard_width / 2 + peg_cutout_offset),
        breadboard_length / 2 + peg_cutout_offset, 
        -.25
        ])
        support_peg();

        translate(
        [
        (breadboard_width / 2 + peg_cutout_offset),
        -(breadboard_length / 2 + peg_cutout_offset),
        -.25
        ])
        support_peg();
        
        translate(
        [
        -(breadboard_width / 2 + peg_cutout_offset),
        -(breadboard_length / 2 + peg_cutout_offset),
        -.25
        ])
        support_peg();   
    }

    translate(
    [
    (breadboard_width / 2 + peg_cutout_offset),
    (breadboard_length / 2 + peg_cutout_offset),
    -1.25
    ])
    support_peg();
    
    translate(
    [
    -(breadboard_width / 2 + peg_cutout_offset),
    breadboard_length / 2 + peg_cutout_offset, 
    -1.25
    ])
    support_peg();

    translate(
    [
    (breadboard_width / 2 + peg_cutout_offset),
    -(breadboard_length / 2 + peg_cutout_offset),
    -1.25
    ])
    support_peg();
    
    translate(
    [
    -(breadboard_width / 2 + peg_cutout_offset),
    -(breadboard_length / 2 + peg_cutout_offset),
    -1.25
    ])
    support_peg();   
}
breadboard_support();