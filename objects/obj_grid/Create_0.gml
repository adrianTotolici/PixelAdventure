/// @description Initilize variables

grid_width = room_width - (ui_grid_size * cell_size);
grid_height =room_height;

grid_cols = (room_width div cell_size) - ui_grid_size;
grid_rows = room_height div cell_size;