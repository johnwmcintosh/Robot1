use <tobsun_parts.scad>
use <lidar_parts.scad>
use <engine_holders.scad>
use <pegs_and_supports.scad>
use <breadboard_support.scad>
use <motor_controller.scad>

main_box_width = 6.5;
main_box_length = 11.5;
main_box_height = 3;

battery_holder_width = 3.5;
battery_holder_length = 2.9;
battery_holder_height = 4;

difference() {
    // main box
    translate([0,0,main_box_height])
    cube([main_box_width, main_box_length, main_box_height]);

    // hollow out main box
    translate([.2, 3.2, main_box_height + .2])
    cube([main_box_width - .4, 9, 2.6]);

    // battery holder
    translate([1.5,-0.2, main_box_height + .2])
    cube([battery_holder_width, battery_holder_length, battery_holder_height]);

    // hollowed cut out 1
    translate([-.2,3.8, main_box_height + .2])
    cube([6.9, 3, 2.55]);

    // hollowed cut out 2
    translate([-.2,7.6, main_box_height + .2])
    cube([6.9, 3, 2.55]);
 
    // lidar wire cutout
    translate([main_box_width/2, main_box_length / 2 + .5, main_box_height * 2 - 1])
    cylinder(h=2, r=.5);

    // mid shelf wire cutout
    translate([.5, main_box_length * .55, main_box_height - .2])
    cube([main_box_width - 1, .5, .6]);
    
    // tobsun chassis shelf cutout
    translate([1.8,2.3, main_box_height + 1.7])
    tobsun_chassis_cutout();
}


// tobsub tray    
translate([1.8,2.7, main_box_height + 1.7])
tobsun_tray();

// lidar
translate([3.2 - 2.8/2, 7.5, main_box_height * 2 + 1.35])
lidar_tray();

// back strap
translate([0, 0,  main_box_height + 1])
cube([main_box_width, .2, 1]);

// breadboard
translate([main_box_width / 2, 9.25, 4.25])
rotate([0,0,90])
breadboard_support();

// lower level
difference() {
    cube([main_box_width, main_box_length, main_box_height]);
    translate([.2, -.2, .2])
    cube([main_box_width -.4, main_box_length + .4, main_box_height - .1]);
    
    // hollowed cut out 1
    translate([-.2, 3.8, .2])
    cube([6.9, 3, 2.55]);

    // hollowed cut out 2
    translate([-.2, 7.6, .2])
    cube([6.9, 3, 2.55]);

    // engine holder left edge cutouts
    translate([6.49, 8, .25])
    rotate([0,180,0])
    engine_holder_cutouts();

    // engine holder right edge cutouts
    translate([0,8, 0])
    engine_holder_cutouts();
}
translate([main_box_width / 2,main_box_length / 2,.3])
rotate([0,0,180])
mc();

//difference() {
//
//    // interior shelf
//    translate([0,3.2,1.5])
//    cube([6.5,8.3, .2]);
//
//    // battery left cut out
//    translate([2,0,.2])
//    cube([.2, 4, 2.7]);
//
//    // battery right cut out
//    translate([4.2,0,.2])
//    cube([.2, 4, 2.7]);
//
//    // cross cut out 1
//    translate([.5,5.8,1.35])
//    cube([5.5,.2, .5]);
//
//    // cross cut out 2
//    translate([.5,9.4,1.35])
//    cube([5.5,.2, .5]);
// }
 
 translate([10,0,0])
 scale([.1,.1,.1])
 support_piece();
