use <MCAD/layouts.scad>;

gap=0.2;
box_size=[38+gap, 38+gap, 280];
capsule_h=29;
capsule_d1=24;
capsule_d2=29.5;
capsule_d3=37;

storage_wall=2;
storage_h=(3*box_size[0]+6*storage_wall);

block_size=[3*box_size[0]+6*storage_wall, 3*box_size[1]+6*storage_wall, storage_h];

module NespressoBox() {    
    color("gray") cube(box_size);
}

module NespressoCapusle() {
    $fn=64;
    color("brown") cylinder(h=capsule_h, d1=capsule_d2, d2=capsule_d1);
    color("darkgray") cylinder(h=1,d=capsule_d3);
}

module NespressoBlock() {
    wall_off=[-2*storage_wall, -2*storage_wall, storage_wall];
    translate([for (o=wall_off) -o])
    difference() {
        translate(wall_off)
            cube(block_size);
        grid(box_size[0]+storage_wall, box_size[1]+storage_wall) {
            NespressoBox();
            NespressoBox();
            NespressoBox();
            NespressoBox();
            NespressoBox();
            NespressoBox();
            NespressoBox();
            NespressoBox();
            NespressoBox();
        }
    }
}

module NesspressoBlockJoint() {
    difference() {
        rotate([0,-90+45/2,0])
        translate([for(o=block_size) o/-2])
            NespressoBlock();
        translate([500,0,0])
            cube([1000,1000,1000], center=true);
    }

    difference() {
        rotate([0,90-45/2,0])
        translate([for(o=block_size) o/-2])
            NespressoBlock();
        translate([-500,0,0])
            cube([1000,1000,1000], center=true);
    }
}

translate([0,0,block_size[2]/2])
difference() {
    rotate([0,45/2,0])
        NesspressoBlockJoint();    
    translate([500+capsule_d3*1.2,0,0])
        cube([1000,1000,1000], center=true);
}
//stopper
translate([capsule_d3*1.1, 0, storage_wall*2])
    cube([2.5,block_size[1],4], center=true);
translate([capsule_d3*1.1, 0, storage_wall*3+box_size[1]])
    cube([2.5,block_size[1],4], center=true);
translate([capsule_d3*1.1, 0, storage_wall*4+2*box_size[1]])
    cube([2.5,block_size[1],4], center=true);
// feet
difference() {
    union() {
        translate([-block_size[0],-40,50/1.6/2])
        rotate([0,45,0])
            cylinder($fn=64, d=20, h=block_size[0], center=true);
        translate([-block_size[0],40,50/1.6/2])
        rotate([0,45,0])
            cylinder($fn=64, d=20, h=block_size[0], center=true);
    }
    translate([0,0,-500])
        cube([1000,1000,1000], center=true);
}