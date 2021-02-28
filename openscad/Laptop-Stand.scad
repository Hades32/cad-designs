// Klimmzugstangenschutz

$fn=32;

height=200;
width=220;
depth=200;
thickness=10;

footThickness=20;

fanThickness=4;

difference() {
  minkowski() {
    cube([width-4,depth-4, thickness-2], center=true);
    sphere(2);
  }
  for(i=[-4 : 4]) {
    translate([0,depth/2/5*i,0]) 
      rotate([35,0,0]) 
        cube([width-4*thickness, depth, fanThickness], center=true);
  }
}

difference() {
  union() {
    translate([width/2-thickness,0,height/2+thickness/2]) 
      cube([thickness,depth-footThickness, height], center=true);
    translate([-width/2+thickness,0,height/2+thickness/2]) 
      cube([thickness,depth-footThickness, height], center=true);
  }
  translate([-depth/2-footThickness/2,0,height/2]) rotate([0,90,0]) cylinder(d=depth-footThickness*4,h=width);
}