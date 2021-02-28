$fn=64;

brush_d=15;
wall=1.2;
length=100;
pipe_d=brush_d+2*wall;
pipe_cnt=6;

module pipe(outer,inner,length,center=true) {
    difference() {
        cylinder(d=outer, h=length, center=center);
        cylinder(d=inner, h=length+1, center=center);
    }
}

for(i=[1:pipe_cnt]) {
    rotate([0,0,i*360/pipe_cnt])
    translate([1.4*pipe_d,pipe_d/2+wall,0])
    rotate([0,-35,0])
    translate([pipe_d/2,pipe_d/2,length/2])
    pipe(pipe_d,brush_d,length);
}

cylinder($fn=100, d=6.5*pipe_d, h=wall, center=false);
pipe($fn=100, 6.5*pipe_d,6.5*pipe_d-2*wall, 3*wall, center=false);