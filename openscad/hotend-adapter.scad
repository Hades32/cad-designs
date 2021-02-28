// Hotend Adapter

$fn=128;

ngap=1;

top_d=20.1;
top_size=[40,36,4.8];
top_hole_size=[32,18];
hole_d=2.6;
holes_pos=[for (x=[-1,1]) for (y=[-1,1]) 
    [x*top_hole_size[0]/2,y*top_hole_size[1]/2] 
    ];

echo(holes_pos);

difference() {
    cube(top_size, center=true);
    cylinder(h=100,d=top_d, center=true);
    translate([0,-50,0]) cube([top_d-ngap,100,100],center=true);
    for (hole_pos=holes_pos) {
        translate(hole_pos) cylinder(h=100,d=hole_d, center=true);
    }
}
