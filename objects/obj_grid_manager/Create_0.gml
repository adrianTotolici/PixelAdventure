// Define grid size and sprites
cell_size = 24;
grid_cols = room_width div cell_size;
grid_rows = room_height div cell_size;
tile_msg = "";

cursor_x = 0;
cursor_y = 0;

cursor_delay = 6;   // Frames between moves
cursor_timer = 0;

// Your available tile types (change as needed)
tile_sprites = [spr_grass, spr_water, spr_sand, spr_dirt, spr_mud_rocks];


// Store sprite indices in 2D array
grid_data = array_create(grid_cols);
for (var pos_x = 0; pos_x < grid_cols; pos_x++) {
    grid_data[pos_x] = array_create(grid_rows);
    for (var pos_y = 0; pos_y < grid_rows; pos_y++) {
        // Pick random sprite
        var index = irandom(array_length(tile_sprites) - 2);
        grid_data[pos_x][pos_y] = index;
    }
}
