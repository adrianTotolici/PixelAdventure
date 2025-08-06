for (var pos_x = 0; pos_x < grid_cols; pos_x++) {
    for (var pos_y = 0; pos_y < grid_rows; pos_y++) {
        var sprite_ind = tile_sprites[grid_data[pos_x][pos_y]];
        draw_sprite(sprite_ind, 0, pos_x * cell_size, pos_y * cell_size);
    }
}

var tile_x = cursor_x * cell_size;
var tile_y = cursor_y * cell_size;

// Draw outline
draw_set_color(c_red);
draw_sprite(spr_player, 0, tile_x, tile_y);

// Get terrain type
var terrain_index = grid_data[cursor_x][cursor_y];
var terrain_name = tile_sprites[terrain_index];