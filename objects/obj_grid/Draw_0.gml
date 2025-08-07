/// @description Draw grid

// Set color for the grid
draw_set_color(c_gray);

// Loop over width and height
for (var pos_x = 0; pos_x <= grid_width; pos_x += cell_size) {
    draw_line(pos_x, 0, pos_x, grid_height);
}
for (var pos_y = 0; pos_y <= grid_height; pos_y += cell_size) {
    draw_line(0, pos_y, grid_width, pos_y);
}