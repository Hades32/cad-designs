use <threads-library-by-cuiso-v1.scad>


diameter=6; 
lenTip=4;
lenRod=10; 
cubeSize=12;

union() {
  thread_for_screw(diameter=diameter, length=lenRod+lenTip);
  translate([0,0,lenTip/2]) cylinder($fn=6, h=lenTip, r=1.5*diameter/2, center=true);
}

translate([0,cubeSize/2+diameter/2+10,0]){
  difference() {
    translate([0,0,6]) cube([cubeSize,cubeSize,cubeSize], center=true);
    translate([0,0,cubeSize-lenRod]) thread_for_nut(diameter=diameter, length=lenRod);
  }
}
