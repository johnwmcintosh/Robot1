$fa=1;
$fs=0.01;

use <caster_platform.scad>


caster_radius = 0.986 / 2;

wheel_radius = 0.986 / 2;
wheel_width = 0.500;

module caster() {
    caster_platform();
}
caster();