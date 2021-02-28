$fn=64;

width=11.5;
length=35.2;
height=17.5;

thick=1.4;

difference() {
  translate([0,0,thick])
    minkowski() {
      cube([width,length,height], center=true);
      sphere(thick);
    }
  cube([width,length,height], center=true);
}