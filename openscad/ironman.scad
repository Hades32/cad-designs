// ironman box

figure=false;
box=true;

module ironman() {
  resize([0,0,100], auto=[true,true,false])
          translate([-160,-125,-16])
            import("../IronManShooting_fixed.off");
}

boxHeight=35;
boxRad=35;
$fn=200;


module box() {
  translate([0,0,boxHeight/2/2]) {
    minkowski($fn=20) {
      intersection() {
        cylinder($fn=200, r=35,h=boxHeight/2);
        cutWidth=boxRad*1.5;
        cutDepth=boxRad*1.5;
        gap=10;
        translate([-cutWidth/2,-cutDepth/2-gap,0])
          cube([cutWidth,cutDepth,cutWidth/2]);
      }
      sphere(r=1.2);
    }
  }
}

if (figure) {
  difference() {
    union(){
      translate([0,0,boxHeight-3]) ironman();
      cylinder(r=boxRad,h=boxHeight);
    }
    box();
  }
}

if (box) {
  s=0.98;
  scale([s,s,s]) {
    difference() {
      box();
      translate([0,-1,5]) scale([0.9,0.9,0.9]) box();
    }
    translate([0,-39,17]){
      minkowski($fn=20) {
        cube([6,7,2], center=true);      
        sphere(r=1.2);
      }
    }
  }
}