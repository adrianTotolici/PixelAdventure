// Set color for the grid
draw_set_color(c_gray);

// Define cell size
var cell_size = 24;

// Loop over width and height
for (var pos_x = 0; pos_x < room_width; pos_x += cell_size) {
    draw_line(pos_x, 0, pos_x, room_height);
}
for (var pos_y = 0; pos_y < room_height; pos_y += cell_size) {
    draw_line(0, pos_y, room_width, pos_y);
}
