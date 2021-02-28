use <Getriebe.scad>

$fn = 96;
axle = 4;
rGap = 0.4;
h = 3.5;
modul = 1;

function opt(teeth) = false;//teeth > 15;

function r(teeth) = modul * teeth / 2;

module wheel(teeth, h=h) {
  stirnrad(
        modul = modul, zahnzahl = teeth, breite = h, bohrung = axle + rGap,
        eingriffswinkel = 20, schraegungswinkel = 0, optimiert = opt(teeth));  
}

module gear(t1,t2) {
  wheel(t1,2*h);
  wheel(t2);
}

// 72 = (2+1)*(3+1)*(5+1)
// 1:10 ------
// 1:2 = 24:48
// 1:5 = 12:60
// 1:6 -------
// 1:2 = 24:48
// 1:3 = 18:54
// 1:12 ------
// 1:2 = 24:48
// 1:2 = 24:48
// 1:3 = 18:54

gears = [
  [0,0,0],
  [1, 64, 24],
  [2, 48, 12],
  [3, 60, 24],
  [4, 48, 18],
  [5, 54, 24],
  [6, 48, 24],
  [7, 48, 18],
  [8, 54, 40]
];


for (g=gears) {
  i=g[0];
  t1=g[1];
  t2=g[2];
  
  if (i>0) {
    echo(i,t1,t2);
    if (i%2==0) {
      # translate([i*h+i*rGap,rGap+axle/2+r(72)-2,0]) 
        rotate([3,0,0]) 
          rotate([0,90,0]) 
            gear(t2,t1);
    } else{
      translate([i*h+i*rGap,0,0]) 
        rotate([0,0,0]) 
          rotate([0,90,0]) 
            gear(t2,t1);
    }
  }
  
}
