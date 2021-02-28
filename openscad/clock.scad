use <MCAD/gears.scad>
use <MCAD/layouts.scad>

$fn=50;

module gear3d(height,teeth) {
  linear_extrude(height = height, convexity = 10,
                     twist = -45)
          gear(teeth, circular_pitch = false, diametral_pitch = 1,
               pressure_angle = 20, clearance = 1);
}

module ClockWheel(size, cSize, height = 10, min = 1, max = 12, axle = 10) {
  cnt = max - min + 1;
  // cSize=2*size+size*1.8*cnt/PI;
  difference() {
    union() {
      linear_extrude(height = height, convexity = 10) {
        difference() {
          circle(d = cSize);
          for (i = [min:max])
            rotate([ 0, 0, -i * 360 / cnt ]) 
              translate([ 0, cSize * 0.45, 0 ])
                text(str(i), size = size, font = "Arial", 
                  valign = "top", halign = "center");
        }
      }
      gear3d(teeth=200/cnt,height=2 * height);
    }
    linear_extrude(height = 10*height, convexity = 20) 
      circle(d = axle);
  }
}

list(95) {
  ClockWheel(size = 20, cSize = 110, min = 0, max = 9);
  ClockWheel(size = 20, cSize = 110, min = 0, max = 5);
  ClockWheel(size = 20, cSize = 110, min = 0, max = 9);
  ClockWheel(size = 20, cSize = 110, min = 0, max = 2);
}