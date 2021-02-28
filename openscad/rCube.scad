
$fn=32;

module rCube(size=[40,10,20],r=2) {
    innerSize=[for (s=size)s-2*r];

    for (mix=[[1,1,0],[0,1,1],[1,0,1]]) {
        translate([r*mix[0],r*mix[1],r*mix[2]]) 
        cube([size[0]-2*r*mix[0],size[1]-2*r*mix[1],size[2]-2*r*mix[2]]);
    }

    for (x=[0,1]) {    
        for (y=[0,1]) {        
            for (z=[0,1]) {
                translate([
                    x*(size[0]-2*r)+r,
                    y*(size[1]-2*r)+r,
                    z*(size[2]-2*r)+r]) 
                sphere(r=r);
            }
        }
    }

    for (x=[0,1]) {
        for (y=[0,1]) {
            translate([r+innerSize[0]*x,r+innerSize[1]*y,r])
                cylinder(r=r,h=size[2]-2*r);
        }
    }

    for (y=[0,1]) {
        for (z=[0,1]) {
            translate([r,r+innerSize[1]*y,r+innerSize[2]*z])
            rotate([0,90,0])
                cylinder(r=r,h=size[0]-2*r);
        }
    }

    for (x=[0,1]) {
        for (z=[0,1]) {
            translate([r+innerSize[0]*x,r,r+innerSize[2]*z])
            rotate([-90,0,0])
                cylinder(r=r,h=size[1]-2*r);
        }
    }
}

for(x=[1:25]) {
    translate([x*10,0,0]) rCube();
}
