$fa=1;
$fs=0.01;

// Constants
board_x = 3.33;  // Length
board_y = 2.3;  // Width
board_z = .15; // Thickness
mount_hole_d = 2.7; // Mounting hole diameter
mount_hole_offset_x = 3.5; // Distance from board edge
mount_hole_offset_y = 3.5; // Distance from board edge

module rp5() {
    // Raspberry Pi 5 Model in OpenSCAD
    // Simplified for fitting and enclosure design
    usb_ports();
    hdmi_ports();
    gpio_header();
}
//rp5();

// Function to place mounting holes
module mount_holes() {
    for (x = [mount_hole_offset_x, board_x - mount_hole_offset_x])
    for (y = [mount_hole_offset_y, board_y - mount_hole_offset_y]) {
        translate([x, y, 0])
        cylinder(h = 5, d = mount_hole_d, center = true);
    }
}

// Board shape
module board() {
    color("green")
    cube([board_x, board_y, board_z]);
}

// USB Ports
module usb_ports() {
    color("silver")
    translate([board_x - 15, board_y - 16, board_z])
    cube([15, 16, 10]);
}

// HDMI Ports
module hdmi_ports() {
    color("black")
    translate([board_x - 40, board_y - 10, board_z])
    cube([15, 10, 5]);
}

// GPIO Header
module gpio_header() {
    color("black")
    translate([2, board_y - 5, board_z])
    cube([52, 5, 10]);
}

// Assemble the Raspberry Pi 5 model
difference() {
    board();
    mount_holes();
}