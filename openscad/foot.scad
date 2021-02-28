
module foot_down(d,h, feet=4, n=1)
{
    intersection(){
      for (i=[0:feet-1]) {
        rotate([0,-45,i*360/feet])
          cylinder($fn=6, h=2*h, r=d);
      }
      translate([-2*h,-2*h,0])
        cube([4*h,4*h,h]);
    }
    if (n > 1) {
        for (i=[0:feet-1])
          rotate([0,0,i*360/feet])
            translate([-h,0,h])
              foot_down(d=d,h=h,feet=feet,n=n-1);
    }
}

module foot(d,h,feet=4,n=1) {
  translate([0,0,n*h]) {
    translate([0,0,-2*d/2])
      cylinder(h=2*d, r=3*d, center=true);
    mirror([0,0,1])
      foot_down(d,h,feet=feet,n=n);
  }
}

foot(1.2, 14, n=4, feet=4);

// TODO brickwall tower