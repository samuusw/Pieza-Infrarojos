h=20;
diamc=17;
X=45;
B=15;
b=7;
h=40;
module piezabase(){
translate([0, 0, 20])
difference(){
translate([25, 0, 0])
translate([0, 0, 20])
rotate([90, 0, 90])
linear_extrude(height=50, center=true)
polygon(points=[
    [-B/4, -h/2],
    [-b/2, h/2],
    [b/2, h/2],
    [B/4, -h/2],
    [B, -h],
    [-B, -h],
    ]);

translate([38.5, 25, 30])
rotate([90, 0, 0])
cylinder(r=diamc/2, h=50, $fn=50);

translate([11.5, 25, 30])
rotate([90, 0, 0])
cylinder(r=diamc/2, h=50, $fn=50);
}
}

module piezacorte(){
difference(){
piezabase();
translate([-10, -19, 5])
cube([70, 15, 20]);
}
}

module piezaserv(){
difference(){
piezacorte();
translate([25, -9, -1])
cylinder(r=5, h=2,$fn=30);
}
}

module piezafin(){
difference(){
piezaserv();
translate([25, -9, -10])
cylinder(r=1, h=40,$fn=30);
}
}

piezafin();

