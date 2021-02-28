// panther box remix

part=3;

s=4.5/3; //scale
gap=0.25;
inset=10;

module panther() {
  scale([s,s,s])
  import("../panter.stl");
}

if (part==1) {
  difference() {
    rotate([90,0,0])
      panther();
    
    translate([-100*s,-100*s,-200*s])
      cube([200*s,200*s,200*s]);
    
    translate([0,-31*s,0])
      cube([inset*s,inset*s,19*s]);
  }
}
else if (part==2) {
  difference() {
    rotate([-90,0,0])
      panther();
    
    translate([-100*s,-100*s,-200*s])
      cube([200*s,200*s,200*s]);
    
    translate([0,21*s,0])
      cube([inset*s,inset*s,28*s]);
  }
}
else {
  wall=1*s;
  side=inset*s-gap;
  intersection(){
    difference() {
      cube([side,side,(19+28)*s-gap-1]);
      translate([wall,wall,0])
        cube([side-2*wall,side-2*wall,(19+28)*s]);
    }
    translate([side/2,side/2,0])
      cylinder($fn=96,h=(19+28)*s,d=1.35*side);
  }
}