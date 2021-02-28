use <Getriebe.scad>
use <MCAD/layouts.scad>

$fn = 96;
dist = 45;
axle = 5;
rGap = 0.4;
h = 3.5;
modul = 1;
teeth = 12;

gearGap = 1.1;
gearOverlap = 1.5;

function add(v, i=0, r=0, e=9999) = i<len(v) && i<e ? 
            add(v, i=i+1, r=r+v[i], e=e) : r;

module Pole(d1, d2, h1, h2) {
  difference() {
    union() {
      linear_extrude(height = h1, convexity = 10) { circle(d = d1); }
      linear_extrude(height = h2, convexity = 10) { circle(d = d2); }
    }
    linear_extrude(height = h2 + 0.1, convexity = 10) { circle(d = d2 / 2); }
  }
}

gears = [
  teeth,
  teeth*1.5,
  teeth*2
];
gearDiams = [
  for (teeth=gears) modul * teeth + 2 * modul
];
gearDiamWGaps = [
  for (g=gearDiams) g + gearGap
];
echo("gearDiamWGaps", gearDiamWGaps);
xOffs = [
  for (i=[0:len(gearDiamWGaps)-1]) add(gearDiamWGaps, i=0, r=0, e=i)
];
echo("xOffs",xOffs);

i = 0;
xOff = 0;
for (i=[i:len(gears)-1]) {
  teeth = gears[i];
  gearDiam = gearDiams[i];
  gearDiamWGap = gearDiamWGaps[i];
  xOff = xOffs[i];
  echo(i,teeth,gearDiam,gearDiamWGap,xOff);
  
  translate([ xOff, 0, 0 ]) 
  rotate([0,0,i*40])
    stirnrad(
      modul = modul, zahnzahl = teeth, breite = h, bohrung = axle + rGap,
      eingriffswinkel = 20, schraegungswinkel = 0, optimiert = true);

  translate([ xOff, -50, 0 ]) {
    difference() {
      cube([ gearDiamWGap, 30, 3 ]);
//      translate([ gearDiam * 0, 15, 0 ]) sphere(10);
//      translate([ gearDiam * 1, 15, 0 ]) sphere(10);
    }
    translate([ gearDiamWGap * 0.5, 15, 0 ])
        Pole(d1 = 7, h1 = 4, d2 = axle, h2 = 10);
  }
}
//
// grid(dist,dist) {
//
//  stirnrad (modul=modul, zahnzahl=teeth, breite=h, bohrung=axle+rGap,
//  eingriffswinkel=20, schraegungswinkel=0, optimiert=true); stirnrad
//  (modul=modul, zahnzahl=teeth*1.5, breite=h, bohrung=axle+rGap,
//  eingriffswinkel=20, schraegungswinkel=0, optimiert=true);
//
//  stirnrad (modul=modul, zahnzahl=teeth*2, breite=h, bohrung=axle+rGap,
//  eingriffswinkel=20, schraegungswinkel=0, optimiert=true);
//
//  translate([-gearDiam/2,0,0])
//  union() {
//    difference() {
//      cube([gearDiam*2*3,30,3]);
//      translate([gearDiam*0,15,0]) sphere(10);
//      translate([gearDiam*1,15,0]) sphere(10);
//      translate([gearDiam*2,15,0]) sphere(10);
//      translate([gearDiam*3,15,0]) sphere(10);
//    }
//    translate([gearDiam,WGap*0.5,15,0]) Pole(d1=7,h1=4,d2=axle,h2=10);
//    translate([gearDiamWGap*1.5,15,0]) Pole(d1=7,h1=4,d2=axle,h2=10);
//    translate([gearDiamWGap*2.5,15,0]) Pole(d1=7,h1=4,d2=axle,h2=10);
//  }
//}
//
