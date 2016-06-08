$fn = 30;  // degree of rendering detail

rightangle = 90;
length = 70; // x
length_sides = 67.5; // x
width = 37.5; // y
start_x = 3.5;
start_y = 3.75;
x_gap = 7;
y_gap = 7.5;
step = 3;
base_height = 4.5;
diameter = 4.5;

difference() {
    union() {
        for(y = [0:4]) {
            difference(){
                translate([0, y * y_gap, 0])
                    cube([length, y_gap, y * step + base_height]);
                start_y = start_y + (y * y_gap);
                for(x = [0:9]) {
                    start_x = start_x + (x * x_gap);
                    translate([start_x, start_y, -0.5])
                        cylinder(y * step + base_height + 1, d = diameter);
                }
            }
        }
    }

    translate([2.5, 0, -5])
        rotate([0, 0, 135])
            cube([5, 3, 30]);

    translate([length, 2.5, -5])
        rotate([0, 0, 225])
            cube([5, 3, 30]);

    translate([0, width + 2.5, 0])
        rotate([0, 0, 225])
            cube([5, 3, 30]);

    translate([length + 2.5, width, -5])
        rotate([0, 0, 135])
           cube([5, 3, 30]);
}
