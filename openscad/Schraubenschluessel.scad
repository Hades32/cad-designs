$fn = 50;

h=3;
diam=38.5;

//#cylinder(d=33,h=10);

difference($fn=10)
{
  minkowski()
  {
    union()
    {
      translate([ diam/2, -0.7*diam/2, 0 ]) {
        cube([ 1.5*diam, 0.7*diam, h ]); 
      }
      linear_extrude(h) { 
        circle(d = 1.5*diam); 
      }
    }
    sphere(d=1);
  }
  translate([ 0, 0, -1 ]) {
    cylinder($fn = 6, h = h+2, d = diam); 
  }
  translate([ diam/2+(1.5*diam-0.8*1.5*diam)/2, -0.6*0.7*diam/2, 0.8*h ]) {
    cube([ 0.8*1.5*diam, 0.6*0.7*diam, h ]); 
  }
}
translate([ diam/20+diam/2+(1.5*diam-0.8*1.5*diam)/2, diam/20, 0.8*h ]) {
  linear_extrude(0.2*h)
  {
    text("Martins Treppen-", size = diam/10, font = "Arial:style=Bold");
  }
}
translate([ diam/20+diam/2+(1.5*diam-0.8*1.5*diam)/2, -diam/10, 0.8*h ]) {
  linear_extrude(0.2*h)
  {
    text("Schlüssel", size = diam/10, font = "Arial:style=Bold");
  }
}