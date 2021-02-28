// Klimmzugstangenschutz

$fn=32;

//43
//cube([75,48.5,15], center=true);
widthBottom=50.5;
widthTop=43;
height=15;
stroke=3;
length=75;

sideHoleR=4;
bottomHoleR=5;

difference() {
  
linear_extrude(length)
polygon(points=[
  [0,0],
  [(widthBottom-widthTop)/2,height],
  [(widthBottom-widthTop)/2-stroke,height],
  [-stroke*1.4,-stroke],
  [widthBottom+stroke*1.4,-stroke],
  [2*stroke+widthTop,height],
  [1*stroke+widthTop,height],
  [widthBottom,0]
  ],convexity=10);
  
  translate([-10,7,15]) rotate([0,90,0]) cylinder(r=sideHoleR,h=100);
  translate([-10,7,30]) rotate([0,90,0]) cylinder(r=sideHoleR,h=100);
  translate([-10,7,45]) rotate([0,90,0]) cylinder(r=sideHoleR,h=100);
  translate([-10,7,60]) rotate([0,90,0]) cylinder(r=sideHoleR,h=100);
  
  translate([16,7,15]) rotate([90,90,0]) cylinder(r=bottomHoleR,h=20);
  translate([16,7,30]) rotate([90,90,0]) cylinder(r=bottomHoleR,h=20);
  translate([16,7,45]) rotate([90,90,0]) cylinder(r=bottomHoleR,h=20);
  translate([16,7,60]) rotate([90,90,0]) cylinder(r=bottomHoleR,h=20);
  
  translate([34,7,15]) rotate([90,90,0]) cylinder(r=bottomHoleR,h=20);
  translate([34,7,30]) rotate([90,90,0]) cylinder(r=bottomHoleR,h=20);
  translate([34,7,45]) rotate([90,90,0]) cylinder(r=bottomHoleR,h=20);
  translate([34,7,60]) rotate([90,90,0]) cylinder(r=bottomHoleR,h=20);
}