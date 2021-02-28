module SoftCube(size) {
  x=size[0];
  y=size[1];
  z=size[2];
  if (x>y) {
    translate([0,y,0]) rotate([0,0,-90]) SoftCube([y,x,z]);
  } else {
    translate([x/2,x/2,0]) linear_extrude(z) circle(x/2);
    translate([0,x/2,0]) cube([x,y-x,z]);
    translate([x/2,x/2+y-x,0]) linear_extrude(z) circle(x/2);
  }
}

segments = [
  [[0,2,0],[0,0,-90]],
  [[0,1,0],[0,0,0]],
  [[1,1,0],[0,0,0]],
  [[0,1,0],[0,0,-90]],
  [[0,0,0],[0,0,0]],
  [[1,0,0],[0,0,0]],
  [[0,0,0],[0,0,-90]],
];
activeSegments=[
[1,1,1,0,1,1,1], //0
[0,0,1,0,0,1,0], //1
[1,0,1,1,1,0,1], //2
[1,0,1,1,0,1,1], //3
[0,1,1,1,0,1,0], //4
[0,1,0,0,1,0,0], //5
[1,1,0,1,1,1,1], //6
[1,0,1,0,0,1,0], //7
[1,1,1,1,1,1,1], //8
[1,1,1,1,0,1,1], //9
];

//SoftCube($fn=30,[60,10,4]);
//SoftCube($fn=30,[10,60,4]);

module segment8(active=[1,1,1,1,1,1,1,1],size=100, h=4) {
  $fn=30;
  width=size/3/6;
  gap=width;
  for (i=[0:len(segments)-1]) {
    if (active[i]==1) {
      s=segments[i];
      translate(s[0]*size/3) rotate(s[1]) translate([-width/2,gap/2,0]) SoftCube([width,size/3-gap,h]);
    }
  }
}

module segment(n,size=100, h=4) {
  segment8(active=activeSegments[n],size=size,h=h);
}

segment(9);
