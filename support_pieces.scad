$fa=1;
$fs=0.4;

////////////////////////////////////////////////
module support_peg() {
    cylinder(h = .75, r = .2);
    //translate([0,0,.3])
    //cylinder(h = .5, r=.4);
}
//translate([.4,.7,-2.1 ])
//support_peg();

////////////////////////////////////////////////
module support_piece() {
    difference() {
        primary_piece();
        
        rotate([90,0,0])
        translate([2.2,4,-3])
        cylinder(h=5, r=1);
               
        translate([1.2, -1.5, 4.2])
        cube([2, 4, 3.6]);
         
        rotate([90,0,0])
        translate([2.2,8,-3])
        cylinder(h=5, r=1);
         
        rotate([90,0,0])
        translate([2.2,11.8,-3])
        cylinder(h=5, r=1);
    } 
}
//support_piece();

module primary_piece() {
    cube([4.4, 1.1, 14]);
    translate([-.8,0,0])
    cube([6,1.1, 2.1]);
}

////////////////////////////////////////////////
tobsun_shelf_width = 2.91;
tobsun_shelf_length = 2.4;
tobsun_shelf_height = 1.3;

module tobsun_tray() {
    difference() {
        color("blue")
        translate([0, 0, 0])
        cube([tobsun_shelf_width, tobsun_shelf_length, tobsun_shelf_height]);
        
        // cut out
        color("blue")
        translate([.1, -.2, .2])
        cube([tobsun_shelf_width -.2, tobsun_shelf_length, tobsun_shelf_height +.2]);
        
        // tobsun tray wire cutout left
        translate([-1, tobsun_shelf_length - 1.9,tobsun_shelf_height - 0.8])
        rotate([0,90,0])
        cylinder(h=2, r=.2);

        // tobsun tray wire cutout right
        translate([tobsun_shelf_width - 1, tobsun_shelf_length - 1.9,          tobsun_shelf_height - 0.8])
        rotate([0,90,0])
        cylinder(h=2, r=.2);
    }
}
//tobsun_tray();

////////////////////////////////////////////////
module tobsun_chassis_cutout() {
    tobsun_chassis_cutout_width = 2.91;
    tobsun_chassis_cutout_length = 2.8;
    tobsun_chassis_cutout_height = 1.4;
    
    // tobsun chassis shelf cutout
    translate([0,0,0])
    cube([tobsun_chassis_cutout_width,tobsun_chassis_cutout_length,tobsun_chassis_cutout_height]);
    
    // tobsun chassis wire cutout left
    translate([2.4,.9,.5])
    rotate([0,90,0])
    cylinder(h=1, r=.2);

    // tobsun chassis wire cutout right
    translate([-.5,.9,.5])
    rotate([0,90,0])
    cylinder(h=1, r=.2);
}
//tobsun_chassis_cutout();

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
        cylinder(h=.4, r=.2);
        
        // peg pair
        translate([.2 + lidar_front_pegs, .75, -.1])
        cylinder(h=.4, r=.2);
       
        translate([.4, .75, -.1])
        cylinder(h=.4, r=.2);
    }
    
    translate([.4, .75, -1.5])
    support_peg();

    translate([.2 + lidar_front_pegs, .75, -1.5])
    support_peg();

    translate([lidar_tray_width / 2, lidar_tray_length - 1, -1.5])
    support_peg();
}
//lidar_tray();

////////////////////////////////////////////////
module engine_holder_cutouts() {
    translate([-.03, 1,-.10])
    cube([.11, .45, .4 ]);

    translate([.73, 1,-.10])
    cube([.11, .45, .4 ]);

    translate([1.88,0,-.10])
    rotate([0,0,90])
    cube([.15, 1.9, .4]);
}
//engine_holder_cutouts();


