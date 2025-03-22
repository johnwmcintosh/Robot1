post_height = 0.467;
screw_hole = 0.04;

module caster_post() {
    difference() {
        cylinder(h = post_height, r = screw_hole * 1.5);
        translate([0, 0, -.25])
        cylinder(h = post_height + .4, r = screw_hole - .02);
    }
}
//caster_post();