$fa=1;
$fs=0.01;

mc_fins_width = .905;
mc_fins_length = .618;
mc_fins_height = 1.000;

board_height = .0667;
hole_radius = .060;
hole_offset = .065 + hole_radius;

mc_width = 1.69;
mc_length = 1.69;
mc_height = .495;

terminal_two_posts_width = .335;
terminal_three_posts_width = .511;
terminal_length = .231;
terminal_height = .315;

capacitor_radius = .2415 / 2;

module mc() {
    
    difference() {
        cube([mc_width, mc_length, board_height], center = true);
        
        translate(
        [
            (-mc_width / 2 + hole_offset), 
            (-mc_length / 2 + hole_offset), 0 
        ])
        cylinder(h = board_height + .1, r = hole_radius, center = true);
        
        translate(
        [
            (mc_width / 2 - hole_offset), 
            (mc_length / 2 - hole_offset), 0 
        ])
        cylinder(h = board_height + .1, r = hole_radius, center = true);
        
        translate(
        [
            -(mc_width / 2 - hole_offset), 
            (mc_length / 2 - hole_offset), 0 
        ])
        cylinder(h = board_height + .1, r = hole_radius, center = true);
        
        translate(
        [
            (mc_width / 2 - hole_offset), 
            -(mc_length / 2 - hole_offset), 0 
        ])
        cylinder(h = board_height + .1, r = hole_radius, center = true);
    }
    
    // fins
    translate(
    [
        -mc_fins_width / 2, 
        mc_length / 2 - mc_fins_length,
        0
    ])
    cube([mc_fins_width, mc_fins_length, mc_fins_height]);
    
    // two post one
    translate(
    [
        mc_width / 2 - terminal_length, 
        -terminal_two_posts_width, 
        board_height - .05
    ])
    cube([terminal_length, terminal_two_posts_width, terminal_height]);
    
    // two post two
    translate(
    [
        -mc_width / 2,  
        -terminal_two_posts_width, 
        board_height - .05
    ])
    cube([terminal_length, terminal_two_posts_width, terminal_height]);
    
    // three post
    translate(
    [
        hole_offset * 2 - mc_width / 2, 
        -mc_length / 2, 
        board_height - .05
    ])
    cube([terminal_three_posts_width, terminal_length, terminal_height]);
    
    // capacitor one
    translate(
    [
        hole_offset * 2 - mc_width / 2 + terminal_three_posts_width / 2,
        -terminal_two_posts_width / 2,
        board_height - .05
    ])
    cylinder(h = terminal_height, r = capacitor_radius);
    
    // capacitor two
    translate(
    [
        capacitor_radius,
        -capacitor_radius * 4,
        board_height - .05
    ])
    cylinder(h = terminal_height, r = capacitor_radius);}
mc();