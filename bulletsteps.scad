$fn = 30;  // degree of rendering detail

rightangle = 90;
length = 70; // x
length_sides = 67.5; // x
x_shift_sides = (length -length_sides) / 2;
width = 37.5; // y
height = 0.5; // z
start_x = 3.5;
start_y = 3.75;
x_gap = 7;
y_gap = 7.5;
step = 1.6;
base_height = 3.5;

module holder(height, diameter) {
    difference() {
        cylinder(height, d = diameter);
        cylinder(height + 1, d = diameter - 1);
    }
}

union() {
    cube([length, width, height]);

    translate([x_shift_sides, width, 0])
        rotate([rightangle])
            cube([length_sides, 5, height]);

    translate([x_shift_sides, height, 0])
        rotate([rightangle])
            cube([length_sides, 5, height]);

    for(x = [0:9]) {
        start_x = start_x + (x * x_gap);
        for(y = [0:4]) {
            start_y = start_y + (y * y_gap);
            translate([start_x, start_y, 0])
                holder(x * step + base_height, 5);
        }
    }
}
