$fa=1;
$fs=0.4;

////////////////////////////////////////////////
tobsun_shelf_width = 2.91;
tobsun_shelf_length = 2.4;
tobsun_shelf_height = 1.3;

module tobsun_tray() {
    difference() {
        translate([0, 0, 0])
        cube([tobsun_shelf_width, tobsun_shelf_length, tobsun_shelf_height]);
        
        // cut out
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