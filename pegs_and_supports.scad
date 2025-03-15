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


