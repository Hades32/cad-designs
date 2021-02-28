size=[52, 160, 41];
cable_d=12;
wall=5;
screw_d=2.5;
gap=0.8;

outer_size=[size[0]+2*wall,size[1]/3*2+wall,size[2]+2*wall];
$fn=64;

module power_box() {
    cube(size);
    // cord
    translate([size[0]/2,0,size[2]/2])
    rotate([90,0,0]) 
        cylinder(h=size[1]/5,d=cable_d);
}

module wall_box_massive() {
    minkowski($fn=16) {
        cube(outer_size);
        sphere($fn=32);
    }
    translate([0,outer_size[1]/4,0]) 
        screw_hole();
    translate([0,outer_size[1]/4*3,0]) 
        screw_hole();
    translate([outer_size[0],outer_size[1]/4,0]) 
        rotate([0,0,180])
        screw_hole();
    translate([outer_size[0],outer_size[1]/4*3,0]) 
        rotate([0,0,180])
        screw_hole();
}

module wall_box() {
    difference() {
        wall_box_massive();
        
        translate([wall,wall,wall]) {
            resize([for (s=size) s+gap]) 
                    power_box();
            // ceiling opening
            translate([wall,wall*2,wall*2]) 
                cube([size[0]-2*wall,size[1],size[2]]);
        }
        // cable opening
        translate([outer_size[0]/2-cable_d*2/3/2,-2,outer_size[2]/2])
            cube([cable_d*2/3,outer_size[1],outer_size[2]]);
        // flat bottom
       translate([0,0,-size[2]*50]) cube([for (s=size) 100*s], center=true);
    }
}

module screw_hole() {
    difference() {
        translate([-2.5*screw_d,0,0]) {
            difference() {
                minkowski($fn=16) {
                    translate([2.5*screw_d,0,0]) 
                    resize([10*screw_d,0,0]) 
                    cylinder($fn=32, d=5*screw_d, h=wall);
                    sphere(1);
                }
                cylinder(d=screw_d, h=wall*2);
            }
        }
        translate([0,-5*screw_d,-0.1]) 
            cube([10*screw_d,10*screw_d,10*screw_d]);
    }
}

//minkowski() {
    wall_box();
    //sphere(r=0.4);
//}