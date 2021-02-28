$fn=30;

rotate([0,-90,0])
resize([40,0,0],auto=[false,true,true])
import("../The_Lemon/The_LEMON.stl");

minkowski(){
  translate([-6,20.5,45.5])
  rotate([0,-90,0])
  linear_extrude(2){
  difference() {
  circle(d=8);
    circle(d=4);
  }
  }
  sphere(0.5);
}