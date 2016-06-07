$fn = 30;  // degree of rendering detail

rightangle = 90;
length = 70; // x
length_sides = 67.5; // x
width = 37.5; // y
start_x = 3.5;
start_y = 3.75;
x_gap = 7;
y_gap = 7.5;
step = 1.6;
base_height = 3.5;
diameter = 5;

difference() {
    union() {
        for(x = [0:9]) {
            difference(){
                translate([x * x_gap, 0, 0])
                    cube([x_gap, width, x * step + base_height]);
                start_x = start_x + (x * x_gap);
                for(y = [0:4]) {
                    start_y = start_y + (y * y_gap);
                    translate([start_x, start_y, -0.5])
                        cylinder(x * step + base_height + 1, d = diameter);
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
