
s=1;

difference() {
  translate([0,0,1*s])
  scale([s,s,s])
  rotate([90,0,0])
  import("../Ogre_01.stl");

 // # 
  translate([30*s,-20*s,103*s])
  rotate([0,90-20,-10])
  cylinder(d=20*s,h=60*s);
}

translate([0,-50*s,0])
cube([80*s,50*s,2*s]);


// fill


s=0.89;

difference() {
  intersection() {
    translate([0,0,1*s])
    scale([s,s,s])
    rotate([90,0,0])
    import("../Ogre_01.stl");

   // # 
    translate([30*s,-20*s,103*s])
    rotate([0,90-20,-10])
    cylinder(d=20*s,h=60*s);
  }

translate([30*s,-20*s,103*s])
  rotate([0,90-20,-10])
  translate([0,0,-0.1])
  cylinder(d=16.5*s,h=40*s);
}

translate([70*s,-27*s,118*s])
rotate([0,90-20,-10])
cylinder(d=s*3,h=s*12);

//translate([0,-50*s,0])
//cube([80*s,50*s,2*s]);
