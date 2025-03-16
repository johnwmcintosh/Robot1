$fa=1;
$fs=0.01;

use <pegs_and_supports.scad>

////////////////////////////////////////////////
lidar_tray_width = 2.8;
lidar_tray_length = 3.2;
lidar_tray_height = .2;

lidar_front_pegs = 2.15;
lidar_back_pegs = 1.53;
lidar_front_to_back = 2.65;
lidar_screw_radius = .1;

module lidar_tray() {
    difference() {
        cube([lidar_tray_width, lidar_tray_length, lidar_tray_height]);
        
        // screw pair
        translate([.3, .2, -.5])
        cylinder(h=1, r = lidar_screw_radius);
        
        translate([.3 + lidar_front_pegs, .2, -.5])
        cylinder(h=1, r = lidar_screw_radius);
        
        // screw pair
        translate([1.4 - lidar_back_pegs /2,.2 + lidar_front_to_back, -.5])
        cylinder(h=1, r = lidar_screw_radius);
        
        translate([1.4 + lidar_back_pegs /2, .2 + lidar_front_to_back, -.5])
        cylinder(h=1, r = lidar_screw_radius);
        
        // solitary peg
        translate([lidar_tray_width / 2, lidar_tray_length - 1, -.1])
        support_peg(h=.4, r=.2);
        
        // peg pair
        translate([.2 + lidar_front_pegs, .75, -.1])
        support_peg(h=.4, r=.2);
       
        translate([.4, .75, -.1])
        support_peg(h=.4, r=.2);
    }
    
    translate([.4, .75, -1.5])
    support_peg();

    translate([.2 + lidar_front_pegs, .75, -1.5])
    support_peg();

    translate([lidar_tray_width / 2, lidar_tray_length - 1, -1.5])
    support_peg();
}
lidar_tray();
