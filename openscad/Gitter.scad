
module kasten(size=100,wall=10){
  buffer=10;
  translate([size/2,size/2,size/2])
  difference() {
    cube([size,size,size],center=true);
    cube([size-wall,size-wall,size+buffer],center=true);
    cube([size-wall,size+buffer,size-wall],center=true);
    cube([size+buffer,size-wall,size-wall],center=true);
  }
}

module gitter(n=3,s=20,w=2.4) {
  range=[for(i=[0:n-1]) i];
  sw=s-w/2;

  kasten(sw*(len(range)-1)+s,2*w);
  for(x=range){
    for(y=range){
      for(z=range){
        echo(x,y,z);
        translate([x*sw,y*sw,z*sw])
        kasten(s,w);
      }
    }
  }
}

gitter(n=3,s=15,w=2);

translate([40,0,40])
rotate([45,90-atan(1.414),0])
cylinder(h=3, r=15);


h1=25;
translate([46,-7,h1/2])
rotate([0,0,40])
cube([14,2,h1], center=true);


h2=30;
translate([46,-7,h2/2])
rotate([0,0,40])
cube([14,1.2,h2], center=true);
